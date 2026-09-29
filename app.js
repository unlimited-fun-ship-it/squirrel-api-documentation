/* =========================================================
   REX Squirrel API Documentation
   Parses api.d.nut at load time and renders it as a docs site.
   ========================================================= */

(function () {
  'use strict';

  var SOURCE_URL = 'api.d.nut';

  var blocks = [];

  /* ---------- Utilities ---------- */

  function escapeHtml(s) {
    return String(s)
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }

  // Escape + turn `backticks` into <code>.
  function inlineCode(s) {
    var escaped = escapeHtml(s);
    return escaped.replace(/`([^`]+)`/g, '<code>$1</code>');
  }

  function isBlank(line) { return /^\s*$/.test(line); }
  function isComment(line) { return /^\s*\/\//.test(line); }
  function stripComment(line) { return line.replace(/^\s*\/\/\s?/, ''); }

  /* ---------- Block reader ---------- */

  // Returns the line index of the matching closing brace.
  function findBlockEnd(lines, startIndex) {
    var depth = 0;
    var started = false;
    for (var i = startIndex; i < lines.length; i++) {
      var line = lines[i];
      for (var j = 0; j < line.length; j++) {
        var ch = line[j];
        if (ch === '{') {
          depth++;
          started = true;
        } else if (ch === '}') {
          depth--;
          if (started && depth === 0) return i;
        }
      }
    }
    return lines.length - 1;
  }

  /* ---------- Member parser ---------- */

  function parseMembers(bodyLines) {
    var members = [];
    var comments = [];

    for (var i = 0; i < bodyLines.length; i++) {
      var raw = bodyLines[i];
      var line = raw.trim();

      if (line === '') { comments = []; continue; }
      if (line.charAt(0) === '/' && line.charAt(1) === '/') {
        comments.push(stripComment(line));
        continue;
      }

      // function name(args) {}
      var mMethod = line.match(/^function\s+(\w+)\s*\(([^)]*)\)\s*\{[^}]*\}\s*$/);
      if (mMethod) {
        members.push({
          kind: 'method',
          name: mMethod[1],
          args: mMethod[2].trim(),
          comments: comments.slice()
        });
        comments = [];
        continue;
      }

      // name = value[,]
      var mProp = line.match(/^(\w+)\s*=\s*(.+?)\s*,?\s*$/);
      if (mProp) {
        members.push({
          kind: 'property',
          name: mProp[1],
          value: mProp[2],
          comments: comments.slice()
        });
        comments = [];
        continue;
      }

      // Unknown — reset
      comments = [];
    }

    return members;
  }

  /* ---------- Top-level parser ---------- */

  function parseNut(source) {
    var lines = source.split(/\r?\n/);
    var out = [];
    var pendingComments = [];
    var i = 0;

    while (i < lines.length) {
      var line = lines[i];
      var trimmed = line.trim();

      if (isBlank(line)) { pendingComments = []; i++; continue; }
      if (isComment(line)) {
        pendingComments.push(stripComment(line));
        i++;
        continue;
      }

      // class X {
      var m = trimmed.match(/^class\s+(\w+)\s*\{/);
      if (m) {
        var classEnd = findBlockEnd(lines, i);
        out.push({
          kind: 'class',
          name: m[1],
          comment: pendingComments.slice(),
          members: parseMembers(lines.slice(i + 1, classEnd))
        });
        pendingComments = [];
        i = classEnd + 1;
        continue;
      }

      // ::Enum.X <- {
      m = trimmed.match(/^::Enum\.(\w+)\s*<-\s*\{/);
      if (m) {
        var enumEnd = findBlockEnd(lines, i);
        out.push({
          kind: 'enum',
          name: m[1],
          comment: pendingComments.slice(),
          members: parseMembers(lines.slice(i + 1, enumEnd))
        });
        pendingComments = [];
        i = enumEnd + 1;
        continue;
      }

      // ::X <- {
      m = trimmed.match(/^::(\w+)\s*<-\s*\{/);
      if (m) {
        var tableName = m[1];
        var tblEnd = findBlockEnd(lines, i);
        // Skip the empty ::Enum wrapper.
        if (tableName !== 'Enum') {
          out.push({
            kind: 'table',
            name: tableName,
            comment: pendingComments.slice(),
            members: parseMembers(lines.slice(i + 1, tblEnd))
          });
        }
        pendingComments = [];
        i = tblEnd + 1;
        continue;
      }

      pendingComments = [];
      i++;
    }

    return out;
  }

  /* ---------- Comment → structure ---------- */

  function parseProperty(prop) {
    var lines = prop.comments;
    var first = lines[0] || '';
    // TYPE (ACCESS) - DESCRIPTION
    var m = first.match(/^(\S+)\s*(?:\(([^)]+)\))?\s*-\s*(.*)$/);
    var type = '', access = '', description = first;
    if (m) {
      type = m[1];
      access = m[2] || '';
      description = m[3] || '';
    }
    if (lines.length > 1) {
      description = description + ' ' + lines.slice(1).join(' ');
    }
    return {
      name: prop.name,
      type: type,
      access: access,
      description: description
    };
  }

  function parseMethod(method) {
    var description = [];
    var params = [];
    var returns = null;
    var lines = method.comments;

    for (var i = 0; i < lines.length; i++) {
      var c = lines[i];
      var pm = c.match(/^@param\s+(\w+)\s*:\s*(\S+)\s*-\s*(.*)$/);
      if (pm) {
        params.push({ name: pm[1], type: pm[2], description: pm[3] });
        continue;
      }
      var rm = c.match(/^@return\s+(\S+)\s*-\s*(.*)$/);
      if (rm) {
        returns = { type: rm[1], description: rm[2] };
        continue;
      }
      description.push(c);
    }

    return {
      name: method.name,
      args: method.args,
      description: description.join(' '),
      params: params,
      returns: returns
    };
  }

  /* ---------- Rendering ---------- */

  function renderType(type, access) {
    if (!type) return '';
    var html = '<code class="type">' + escapeHtml(type) + '</code>';
    if (access) html += ' <span class="access">' + escapeHtml(access) + '</span>';
    return html;
  }

  function renderMethod(m) {
    var html = '<div class="method">';
    html += '<h3 class="method-sig"><code>' +
            escapeHtml(m.name) + '(' + escapeHtml(m.args) + ')</code>';
    if (m.returns) {
      html += ' <span class="arrow">→</span> ' +
              '<code class="return-type">' + escapeHtml(m.returns.type) + '</code>';
    }
    html += '</h3>';

    if (m.description) {
      html += '<p class="method-desc">' + inlineCode(m.description) + '</p>';
    }

    if (m.params.length) {
      html += '<div class="params"><h4>Parameters</h4><ul>';
      for (var i = 0; i < m.params.length; i++) {
        var p = m.params[i];
        html += '<li><code>' + escapeHtml(p.name) + '</code>' +
                ' <span class="type">' + escapeHtml(p.type) + '</span>' +
                ' <span class="param-desc">' + inlineCode(p.description) + '</span></li>';
      }
      html += '</ul></div>';
    }

    if (m.returns) {
      html += '<div class="returns"><h4>Returns</h4><p>' +
              '<code class="type">' + escapeHtml(m.returns.type) + '</code>' +
              inlineCode(m.returns.description) + '</p></div>';
    }

    html += '</div>';
    return html;
  }

  function renderBlock(block) {
    var properties = block.members
      .filter(function (m) { return m.kind === 'property'; })
      .map(parseProperty);
    var methods = block.members
      .filter(function (m) { return m.kind === 'method'; })
      .map(parseMethod);

    var displayName = block.kind === 'enum'  ? 'Enum.' + block.name
                    : block.kind === 'table' ? '::' + block.name
                    : block.name;

    var html = '<article class="doc">';
    html += '<header class="doc-header">';
    html += '<h1>' + escapeHtml(displayName) + '</h1>';
    html += '<span class="doc-kind">' + escapeHtml(block.kind) + '</span>';
    html += '</header>';

    if (block.comment.length) {
      html += '<p class="doc-comment">' + inlineCode(block.comment.join(' ')) + '</p>';
    }

    if (properties.length) {
      var title = block.kind === 'enum' ? 'Values' : 'Properties';
      html += '<section class="section">';
      html += '<h2>' + title + ' <span class="count">' + properties.length + '</span></h2>';
      html += '<table class="props"><thead><tr><th>Name</th><th>Type</th><th>Description</th></tr></thead><tbody>';
      for (var i = 0; i < properties.length; i++) {
        var p = properties[i];
        html += '<tr>';
        html += '<td class="prop-name"><code>' + escapeHtml(p.name) + '</code></td>';
        html += '<td class="prop-type">' + renderType(p.type, p.access) + '</td>';
        html += '<td class="prop-desc">' + inlineCode(p.description) + '</td>';
        html += '</tr>';
      }
      html += '</tbody></table></section>';
    }

    if (methods.length) {
      html += '<section class="section">';
      html += '<h2>Methods <span class="count">' + methods.length + '</span></h2>';
      for (var k = 0; k < methods.length; k++) {
        html += renderMethod(methods[k]);
      }
      html += '</section>';
    }

    html += '</article>';
    return html;
  }

  function renderSidebar() {
    var groups = { class: [], enum: [], table: [] };
    blocks.forEach(function (b) { groups[b.kind].push(b); });

    Object.keys(groups).forEach(function (k) {
      groups[k].sort(function (a, b) { return a.name.localeCompare(b.name); });
    });

    var html = '';

    if (groups.class.length) {
      html += '<div class="nav-section"><h2>Classes</h2><ul>';
      groups.class.forEach(function (b) {
        var slug = b.name;
        html += '<li><a href="#' + encodeURIComponent(slug) + '"' +
                ' data-name="' + escapeHtml(b.name.toLowerCase()) + '">' +
                escapeHtml(b.name) + '</a></li>';
      });
      html += '</ul></div>';
    }
    if (groups.enum.length) {
      html += '<div class="nav-section"><h2>Enums</h2><ul>';
      groups.enum.forEach(function (b) {
        var slug = 'Enum.' + b.name;
        html += '<li><a href="#' + encodeURIComponent(slug) + '"' +
                ' data-name="' + escapeHtml(b.name.toLowerCase()) + '">' +
                escapeHtml(b.name) + '</a></li>';
      });
      html += '</ul></div>';
    }
    if (groups.table.length) {
      html += '<div class="nav-section"><h2>Global tables</h2><ul>';
      groups.table.forEach(function (b) {
        var slug = '::' + b.name;
        html += '<li><a href="#' + encodeURIComponent(slug) + '"' +
                ' data-name="' + escapeHtml(b.name.toLowerCase()) + '">' +
                '::' + escapeHtml(b.name) + '</a></li>';
      });
      html += '</ul></div>';
    }

    document.getElementById('nav').innerHTML = html;

    var total = blocks.length;
    document.getElementById('stats').textContent =
      total + ' entr' + (total === 1 ? 'y' : 'ies') + ' loaded';
  }

  /* ---------- Navigation ---------- */

  function findBlock(hash) {
    if (hash.indexOf('Enum.') === 0) {
      var eName = hash.slice(5);
      return blocks.filter(function (b) {
        return b.kind === 'enum' && b.name === eName;
      })[0];
    }
    if (hash.indexOf('::') === 0) {
      var tName = hash.slice(2);
      return blocks.filter(function (b) {
        return b.kind === 'table' && b.name === tName;
      })[0];
    }
    return blocks.filter(function (b) {
      return b.kind === 'class' && b.name === hash;
    })[0];
  }

  function updateActiveLink(hash) {
    var links = document.querySelectorAll('.nav a');
    for (var i = 0; i < links.length; i++) {
      var target = decodeURIComponent(links[i].getAttribute('href').slice(1));
      if (target === hash) links[i].classList.add('active');
      else links[i].classList.remove('active');
    }
  }

  function navigate() {
    var hash = location.hash
      ? decodeURIComponent(location.hash.slice(1))
      : '';

    updateActiveLink(hash);

    var content = document.getElementById('content');

    if (!hash) {
      content.innerHTML =
        '<div class="welcome">' +
          '<h1>REX Squirrel API Documentation</h1>' +
          '<p>This reference is generated at load time from <code>api.d.nut</code>.</p>' +
          '<p>Pick a class, enum, or global table from the sidebar to begin.</p>' +
          '<p class="hint"><kbd>Ctrl</kbd><kbd>K</kbd> &mdash; focus search &nbsp;·&nbsp; ' +
          '<kbd>Esc</kbd> &mdash; clear search</p>' +
        '</div>';
      return;
    }

    var block = findBlock(hash);
    if (!block) {
      content.innerHTML =
        '<article class="doc"><header class="doc-header">' +
        '<h1>Not found</h1></header>' +
        '<p>No entry named <code>' + escapeHtml(hash) + '</code>.</p></article>';
      return;
    }

    content.innerHTML = renderBlock(block);
    window.scrollTo(0, 0);
  }

  /* ---------- Search ---------- */

  function setupSearch() {
    var input = document.getElementById('search');

    input.addEventListener('input', function () {
      var q = input.value.trim().toLowerCase();
      var items = document.querySelectorAll('.nav li');
      for (var i = 0; i < items.length; i++) {
        var a = items[i].querySelector('a');
        var name = a.getAttribute('data-name') || '';
        items[i].style.display = (!q || name.indexOf(q) !== -1) ? '' : 'none';
      }
      var sections = document.querySelectorAll('.nav-section');
      for (var j = 0; j < sections.length; j++) {
        var hasVisible = false;
        var lis = sections[j].querySelectorAll('li');
        for (var k = 0; k < lis.length; k++) {
          if (lis[k].style.display !== 'none') { hasVisible = true; break; }
        }
        sections[j].style.display = hasVisible ? '' : 'none';
      }
    });

    document.addEventListener('keydown', function (e) {
      if ((e.ctrlKey || e.metaKey) && e.key.toLowerCase() === 'k') {
        e.preventDefault();
        input.focus();
        input.select();
      } else if (e.key === 'Escape' && document.activeElement === input) {
        input.value = '';
        input.dispatchEvent(new Event('input'));
        input.blur();
      }
    });
  }

  /* ---------- Mobile drawer ---------- */

  function setupMobile() {
    var toggle = document.getElementById('menuToggle');
    var sidebar = document.getElementById('sidebar');

    toggle.addEventListener('click', function () {
      sidebar.classList.toggle('open');
    });

    sidebar.addEventListener('click', function (e) {
      if (e.target.tagName === 'A' && window.innerWidth <= 900) {
        sidebar.classList.remove('open');
      }
    });
  }

  /* ---------- Boot ---------- */

  function boot() {
    var nav = document.getElementById('nav');

    fetch(SOURCE_URL, { cache: 'no-cache' })
      .then(function (res) {
        if (!res.ok) throw new Error('HTTP ' + res.status);
        return res.text();
      })
      .then(function (text) {
        blocks = parseNut(text);
        if (!blocks.length) throw new Error('No blocks parsed — wrong file?');
        renderSidebar();
        window.addEventListener('hashchange', navigate);
        navigate();
      })
      .catch(function (err) {
        nav.innerHTML =
          '<div class="error">' +
          'Could not load <code>' + escapeHtml(SOURCE_URL) + '</code>.<br>' +
          '<small>' + escapeHtml(err.message) + '</small><br><br>' +
          'If you opened this file with <code>file://</code>, serve the folder ' +
          'over HTTP instead (for example <code>python -m http.server</code>), ' +
          'or publish it on GitHub Pages.' +
          '</div>';
      });
  }

  document.addEventListener('DOMContentLoaded', function () {
    setupSearch();
    setupMobile();
    boot();
  });
})();