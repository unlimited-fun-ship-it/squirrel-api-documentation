// Generated from the engine's binding registrations by `--generate-script-docs`. Do not edit; edit the registration call.
//
// Quirrel has no stub-ingestion format: its static analyser reads a LIVE
// bindings table (sq_analyzeast), and its VS Code extension indexes workspace
// .nut files. So this file is real Quirrel source with empty bodies - editors
// that index the workspace pick the names up, and it reads as documentation.
// It is NOT loaded by the game. For a real check, run the engine's own
// analyser against the live bindings.

// One export_descr_ancillaries.txt record. This is the database entry, not a per-character copy: every holder shares it, so a write here changes it for all of them.
class Ancillary {
    // string (read/write) - The displayed description.
    description = null
    // string (read/write) - The displayed name.
    displayName = null
    // integer (read-only) - How many attribute effects it carries.
    effectCount = null
    // string (read/write) - The displayed effects text.
    effectsDescription = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // string (read/write) - The UI image path.
    imagePath = null
    // integer (read-only) - The record's position in the ancillary database.
    index = null
    // bool (read/write) - Whether it can be handed to another character. Medieval II only.
    isTransferable = null
    // bool (read/write) - Whether only one of these may exist in the game at a time.
    isUnique = null
    // string (read/write) - The internal name. Renaming it in place breaks every data file and trigger that names the old one; logged loudly.
    name = null
    // string (read/write) - The ancillary type ("ancillary", "holy_relic", "title", ...). Medieval II only.
    type = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // One of the ancillary's attribute effects, as a read-only table with `id` and `value`. `id` is an attribute index.
    // @param index : integer - 0 .. effectCount-1.
    // @return table|null - null when out of range.
    function getEffect(index) {}
    // Whether a culture is barred from receiving it.
    // @param cultureId : integer
    // @return bool
    function isCultureExcluded(cultureId) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// An army, navy or garrison stack. Held as a generation-counted handle, so a reference to a stack that has been destroyed reads as null.
class Army {
    // Army|null (read/write) - The army this one is reinforcing.
    armyBeingReinforced = null
    // integer (read/write) - See bannerRed.
    bannerBlue = null
    // integer (read/write) - See bannerRed.
    bannerGreen = null
    // integer (read/write) - Red channel of this stack's own banner colour, 0-255. Only drawn once usesOwnBannerColour is true. Saved with the campaign.
    bannerRed = null
    // integer (read/write) - Which side of the battle the stack is on.
    battleAlliance = null
    // bool (read/write) - Whether the stack's battle has just finished.
    battleFinished = null
    // integer (read/write) - How far post-battle resolution has got: 0 none, 1 engagement, 2 phase 1, 3 phase 2.
    battleOutcome = null
    // Fort|null (read-only) - The fort under siege.
    besiegedFort = null
    // Settlement|null (read-only) - The settlement under siege.
    besiegedSettlement = null
    // Port|null (read/write) - The port this fleet is blockading. Writing a port starts the blockade and both sides of the relation are written; writing null lifts it. Refused when the fleet has no general or the port is already blockaded.
    blockedPort = null
    // bool (read/write) - Whether the stack may retreat from a campaign battle.
    canRetreat = null
    // integer (read-only) - Travelling characters: agents and secondary generals, not the leader.
    characterCount = null
    // Army|null (read/write) - The army whose orders this AI stack follows. Medieval II only.
    commandingArmy = null
    // integer (read-only) - Units that died or fled in the current battle. Zero on the campaign map.
    deadUnitCount = null
    // Faction|null (read/write) - The owning faction. Writing reassigns it without re-homing the stack in either faction's army list - sharp, and deliberately so.
    faction = null
    // float (read-only) - The general's command radius, in metres. The engine only stores the square, so this is its root; `generalCommandRadiusSquared` is the stored value if you were going to square it again anyway.
    generalCommandRadius = null
    // float (read-only) - The general's command radius squared - the number the engine actually keeps.
    generalCommandRadiusSquared = null
    // integer (read-only) - Ticks left on the recently-died-general window, -1 when he is alive.
    generalDeathTimer = null
    // integer (read-only) - The general's morale bonus to his troops.
    generalMoraleBonus = null
    // integer (read-only) - Ticks left on the recently-fled window.
    generalRoutTimer = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // bool (read/write) - Whether the stack has lost all hope. Writing true forces it; false is refused, because the engine's mutator is one-way.
    hasGivenUp = null
    // bool (read-only) - Whether the stack is in a battle right now.
    inBattle = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - Whether this fleet is blockading a port.
    isBlockadingPort = null
    // bool (read-only) - Whether the stack has lost half its men. Medieval II only; false in Rome.
    isHalfDestroyed = null
    // bool (read/write) - Whether this stack is a fleet.
    isNavy = null
    // bool (read/write) - Whether it entered as a reinforcement.
    isReinforcement = null
    // bool (read-only) - Whether it is marching on right now.
    isReinforcing = null
    // bool (read-only) - Whether every unit is at least tired. Medieval II only. Not campaign fatigue.
    isTired = null
    // integer (read/write) - Ladders built on the campaign map. Writing sets the in-battle count too.
    laddersBuilt = null
    // integer (read/write) - Ladders still standing in the battle. Reset from laddersBuilt at battle open.
    laddersRemaining = null
    // Character|null (read/write) - The general, or null for an unled garrison stack.
    leader = null
    // bool (read-only) - Whether so few men are left that every unit takes a morale penalty.
    moraleBroken = null
    // integer (read/write) - Rams built.
    ramsBuilt = null
    // integer (read/write) - Rams still standing.
    ramsRemaining = null
    // float (read/write) - Where fleeing units head to reform.
    reformPointX = null
    // float (read/write) - See reformPointX.
    reformPointY = null
    // integer (read/write) - The region the stack stands in.
    regionId = null
    // Army|null (read-only) - Non-null while this stack is besieging something - it hands back the stack itself, because the siege's members live on this class.
    siege = null
    // integer|null (read-only) - How many times it has assaulted.
    siegeAssaults = null
    // integer|null (read/write) - Casualties the besieger has taken.
    siegeCasualties = null
    // bool|null (read-only) - Whether the siege has ended.
    siegeFinished = null
    // integer|null (read-only) - Items in the equipment build queue, 0-25.
    siegeQueueCount = null
    // integer|null (read-only) - Men the besieger had when the siege began - what the surrender check divides by.
    siegeSoldiersAtStart = null
    // integer|null (read-only) - Turns the siege has lasted, null when not besieging.
    siegeTurns = null
    // integer (read-only) - Combat potential. Reads 0 once the stack has given up.
    strength = null
    // integer (read-only) - What strength was when the battle opened.
    strengthAtStart = null
    // integer (read/write) - The rebel sub-faction, for slave-faction stacks.
    subFactionId = null
    // integer (read/write) - How many armies support this one.
    supportingArmies = null
    // integer|null (read-only) - The tile the stack stands on, null when it has none.
    tileX = null
    // integer|null (read-only) - See tileX.
    tileY = null
    // integer (read/write) - Siege towers built.
    towersBuilt = null
    // integer (read/write) - Siege towers still standing.
    towersRemaining = null
    // Army|null (read/write) - The passengers this fleet carries. Writing null disembarks them.
    transportedArmy = null
    // Army|null (read/write) - The fleet this army is aboard. Writing null disembarks.
    transportingNavy = null
    // integer (read-only) - How many units are in the stack.
    unitCount = null
    // integer (read-only) - Unit-group slots. Battle only; zero otherwise.
    unitGroupCount = null
    // integer (read/write) - The stack's wage adjustment, 0-100 percent.
    upkeepModifier = null
    // bool (read/write) - Whether this stack draws its own banner colour instead of its faction's. False puts it back on the faction colour and leaves the three channels alone.
    usesOwnBannerColour = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // Attack another stack. Refused when the defender is inside a settlement or fort - that is an assault. Issue-and-return.
    // @param defender : Army
    // @return integer - 0 failed, 1 issued.
    function attackArmy(defender) {}
    // Besiege or assault a fort.
    // @param fort : Fort
    // @param assault : bool
    // @return bool
    function besiegeFort(fort, assault) {}
    // Besiege or assault a settlement. Issue-and-return: the order is queued on the general and resolves over the following ticks.
    // @param settlement : Settlement
    // @param assault : bool
    // @return bool
    function besiegeSettlement(settlement, assault) {}
    // Blockade a port. Issue-and-return: the fleet paths to it. Writing `blockedPort` is the immediate state change.
    // @param port : Port
    // @return bool - whether the order was issued.
    function blockadePort(port) {}
    // Blockade the port on a tile. Takes coordinates rather than a port, because there is no port reference type yet.
    // @param x : integer
    // @param y : integer
    // @return bool - false when there is no port there.
    function blockadePortAt(x, y) {}
    // Build a watchtower on the stack's tile. The engine's checks run: a named general, not sieging, a valid tile, enough money.
    // @return bool
    function buildWatchtower() {}
    // Whether this stack could assault a settlement.
    // @param target : Settlement
    // @return bool
    function canAssault(target) {}
    // Whether this stack could assault a fort.
    // @param target : Fort
    // @return bool
    function canAssaultFort(target) {}
    // Whether this stack could besiege a settlement.
    // @param target : Settlement
    // @return bool
    function canBesiege(target) {}
    // Whether this stack could besiege a fort.
    // @param target : Fort
    // @return bool
    function canBesiegeFort(target) {}
    // A travelling character by index.
    // @param index : integer
    // @return Character|null
    function character(index) {}
    // Units of one category in the stack.
    // @param category : integer
    // @return integer
    function countUnitsOfCategory(category) {}
    // Create a unit in this stack by its export_descr_unit name.
    // @param typeName : string
    // @param experience : integer
    // @param armourLevel : integer
    // @param weaponLevel : integer
    // @param soldiers : integer - negative for the type's default.
    // @return Unit|null - null when the type is unknown or the stack is full.
    function createUnit(typeName, experience, armourLevel, weaponLevel, soldiers) {}
    // Create a unit in this stack from a UnitType.
    // @param type : UnitType
    // @param experience : integer
    // @param armourLevel : integer
    // @param weaponLevel : integer
    // @param soldiers : integer
    // @return Unit|null
    function createUnitOfType(type, experience, armourLevel, weaponLevel, soldiers) {}
    // A dead-or-fled unit by index.
    // @param index : integer
    // @return Unit|null
    function deadUnit(index) {}
    // Put a unit into the stack's first free unit-group slot. Battle only. The name goes into the battle script's own label table, so the DSL and the `unit_group_*` script commands resolve the group by it afterwards.
    // @param name : string
    // @param seedUnit : Unit
    // @return UnitGroup|null - null when every slot is in use.
    function defineUnitGroup(name, seedUnit) {}
    // The fort this stack garrisons.
    // @return Fort|null - null when it is not in one.
    function inFort() {}
    // The settlement this stack garrisons.
    // @return Settlement|null - null when it is not in one.
    function inSettlement() {}
    // Whether another stack's faction is allied to this one's. Strict alliance only; same faction is always an ally.
    // @param other : Army
    // @return bool
    function isAllyTo(other) {}
    // Whether this stack is allied to a faction.
    // @param other : Faction
    // @return bool
    function isAllyToFaction(other) {}
    // Whether another stack's faction is at war with this one's. Same faction is never an enemy.
    // @param other : Army
    // @return bool
    function isEnemyTo(other) {}
    // Whether this stack is at war with a faction.
    // @param other : Faction
    // @return bool
    function isEnemyToFaction(other) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // End the blockade this fleet is maintaining.
    // @return bool - false when it was not blockading.
    function liftBlockade() {}
    // End the siege this stack is conducting.
    // @return bool - false when it was not besieging.
    function liftSiege() {}
    // Merge this stack into another; the target absorbs it.
    // @param target : Army
    // @param force : bool - false runs the engine's can-receive check first.
    // @return Army|null - the surviving stack.
    function mergeInto(target, force) {}
    // Move the whole stack to a tile, merging into whatever is there.
    // @param x : integer
    // @param y : integer
    // @param forceMerge : bool
    // @return Army|null - the stack the units ended up in.
    function moveTo(x, y, forceMerge) {}
    // Hand every unit back to whoever should be driving it. Battle only.
    // @return bool
    function releaseUnits() {}
    // Set every unit's control status: 0 player, 1 AI, 2 script, 3 formerly-scripted.
    // @param status : integer
    // @return bool
    function setControlStatus(status) {}
    // One item of the siege-equipment queue, as a read-only table of type, frozen, valid, cost, remainingCost, percentComplete.
    // @param index : integer
    // @return table|null - null when out of range or not besieging.
    function siegeQueueItem(index) {}
    // Reorder the stack by up to three sort keys, most significant first. The general's bodyguard always stays first.
    // @param key1 : integer - 0 for none.
    // @param key2 : integer
    // @param key3 : integer
    // @return bool
    function sortUnits(key1, key2, key3) {}
    // A unit by index, 0-based.
    // @param index : integer
    // @return Unit|null - null when out of range.
    function unit(index) {}
    // A unit group by slot index. Battle only.
    // @param index : integer
    // @return UnitGroup|null
    function unitGroup(index) {}
}

// The running battle. Reads null whenever there is no battle - which is the first thing any battle script has to check.
class Battle {
    // bool (read/write) - Whether the battle AI updates at all.
    aiEnabled = null
    // integer (read-only) - The tile the attacker came from, or -1.
    attackerX = null
    // integer (read-only) - The tile the attacker came from, or -1.
    attackerY = null
    // integer (read-only) - The attacking side's index, or -1.
    attackingSide = null
    // integer (read-only) - 0 successful ambush, 1 failed ambush, 2 open, 3 siege, 4 sally, 5 naval, 6 withdrawal, 7 meet enemy.
    conflictType = null
    // bool (read-only) - Whether the defender fled before the assault. Medieval II only.
    defenderFled = null
    // integer (read-only) - The tile the defender came from. Medieval II only; -1 in Rome.
    defenderX = null
    // integer (read-only) - The tile the defender came from. Medieval II only.
    defenderY = null
    // integer (read-only) - The defending side's index, or -1.
    defendingSide = null
    // integer (read-only) - Ticks left in the finish countdown.
    finishTimer = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read/write) - Non-zero while units may hide.
    hidingEnabled = null
    // integer (read/write) - The faction that owns the settlement or fort being fought over, and supplies the ambient population.
    homeFactionId = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - Whether a fort is present.
    isFortBattle = null
    // bool (read/write) - Whether this is a night battle. Writing swaps the environment and the visibility rules with it.
    isNight = null
    // bool (read-only) - Whether this is a two-sided river battle.
    isRiverBattle = null
    // float (read-only) - The playable area's height in world units.
    mapHeight = null
    // float (read-only) - The playable area's width in world units.
    mapWidth = null
    // bool (read/write) - Whether time is paused. Writing fans it out to every human player.
    paused = null
    // integer (read-only) - The battle phase: 0 none, 1 setup, 2 delay, 3-4 deployment, 5 conflict, 6 end pending, 7 end, 8 finish countdown, 9 finished.
    phase = null
    // integer (read-only) - How many human players are in this battle.
    playerArmyCount = null
    // float (read-only) - Battle seconds since the conflict phase began.
    secondsPassed = null
    // integer (read-only) - How many sides are in this battle. At most 8.
    sideCount = null
    // float (read/write) - The time-rate multiplier. Must be positive.
    speed = null
    // bool (read-only) - Whether battle setup has begun. True from setup, which is before the battle handler opens.
    started = null
    // integer (read/write) - The strategy-map tile the battle is on.
    strategyX = null
    // integer (read/write) - The strategy-map tile the battle is on.
    strategyY = null
    // integer (read-only) - AI ticks since the conflict phase began.
    tickCount = null
    // integer (read-only) - AI ticks since the battlefield was entered - earlier than tickCount's zero.
    ticksSinceStart = null
    // integer (read-only) - Which side is strongest: 0 the enemies, 1 the player. Medieval II only.
    tideOfBattle = null
    // integer (read/write) - Which side wins if the clock runs out, or -1 for none.
    timeoutWinner = null
    // integer (read-only) - The unit-size preset: 0 small, 1 normal, 2 large, 3 huge. Sizes between the presets round to the nearest.
    unitSize = null
    // float (read-only) - The continuous unit-size multiplier the engine stores. `unitSize` rounds it to the nearest of the four presets; this does not.
    unitSizeMultiplier = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // bool (read-only) - Whether this battle was auto-resolved.
    wasAutoResolved = null
    // The running battle, or null when there is none. THE entry point: it answers on the class too, so `Battle.current()` works before you have a reference.
    // @return Battle|null
    function current() {}
    // The battlefield's siege-engine list.
    // @return BattlefieldEngines|null
    function engines() {}
    // Which side a faction is on. The faction id is zero-based.
    // @param factionId : integer
    // @return integer - -1 when that faction is not in this battle.
    function factionSide(factionId) {}
    // The fort being fought over, as a read-only table: fort, garrison, faction, ownerFactionId, creatorFactionId, fortificationLevel.
    // @return table|null - null when there is no fort.
    function fortInfo() {}
    // The interpolated ground height at a battlefield position.
    // @param x : float
    // @param y : float
    // @return float|null - null when the position is off the grid.
    function groundHeightAt(x, y) {}
    // A unit group by its `define_unit_group` label.
    // @param label : string
    // @return UnitGroup|null - null when no group carries that label.
    function groupByLabel(label) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Whether a zone id names a real zone. Medieval II only.
    // @param zoneId : integer
    // @return bool
    function isZoneValid(zoneId) {}
    // Which settlement wall ring a position is inside, or -1 for outside. Medieval II only.
    // @param x : float
    // @param y : float
    // @return integer|null - null in Rome.
    function perimeterAt(x, y) {}
    // A human player's army by index, 0-based.
    // @param index : integer - 0 .. playerArmyCount-1.
    // @return Army|null - null when out of range.
    function playerArmy(index) {}
    // The settlement, fort or camp being fought over.
    // @return BattleResidence|null - null when there is none.
    function residence() {}
    // A side by index, 0-based.
    // @param index : integer - 0 .. sideCount-1.
    // @return BattleSide|null - null when out of range.
    function side(index) {}
    // The AI's terrain analysis: the hills and ridge lines it plans around.
    // @return TerrainFeatures|null - null before the battle map has been analysed.
    function terrain() {}
    // The 2-metre tile at a position.
    // @param x : float
    // @param y : float
    // @return BattleTile|null - null when the position is off the grid.
    function tileAt(x, y) {}
    // A unit by the script label a battle script gave it with `label_unit`.
    // @param label : string
    // @return Unit|null - null when no unit carries that label.
    function unitByLabel(label) {}
    // The pathfinding zone id at a position. Medieval II only.
    // @param x : float
    // @param y : float
    // @return integer|null - null in Rome.
    function zoneIdAt(x, y) {}
}

// One side's grand tactical AI. `plan` is the only writable member and it is how a script takes the battle over.
class BattleAi {
    // integer (read-only) - What the strategy analyser recommends. Medieval II only.
    analyserPlan = null
    // bool (read-only) - Whether a defensive area has been picked.
    defendAreaValid = null
    // float (read-only) - The defensive area's centre. x and z are the ground plane, y is the height.
    defendAreaX = null
    // float (read-only) - The defensive area's centre height.
    defendAreaY = null
    // float (read-only) - The defensive area's centre.
    defendAreaZ = null
    // TerrainHill|null (read-only) - The hill the AI settled on defending, or null.
    defendHill = null
    // float (read-only) - The defensive area's radius.
    defendRadius = null
    // integer (read-only) - The battle difficulty it was built with.
    difficulty = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // bool (read-only) - Whether it has finished deploying.
    hasDeployed = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - Whether it is running an ambush.
    isAmbush = null
    // bool (read-only) - Whether the AI is playing the defender.
    isDefender = null
    // bool (read-only) - Whether it is still deploying.
    isDeploying = null
    // integer (read-only) - How many objectives `objective(i)` will index: the player ones when there are any, the AI's own otherwise.
    objectiveCount = null
    // integer (read/write) - The current plan: 0 do nothing, 1 attack all, 2 defend, 3 defend feature, 4 hide, 5 ambush, 6 scout, 7 withdraw, 8 attack settlement, 9 defend settlement, 10 sally out; write 11 to hand control back to the AI. Medieval II only - Rome's AI has no override flag and refuses the write.
    plan = null
    // integer (read-only) - Ticks the current plan has been running.
    planAge = null
    // bool (read-only) - Whether the current plan was forced rather than chosen. Medieval II only.
    planIsScripted = null
    // integer (read-only) - How many player objectives have been added on top of the AI's own.
    playerObjectiveCount = null
    // integer (read-only) - The plan before the current one.
    previousPlan = null
    // BattleSide|null (read-only) - The side this AI plays for.
    side = null
    // integer (read-only) - How many units this AI controls - player-controlled units on the same side are not included.
    unitCount = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - How many enemy units it can see.
    visibleEnemyCount = null
    // bool (read-only) - Whether the sally attack has been triggered.
    wantsToSally = null
    // This side's strength at the start, as a read-only table: soldierCount, melee, missile, siege, infantry, cavalry, total.
    // @return table|null
    function alliedInitialStrength() {}
    // This side's strength now. Same keys.
    // @return table|null
    function alliedStrength() {}
    // The defensive line the AI is holding, as a read-only table: startX, startY, endX, endY, midX, midY, length. Medieval II only; all zeroes in Rome.
    // @return table|null
    function defendLine() {}
    // The enemy's strength at the start. Same keys.
    // @return table|null
    function enemyInitialStrength() {}
    // The enemy's strength now. Same keys.
    // @return table|null
    function enemyStrength() {}
    // The visible part of the enemy's strength at the start. Same keys.
    // @return table|null
    function enemyVisibleInitialStrength() {}
    // The visible part of the enemy's strength now. Same keys.
    // @return table|null
    function enemyVisibleStrength() {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // An objective by index, 0-based.
    // @param index : integer
    // @return BattleObjective|null
    function objective(index) {}
    // A unit this AI controls, by index, 0-based.
    // @param index : integer
    // @return Unit|null
    function unit(index) {}
    // A visible enemy unit by index, 0-based.
    // @param index : integer
    // @return Unit|null - null when out of range, or when that unit has died and not yet been pruned.
    function visibleEnemy(index) {}
}

// An army's battle statistics record. Entirely engine bookkeeping, so entirely read-only.
class BattleArmy {
    // Army|null (read-only) - The army these are for.
    army = null
    // float (read-only) - The odds it was given of winning.
    battleOdds = null
    // Character|null (read-only) - Its general, or null.
    general = null
    // float (read-only) - The fraction of the general's hitpoints lost.
    generalHpRatioLost = null
    // integer (read-only) - Enemies the general killed personally.
    generalKills = null
    // integer (read-only) - Enemy generals this army killed.
    generalsKilled = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // float (read-only) - Its strength when it deployed.
    initialStrength = null
    // integer (read-only) - How many units have statistics records.
    unitCount = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // A unit's statistics record by index, 0-based.
    // @param index : integer
    // @return BattleUnit|null
    function unitStats(index) {}
}

// One AI battle objective - a task with units allocated to it. Reads null once the AI drops it.
class BattleObjective {
    // BattleAi|null (read-only) - The AI that created it.
    ai = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - Whether a player set it.
    isPlayerObjective = null
    // bool (read/write) - Whether the AI must resource it. The one writable member on this type.
    isRequired = null
    // integer (read-only) - Its current priority.
    priority = null
    // integer (read-only) - How many ticks it has been alive.
    ticks = null
    // integer (read-only) - The objective type: 0 invalid, 1 move to point, 2 attack battlegroup, 3 defend hill, 4 defend forest, 5 defend area, 6 defend crossing, 7 assault crossing, 8 defend line, 9 scout, 10 withdraw, 11 defend settlement, 12 support defend settlement, 13 attack settlement, 14 skirmish, 15 bombard, 16 attack model, 17 sally out, 18 ambush.
    type = null
    // integer (read-only) - How many units are allocated to it.
    unitCount = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // An allocated unit by index, 0-based.
    // @param index : integer
    // @return Unit|null
    function unit(index) {}
}

// The settlement, fort or camp the battle is being fought over, and the list of its battle buildings.
class BattleResidence {
    // integer (read-only) - Which side holds it.
    alliance = null
    // integer (read-only) - How many battle buildings it has.
    buildingCount = null
    // Faction|null (read-only) - The faction that holds it.
    faction = null
    // integer (read/write) - Non-zero once a gate is destroyed. Same one-way rule.
    gateDestroyed = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - Whether this slot holds anything.
    isUsed = null
    // integer (read-only) - How many concentric wall rings. Medieval II only; 0 in Rome.
    perimeterCount = null
    // Plaza|null (read-only) - Its capture point, or null.
    plaza = null
    // Settlement|null (read-only) - The campaign settlement, or null for a fort, camp or custom battle.
    settlement = null
    // integer (read-only) - How many street deployment slots the settlement has. Medieval II only.
    streetPositionCount = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read/write) - Non-zero once the walls are breached. Writing non-zero sets it; the engine's flag is one-way, so writing 0 is refused.
    wallsBreached = null
    // A battle building by index, 0-based.
    // @param index : integer
    // @return BuildingBattle|null
    function building(index) {}
    // The fort, as a read-only table with the same keys `Battle.fortInfo` uses.
    // @return table|null - null when this is not a fort.
    function fortInfo() {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // A building in one wall ring, 0-based.
    // @param perimeter : integer
    // @param index : integer
    // @return BuildingBattle|null
    function perimeterBuilding(perimeter, index) {}
    // How many buildings one wall ring has.
    // @param perimeter : integer
    // @return integer
    function perimeterBuildingCount(perimeter) {}
    // A street deployment slot, 0-based, as a read-only table: x, y, perimeter, available. Medieval II only.
    // @param index : integer
    // @return table|null
    function streetPosition(index) {}
}

// One side of the battle - what the engine calls an alliance. Addressed by its index, 0 .. sideCount-1.
class BattleSide {
    // integer (read/write) - Strength of the armies on the field.
    activeStrength = null
    // BattleAi|null (read-only) - This side's battle AI, or null.
    ai = null
    // integer (read-only) - How many armies this side has.
    armyCount = null
    // bool (read-only) - Whether this side gets a deployment phase.
    canDeploy = null
    // bool (read-only) - Whether this side may withdraw. The writable flag is per army.
    canWithdraw = null
    // integer (read-only) - How many factions are on this side.
    factionCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - Whether this side is defending. A hint to the AI and the advisor.
    isDefender = null
    // integer (read-only) - How many reinforcement armies are still waiting.
    pendingReinforcementCount = null
    // float (read/write) - 0 when everybody is dead or routing, 1 when this is the only side left.
    relativeStrength = null
    // integer (read/write) - -1 undecided, 0 lose, 1 draw, 2 win.
    result = null
    // integer (read-only) - Soldiers this side started with.
    startingSoldiers = null
    // integer (read/write) - 0 close, 1 average, 2 clear, 3 crushing.
    success = null
    // integer (read/write) - Strength including reinforcements not yet on field.
    totalStrength = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - How many victory conditions, at most 4.
    winConditionCount = null
    // An army's slot on this side by index, 0-based.
    // @param index : integer
    // @return BattleSideArmy|null
    function armySlot(index) {}
    // An army's battle statistics record by index, 0-based.
    // @param index : integer
    // @return BattleArmy|null
    function armyStats(index) {}
    // A faction on this side by index, 0-based.
    // @param index : integer
    // @return Faction|null
    function faction(index) {}
    // Whether a faction is on this side. Correct at any faction count.
    // @param factionId : integer
    // @return bool
    function hasFaction(factionId) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // A pending reinforcement army by index, 0-based.
    // @param index : integer
    // @return Army|null
    function reinforcement(index) {}
    // A victory-condition code by index, 0-based. 0 destroy or rout enemy, 1 balance of strength, 2 destroy enemy strength, 3 capture location, 4 destroy character, 5 capture major settlement, 6 capture army settlement.
    // @param index : integer - 0 .. winConditionCount-1.
    // @return integer - -1 when out of range.
    function winCondition(index) {}
}

// One army's slot on its side. Identified by the army, so it reads null the moment that army is gone.
class BattleSideArmy {
    // Army|null (read-only) - The army this slot holds.
    army = null
    // bool (read/write) - Whether this army may withdraw from the battlefield.
    canWithdraw = null
    // DeploymentArea|null (read-only) - Its first deployment area.
    deploymentArea = null
    // integer (read-only) - How many deployment areas it has.
    deploymentAreaCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - Whether it came on as a reinforcement.
    isReinforcement = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // A deployment area by index, 0-based.
    // @param index : integer
    // @return DeploymentArea|null
    function deploymentAreaAt(index) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One 2-metre battlefield tile. The grid is 1000 by 1000 over world coordinates -1000 .. +1000.
class BattleTile {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - 0 short grass, 1 long grass, 2 sand, 3 rock, 4 dense forest, 5 dense scrub, 6 swamp, 7 mud, 8 mud road, 9 stone road, 10 water, 11 ice, 12 snow, 13 wood, 14 dirt. Bridge decking reads as the bridge's material.
    groundType = null
    // float (read-only) - Its ground height in world units.
    height = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // float (read-only) - The water surface height over it.
    waterHeight = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A unit's battle statistics record - the SAME unit as `Unit`, seen from the battle's side, so it dies with the unit. Entirely read-only.
class BattleUnit {
    // integer (read-only) - Experience gained in this battle.
    experienceGained = null
    // integer (read-only) - Experience when the battle began.
    experienceStart = null
    // integer (read-only) - Soldiers killed by their own side. Medieval II only; 0 in Rome.
    friendlyFireCasualties = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - 1 when the unit routed off the field.
    hasRouted = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read-only) - 1 when this is the general's own unit.
    isGeneralUnit = null
    // integer (read-only) - Enemy soldiers it captured.
    prisonersCaught = null
    // integer (read-only) - Its own ship damage: 0 none, 1 light, 2 medium, 3 heavy, 4 sunk.
    shipDamage = null
    // integer (read-only) - Enemy ships sunk. Naval battles only.
    shipsSunk = null
    // integer (read-only) - Soldiers remaining at the end.
    soldiersEnd = null
    // integer (read-only) - Soldiers revived by a doctor.
    soldiersHealed = null
    // integer (read-only) - Enemy soldiers THIS unit killed.
    soldiersKilled = null
    // integer (read-only) - Soldiers lost: killed plus captured plus fled.
    soldiersLost = null
    // integer (read-only) - Soldiers who fled and came back.
    soldiersRallied = null
    // integer (read-only) - Soldiers who fled the battlefield.
    soldiersRouted = null
    // integer (read-only) - Soldiers it deployed with.
    soldiersStart = null
    // integer (read-only) - Its own soldiers taken prisoner.
    soldiersTakenPrisoner = null
    // Unit|null (read-only) - The unit these are for.
    unit = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // float (read-only) - Deployed strength divided by deployed soldier count.
    valuePerSoldier = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// Every siege engine on the battlefield, crewed or abandoned.
class BattlefieldEngines {
    // integer (read-only) - How many engines there are.
    engineCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // An engine by index, 0-based.
    // @param index : integer
    // @return SiegeEngine|null
    function engine(index) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One constructed building inside a settlement. Not the export_descr_buildings record - that is BuildingType.
class Building {
    // string (read-only) - The building chain name.
    chainName = null
    // integer (read/write) - The faction whose version of this building this is - it picks the model and the card, not the owner.
    factionId = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read/write) - Health as a percentage, 0-100. Writing repairs or damages by the difference, which keeps the defences' battle-damage table in step.
    health = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read/write) - The building's level within its chain. Writing goes through the engine's level_set, which stamps the creating faction and seeds the pools the level grants.
    level = null
    // string (read-only) - The name of the current level.
    levelName = null
    // Settlement (read-only) - The settlement this building is in. Immutable.
    settlement = null
    // BuildingType (read-only) - The export_descr_buildings record this is an instance of. Immutable.
    type = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A building inside a settlement battle - a wall segment, a tower, a gate, a plaza building. Generation-counted, so one that was destroyed reads dead rather than as freed memory.
class BuildingBattle {
    // integer (read/write) - Which side holds it. Writing a gate also swings it to match the new owner.
    alliance = null
    // bool (read/write) - Whether this wall has been breached. Writing sets the flag only; the hole comes from damage. Medieval II only.
    breached = null
    // Unit|null (read-only) - The unit manning this tower, or null. Medieval II only.
    controllingUnit = null
    // bool (read-only) - Whether a siege tower or ladder can dock against it. Medieval II only.
    dockable = null
    // Faction|null (read/write) - The owning faction.
    faction = null
    // integer (read/write) - The owning faction's id.
    factionId = null
    // float (read-only) - Accumulated fire damage.
    fireDamage = null
    // float (read-only) - How far the fire has taken hold.
    fireLevel = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - Its remaining health.
    health = null
    // integer (read-only) - Its index in its residence's building list.
    index = null
    // bool (read-only) - Whether it is on fire.
    isBurning = null
    // integer (read-only) - Its full health.
    maxHealth = null
    // integer (read-only) - Which wall ring it is on, or -1. Medieval II only.
    perimeter = null
    // float (read-only) - Its position. x and z are the ground plane, y is the height.
    posX = null
    // float (read-only) - Its height.
    posY = null
    // float (read-only) - Its position.
    posZ = null
    // BattleResidence|null (read-only) - The settlement or fort it belongs to.
    residence = null
    // integer (read-only) - 0 ambient, 1 major, 2 wall, 3 tower, 4 gate, 5 gatehouse (Medieval II only).
    type = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Its descr_walls record, as a read-only table: name, flammability, impactDamage, fullHealth, controlAreaRadiusSquared, needsManning, healthExcluded, isSelectable, towerStatsCount. The radius is SQUARED, as the engine stores it.
    // @return table|null
    function stats() {}
    // One firing level of a tower or gatehouse, 0-based, as a read-only table: fireAngle (a cosine, not degrees), slotYawMin/Max, slotPitchMin/Max, reloadMs, reloadMsFlaming. Medieval II only.
    // @param index : integer - 0 .. stats().towerStatsCount-1.
    // @return table|null
    function towerStats(index) {}
}

// One capability line of a building level. Addressed as (chain, level, list, position) - the position does NOT shift when a line is removed, because removal disables the line in place.
class BuildingCapability {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One entry in a settlement's construction queue, borrowed for the duration of the event that produced it (`payload.priorBuild`, `payload.advisedBuild`). Reads null afterwards - a queue entry has no identity to hold on to, so there is nothing to hand out that would still mean anything next turn.
class BuildingConstruction {
    // Building|null (read-only) - The building being upgraded, null for a new one.
    building = null
    // BuildingType|null (read-only) - The building type.
    buildingType = null
    // string (read-only) - The building chain's name.
    chainName = null
    // integer (read-only) - A BUILDING_CONSTRUCTION_ITEM_TYPE value.
    constructionType = null
    // integer (read-only) - Cost in denari.
    cost = null
    // bool (read/write) - Whether construction is paused. Writable while the item is still queued.
    frozen = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read-only) - The level being built.
    level = null
    // string (read-only) - The level's name.
    levelName = null
    // integer (read/write) - Progress, percent. Writable while the item is still queued.
    percentBuilt = null
    // integer (read-only) - The level before it.
    previousLevel = null
    // Settlement|null (read-only) - The settlement.
    settlement = null
    // integer (read-only) - Turns spent so far.
    turnsPassed = null
    // integer (read-only) - Turns left.
    turnsRemaining = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Queue a copy of this item in its settlement.
    // @return bool - false when the queue refused it or the view is stale.
    function queue() {}
}

// The building info scroll, while it is open. Reads null when it is not.
class BuildingInfoScroll {
    // Building|null (read-only) - The building the scroll is about, when it is one that already stands.
    building = null
    // BuildingType|null (read-only) - The EDB record the scroll is previewing. Null whenever `building` answers, and null for the browser's per-LEVEL preview - a level record carries no pointer back to the chain that owns it, so there is nothing to name.
    buildingType = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // Settlement|null (read-only) - The settlement the scroll is about - the one that owns the building, or the one whose construction options are being browsed. Answers in both cases.
    settlement = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One tier of a building chain. Addressed as (chain, level); it stays valid across save/load and reads null if the chain stops existing.
class BuildingLevel {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A recruitment line of a building level. The same engine node as a BuildingCapability, presented with the pooling fields named.
class BuildingRecruitPool {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One building chain from the buildings database - `market`, `hinterland_roads`. Addressed by its record index, which is stable for the process and across save/load on the same data files, so it is safe in `persistent`.
class BuildingType {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// The campaign - the singleton the whole strategy game hangs off. There is exactly one and it exists for the whole process, so this reference never goes stale; `isOpen` is the honest "is a campaign running" test.
class Campaign {
    // float (read-only) - Brigand spawn rate - LOWER spawns more.
    brigandSpawnValue = null
    // CollegeOfCardinals|null (read-only) - The College of Cardinals. Medieval II only, and null even there until a campaign with a papal faction has opened.
    college = null
    // Settlement|null (read/write) - The settlement the engine treats as Constantinople.
    constantinopleSettlement = null
    // Crusade|null (read-only) - The campaign's crusade slot. There is exactly one and it always exists - a crusade that is not running has no target. Medieval II only.
    crusade = null
    // Faction|null (read-only) - The faction whose turn it is. Read-only: the turn faction, its slot index and the turn bookkeeping only move together.
    currentFaction = null
    // integer (read/write) - Days elapsed in the current battle. Total battle time is daysInBattle*24 + timeInBattle. Writing it regenerates the sun and moon positions.
    daysInBattle = null
    // integer (read/write) - The season the campaign ends.
    endSeason = null
    // float (read/write) - The year the campaign ends.
    endYear = null
    // integer (read-only) - How many factions are in the turn order.
    factionCount = null
    // integer (read-only) - One past the largest legal faction id. NOT the same as factionCount - ids are a fixed space, the turn order shrinks as factions die.
    factionIdLimit = null
    // integer (read-only) - The turn-order slot of the faction whose turn it is, or -1 between games.
    factionTurnIndex = null
    // bool (read/write) - Whether fog of war is on.
    fogOfWar = null
    // bool (read/write) - Whether the camera follows character movement on AI turns.
    followMovement = null
    // integer (read-only) - How many forts stand on the map.
    fortCount = null
    // integer (read-only) - How many units get free upkeep in a fort.
    freeUpkeepForts = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - How many factions a human controls.
    humanFactionCount = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - Whether a world is actually open.
    isOpen = null
    // bool (read/write) - Whether the strategy map is paused. Context-sensitive: inside a battle this is the battle's pause.
    isPaused = null
    // Jihad|null (read-only) - The campaign's jihad slot. Medieval II only.
    jihad = null
    // bool (read/write) - Whether the Marian reforms have happened. Writing true triggers them; they cannot be un-triggered.
    marianReformsActive = null
    // bool (read-only) - Whether the Marian reforms are disabled for this campaign. descr_strat state.
    marianReformsDisabled = null
    // integer (read-only) - How many mercenary pools descr_mercenaries defined. There is no pool reference type yet.
    mercPoolCount = null
    // integer (read-only) - Strategy-map game time at the last AI tick, in milliseconds.
    millisecondCount = null
    // bool (read-only) - Whether night battles are available.
    nightBattlesEnabled = null
    // Faction|null (read/write) - The papal faction. Medieval II only; null in Rome.
    papalFaction = null
    // integer (read-only) - What opened this world: 0 nothing, 1 a save, 2 a campaign, 3 a custom battle.
    parsingType = null
    // string (read-only) - The descr_strat this world was opened from.
    path = null
    // float (read-only) - Pirate spawn rate - LOWER spawns more.
    pirateSpawnValue = null
    // integer (read-only) - How many port buildings stand on the map. There is no port reference type yet, so they cannot be indexed.
    portCount = null
    // bool (read/write) - Whether characters can rebel. Writing true switches the feature on for good.
    rebellingCharactersActive = null
    // integer (read/write) - Non-zero greys out autoresolve in the pre-battle scroll. Medieval II only.
    restrictAutoResolve = null
    // integer (read-only) - How many roads the road manager holds. There is no road reference type yet.
    roadCount = null
    // Settlement|null (read/write) - The settlement the engine treats as Rome.
    romeSettlement = null
    // integer (read/write) - Non-zero allows saving. Medieval II only; reads 1 in Rome.
    saveEnabled = null
    // integer (read/write) - The current season: 0 winter, 1 spring, 2 summer, 3 autumn. ⚠ Four seasons, and a campaign may run any number of turns per year - retail Medieval II had two, so a script written against the two-season numbering has to be re-read.
    season = null
    // float (read-only) - The same clock in seconds.
    secondCount = null
    // integer (read-only) - How many settlements exist in the campaign.
    settlementCount = null
    // Faction|null (read-only) - The rebel faction every unowned settlement, brigand and pirate belongs to.
    slaveFaction = null
    // integer (read-only) - The rebel faction's id, or -1 when the campaign has none. Read-only: repointing it orphans everything that was created as a slave.
    slaveFactionId = null
    // bool (read/write) - The sticky campaign speed-up - it accelerates a drawn campaign rather than skipping it.
    speedUp = null
    // integer (read/write) - The season the campaign started.
    startSeason = null
    // float (read/write) - The year the campaign started.
    startYear = null
    // integer (read-only) - Strategy-map AI ticks processed so far.
    tickCount = null
    // float (read/write) - Hours into the current battle day, 0-24.
    timeInBattle = null
    // float (read-only) - The battle's start hour, which is what the weather period and the lighting environment were resolved from.
    timeOfDay = null
    // float (read-only) - Years per turn, from descr_strat. Medieval II only; 0 in Rome.
    timescale = null
    // integer (read-only) - How many turns the campaign has taken. Read-only: the turn counter and the calendar advance together. Move the date instead.
    turnNumber = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - How many watchtowers stand on the map. There is no watchtower reference type yet, so they cannot be indexed.
    watchtowerCount = null
    // Weather|null (read-only) - The live weather block.
    weather = null
    // float (read-only) - Current wind speed. Re-interpolated from the weather keyframer every frame.
    windSpeed = null
    // integer (read/write) - The faction id that won, or the invalid-faction value. Writing it RECORDS a winner; it does not end the campaign. Medieval II only.
    winnerFactionId = null
    // float (read/write) - The current year. Writing it moves the calendar and NOT the turn counter.
    year = null
    // A faction's battle difficulty. No setter: it is fixed at campaign start and the battle rules read it the moment a battle begins.
    // @param factionId : integer
    // @return integer|null - null for an out-of-range id.
    function battleDifficultyOf(factionId) {}
    // A faction's campaign difficulty.
    // @param factionId : integer
    // @return integer|null - null for an out-of-range id.
    function campaignDifficultyOf(factionId) {}
    // Test one diplomatic relation between two factions.
    // @param relation : integer - a DiplomaticRelation value.
    // @param first : Faction
    // @param second : Faction
    // @return bool
    function checkStance(relation, first, second) {}
    // What one faction thinks of another. Directed: the engine keeps both halves separately.
    // @param firstFactionId : integer - whose opinion.
    // @param secondFactionId : integer - about whom.
    // @return FactionDiplomacy|null - null when either id is out of range.
    function diplomacyWith(firstFactionId, secondFactionId) {}
    // A faction by id.
    // @param factionId : integer
    // @return Faction|null - null for an out-of-range id or a slot this campaign never filled.
    function factionById(factionId) {}
    // A faction by internal name.
    // @param name : string - e.g. "england".
    // @return Faction|null - null for an unknown name.
    function factionByName(name) {}
    // A faction by turn-order index, 0-based. The right way to walk every faction on the map.
    // @param index : integer - 0 .. factionCount-1.
    // @return Faction|null - null when out of range.
    function factionByOrder(index) {}
    // The first character record anywhere in the campaign holding a named ancillary, including off-map, retired and dead holders.
    // @param ancillaryName : string
    // @return CharacterRecord|null
    function findAncillaryHolder(ancillaryName) {}
    // Find a character record anywhere in the campaign by script label, including in dead factions. Rome's records carry no labels, so it always reads null there.
    // @param label : string
    // @return CharacterRecord|null
    function findCharacterByLabel(label) {}
    // Fire a disaster immediately at a tile.
    // @param name : string - the specific event inside the category; "" for the category.
    // @param eventType : string - earthquake, flood, horde, storm, volcano, dustbowl, locusts, famine, plague, riot or fire.
    // @param x : integer
    // @param y : integer
    // @param scale : integer - optional; 1 or more, the engine default is 4.
    // @param movie : string - optional. Medieval II only.
    // @return bool - false for an unknown type or an off-map tile.
    function fireDisaster(name, eventType, x, y, scale, movie) {}
    // A fort by index, 0-based.
    // @param index : integer - 0 .. fortCount-1.
    // @return Fort|null - null when out of range.
    function fort(index) {}
    // Whether this faction id is present in the campaign at all.
    // @param factionId : integer
    // @return bool
    function isExistingFaction(factionId) {}
    // Whether a human is allowed to pick this faction id.
    // @param factionId : integer
    // @return bool
    function isPlayableFaction(factionId) {}
    // Whether a human currently controls this faction id.
    // @param factionId : integer
    // @return bool
    function isPlayerFaction(factionId) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // How many inter-faction marriages the two factions have made. Medieval II only; 0 in Rome.
    // @param firstFactionId : integer
    // @param secondFactionId : integer
    // @return integer
    function marriageCount(firstFactionId, secondFactionId) {}
    // A mercenary pool by index, 0-based.
    // @param index : integer - 0 .. mercPoolCount-1.
    // @return MercenaryPool|null - null when out of range.
    function mercPool(index) {}
    // A mercenary pool by its descr_mercenaries name.
    // @param name : string
    // @return MercenaryPool|null - null for an unknown name.
    function mercPoolByName(name) {}
    // A human-controlled faction by index, 0-based.
    // @param index : integer - 0 .. humanFactionCount-1.
    // @return Faction|null - null when out of range.
    function playerFaction(index) {}
    // A port building by index, 0-based.
    // @param index : integer - 0 .. portCount-1.
    // @return Port|null - null when out of range.
    function port(index) {}
    // Raise an event message with a title and body you supply. `name` is the event PICTURE and the counter key, not a historic_events.txt entry.
    // @param name : string - picture name; also the counter that is bumped.
    // @param title : string
    // @param body : string
    // @param isChoice : bool - optional; adds accept/decline buttons that bump <name>_accepted / _declined. Medieval II only.
    // @param x : integer - optional, -1 for no map position. Medieval II only.
    // @param y : integer - optional. Medieval II only.
    // @param factionIds : array - optional list of faction ids; everybody when omitted. Medieval II only.
    // @return bool - false when both title and body are empty.
    function raiseEvent(name, title, body, isChoice, x, y, factionIds) {}
    // A road by index, 0-based.
    // @param index : integer - 0 .. roadCount-1.
    // @return Road|null - null when out of range.
    function road(index) {}
    // Set a faction's campaign difficulty.
    // @param factionId : integer
    // @param difficulty : integer - a DIFFICULTY value.
    // @return bool - false for an out-of-range id or difficulty.
    function setCampaignDifficultyOf(factionId, difficulty) {}
    // Set one diplomatic relation. ⚠ `trade` TOGGLES rather than sets, so calling it twice puts you back where you started. Asking for the stance the two are already at is a no-op success.
    // @param relation : integer - a DiplomaticRelation value.
    // @param first : Faction
    // @param second : Faction
    // @return bool - false when the engine refused - war can be blocked by an alliance.
    function setStance(relation, first, second) {}
    // A settlement by index, 0-based.
    // @param index : integer - 0 .. settlementCount-1.
    // @return Settlement|null - null when out of range.
    function settlement(index) {}
    // A settlement by its INTERNAL name - the descr_strat token, not the renamable display name.
    // @param name : string
    // @return Settlement|null - null for an unknown name.
    function settlementByName(name) {}
    // The unit-size preference: 0 small, 1 normal, 2 large, 3 huge. A process preference, not campaign state.
    // @return integer
    function unitSize() {}
    // A watchtower by index, 0-based.
    // @param index : integer - 0 .. watchtowerCount-1.
    // @return Watchtower|null - null when out of range.
    function watchtower(index) {}
}

// One cardinal in the college, or one vote in the last election. Addressed by (which list, index); the lists compact when a cardinal dies, so an index held across that names a different cardinal - it can never dangle.
class Cardinal {
    // Character|null (read-only) - The cardinal's character on the map, or null once he is dead - an election result outlives its cardinals.
    character = null
    // integer (read/write) - The faction the cardinal belongs to.
    factionId = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - Whether he can be voted for. The engine re-picks the preferati at the start of an election, so a write holds only until then.
    isPreferati = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read/write) - The faction this ONE cardinal will vote for, or the invalid-faction value when undecided.
    voteFactionId = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A character standing on the campaign map. Dead characters, wives, children and off-map characters have only a CharacterRecord, which this reaches through `record`.
class Character {
    // integer (read/write) - The action the character is currently set to perform.
    actionState = null
    // Army (read/write) - The stack this character COMMANDS. Writing attaches it as that stack's general; writing null detaches.
    army = null
    // Port|null (read/write) - The port this admiral is blockading. The blockade lives on his fleet, so this is the same field `Army.blockedPort` is; writing starts or lifts it.
    blockedPort = null
    // Unit (read-only) - The bodyguard unit.
    bodyguard = null
    // Crusade (read-only) - The crusade this character has joined, or null. Medieval II only. A character on a JIHAD reads null here and non-null on `jihad`: the engine hangs both off one pointer, so the two properties test the type.
    crusade = null
    // integer (read-only) - The turn the character joined. Medieval II only.
    crusadeJoinTurn = null
    // bool (read-only) - Whether no progress was made this turn. Medieval II only.
    crusadeNoProgressThisTurn = null
    // integer (read-only) - Turns without progress towards the target. Medieval II only.
    crusadeNoProgressTurns = null
    // float (read-only) - Tiles to the crusade target, computed now. Medieval II only.
    crusadeTargetDistance = null
    // integer (read-only) - 0 none, 1 crusade, -1 jihad. Medieval II only.
    crusadeType = null
    // Port|null (read-only) - The port this admiral is docked in, or null. Read-only: the engine derives it from the dock in the character's own tile.
    dockedPort = null
    // Faction (read-only) - The faction this character belongs to.
    faction = null
    // Fort (read-only) - The fort on this character's tile, or null.
    fort = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // bool (read/write) - Whether the character carries the plague. Writing true infects it properly (flag and duration); it cannot be cured by writing false.
    hasPlague = null
    // string (read/write) - The descr_hero_abilities entry, or "". Medieval II only.
    heroAbility = null
    // bool (read-only) - Whether the character stands in a region owned by someone it is at war with. Asked of the map live - the stored flag on the character is written once at creation and never updated, in both games.
    inEnemyTerritory = null
    // bool (read/write) - Whether the character entered an enemy zone of control this turn and therefore cannot leave it again.
    inEnemyZoc = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - Stop this character spending movement points. The read always returns false - the engine keeps no getter for the flag.
    infiniteMovementPoints = null
    // Jihad (read-only) - The jihad this character has joined, or null. Medieval II only.
    jihad = null
    // bool (read/write) - Whether this character is queued to die on the next faction sweep - the way to tell someone died before the engine caught up. Writing true is what `kill` does.
    markedForDeath = null
    // float (read/write) - The movement points actually available for a step - the minimum over the character and everything travelling with it. Writing sets the character's pool and mirrors it onto the bodyguard.
    movementPoints = null
    // float (read-only) - The bonus movement from traits, ancillaries and the crusade multiplier. Write `record.movementPointsBonus` to change it.
    movementPointsModifier = null
    // float (read-only) - How much this character gets at the start of a turn.
    movementPointsPerTurn = null
    // float (read-only) - The per-turn maximum including the stack.
    movementPointsPerTurnWithArmy = null
    // float (read-only) - The pool including the stack. Recomputed after every action.
    movementPointsWithArmy = null
    // float (read/write) - The character's own remaining pool.
    ownMovementPoints = null
    // integer (read/write) - How much population this priest converted last turn. Medieval II only.
    populationConverted = null
    // CharacterRecord (read-only) - The persistent record behind this character.
    record = null
    // integer (read-only) - The region the character's tile is in.
    regionId = null
    // float (read-only) - How far the region's religion has shifted since this character entered it, 0 to 1. Medieval II only.
    religionShift = null
    // integer (read-only) - Consecutive turns without moving.
    sedentaryTurns = null
    // Settlement (read-only) - The settlement on this character's tile, or null. A besieger sees the settlement it is besieging.
    settlement = null
    // integer (read-only) - Turns idle. Medieval II only; 0 in Rome.
    turnsIdle = null
    // integer (read-only) - Turns spent in the current region. Medieval II only.
    turnsInRegion = null
    // integer (read-only) - Turns an auxiliary character has travelled with its stack. Medieval II only.
    turnsWithArmy = null
    // integer (read/write) - The character type. Writing it re-points the character at a different descr_character row, which also swaps the strategy models, the portraits and the permitted actions. Compare against the enum table - the numbers differ between the two games.
    typeId = null
    // string (read-only) - The character type as spelled in descr_character.
    typeName = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // Army (read/write) - The stack this character travels WITH. Writing registers it in that stack's travelling-character list.
    visitingArmy = null
    // integer (read-only) - Tile X. Immutable - use `relocate`, which also relinks the per-tile object lists and redoes the fog of war.
    x = null
    // integer (read-only) - Tile Y. Immutable - use `relocate`.
    y = null
    // Whether this character could step off its tile at all: it has movement points, it is not locked in a zone of control, and a neighbour is passable and affordable.
    // @return bool
    function canMove() {}
    // Give this character an army to command. A general who already commands one gets that stack back - creating a second would strand the first. A general garrisoned in a settlement or fort, or riding in another general's army, gets that stack: his bodyguard lives there.
    // @return Army|null - The army, or null when the character has no faction.
    function createArmy() {}
    // Build a fort on this character's tile. The character must command a stack; the faction pays the culture's fort cost.
    // @return Fort|null - the new fort, or null.
    function createFort() {}
    // Whether the character is on a crusade or a jihad. Medieval II only.
    // @return bool
    function isCrusading() {}
    // Whether this is a named character or a general - the two types that can command a land army.
    // @return bool
    function isGeneral() {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Join the running crusade: ends hostilities with the other crusading factions and applies the movement bonus, as the UI button does. Medieval II only.
    // @return bool - false when no crusade has been called.
    function joinCrusade() {}
    // Join the running jihad. Medieval II only.
    // @return bool
    function joinJihad() {}
    // Kill this character. The obituary is written and the death queued; the engine plays the animation, fires the death event and frees the object on the next faction sweep - the same thing the campaign script's kill_character does. The character is NOT gone the instant this returns; test `markedForDeath`.
    // @return bool - always true.
    function kill() {}
    // Abandon the crusade. Medieval II only.
    // @param triggerEvent : bool - fire the event trigger.
    // @return bool
    function leaveCrusade(triggerEvent) {}
    // Abandon the jihad. Medieval II only.
    // @param triggerEvent : bool
    // @return bool
    function leaveJihad(triggerEvent) {}
    // Issue a normal move order. ISSUE-AND-RETURN: the character walks over the following frames and this does not wait for it.
    // @param x : integer
    // @param y : integer
    // @return bool - whether the order was accepted, NOT whether it arrived.
    function moveTo(x, y) {}
    // Everywhere this character can walk. ⚠ Runs the pathfinder: the work grows roughly with the square of `turns`, so ask for the smallest budget that answers your question. The answer is cached per character until it moves.
    // @param searchType : integer - which zone-of-control rules to path under.
    // @param turns : integer - how many turns of movement to explore.
    // @return MovementExtents|null - null outside a campaign, and for a searchType or turn count out of range.
    function movementExtents(searchType, turns) {}
    // Issue a merchant's acquire order. Medieval II only.
    // @param target : Character
    // @return bool
    function orderAcquire(target) {}
    // Issue an assassination order.
    // @param target : Character
    // @return bool - whether the order was accepted.
    function orderAssassinate(target) {}
    // Issue a bribe order against a character.
    // @param target : Character
    // @return bool
    function orderBribe(target) {}
    // Issue a bribe order against a fort.
    // @param target : Fort
    // @return bool
    function orderBribeFort(target) {}
    // Issue a bribe order against a settlement.
    // @param target : Settlement
    // @return bool
    function orderBribeSettlement(target) {}
    // Issue an inquisitor's denounce order. Medieval II only.
    // @param target : Character
    // @return bool
    function orderDenounce(target) {}
    // Issue a diplomacy order against a character.
    // @param target : Character
    // @return bool - whether the order was accepted.
    function orderDiplomacy(target) {}
    // Issue a diplomacy order against a fort.
    // @param target : Fort
    // @return bool
    function orderDiplomacyOnFort(target) {}
    // Issue a diplomacy order against a settlement.
    // @param target : Settlement
    // @return bool
    function orderDiplomacyOnSettlement(target) {}
    // Issue a princess's marriage proposal. Medieval II only.
    // @param target : Character - must be a family member.
    // @return bool
    function orderMarry(target) {}
    // Issue a sabotage order against one building.
    // @param target : Building
    // @return bool
    function orderSabotageBuilding(target) {}
    // Issue a sabotage order against a settlement - the engine picks the building.
    // @param target : Settlement
    // @return bool
    function orderSabotageSettlement(target) {}
    // Issue a spy order against a character.
    // @param target : Character
    // @return bool
    function orderSpy(target) {}
    // Issue a spy order against a fort.
    // @param target : Fort
    // @return bool
    function orderSpyOnFort(target) {}
    // Issue a spy order against a settlement.
    // @param target : Settlement
    // @return bool
    function orderSpyOnSettlement(target) {}
    // Put the character on a tile immediately - no order, no path, no movement points. Travelling characters and a transported army's general come along. When the tile will not take this character the nearest one that will is used, searched outward up to five tiles. Refused for a character inside a settlement.
    // @param x : integer
    // @param y : integer
    // @return bool - false when the tile is off the map, the character is in a settlement, or nothing within five tiles will take it.
    function relocate(x, y) {}
    // Send this character off the map, keeping its record so it can come back. Medieval II only. Give the character a label first or you will not find it again.
    // @return bool
    function sendOffMap() {}
    // Give a bodyguard to a character that does not have one - typically right after creating it. Replacing a live bodyguard is the engine's own swap, which creates the replacement itself.
    // @param unit : Unit
    // @return bool - false when the character already has one.
    function setBodyguard(unit) {}
    // Override this character's strategy-map model, saved with the campaign. Both games. Pass an empty string to go back to the default for the character's type and faction; a name descr_model_strat.txt does not define falls back to that default rather than making the character invisible.
    // @param model : string - a descr_model_strat.txt strat model name.
    // @return bool - always true.
    function setStratModel(model) {}
    // Move this character to another faction. Medieval II kills priests crossing a religion and princesses outright rather than transferring them - the engine's own rule.
    // @param faction : Faction
    // @param keepArmy : bool - keep the commanded stack. Ignored in Rome.
    // @param keepBodyguard : bool - accepted and ignored - the bodyguard always follows.
    // @return bool - false for a null or unchanged faction.
    function switchFaction(faction, keepArmy, keepBodyguard) {}
}

// The persistent half of a character: names, attributes, traits, ancillaries, family, life and death. Every named character has one, including dead ones, wives, children and characters who are off the map.
class CharacterRecord {
    // integer (read/write) - Age in years.
    age = null
    // integer (read/write) - Ambush bonus.
    ambush = null
    // integer (read-only) - How many ancillaries this character holds.
    ancillaryCount = null
    // integer (read/write) - Artillery command. Medieval II only.
    artilleryCommand = null
    // integer (read/write) - Assassination skill. Medieval II only.
    assassination = null
    // integer (read/write) - Attack bonus.
    attack = null
    // integer (read/write) - Authority. Medieval II only.
    authority = null
    // string (read/write) - The per-character battle model override, or "" for none.
    battleModel = null
    // integer (read/write) - Battle surgery.
    battleSurgery = null
    // integer (read/write) - Season of birth, 0 winter to 3 autumn.
    birthSeason = null
    // float (read/write) - Year of birth. Fractional: with four turns per year a spring birth reads x.25.
    birthYear = null
    // integer (read/write) - Bodyguard size bonus. Medieval II only.
    bodyguardSize = null
    // integer (read/write) - Bodyguard valour.
    bodyguardValour = null
    // integer (read/write) - Boldness. Medieval II only.
    boldness = null
    // integer (read/write) - Bribery skill.
    bribery = null
    // integer (read/write) - Bribe resistance.
    briberyResistance = null
    // string (read/write) - The small UI card texture path.
    cardPath = null
    // integer (read/write) - Cavalry command.
    cavalryCommand = null
    // Character (read-only) - The on-map character, or null for a dead, off-map, wife or child record.
    character = null
    // integer (read/write) - Charm. Medieval II only.
    charm = null
    // integer (read-only) - How many children.
    childCount = null
    // integer (read/write) - ONE signed value: positive is chivalry, negative is dread. Medieval II only.
    chivalry = null
    // integer (read/write) - Command.
    command = null
    // integer (read/write) - Construction bonus.
    construction = null
    // string (read/write) - The folder under data/ui/custom_portraits. Setting it makes both textures come from there.
    customPortraitFolder = null
    // integer (read/write) - Season of death.
    deathSeason = null
    // integer (read/write) - How the character died; 0 means alive. The two games' enums diverge after `executed`, so compare against the enum table.
    deathType = null
    // float (read/write) - Year of death.
    deathYear = null
    // integer (read/write) - Defence bonus.
    defence = null
    // string (read-only) - The localised epithet, which comes from a trait level. `removeEpithet` clears it.
    displayEpithet = null
    // string (read-only) - The localised first name.
    displayFirstName = null
    // string (read-only) - The localised surname.
    displayLastName = null
    // string (read-only) - The name the player sees, title and epithet included. Rebuilt from the parts whenever the leader or heir flags move.
    displayName = null
    // integer (read/write) - Disposition. Medieval II only.
    disposition = null
    // integer (read/write) - Electability.
    electability = null
    // integer (read/write) - Eligibility. Medieval II only.
    eligibility = null
    // Faction (read-only) - The faction that owns this record. Read-only - the faction owns the record list; use `Character.switchFaction`.
    faction = null
    // integer (read/write) - Farming bonus.
    farming = null
    // integer (read/write) - Fertility.
    fertility = null
    // integer (read/write) - Finance. Medieval II only.
    finance = null
    // integer (read/write) - Foot in the door.
    footInTheDoor = null
    // string (read-only) - The internal first and surname as one label - what a campaign script looks a character up by. Built from the two parts.
    fullName = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read/write) - Generosity. Medieval II only.
    generosity = null
    // integer (read/write) - Grain trading. Rome only.
    grainTrading = null
    // integer (read/write) - Gunpowder command. Medieval II only.
    gunpowderCommand = null
    // integer (read/write) - Settlement health bonus.
    health = null
    // integer (read/write) - Heresy immunity. Medieval II only.
    heresyImmunity = null
    // integer (read/write) - Hit points. Generals start at 5 and can reach 10 from traits and ancillaries; the effective cap is 10.
    hitPoints = null
    // integer (read-only) - This record's position in its faction's record list.
    index = null
    // integer (read/write) - Infantry command.
    infantryCommand = null
    // integer (read/write) - Influence.
    influence = null
    // bool (read/write) - Whether the character is alive. Writing flips the flag ONLY - it neither kills nor resurrects. Use `Character.kill()`.
    isAlive = null
    // bool (read/write) - Whether the character is not yet of age.
    isChild = null
    // bool (read/write) - Whether the character heads the family tree.
    isFamilyHead = null
    // bool (read/write) - Whether the character hangs on the family tree.
    isFamilyMember = null
    // bool (read/write) - Sex.
    isMale = null
    // integer (read/write) - Kill count; feeds the experience level.
    kills = null
    // string (read/write) - The script label this character can be addressed by. Medieval II only.
    label = null
    // string (read/write) - The internal surname.
    lastName = null
    // integer (read/write) - Law bonus.
    law = null
    // integer (read/write) - The hidden character level, which picks the strategy model variant. Medieval II only.
    level = null
    // integer (read/write) - Line of sight. Writing it refreshes the faction's fog of war around this character.
    lineOfSight = null
    // integer (read/write) - Local popularity.
    localPopularity = null
    // integer (read/write) - Looting bonus.
    looting = null
    // integer (read/write) - Loyalty.
    loyalty = null
    // integer (read/write) - Magic. Medieval II only.
    magic = null
    // integer (read/write) - Management - hidden on Medieval II, one of the five visible attributes in Rome.
    management = null
    // integer (read/write) - Mining bonus.
    mining = null
    // integer (read/write) - Movement point bonus.
    movementPointsBonus = null
    // integer (read/write) - Which faction's name list this character's names come from. Medieval II only.
    nameFaction = null
    // integer (read/write) - Naval command.
    navalCommand = null
    // integer (read/write) - Negotiation. Rome only.
    negotiation = null
    // integer (read/write) - Night battle bonus.
    nightBattle = null
    // integer (read/write) - The faction that created this character - the sub-faction names, models and portraits are drawn from.
    originalFaction = null
    // CharacterRecord (read/write) - The character's father. Writing re-parents through the engine so the father's children list follows.
    parent = null
    // integer (read/write) - Personal security.
    personalSecurity = null
    // integer (read/write) - Piety. Medieval II only.
    piety = null
    // integer (read/write) - Popular standing. Rome only.
    popularStanding = null
    // integer (read/write) - Which slot of the portrait pool this character holds, or -1.
    portraitIndex = null
    // string (read/write) - The large portrait texture path.
    portraitPath = null
    // integer (read/write) - Public security.
    publicSecurity = null
    // integer (read/write) - Purity. Medieval II only.
    purity = null
    // integer (read/write) - Sabotage skill. Medieval II only.
    sabotage = null
    // integer (read/write) - Senate standing. Rome only.
    senateStanding = null
    // string (read/write) - The internal first name. Writing it re-spells the whole name through the engine so the display name and all three labels stay consistent.
    shortName = null
    // integer (read/write) - Siege attack bonus.
    siegeAttack = null
    // integer (read/write) - Siege defence bonus.
    siegeDefence = null
    // integer (read/write) - Siege engineering.
    siegeEngineering = null
    // integer (read/write) - Slave trading. Rome only.
    slaveTrading = null
    // CharacterRecord (read/write) - The character's spouse. Writing marries the two properly - surname change, log entry and the cross-faction diplomatic marriage on Medieval II. Refused when either is already married.
    spouse = null
    // integer (read/write) - Squalor modifier.
    squalor = null
    // integer (read/write) - The four status bits as one number: 1 leader, 2 heir, 4 was-leader, 8 off-map (Medieval II only). Writing goes through the engine's setters, which also regenerate the displayed title.
    status = null
    // integer (read/write) - Subterfuge.
    subterfuge = null
    // integer (read/write) - Tax collection bonus.
    taxCollection = null
    // integer (read/write) - Trade bonus.
    trading = null
    // integer (read/write) - Agent training bonus.
    trainingAgents = null
    // integer (read/write) - Animal unit training bonus.
    trainingAnimalUnits = null
    // integer (read/write) - Unit training bonus.
    trainingUnits = null
    // integer (read-only) - How many traits this character holds.
    traitCount = null
    // integer (read/write) - Troop morale bonus.
    troopMorale = null
    // integer (read/write) - Unorthodoxy. Medieval II only.
    unorthodoxy = null
    // integer (read/write) - Unrest modifier.
    unrest = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read/write) - Violence. Medieval II only.
    violence = null
    // bool (read/write) - Whether the character was ever the faction leader.
    wasLeader = null
    // bool (read/write) - Whether this marriage created a diplomatic alliance. Medieval II only.
    wasMarriageAlliance = null
    // The same engine call as `addAncillary`, with an optional duplicate check.
    // @param ancillaryName : string
    // @param noDuplicate : bool
    // @return bool
    function acquireAncillary(ancillaryName, noDuplicate) {}
    // Give the character an ancillary by name. Applies the attribute effects, enforces the unique-per-game rule and fires the acquired trigger.
    // @param ancillaryName : string
    // @return bool
    function addAncillary(ancillaryName) {}
    // Give the character a trait at a level. Case sensitive. A level above the trait's maximum is clamped; an existing instance is removed first, attribute effects included, and the anti-trait rules run.
    // @param traitName : string
    // @param level : integer
    // @return bool - false for an unknown trait name.
    function addTrait(traitName, level) {}
    // Add trait points, crossing level thresholds and running the anti-trait drain exactly as an event trigger would.
    // @param traitName : string
    // @param points : integer - may be negative.
    // @return bool
    function addTraitPoints(traitName, points) {}
    // Give this character a child. He must be male, married and below the children cap.
    // @param name : string - "random_name" or "" draws one.
    // @param lastName : string - empty takes the father's surname.
    // @param age : integer
    // @param isMale : bool
    // @param isAlive : bool
    // @return CharacterRecord|null - the child, or null when a check refused.
    function birthChild(name, lastName, age, isMale, isAlive) {}
    // One child by index, 0-based.
    // @param index : integer - 0 .. childCount-1.
    // @return CharacterRecord|null
    function child(index) {}
    // Every child, as an array. Empty for a woman.
    // @return array - of CharacterRecord.
    function children() {}
    // The character's combat bonus against each faction, as an array indexed by faction id. Medieval II only; grows past faction 31.
    // @return array - of int.
    function combatVsFaction() {}
    // The character's combat bonus against each religion, as an array indexed by religion id. Medieval II only - empty in Rome, which has a per-culture axis instead.
    // @return array - of int.
    function combatVsReligion() {}
    // Create a marriage candidate of the opposite sex, aged inside the campaign database's marriage window - a wife for a son, a husband for a daughter. Rome can only do the husband direction.
    // @return CharacterRecord|null
    function createMarriageCandidate() {}
    // Return the label, inventing an unused one and assigning it when there is none. Medieval II only.
    // @return string - the label, or "" in Rome.
    function ensureLabel() {}
    // The head of the trait list; walk it with `.next`.
    // @return Trait|null - null when there are none.
    function firstTrait() {}
    // One held ancillary by index, 0-based. What comes back is the database entry, shared by every holder.
    // @param index : integer - 0 .. ancillaryCount-1.
    // @return Ancillary|null
    function getAncillary(index) {}
    // One trait by list position, 0-based.
    // @param index : integer - 0 .. traitCount-1.
    // @return Trait|null
    function getTrait(index) {}
    // Whether the character holds a named ancillary.
    // @param ancillaryName : string
    // @return bool
    function hasAncillary(ancillaryName) {}
    // Whether the character holds any ancillary of a type. Medieval II only - Rome's ancillary records have no type field.
    // @param ancillaryType : string
    // @return bool
    function hasAncillaryType(ancillaryType) {}
    // Whether this is the faction heir.
    // @return bool
    function isHeir() {}
    // Whether this is the faction leader.
    // @return bool
    function isLeader() {}
    // Whether this character is off the map. Medieval II only.
    // @return bool
    function isOffMap() {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Create a wife for this character and marry her to him.
    // @param name : string - "random_name" or "".
    // @param age : integer
    // @return CharacterRecord|null
    function marryWife(name, age) {}
    // Draw a fresh first name and surname from a faction's list and re-spell the character.
    // @param nameFactionId : integer
    // @return bool
    function randomiseName(nameFactionId) {}
    // Re-roll the portrait out of the engine's pool. The culture and religion arguments are accepted and ignored - the allocator keys on the record's own faction.
    // @param cultureId : integer - ignored.
    // @param religionId : integer - ignored.
    // @return bool
    function randomisePortrait(cultureId, religionId) {}
    // Take an ancillary away, undoing its effects.
    // @param ancillary : Ancillary
    // @return bool
    function removeAncillary(ancillary) {}
    // Drop the epithet and rebuild the display name without it.
    // @return bool
    function removeEpithet() {}
    // Take a trait away, undoing its attribute effects.
    // @param traitName : string
    // @return bool
    function removeTrait(traitName) {}
    // Make this character the faction heir. The engine has one heir slot, so the argument is accepted and ignored.
    // @param onlyHeir : bool - accepted and ignored.
    // @return bool
    function setAsHeir(onlyHeir) {}
    // Point both portrait textures at one path.
    // @param path : string - relative to the mod folder.
    // @return bool
    function setPortrait(path) {}
    // The level of a trait the character holds.
    // @param traitName : string
    // @return integer - 0 when it does not have it.
    function traitLevel(traitName) {}
}

// The College of Cardinals. Medieval II only.
class CollegeOfCardinals {
    // integer (read-only) - How many cardinals are in the college.
    cardinalCount = null
    // integer (read-only) - How many cardinals voted in the last election.
    electionResultCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // bool (read/write) - Whether a papal election is under way. Writing true TRIGGERS one, which also builds the preferati list and the vote table.
    inElection = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read/write) - How many cardinals the college may hold. Promotions are re-evaluated against it each round, so raising it fills up over the following turns.
    maxCardinals = null
    // integer (read/write) - How many cardinals may be papal candidates.
    maxPreferati = null
    // CharacterRecord|null (read-only) - The seated pope's record.
    pope = null
    // bool (read-only) - Whether the pope is old or dead - the flag that arms an election.
    popeIsOld = null
    // integer (read-only) - The faction the current pope came from.
    popePreviousFactionId = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // A cardinal by index, 0-based.
    // @param index : integer - 0 .. cardinalCount-1.
    // @return Cardinal|null - null when out of range.
    function cardinal(index) {}
    // One vote from the last election, 0-based.
    // @param index : integer - 0 .. electionResultCount-1.
    // @return Cardinal|null - null when out of range.
    function electionResult(index) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// The campaign's crusade slot. There is exactly one and it always exists - a crusade that is not running has no target and an outcome of 0.
class Crusade {
    // integer (read-only) - The religion index of "catholic", or -1.
    catholicReligionId = null
    // integer (read-only) - The turn the join window closes.
    endTurn = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The religion index of "heretic", or -1.
    hereticReligionId = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read-only) - The join window in turns.
    joinWindow = null
    // integer (read-only) - The religion index of "orthodox", or -1 when the mod has no such religion.
    orthodoxReligionId = null
    // integer (read-only) - How the last crusade ended: 0 none, 1 success, 2 failure, 3 cancelled.
    outcome = null
    // integer (read-only) - The turn the crusade was called.
    startTurn = null
    // Settlement|null (read-only) - The settlement the crusade is called against, or null when none is running.
    target = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // Whether a faction has fought at the target.
    // @param factionId : integer
    // @return bool
    function factionFought(factionId) {}
    // Whether a faction has reached the target region.
    // @param factionId : integer
    // @return bool
    function factionInTarget(factionId) {}
    // Whether a faction has joined.
    // @param factionId : integer
    // @return bool
    function factionJoined(factionId) {}
    // Whether a faction joined during the previous turn.
    // @param factionId : integer
    // @return bool
    function factionJoinedLastTurn(factionId) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Denari a faction is paid when the crusade succeeds.
    // @param factionId : integer
    // @return integer - 0 for an out-of-range id.
    function rewardMoney(factionId) {}
    // How many of a faction's units get the experience bonus. A unit COUNT, not a chevron level.
    // @param factionId : integer
    // @return integer
    function rewardUnits(factionId) {}
    // Set the denari reward for a faction.
    // @param factionId : integer
    // @param money : integer
    // @return bool
    function setRewardMoney(factionId, money) {}
    // Set how many of a faction's units get the experience bonus.
    // @param factionId : integer
    // @param units : integer
    // @return bool
    function setRewardUnits(factionId, units) {}
    // Call a crusade. Refused while one is already running - starting over would repoint the target without stopping the old one, stranding every general already marching.
    // @param target : Settlement
    // @param timeToJoin : integer - the join window in turns; the game uses 10.
    // @param caller : Character - who called it; may be null.
    // @return bool
    function start(target, timeToJoin, caller) {}
    // End the running crusade and pay out.
    // @param result : integer - 0 none, 1 success, 2 failure, 3 cancelled.
    // @return bool
    function stop(result) {}
}

// A polygon a side's units may be placed in. Entirely engine-built, so entirely read-only.
class DeploymentArea {
    // float (read-only) - Its centre.
    centreX = null
    // float (read-only) - Its centre.
    centreY = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - Its height in world units.
    height = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read-only) - How many points make up the outline.
    pointCount = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - Its width in world units.
    width = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // One outline point, 0-based, as a read-only table with x and y.
    // @param index : integer - 0 .. pointCount-1.
    // @return table|null - null when out of range.
    function point(index) {}
}

// One row of descr_engines: a ram, a ladder, a siege tower, a catapult. Shared by every engine of that kind on the field and by the AI's planning, so it is read-only throughout.
class EngineRecord {
    // integer (read-only) - Its armour's index in the rules database.
    armourIndex = null
    // integer (read-only) - How many fixed arrow ports it has - a siege tower's shooting positions.
    arrowGeneratorCount = null
    // integer (read-only) - The attack the engine itself makes: a ram's impact, a sap's dig. 0 for an engine that only carries men. ⚠ An artillery piece's SHOT is not here - the crewing unit's record carries it.
    attack = null
    // integer (read-only) - The extra attack it lands on the first contact.
    chargeBonus = null
    // integer (read-only) - Which class of engine this is. The same number `SiegeEngine.type` reports.
    classId = null
    // integer (read-only) - What kind of damage it does.
    damageType = null
    // float (read-only) - How far short of the wall the crew stops to prepare the assault.
    dockDistance = null
    // bool (read-only) - Whether it can catch fire at all.
    flammable = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // float (read-only) - Total height, in metres.
    height = null
    // float (read-only) - How readily it catches, once something sets about it.
    ignitionChance = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - Whether it halves the armour of what it hits.
    isArmourPiercing = null
    // bool (read-only) - Whether it shoots, as opposed to being pushed into something.
    isArtillery = null
    // bool (read-only) - Whether it sets fires and frightens horses.
    isFire = null
    // bool (read-only) - Whether the engine's own attack is a ranged one.
    isMissileWeapon = null
    // float (read-only) - Front to back, in metres.
    length = null
    // float (read-only) - Its mass. What the pushing crew has to overcome.
    mass = null
    // integer (read-only) - The structural integrity a fresh engine of this kind starts with.
    maxHealth = null
    // integer (read-only) - An extra range limit on top of whatever it shoots, in metres. 0 for no limit of its own.
    missileRange = null
    // float (read-only) - How far behind it the men who are not pushing wait.
    mobDistance = null
    // string (read-only) - The engine's name as written in descr_engines.
    name = null
    // float (read-only) - Its collision radius in metres.
    radius = null
    // integer|null (read-only) - How many men may stand on it. Medieval II only; null in Rome.
    surfaceOccupants = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - Which variant of that class, for the classes that come in more than one shape.
    variant = null
    // float|null (read-only) - The radius used to decide whether it is on screen. Medieval II only; null in Rome, which culls on `radius`.
    visualRadius = null
    // integer (read-only) - Its weapon's index in the rules database.
    weaponIndex = null
    // integer (read-only) - Its weapon's type: melee, thrown, missile, siege.
    weaponType = null
    // float (read-only) - Side to side, in metres.
    width = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Whether one culture builds this engine.
    // @param cultureId : integer
    // @return bool
    function usesCulture(cultureId) {}
}

// Every named constant the engine exposes, one table per enum. Values are integers; compare against them rather than against literals, because a mod that reorders the underlying data can move them.
::Enum <- {
}

// One concrete objective under the battle AI's plan. Several are live at once, each owning a detachment of units.
::Enum.BattleAiObjective <- {
    // integer (read-only) - Lie in ambush.
    ambush = null,
    // integer (read-only) - Force a river crossing.
    assaultCrossing = null,
    // integer (read-only) - Attack a specific enemy battlegroup.
    attackEnemyBattleGroup = null,
    // integer (read-only) - Attack a specific model on the map, such as a gate or a wall section.
    attackModel = null,
    // integer (read-only) - Assault a settlement.
    attackSettlement = null,
    // integer (read-only) - Artillery only: bombard a target.
    bombard = null,
    // integer (read-only) - Deny a river crossing.
    defendCrossing = null,
    // integer (read-only) - Hold a line.
    defendLine = null,
    // integer (read-only) - Defend a settlement - one objective per settlement.
    defendSettlement = null,
    // integer (read-only) - Hold an area of terrain.
    defendTerrainArea = null,
    // integer (read-only) - Hold a forest.
    defendTerrainForest = null,
    // integer (read-only) - Hold a hill line.
    defendTerrainHill = null,
    // integer (read-only) - No objective - the slot is empty.
    invalid = null,
    // integer (read-only) - Move to a point on the battle map.
    moveToPoint = null,
    // integer (read-only) - Sally out of a settlement.
    sallyOut = null,
    // integer (read-only) - Improve visibility of the enemy.
    scout = null,
    // integer (read-only) - Harass a specific enemy battlegroup.
    skirmish = null,
    // integer (read-only) - Move reinforcements into a settlement being defended.
    supportDefendSettlement = null,
    // integer (read-only) - Move off the map.
    withdraw = null,
}

// The top-level plan the battle AI's group tactical analyser has settled on.
::Enum.BattleAiPlan <- {
    // integer (read-only) - Hide and spring an ambush if the chance comes.
    ambush = null,
    // integer (read-only) - Attack every enemy battlegroup.
    attackAll = null,
    // integer (read-only) - Assault the settlement.
    attackSettlement = null,
    // integer (read-only) - Take up a defensive position.
    defend = null,
    // integer (read-only) - Deny the enemy a terrain feature, typically a river crossing.
    defendFeature = null,
    // integer (read-only) - Defend the settlement.
    defendSettlement = null,
    // integer (read-only) - Hold and see what develops.
    doNothing = null,
    // integer (read-only) - Stay hidden.
    hide = null,
    // integer (read-only) - Sally out of the settlement.
    sallyOut = null,
    // integer (read-only) - Go and find the enemy.
    scout = null,
    // integer (read-only) - Leave the battlefield.
    withdraw = null,
}

// The kind of battlefield building an object is. Sparse on purpose: EOP names only the four values its callers test for, and the engine's enum has more.
::Enum.BattleBuildingType <- {
    // integer (read-only) - An ambient building - scenery that can be entered or knocked down.
    ambient = null,
    // integer (read-only) - A settlement gate.
    gate = null,
    // integer (read-only) - A wall tower.
    tower = null,
    // integer (read-only) - A wall section.
    wall = null,
}

// Which phase of a battle is running.
::Enum.BattleState <- {
    // integer (read-only) - The battle itself.
    conflict = null,
    // integer (read-only) - A hold before deployment starts.
    delay = null,
    // integer (read-only) - Deployment.
    deployment = null,
    // integer (read-only) - The second player's deployment, in a hotseat or multiplayer battle.
    deploymentPlayer2 = null,
    // integer (read-only) - No battle is running.
    notInBattle = null,
    // integer (read-only) - Before the battle proper - the pre-battle scroll.
    preBattle = null,
    // integer (read-only) - The pursuit phase after the scroll.
    pursuit = null,
    // integer (read-only) - The post-battle scroll.
    victoryScroll = null,
}

// How decisive a battle result was.
::Enum.BattleSuccess <- {
    // integer (read-only) - An average result.
    average = null,
    // integer (read-only) - A clear result.
    clear = null,
    // integer (read-only) - A close-run thing.
    close = null,
    // integer (read-only) - A crushing result.
    crushing = null,
}

// The kind of engagement a battle is. The engine calls this the conflict type and has four more values past the ones EOP names, for conflicts that are reported to the strategy map but never generate a battle.
::Enum.BattleType <- {
    // integer (read-only) - An ambush that was spotted.
    ambushFail = null,
    // integer (read-only) - An ambush that was sprung successfully.
    ambushSuccess = null,
    // integer (read-only) - A meeting engagement.
    meetEnemy = null,
    // integer (read-only) - A naval battle.
    naval = null,
    // integer (read-only) - An ordinary field battle.
    open = null,
    // integer (read-only) - A sally out of a besieged settlement.
    sally = null,
    // integer (read-only) - A settlement assault.
    siege = null,
    // integer (read-only) - A withdrawal.
    withdrawal = null,
}

// The effects a building can grant, as spelled in `export_descr_buildings`. Indexes the engine's CAPABILITY_TYPE table.
::Enum.BuildingCapability <- {
    // integer (read-only) - Multiplier applied to the region's total religion level.
    amplifyReligionLevel = null,
    // integer (read-only) - Experience granted to archers recruited here.
    archerBonus = null,
    // integer (read-only) - Armour upgrade level granted to units recruited here.
    armour = null,
    // integer (read-only) - Experience granted to cavalry recruited here.
    cavalryBonus = null,
    // integer (read-only) - Percentage discount on defensive building construction.
    constructionCostBonusDefensive = null,
    // integer (read-only) - Percentage discount on military building construction.
    constructionCostBonusMilitary = null,
    // integer (read-only) - Percentage discount on all other building construction.
    constructionCostBonusOther = null,
    // integer (read-only) - Percentage discount on religious building construction.
    constructionCostBonusReligious = null,
    // integer (read-only) - Percentage discount on stone building construction.
    constructionCostBonusStone = null,
    // integer (read-only) - Percentage discount on wooden building construction.
    constructionCostBonusWooden = null,
    // integer (read-only) - Percentage reduction in defensive building construction time.
    constructionTimeBonusDefensive = null,
    // integer (read-only) - Percentage reduction in military building construction time.
    constructionTimeBonusMilitary = null,
    // integer (read-only) - Percentage reduction in all other building construction time.
    constructionTimeBonusOther = null,
    // integer (read-only) - Percentage reduction in religious building construction time.
    constructionTimeBonusReligious = null,
    // integer (read-only) - Percentage reduction in stone building construction time.
    constructionTimeBonusStone = null,
    // integer (read-only) - Percentage reduction in wooden building construction time.
    constructionTimeBonusWooden = null,
    // integer (read-only) - Farming level; scales the region's food production.
    farmingLevel = null,
    // integer (read-only) - Modifier to the settlement's fire risk.
    fireRisk = null,
    // integer (read-only) - Number of units the settlement supports at no upkeep cost.
    freeUpkeep = null,
    // integer (read-only) - Defensive strength of the gatehouse.
    gateDefences = null,
    // integer (read-only) - Hit points of the settlement's gates.
    gateStrength = null,
    // integer (read-only) - Experience granted to gunpowder units recruited here.
    gunBonus = null,
    // integer (read-only) - Flat public-order bonus from happiness.
    happinessBonus = null,
    // integer (read-only) - Experience granted to heavy cavalry recruited here.
    heavyCavalryBonus = null,
    // integer (read-only) - Flat income the building generates each turn.
    incomeBonus = null,
    // integer (read-only) - Flat public-order bonus from law.
    lawBonus = null,
    // integer (read-only) - Mining level; scales income from the region's mineable resources.
    mineResource = null,
    // integer (read-only) - Experience granted to ships recruited here.
    navyBonus = null,
    // integer (read-only) - Papal standing gained while the building stands.
    popeApproval = null,
    // integer (read-only) - Papal standing lost while the building stands.
    popeDisapproval = null,
    // integer (read-only) - Percentage bonus to settlement population growth.
    populationGrowthBonus = null,
    // integer (read-only) - Percentage bonus to public health.
    populationHealthBonus = null,
    // integer (read-only) - Flat bonus to settlement loyalty.
    populationLoyaltyBonus = null,
    // integer (read-only) - Percentage discount on recruiting ships.
    recruitmentCostBonusNaval = null,
    // integer (read-only) - Extra recruitment queue slots the settlement gets.
    recruitmentSlots = null,
    // integer (read-only) - Experience chevrons granted to units recruited here.
    recruitsExpBonus = null,
    // integer (read-only) - Flat morale bonus for units recruited here.
    recruitsMoraleBonus = null,
    // integer (read-only) - Amount of the owner's religion the building spreads in its region.
    religionLevel = null,
    // integer (read-only) - Percentage discount on retraining.
    retrainCostBonus = null,
    // integer (read-only) - Road level available in the region.
    roadLevel = null,
    // integer (read-only) - Games the settlement can stage, for the public-order bonus.
    stageGames = null,
    // integer (read-only) - Races the settlement can stage, for the public-order bonus.
    stageRaces = null,
    // integer (read-only) - Percentage bonus to taxable income.
    taxableIncomeBonus = null,
    // integer (read-only) - Level of the settlement's towers.
    towerLevel = null,
    // integer (read-only) - Flat bonus to the settlement's base trade income.
    tradeBaseIncomeBonus = null,
    // integer (read-only) - Number of extra trade fleets the settlement supports.
    tradeFleet = null,
    // integer (read-only) - Percentage bonus to trade income.
    tradeLevelBonus = null,
    // integer (read-only) - Upgrades the bodyguard unit of generals recruited here.
    upgradeBodyguard = null,
    // integer (read-only) - Level of the settlement's walls.
    wallLevel = null,
    // integer (read-only) - Weapon upgrade level for gunpowder artillery.
    weaponArtilleryGunpowder = null,
    // integer (read-only) - Weapon upgrade level for mechanical artillery.
    weaponArtilleryMechanical = null,
    // integer (read-only) - Weapon upgrade level for bladed melee weapons.
    weaponMeleeBlade = null,
    // integer (read-only) - Weapon upgrade level for simple melee weapons.
    weaponMeleeSimple = null,
    // integer (read-only) - Weapon upgrade level for gunpowder missile weapons.
    weaponMissileGunpowder = null,
    // integer (read-only) - Weapon upgrade level for mechanical missile weapons.
    weaponMissileMechanical = null,
    // integer (read-only) - Weapon upgrade level for naval gunpowder weapons.
    weaponNavalGunpowder = null,
    // integer (read-only) - Projectile upgrade the building grants.
    weaponProjectile = null,
}

// Every attribute a character record carries, main and hidden. Several names are block markers that share a value with the first or last member of their block.
::Enum.CharacterAttribute <- {
    // integer (read-only) - Bonus to setting up and springing ambushes.
    ambush = null,
    // integer (read-only) - Command bonus with artillery.
    artilleryCommand = null,
    // integer (read-only) - Assassination skill.
    assassination = null,
    // integer (read-only) - Attack bonus in battle.
    attack = null,
    // integer (read-only) - One past the last attribute - the count, not an attribute. Our engine appends further slots here for factions past 32 and religions past 10.
    attributeNum = null,
    // integer (read-only) - Authority: the faction leader's hold over his generals.
    authority = null,
    // integer (read-only) - Chance of wounded men from the character's army surviving the battle.
    battleSurgery = null,
    // integer (read-only) - Bonus to the size of the character's bodyguard unit.
    bodyguardSize = null,
    // integer (read-only) - Experience bonus for the character's bodyguard unit.
    bodyguardValour = null,
    // integer (read-only) - Boldness: how readily a general commits to a fight.
    boldness = null,
    // integer (read-only) - Bonus to bribing enemy forces.
    bribery = null,
    // integer (read-only) - Resistance to being bribed.
    briberyResistance = null,
    // integer (read-only) - Command bonus with cavalry.
    cavalryCommand = null,
    // integer (read-only) - Charm: a princess's core skill.
    charm = null,
    // integer (read-only) - Chivalry, signed: negative is dread, positive is chivalry.
    chivalry = null,
    // integer (read-only) - Combat bonus against faction 0.
    combatVFaction0 = null,
    // integer (read-only) - Combat bonus against faction 1.
    combatVFaction1 = null,
    // integer (read-only) - Combat bonus against faction 10.
    combatVFaction10 = null,
    // integer (read-only) - Combat bonus against faction 11.
    combatVFaction11 = null,
    // integer (read-only) - Combat bonus against faction 12.
    combatVFaction12 = null,
    // integer (read-only) - Combat bonus against faction 13.
    combatVFaction13 = null,
    // integer (read-only) - Combat bonus against faction 14.
    combatVFaction14 = null,
    // integer (read-only) - Combat bonus against faction 15.
    combatVFaction15 = null,
    // integer (read-only) - Combat bonus against faction 16.
    combatVFaction16 = null,
    // integer (read-only) - Combat bonus against faction 17.
    combatVFaction17 = null,
    // integer (read-only) - Combat bonus against faction 18.
    combatVFaction18 = null,
    // integer (read-only) - Combat bonus against faction 19.
    combatVFaction19 = null,
    // integer (read-only) - Combat bonus against faction 2.
    combatVFaction2 = null,
    // integer (read-only) - Combat bonus against faction 20.
    combatVFaction20 = null,
    // integer (read-only) - Combat bonus against faction 21.
    combatVFaction21 = null,
    // integer (read-only) - Combat bonus against faction 22.
    combatVFaction22 = null,
    // integer (read-only) - Combat bonus against faction 23.
    combatVFaction23 = null,
    // integer (read-only) - Combat bonus against faction 24.
    combatVFaction24 = null,
    // integer (read-only) - Combat bonus against faction 25.
    combatVFaction25 = null,
    // integer (read-only) - Combat bonus against faction 26.
    combatVFaction26 = null,
    // integer (read-only) - Combat bonus against faction 27.
    combatVFaction27 = null,
    // integer (read-only) - Combat bonus against faction 28.
    combatVFaction28 = null,
    // integer (read-only) - Combat bonus against faction 29.
    combatVFaction29 = null,
    // integer (read-only) - Combat bonus against faction 3.
    combatVFaction3 = null,
    // integer (read-only) - Combat bonus against faction 30.
    combatVFaction30 = null,
    // integer (read-only) - Combat bonus against faction 31.
    combatVFaction31 = null,
    // integer (read-only) - Combat bonus against faction 4.
    combatVFaction4 = null,
    // integer (read-only) - Combat bonus against faction 5.
    combatVFaction5 = null,
    // integer (read-only) - Combat bonus against faction 6.
    combatVFaction6 = null,
    // integer (read-only) - Combat bonus against faction 7.
    combatVFaction7 = null,
    // integer (read-only) - Combat bonus against faction 8.
    combatVFaction8 = null,
    // integer (read-only) - Combat bonus against faction 9.
    combatVFaction9 = null,
    // integer (read-only) - Combat bonus against factions of religion 0.
    combatVReligion0 = null,
    // integer (read-only) - Combat bonus against factions of religion 1.
    combatVReligion1 = null,
    // integer (read-only) - Combat bonus against factions of religion 2.
    combatVReligion2 = null,
    // integer (read-only) - Combat bonus against factions of religion 3.
    combatVReligion3 = null,
    // integer (read-only) - Combat bonus against factions of religion 4.
    combatVReligion4 = null,
    // integer (read-only) - Combat bonus against factions of religion 5.
    combatVReligion5 = null,
    // integer (read-only) - Combat bonus against factions of religion 6.
    combatVReligion6 = null,
    // integer (read-only) - Combat bonus against factions of religion 7.
    combatVReligion7 = null,
    // integer (read-only) - Combat bonus against factions of religion 8.
    combatVReligion8 = null,
    // integer (read-only) - Combat bonus against factions of religion 9.
    combatVReligion9 = null,
    // integer (read-only) - Command: the general's battlefield leadership.
    command = null,
    // integer (read-only) - Discount on construction in the character's settlement.
    construction = null,
    // integer (read-only) - Defence bonus in battle.
    defence = null,
    // integer (read-only) - Disposition: a witch's temperament.
    disposition = null,
    // integer (read-only) - Electability - papal elections.
    electability = null,
    // integer (read-only) - Eligibility for promotion within the church.
    eligibility = null,
    // integer (read-only) - Marks the end of the per-faction combat bonus block; equal to combatVFaction31.
    endFactionCombat = null,
    // integer (read-only) - Marks the end of the per-religion combat bonus block; equal to combatVReligion9.
    endReligionCombat = null,
    // integer (read-only) - Bonus to the region's farming.
    farming = null,
    // integer (read-only) - Fertility: the chance of children.
    fertility = null,
    // integer (read-only) - Finance: a merchant's core skill.
    finance = null,
    // integer (read-only) - Bonus to getting a diplomatic proposal heard.
    footInTheDoor = null,
    // integer (read-only) - Generosity.
    generosity = null,
    // integer (read-only) - Command bonus with gunpowder units.
    gunpowderCommand = null,
    // integer (read-only) - Bonus to public health in the character's settlement.
    health = null,
    // integer (read-only) - Immunity to heresy: 0 is none, anything above 0 is full immunity.
    heresyImmunity = null,
    // integer (read-only) - Extra hit points for the character himself.
    hitPoints = null,
    // integer (read-only) - Command bonus with infantry.
    infantryCommand = null,
    // integer (read-only) - Influence: weight in diplomacy and at home.
    influence = null,
    // integer (read-only) - Bonus to law in the character's settlement.
    law = null,
    // integer (read-only) - Character level. Drives which model a priest or similar is shown with.
    level = null,
    // integer (read-only) - Bonus to how far the character can see on the campaign map.
    lineOfSight = null,
    // integer (read-only) - Public-order bonus in the character's settlement.
    localPopularity = null,
    // integer (read-only) - Bonus to what the character loots from a sacked settlement.
    looting = null,
    // integer (read-only) - Loyalty to the faction leader.
    loyalty = null,
    // integer (read-only) - Magic: a witch's core skill.
    magic = null,
    // integer (read-only) - Management: general governing competence.
    management = null,
    // integer (read-only) - Bonus to the region's mining income.
    mining = null,
    // integer (read-only) - Bonus to campaign-map movement points.
    movementPoints = null,
    // integer (read-only) - Command bonus at sea.
    navalCommand = null,
    // integer (read-only) - Bonus in night battles, and the ability to fight them.
    nightBattle = null,
    // integer (read-only) - Resistance to being assassinated.
    personalSecurity = null,
    // integer (read-only) - Piety: a priest's core skill.
    piety = null,
    // integer (read-only) - Bonus to catching enemy agents in the character's settlement.
    publicSecurity = null,
    // integer (read-only) - Purity: a priest's resistance to corruption.
    purity = null,
    // integer (read-only) - Sabotage skill.
    sabotage = null,
    // integer (read-only) - Attack bonus when assaulting a settlement.
    siegeAttack = null,
    // integer (read-only) - Defence bonus when defending a settlement.
    siegeDefence = null,
    // integer (read-only) - Bonus to building siege equipment.
    siegeEngineering = null,
    // integer (read-only) - Modifier to squalor in the character's settlement.
    squalor = null,
    // integer (read-only) - Marks the start of the per-faction combat bonus block; equal to combatVFaction0.
    startFactionCombat = null,
    // integer (read-only) - Marks the start of the per-religion combat bonus block; equal to combatVReligion0.
    startReligionCombat = null,
    // integer (read-only) - Subterfuge: the spy's and assassin's core skill.
    subterfuge = null,
    // integer (read-only) - Bonus to the settlement's tax income.
    taxCollection = null,
    // integer (read-only) - Bonus to the settlement's trade income.
    trading = null,
    // integer (read-only) - Discount on recruiting agents in the character's settlement.
    trainingAgents = null,
    // integer (read-only) - Discount on recruiting animal units in the character's settlement.
    trainingAnimalUnits = null,
    // integer (read-only) - Discount on recruiting units in the character's settlement.
    trainingUnits = null,
    // integer (read-only) - Morale bonus the general gives his troops.
    troopMorale = null,
    // integer (read-only) - Unorthodoxy: how far a priest strays from doctrine.
    unorthodoxy = null,
    // integer (read-only) - Modifier to unrest in the character's settlement.
    unrest = null,
    // integer (read-only) - Violence: an inquisitor's willingness to burn people.
    violence = null,
}

// What kind of character an agent or general is.
::Enum.CharacterType <- {
    // integer (read-only) - An admiral.
    admiral = null,
    // integer (read-only) - An assassin.
    assassin = null,
    // integer (read-only) - A diplomat.
    diplomat = null,
    // integer (read-only) - A general who is not a member of the family tree - a captain-general or hired one.
    general = null,
    // integer (read-only) - A heretic.
    heretic = null,
    // integer (read-only) - An inquisitor.
    inquisitor = null,
    // integer (read-only) - A merchant.
    merchant = null,
    // integer (read-only) - A member of the faction's family tree.
    namedCharacter = null,
    // integer (read-only) - The Pope. Value 12 is the engine's character-type count and is deliberately skipped.
    pope = null,
    // integer (read-only) - A priest (or bishop, or cardinal).
    priest = null,
    // integer (read-only) - A princess.
    princess = null,
    // integer (read-only) - A spy.
    spy = null,
    // integer (read-only) - A witch.
    witch = null,
}

// How a unit is faring in the melee it is currently in.
::Enum.CombatStatus <- {
    // integer (read-only) - Evenly balanced.
    balanced = null,
    // integer (read-only) - Losing badly.
    defeatAlmostCertain = null,
    // integer (read-only) - Being wiped out.
    defeatCertain = null,
    // integer (read-only) - Losing slightly.
    defeatDistinct = null,
    // integer (read-only) - Not in combat at all.
    notInCombat = null,
    // integer (read-only) - Winning clearly.
    victoryAlmostCertain = null,
    // integer (read-only) - Winning overwhelmingly.
    victoryCertain = null,
    // integer (read-only) - Winning slightly.
    victoryDistinct = null,
}

// What an entry in a settlement's construction queue is doing.
::Enum.ConstructionType <- {
    // integer (read-only) - Building something new.
    construction = null,
    // integer (read-only) - Converting the settlement between city and castle.
    convert = null,
    // integer (read-only) - Demolishing a building.
    demolition = null,
    // integer (read-only) - Nothing queued.
    none = null,
    // integer (read-only) - Repairing a damaged building.
    repair = null,
    // integer (read-only) - Upgrading an existing building to its next level.
    upgrade = null,
}

// How a character left the game. Also covers removals that are not deaths.
::Enum.DeathType <- {
    // integer (read-only) - A merchant removed because a rival acquired him - not a death.
    acquired = null,
    // integer (read-only) - Not dead - the character is still in play.
    alive = null,
    // integer (read-only) - Killed by an assassin.
    assassinated = null,
    // integer (read-only) - Removed by a successful bribe - not a death.
    bribed = null,
    // integer (read-only) - Removed because the captain was no longer needed - not a death.
    captainRemoval = null,
    // integer (read-only) - Denounced - not a death.
    denounced = null,
    // integer (read-only) - Killed in battle.
    diedInBattle = null,
    // integer (read-only) - Killed by a disaster event.
    diedInDisaster = null,
    // integer (read-only) - Died of old age or natural causes.
    diedNatural = null,
    // integer (read-only) - Disbanded - not a death.
    disbanded = null,
    // integer (read-only) - Removed in disgrace - not a death.
    disgraced = null,
    // integer (read-only) - Executed.
    executed = null,
    // integer (read-only) - Executed while a prisoner.
    executedPrisoner = null,
    // integer (read-only) - Removed because the character's faction no longer exists - not a death.
    incompatibleFaction = null,
    // integer (read-only) - A princess removed because she married - not a death.
    married = null,
    // integer (read-only) - Died of the plague.
    plague = null,
    // integer (read-only) - Poisoned.
    poisoned = null,
    // integer (read-only) - Removed while retraining - not a death.
    removedForRetraining = null,
    // integer (read-only) - Retired - not a death.
    retired = null,
    // integer (read-only) - Starved, typically in a besieged settlement.
    starvation = null,
    // integer (read-only) - Went down with a sunk ship.
    sunk = null,
}

// How the campaign AI intends to defend against one particular enemy faction.
::Enum.DefendPolicy <- {
    // integer (read-only) - Defence in depth - armies well behind the front line.
    deep = null,
    // integer (read-only) - Build and garrison forts wherever possible.
    fortified = null,
    // integer (read-only) - A strong force on the frontline, superior wherever possible.
    frontline = null,
    // integer (read-only) - A token garrison only.
    minimal = null,
    // integer (read-only) - Match the enemy's strength in the province.
    normal = null,
    // integer (read-only) - Defend by raiding into enemy territory.
    raid = null,
}

// Diplomatic relation kinds, as `campaign:checkDipStance` and `campaign:setDipStance` take them. These are relation FLAGS, not the 0-600 attitude scale the engine calls DIPLOMATIC_STANCE.
::Enum.DiplomaticRelation <- {
    // integer (read-only) - The two factions are allied.
    alliance = null,
    // integer (read-only) - The two factions are at peace.
    peace = null,
    // integer (read-only) - One faction is the other's suzerain (protectorate relationship).
    suzerain = null,
    // integer (read-only) - The two factions have trade rights. Does not report trade rights that were set up at game start.
    trade = null,
    // integer (read-only) - The two factions are at war.
    war = null,
}

// The values behind `eventTrigger.disasterType`. The EOP skin turns these into strings; the Squirrel payload keeps the integer, so this is how a Squirrel handler names one.
::Enum.DisasterType <- {
    // integer (read-only) - A dustbowl.
    dustbowl = null,
    // integer (read-only) - An earthquake.
    earthquake = null,
    // integer (read-only) - A famine.
    famine = null,
    // integer (read-only) - A fire.
    fire = null,
    // integer (read-only) - A flood.
    flood = null,
    // integer (read-only) - A barbarian horde spawning.
    horde = null,
    // integer (read-only) - A plague of locusts.
    locusts = null,
    // integer (read-only) - An outbreak of plague.
    plague = null,
    // integer (read-only) - A riot.
    riot = null,
    // integer (read-only) - A storm.
    storm = null,
    // integer (read-only) - A volcanic eruption.
    volcano = null,
}

// The formation a unit is in. WARNING: values from 5 up differ in Rome, which has a testudo the Medieval engine dropped - see idocs/part3/ENUMS.md.
::Enum.FormationType <- {
    // integer (read-only) - Column.
    column = null,
    // integer (read-only) - A loose clump - the engine's default unordered formation.
    horde = null,
    // integer (read-only) - Moving through another unit.
    movingThrough = null,
    // integer (read-only) - Phalanx.
    phalanx = null,
    // integer (read-only) - Schiltrom.
    schiltrom = null,
    // integer (read-only) - Shield wall.
    shieldWall = null,
    // integer (read-only) - Square.
    square = null,
    // integer (read-only) - Hollow square.
    squareHollow = null,
    // integer (read-only) - Manning a wall.
    wall = null,
    // integer (read-only) - Wedge.
    wedge = null,
}

// How the campaign AI intends to go after one particular enemy faction.
::Enum.InvadePolicy <- {
    // integer (read-only) - Build up to maximum force, then attack.
    buildup = null,
    // integer (read-only) - Attack immediately and hard.
    immediate = null,
    // integer (read-only) - Do not invade this faction.
    none = null,
    // integer (read-only) - Take and hold one particular region.
    opportunistic = null,
    // integer (read-only) - Raid only - damage and withdraw.
    raids = null,
    // integer (read-only) - Do not invade yet; move troops towards the border.
    start = null,
}

// The management policy the campaign AI applies to a settlement it controls.
::Enum.ManagePolicy <- {
    // integer (read-only) - Balanced - no particular emphasis.
    balanced = null,
    // integer (read-only) - Build for culture and public order.
    cultural = null,
    // integer (read-only) - Build for money.
    financial = null,
    // integer (read-only) - Build for population growth.
    growth = null,
    // integer (read-only) - Build for military strength.
    military = null,
    // integer (read-only) - No policy set.
    noPolicy = null,
}

// The values behind `eventTrigger.missionSuccessLevel`. The EOP skin turns these into strings; the Squirrel payload keeps the integer, so this is how a Squirrel handler names one.
::Enum.MissionSuccessLevel <- {
    // integer (read-only) - The mission was highly successful.
    highlySuccessful = null,
    // integer (read-only) - The mission failed.
    notSuccessful = null,
    // integer (read-only) - The mission was partly successful.
    partlySuccessful = null,
    // integer (read-only) - The mission was slightly successful.
    slightlySuccessful = null,
}

// The broad class of a unit's mount. WARNING: value 3 is EOP's `infantry`, but the engine's mount class 3 is the chariot - see idocs/part3/ENUMS.md.
::Enum.MountClass <- {
    // integer (read-only) - Camel.
    camel = null,
    // integer (read-only) - Elephant.
    elephant = null,
    // integer (read-only) - Horse.
    horse = null,
    // integer (read-only) - EOP's name for "no mount". Reads as the engine's chariot class - see the ENUMS.md divergence table.
    infantry = null,
}

// Which strategy-map pathfinding search to run - what the search is allowed to walk through and what it is looking for.
::Enum.PathSearchType <- {
    // integer (read-only) - Route around enemy zones of control.
    avoidZoc = null,
    // integer (read-only) - Direct route, ignoring most constraints.
    direct = null,
    // integer (read-only) - Ignore zones of control.
    ignoreZoc = null,
    // integer (read-only) - Find places a fleet can land an army.
    landingPoints = null,
    // integer (read-only) - Route that respects military access rights.
    militaryAccess = null,
    // integer (read-only) - Search constrained to one region.
    region = null,
    // integer (read-only) - Long-range strategic route.
    strategic = null,
}

// The battle-map ground material under a point; drives footing, movement cost and footstep sounds.
::Enum.PhysicalGroundType <- {
    // integer (read-only) - Dirt.
    dirt = null,
    // integer (read-only) - Dense forest.
    forestDense = null,
    // integer (read-only) - Long grass.
    grassLong = null,
    // integer (read-only) - Short grass.
    grassShort = null,
    // integer (read-only) - Ice.
    ice = null,
    // integer (read-only) - Mud.
    mud = null,
    // integer (read-only) - Mud road.
    mudRoad = null,
    // integer (read-only) - Rock.
    rock = null,
    // integer (read-only) - Sand.
    sand = null,
    // integer (read-only) - Dense scrub.
    scrubDense = null,
    // integer (read-only) - Snow.
    snow = null,
    // integer (read-only) - Stone road.
    stoneRoad = null,
    // integer (read-only) - Swamp.
    swamp = null,
    // integer (read-only) - One past the last ground type - the count, not a ground type.
    unknown = null,
    // integer (read-only) - Water.
    water = null,
    // integer (read-only) - Wooden decking.
    wood = null,
}

// How hard it is coming down.
::Enum.PrecipitationLevel <- {
    // integer (read-only) - Drizzle.
    drizzle = null,
    // integer (read-only) - Dry.
    dry = null,
    // integer (read-only) - Heavy.
    heavy = null,
    // integer (read-only) - One past the last level - the count, not a weather state.
    invalid = null,
    // integer (read-only) - Light.
    light = null,
    // integer (read-only) - Torrential.
    torrential = null,
}

// What is falling out of the sky.
::Enum.PrecipitationType <- {
    // integer (read-only) - Blown dust.
    dust = null,
    // integer (read-only) - Hail.
    hail = null,
    // integer (read-only) - One past the last type - the count, not a weather state.
    invalid = null,
    // integer (read-only) - Nothing.
    none = null,
    // integer (read-only) - Rain.
    rain = null,
    // integer (read-only) - Snow.
    snow = null,
}

// A hint the campaign AI's global production controller pushes onto a settlement, biasing what it builds and recruits.
::Enum.ProductionBias <- {
    // integer (read-only) - Likely to be lost; do not invest.
    abandon = null,
    // integer (read-only) - Recruit assassins.
    assassins = null,
    // integer (read-only) - Do not build units weaker than this threshold.
    buildStrengthLimit = null,
    // integer (read-only) - Likely to be attacked soon.
    conflict = null,
    // integer (read-only) - Recruit diplomats.
    diplomats = null,
    // integer (read-only) - A frontier province, but not under immediate threat.
    frontier = null,
    // integer (read-only) - On the front line and in the fighting.
    frontline = null,
    // integer (read-only) - Garrison is too small - build troops.
    increaseGarrison = null,
    // integer (read-only) - Recruit merchants.
    merchants = null,
    // integer (read-only) - Recruit priests.
    priests = null,
    // integer (read-only) - Favour tough units over cost-efficient ones.
    qualityUnits = null,
    // integer (read-only) - Build ships.
    ships = null,
    // integer (read-only) - Recruit spies.
    spies = null,
    // integer (read-only) - Large population, poor connectivity - build for tax.
    tax = null,
    // integer (read-only) - Well connected - build for trade.
    trade = null,
}

// The values behind `eventTrigger.ransomType`. The EOP skin turns these into strings; the Squirrel payload keeps the integer, so this is how a Squirrel handler names one.
::Enum.RansomType <- {
    // integer (read-only) - The captor's offer could not be paid.
    cannotPayRansom = null,
    // integer (read-only) - The prisoners were executed.
    execute = null,
    // integer (read-only) - The prisoners were ransomed.
    ransom = null,
    // integer (read-only) - The prisoners were released.
    release = null,
}

// Trade resources, in vanilla Medieval II's `descr_sm_resources` order. A mod that reorders or extends that file changes what these indices mean - read the resource's name if you need to be sure.
::Enum.ResourceType <- {
    // integer (read-only) - Amber.
    amber = null,
    // integer (read-only) - Camels.
    camels = null,
    // integer (read-only) - Chocolate.
    chocolate = null,
    // integer (read-only) - Coal.
    coal = null,
    // integer (read-only) - Cotton.
    cotton = null,
    // integer (read-only) - Dogs.
    dogs = null,
    // integer (read-only) - Dyes.
    dyes = null,
    // integer (read-only) - Elephants.
    elephants = null,
    // integer (read-only) - Fish.
    fish = null,
    // integer (read-only) - Furs.
    furs = null,
    // integer (read-only) - The generic trade-goods resource used where nothing specific applies.
    generic = null,
    // integer (read-only) - Gold.
    gold = null,
    // integer (read-only) - Grain.
    grain = null,
    // integer (read-only) - Iron.
    iron = null,
    // integer (read-only) - Ivory.
    ivory = null,
    // integer (read-only) - Marble.
    marble = null,
    // integer (read-only) - Silk.
    silk = null,
    // integer (read-only) - Silver.
    silver = null,
    // integer (read-only) - Slaves.
    slaves = null,
    // integer (read-only) - Spices.
    spices = null,
    // integer (read-only) - Sugar.
    sugar = null,
    // integer (read-only) - Sulphur. EOP's American spelling; the data file agrees.
    sulfur = null,
    // integer (read-only) - Textiles.
    textiles = null,
    // integer (read-only) - Timber.
    timber = null,
    // integer (read-only) - Tin.
    tin = null,
    // integer (read-only) - Tobacco.
    tobacco = null,
    // integer (read-only) - Wine.
    wine = null,
    // integer (read-only) - Wool.
    wool = null,
}

// The class of a siege engine or siege machine. Values 16 and 21 upward are not named here: 16 is the engine's artillery/machine boundary marker.
::Enum.SiegeEngineClass <- {
    // integer (read-only) - Ballista.
    ballista = null,
    // integer (read-only) - Basilisk.
    basilisk = null,
    // integer (read-only) - Bombard.
    bombard = null,
    // integer (read-only) - Cannon.
    cannon = null,
    // integer (read-only) - Catapult.
    catapult = null,
    // integer (read-only) - Culverin.
    culverin = null,
    // integer (read-only) - Grand bombard.
    grandBombard = null,
    // integer (read-only) - Holy cart.
    holyCart = null,
    // integer (read-only) - Huge bombard.
    hugeBombard = null,
    // integer (read-only) - Scaling ladder.
    ladder = null,
    // integer (read-only) - Mangonel.
    mangonel = null,
    // integer (read-only) - Monster ribault.
    monsterRibault = null,
    // integer (read-only) - Mortar.
    mortar = null,
    // integer (read-only) - Battering ram.
    ram = null,
    // integer (read-only) - Ribault.
    ribault = null,
    // integer (read-only) - Rocket launcher.
    rocketLauncher = null,
    // integer (read-only) - Scorpion. Also the engine's marker for the first class that can destroy walls.
    scorpion = null,
    // integer (read-only) - Serpentine.
    serpentine = null,
    // integer (read-only) - Siege tower.
    tower = null,
    // integer (read-only) - Trebuchet.
    trebuchet = null,
}

// Sort keys for `army:sortStack`. Plugin-defined ordering, not an engine enum; 0 is reserved as "no further key" so the first key can never be 0.
::Enum.StackSortKey <- {
    // integer (read-only) - Sort by the AI's own valuation of the unit.
    aiUnitValue = null,
    // integer (read-only) - Sort by unit category (infantry, cavalry, siege...).
    category = null,
    // integer (read-only) - Sort by the combined category-and-class classification.
    categoryClass = null,
    // integer (read-only) - Sort by unit class (heavy, light, skirmish...).
    class = null,
    // integer (read-only) - Sort by the unit's entry in export_descr_unit.
    eduType = null,
    // integer (read-only) - Sort by experience chevrons.
    experience = null,
    // integer (read-only) - Sort by the number of soldiers left in the unit.
    soldierCount = null,
}

// The campaign-map terrain type of a tile; drives movement cost, farming and what can be built.
::Enum.StrategyGroundType <- {
    // integer (read-only) - Beach.
    coast = null,
    // integer (read-only) - Deep sea.
    deepSea = null,
    // integer (read-only) - Dense forest.
    denseForest = null,
    // integer (read-only) - High-fertility farmland.
    highFertility = null,
    // integer (read-only) - High mountains.
    highMountains = null,
    // integer (read-only) - Hills.
    hills = null,
    // integer (read-only) - Impassable land.
    impassableLand = null,
    // integer (read-only) - Impassable sea.
    impassableSea = null,
    // integer (read-only) - Low-fertility farmland.
    lowFertility = null,
    // integer (read-only) - Low mountains.
    lowMountains = null,
    // integer (read-only) - Medium-fertility farmland.
    mediumFertility = null,
    // integer (read-only) - Ocean.
    ocean = null,
    // integer (read-only) - Shallow sea.
    shallowSea = null,
    // integer (read-only) - Swamp.
    swamp = null,
    // integer (read-only) - Wilderness.
    wilderness = null,
    // integer (read-only) - Sparse woodland.
    woodland = null,
}

// What a faction can currently see of one strategy-map tile.
::Enum.TileVisibility <- {
    // integer (read-only) - Not currently visible.
    notVisible = null,
    // integer (read-only) - Never seen, and still under the initial shroud.
    notVisibleInitial = null,
    // integer (read-only) - Currently visible.
    visible = null,
    // integer (read-only) - Seen before, currently under fog of war.
    wasVisible = null,
}

// What a unit is visibly doing right now.
::Enum.UnitActionStatus <- {
    // integer (read-only) - Berserk.
    berserk = null,
    // integer (read-only) - Bracing against a charge. Medieval II only.
    bracing = null,
    // integer (read-only) - Celebrating.
    celebrating = null,
    // integer (read-only) - Charging.
    charging = null,
    // integer (read-only) - Wiped out.
    dead = null,
    // integer (read-only) - Entering the battle; cannot be targeted yet.
    enteringBattle = null,
    // integer (read-only) - In melee.
    fighting = null,
    // integer (read-only) - Surrounded and fighting to the death.
    fightingBacksToTheWalls = null,
    // integer (read-only) - Hidden in woods or among buildings.
    hiding = null,
    // integer (read-only) - Idle, standing in formation.
    idle = null,
    // integer (read-only) - Infighting. Medieval II only.
    infighting = null,
    // integer (read-only) - Leaving the battle; cannot be targeted.
    leavingBattle = null,
    // integer (read-only) - Routed off the edge of the map.
    leftBattle = null,
    // integer (read-only) - Firing missiles.
    missilesFiring = null,
    // integer (read-only) - Reloading missiles.
    missilesReloading = null,
    // integer (read-only) - Moving.
    moving = null,
    // integer (read-only) - Chasing down a broken enemy.
    pursuing = null,
    // integer (read-only) - Rallying.
    rallying = null,
    // integer (read-only) - In its combat-ready pose, in formation.
    ready = null,
    // integer (read-only) - Reforming into its formation.
    reforming = null,
    // integer (read-only) - Routing.
    routing = null,
    // integer (read-only) - Running amok - elephants and the like.
    runningAmok = null,
    // integer (read-only) - Taunting the enemy.
    taunting = null,
    // integer (read-only) - Withdrawing from the battlefield.
    withdrawing = null,
}

// Toggleable per-unit battle behaviour. A BIT MASK, not a sequence: combine with arithmetic addition or a bitwise or, and test with a bitwise and.
::Enum.UnitBattleProperty <- {
    // integer (read-only) - Fire at will: missile troops pick their own targets.
    fireAtWill = null,
    // integer (read-only) - Guard mode: the unit holds its position instead of pursuing.
    guardMode = null,
    // integer (read-only) - Skirmish mode: the unit backs away from approaching melee.
    skirmish = null,
}

// A unit's broad category, as spelled in export_descr_unit.
::Enum.UnitCategory <- {
    // integer (read-only) - Cavalry.
    cavalry = null,
    // integer (read-only) - Animal handlers.
    handler = null,
    // integer (read-only) - Infantry.
    infantry = null,
    // integer (read-only) - Non-combatants.
    nonCombatant = null,
    // integer (read-only) - Ships.
    ship = null,
    // integer (read-only) - Siege engines.
    siege = null,
}

// Category and class collapsed into one classification, which is how the AI reasons about a stack's composition.
::Enum.UnitCategoryClass <- {
    // integer (read-only) - Animal handler.
    animalHandler = null,
    // integer (read-only) - Warship.
    battleShip = null,
    // integer (read-only) - Heavy cavalry.
    heavyCavalry = null,
    // integer (read-only) - Heavy infantry.
    heavyInfantry = null,
    // integer (read-only) - Light cavalry.
    lightCavalry = null,
    // integer (read-only) - Light infantry.
    lightInfantry = null,
    // integer (read-only) - Missile cavalry.
    missileCavalry = null,
    // integer (read-only) - Missile infantry.
    missileInfantry = null,
    // integer (read-only) - Non-combatant.
    nonCombatant = null,
    // integer (read-only) - Siege weapon.
    siegeWeapon = null,
    // integer (read-only) - Spearmen.
    spearmenInfantry = null,
}

// A unit's tactical class, orthogonal to its category.
::Enum.UnitClass <- {
    // integer (read-only) - Heavy - shock troops.
    heavy = null,
    // integer (read-only) - Light.
    light = null,
    // integer (read-only) - Missile troops.
    missile = null,
    // integer (read-only) - Skirmishers.
    skirmish = null,
    // integer (read-only) - Spearmen.
    spearmen = null,
}

// How a unit reacts to orders and to friends breaking around it.
::Enum.UnitDiscipline <- {
    // integer (read-only) - Can go berserk: fearsome in combat and deaf to orders.
    berserker = null,
    // integer (read-only) - Highly disciplined: stays responsive to orders under pressure.
    disciplined = null,
    // integer (read-only) - Can become impetuous and attack without being told to.
    impetuous = null,
    // integer (read-only) - Routs more easily when units nearby are routing.
    low = null,
    // integer (read-only) - Normal discipline.
    normal = null,
}

// A unit's morale band, in descending order of steadiness.
::Enum.UnitMorale <- {
    // integer (read-only) - Berserk: fighting mad and beyond command.
    berserk = null,
    // integer (read-only) - Firm.
    firm = null,
    // integer (read-only) - High morale.
    high = null,
    // integer (read-only) - Impetuous: eager to the point of charging without orders.
    impetuous = null,
    // integer (read-only) - Routing.
    routing = null,
    // integer (read-only) - Shaken.
    shaken = null,
    // integer (read-only) - Wavering - about to break.
    wavering = null,
}

// The order a unit is currently executing. WARNING: every value from 10 up is shifted by one against our engine, which has an extra attack-move order - see idocs/part3/ENUMS.md.
::Enum.UnitOrder <- {
    // integer (read-only) - Attacking a building.
    attackBuilding = null,
    // integer (read-only) - Attacking a siege engine.
    attackEngine = null,
    // integer (read-only) - Attacking a unit.
    attackUnit = null,
    // integer (read-only) - Changing formation.
    changeFormation = null,
    // integer (read-only) - Closing up its formation.
    changeFormationClose = null,
    // integer (read-only) - Changing formation width.
    changeFormationWidth = null,
    // integer (read-only) - Changing melee state - guard mode on or off.
    changeMeleeState = null,
    // integer (read-only) - Changing between walk and run.
    changeSpeed = null,
    // integer (read-only) - Manning a siege engine.
    collectEngine = null,
    // integer (read-only) - Abandoning a siege engine.
    dropEngine = null,
    // integer (read-only) - Feigning a rout.
    feignRout = null,
    // integer (read-only) - Halting.
    halt = null,
    // integer (read-only) - Hiding.
    hide = null,
    // integer (read-only) - Idle. Never actually assigned to a unit; it exists so a script has a name for "no order".
    idle = null,
    // integer (read-only) - Moving to a position.
    move = null,
    // integer (read-only) - Moving back inside the playable area.
    moveIntoPlayableArea = null,
    // integer (read-only) - Setting up a siege engine.
    setupEngine = null,
    // integer (read-only) - Turning on the spot.
    turn = null,
    // integer (read-only) - Using a special ability.
    useAbility = null,
    // integer (read-only) - Withdrawing from the battlefield.
    withdraw = null,
}

// How well drilled a unit is; affects how tidily it holds and changes formation.
::Enum.UnitTraining <- {
    // integer (read-only) - Highly trained.
    highlyTrained = null,
    // integer (read-only) - Trained.
    trained = null,
    // integer (read-only) - Untrained.
    untrained = null,
}

// The technology family a weapon belongs to; picks which building upgrade applies to it.
::Enum.WeaponTechType <- {
    // integer (read-only) - Gunpowder artillery - bombards and cannon.
    artilleryGunpowder = null,
    // integer (read-only) - Mechanical artillery - catapults, trebuchets, ballistae.
    artilleryMechanical = null,
    // integer (read-only) - Bladed melee weapons - the smith's upgrade path.
    meleeBlade = null,
    // integer (read-only) - Simple melee weapons - spears, clubs, basic swords.
    meleeSimple = null,
    // integer (read-only) - Gunpowder missile weapons - handguns and arquebuses.
    missileGunpowder = null,
    // integer (read-only) - Mechanical missile weapons - bows and crossbows.
    missileMechanical = null,
    // integer (read-only) - Naval gunpowder weapons.
    navalGunpowder = null,
}

// How a weapon is used. Ordering is load-bearing in the engine; do not reorder it.
::Enum.WeaponType <- {
    // integer (read-only) - An ordinary melee weapon.
    melee = null,
    // integer (read-only) - A fired missile weapon.
    missile = null,
    // integer (read-only) - A melee weapon that damages buildings.
    siegeMelee = null,
    // integer (read-only) - A missile weapon that damages buildings.
    siegeMissile = null,
    // integer (read-only) - A thrown weapon - javelins, axes.
    thrown = null,
}

// A faction. Addressed by its stable faction id, so the reference stays usable for the whole campaign - including after the faction is destroyed, which is a state you can ask about through `status`.
class Faction {
    // FactionAi|null (read-only) - The faction's campaign-AI controller, or null for a human faction. Read-only - the controller is owned by the faction and created and destroyed with it.
    ai = null
    // integer (read/write) - The AI's building-production persona index.
    aiBuildingPersona = null
    // integer (read/write) - Non-zero stops the campaign AI acting for this faction. Medieval II only.
    aiFrozen = null
    // string (read/write) - The campaign-AI label, which selects this faction's entry in the campaign AI database. Writing it relinks the parameters too. Medieval II only.
    aiLabel = null
    // integer (read/write) - The AI's troop-production persona index. Writing it changes what the AI builds but NOT its sally and risk values, which were bound when the AI was built.
    aiTroopPersona = null
    // integer (read-only) - How many armies and navies, garrisons included.
    armyCount = null
    // bool (read/write) - Whether AI assistants manage every settlement of this faction.
    autoManageAll = null
    // bool (read/write) - Whether the assistants may construct buildings.
    autoManageBuildings = null
    // bool (read/write) - Whether the assistants may recruit troops.
    autoManageRecruitment = null
    // bool (read/write) - Whether the assistants may set taxes and the rest of the settlement mechanics.
    autoManageTaxes = null
    // integer (read/write) - Battles lost.
    battlesLost = null
    // integer (read/write) - Battles won.
    battlesWon = null
    // Settlement|null (read/write) - The faction's capital. Writing refuses a settlement this faction does not own.
    capital = null
    // integer (read-only) - How many characters are on the campaign map.
    characterCount = null
    // integer (read-only) - Every character record the faction holds - alive, dead, off-map, wives and children included.
    characterRecordCount = null
    // integer (read-only) - The faction's culture index. Immutable at runtime.
    cultureId = null
    // string (read/write) - The name shown to the player.
    displayName = null
    // integer (read-only) - How many forts the faction owns.
    fortCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // bool (read-only) - Whether one of this faction's regions is a sea region with an open frontier.
    hasSeaAccess = null
    // CharacterRecord|null (read/write) - The faction heir, or null.
    heir = null
    // integer (read-only) - The faction id. Immutable - it is the key of every per-faction table in the game.
    id = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - Whether the Pope has excommunicated this faction. Medieval II only.
    isExcommunicated = null
    // bool (read/write) - Whether the faction is in horde mode. Writing flips the flag only; it does not create or disband the horde stack.
    isHorde = null
    // integer (read/write) - 1 when a human owns this faction, 0 when the AI does. Writing hands it over.
    isPlayerControlled = null
    // integer (read/write) - Non-zero while nobody has met this faction. Medieval II only.
    isUndiscovered = null
    // integer (read/write) - The fixed per-turn royal income. Medieval II only; reads 0 in Rome.
    kingsPurse = null
    // integer (read/write) - The faction id this one last fought.
    lastOpponentId = null
    // CharacterRecord|null (read/write) - The faction leader. Writing runs the full promotion.
    leader = null
    // integer (read-only) - How many missions are currently active.
    missionCount = null
    // integer (read/write) - The treasury. Writing sets it outright, without booking it against an income or expenditure category.
    money = null
    // string (read-only) - The internal name from descr_sm_factions.txt, e.g. "england".
    name = null
    // integer (read-only) - Bit N is set when faction N borders this one. Only the first 32 factions fit - use isNeighbourFaction past that.
    neighbourFactionMask = null
    // integer (read-only) - How many regions border this faction's territory.
    neighbourRegionCount = null
    // integer (read-only) - Farms + trade + taxes + mining + king's purse - upkeep - wages, this turn.
    netIncome = null
    // integer (read-only) - How many port buildings the faction owns.
    portCount = null
    // FactionRecord|null (read-only) - The faction's descr_sm_factions record - colours, culture, banner indices, horde parameters, the roman/barbarian/eastern/slave flags. Read-only: the record is the database row for this faction id, so there is no other one to point at.
    record = null
    // integer (read-only) - How many regions the faction owned when the campaign began.
    regionsAtStart = null
    // integer (read/write) - Regions captured. Medieval II only - Rome keeps no such counter.
    regionsCaptured = null
    // integer (read/write) - Regions lost. Medieval II only.
    regionsLost = null
    // integer (read/write) - The faction's religion index, -1 for none. Medieval II only; reads 0 in Rome.
    religionId = null
    // integer (read-only) - Why this faction last revolted. Engine-written. Medieval II only.
    revoltReason = null
    // integer (read-only) - How many settlements the faction owns.
    settlementCount = null
    // float (read/write) - The assistants' spend-versus-save balance, 0.0 to 1.0.
    spendingLimit = null
    // integer (read-only) - How many hiding enemy characters this faction has spotted.
    spottedCharacterCount = null
    // integer (read/write) - 0 alive, 1 death pending, 2 dead, 3 dead until resurrected, 4 dead until emerged (Medieval II only).
    status = null
    // integer (read-only) - How many per-faction battle records this faction keeps.
    trackedFactionCount = null
    // integer (read-only) - What the treasury held at the start of this round. Engine-snapshotted.
    treasuryAtTurnStart = null
    // integer (read/write) - Units lost. Medieval II only.
    unitsLost = null
    // integer (read/write) - Units recruited. Medieval II only.
    unitsRecruited = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - How many watchtowers the faction owns.
    watchtowerCount = null
    // WinCondition|null (read-only) - The victory condition this faction is playing to, or null when it has none. Read-only: changing a condition means building a whole new one.
    winCondition = null
    // The campaign AI's absolute statistics for this faction - population, border lengths, fleet and army strength, enemy count. A writable view of the real row; recomputed once per AI turn, so it reads all zeroes before the first one.
    // @return FactionAiStats|null - null outside a campaign.
    function aiStats() {}
    // The campaign AI's view of this faction's position relative to another - the numbers the long-term-goal director scores an invasion with. A writable view of the real row.
    // @param other : Faction
    // @return FactionPairAiStats|null - null outside a campaign.
    function aiStatsVs(other) {}
    // An army by index, 0-based.
    // @param index : integer - 0 .. armyCount-1.
    // @return Army|null - null when out of range.
    function army(index) {}
    // This faction's battle record against one other faction, as a read-only table {battlesWon, battlesLost, lastResult}.
    // @param targetFactionId : integer - 0 .. trackedFactionCount-1.
    // @return table|null - null when out of range. lastResult is 0 lose, 1 draw, 2 win, -1 never fought.
    function battleStatsVs(targetFactionId) {}
    // Whether this faction can currently see a character.
    // @param candidate : Character
    // @return bool
    function canSee(candidate) {}
    // An on-map character by index, 0-based.
    // @param index : integer - 0 .. characterCount-1.
    // @return Character|null - null when out of range.
    function character(index) {}
    // A character record by index, 0-based.
    // @param index : integer - 0 .. characterRecordCount-1.
    // @return CharacterRecord|null - null when out of range.
    function characterRecord(index) {}
    // How many alive characters of one type the faction has on the map.
    // @param characterType : integer
    // @return integer
    function countCharactersOfType(characterType) {}
    // Create a character on the campaign map. Prefer spawnArmy unless you want a bare agent.
    // @param type : string - a descr_character title, e.g. "named character".
    // @param age : integer
    // @param name : string - short name.
    // @param lastName : string - full name.
    // @param subFaction : integer - out of range disables it.
    // @param portrait : string - custom-portrait folder, or "".
    // @param x : integer
    // @param y : integer
    // @return Character|null - null when the tile is invalid.
    function createCharacter(type, age, name, lastName, subFaction, portrait, x, y) {}
    // Build a fort at a tile.
    // @param x : integer
    // @param y : integer
    // @param cultureId : integer - negative for this faction's own culture.
    // @return Fort|null - null when the tile will not take one.
    function createFort(x, y, cultureId) {}
    // Build a watchtower at a tile. The region must have a settlement, which is where the tower's culture comes from.
    // @param x : integer
    // @param y : integer
    // @return bool - whether it was built.
    function createWatchtower(x, y) {}
    // Remove one of this faction's forts. Refused while it still has a garrison.
    // @param fort : Fort
    // @return bool
    function deleteFort(fort) {}
    // Income and expenditure for one past turn, as a read-only table of 24 keys. adminIncome, corruptionExpense and devastationExpense are always 0; merchantIncome and kingsPurseIncome are 0 in Rome.
    // @param turnsAgo : integer - 0 is the current turn, 9 the oldest kept.
    // @return table|null - null past the ring or the campaign's age.
    function economyAt(turnsAgo) {}
    // The first character record in this faction holding a named ancillary, including off-map, retired and dead holders.
    // @param ancillaryName : string
    // @return CharacterRecord|null
    function findAncillaryHolder(ancillaryName) {}
    // Find one of this faction's character records by script label. Rome's records carry no labels, so it always reads null there.
    // @param label : string
    // @return CharacterRecord|null
    function findCharacterByLabel(label) {}
    // A fort by index, 0-based.
    // @param index : integer - 0 .. fortCount-1.
    // @return Fort|null - null when out of range.
    function fort(index) {}
    // Whether this faction has military access to another's territory. One-way.
    // @param target : Faction
    // @return bool
    function hasMilitaryAccess(target) {}
    // Drop one viewer from a tile; with none left it settles at explored.
    // @param x : integer
    // @param y : integer
    // @return bool
    function hideTile(x, y) {}
    // Whether another faction borders this one.
    // @param other : Faction
    // @return bool
    function isNeighbourFaction(other) {}
    // Whether a region borders this faction's territory.
    // @param regionId : integer
    // @return bool
    function isNeighbourRegion(regionId) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // A bordering region's id by index, 0-based.
    // @param index : integer
    // @return integer - -1 when out of range.
    function neighbourRegionId(index) {}
    // A port by index, 0-based.
    // @param index : integer - 0 .. portCount-1.
    // @return Port|null - null when out of range.
    function port(index) {}
    // The faction's six score components for one scored turn, as a read-only table.
    // @param turnNumber : integer
    // @return table|null - null when that turn is not in the score history.
    function rankingAt(turnNumber) {}
    // Give this faction live vision of one tile.
    // @param x : integer
    // @param y : integer
    // @return bool
    function revealTile(x, y) {}
    // Wear another faction's banner, standard, symbol and UI logos. Saved with the campaign. Medieval II only.
    // @param factionName : string - the other faction's internal name.
    // @return bool
    function setBannerFrom(factionName) {}
    // Set the faction's primary colour, channels 0-255. The strat radar refreshes; the aerial map's border materials are built at map open and will not.
    // @param red : integer
    // @param green : integer
    // @param blue : integer
    // @return bool
    function setColour(red, green, blue) {}
    // Make a character record the faction leader.
    // @param newLeader : CharacterRecord - must be in this faction.
    // @param replaceExisting : bool - false refuses when a leader already exists.
    // @return bool - whether the promotion happened.
    function setLeader(newLeader, replaceExisting) {}
    // Grant or revoke this faction's military access to another's territory. One-way.
    // @param target : Faction
    // @param access : bool
    // @return bool
    function setMilitaryAccess(target, access) {}
    // Choose which faction's name pool one character type draws from. Medieval II only.
    // @param characterType : integer
    // @param nameFactionId : integer
    // @return bool
    function setNameFaction(characterType, nameFactionId) {}
    // Set the faction's secondary colour, 0-255.
    // @param red : integer
    // @param green : integer
    // @param blue : integer
    // @return bool
    function setSecondaryColour(red, green, blue) {}
    // Set the diplomatic standing towards another faction, clamped to the database's range. Medieval II only.
    // @param target : Faction
    // @param standing : float
    // @return bool
    function setStandingTowards(target, standing) {}
    // Set what this faction knows about one tile. 3 or more reveals with live vision, 2 leaves it explored. 0 and 1 are refused - there is no route back below explored.
    // @param x : integer
    // @param y : integer
    // @param visibility : integer
    // @return bool
    function setTileVisibility(x, y, visibility) {}
    // A settlement by index, 0-based.
    // @param index : integer - 0 .. settlementCount-1.
    // @return Settlement|null - null when out of range.
    function settlement(index) {}
    // Create a general or agent with one unit under him.
    // @param name : string - short name.
    // @param lastName : string - "" splits `name` into both parts.
    // @param characterType : integer
    // @param label : string - accepted and ignored.
    // @param portrait : string
    // @param x : integer
    // @param y : integer
    // @param age : integer
    // @param family : bool - accepted and ignored.
    // @param subFaction : integer
    // @param unitIndex : integer - EDU record index; negative for none.
    // @param experience : integer
    // @param weaponUpgrade : integer
    // @param armourUpgrade : integer
    // @param soldiers : integer - negative for the unit's default size.
    // @return Army|null - null when the tile is occupied or invalid.
    function spawnArmy(name, lastName, characterType, label, portrait, x, y, age, family, subFaction, unitIndex, experience, weaponUpgrade, armourUpgrade, soldiers) {}
    // Move a set of units out of their stack to a target tile. Every unit must belong to this faction and to the same army.
    // @param units : array - an array of Unit references.
    // @param x : integer
    // @param y : integer
    // @return Army|null - the resulting army, or null if the split was refused.
    function splitArmy(units, x, y) {}
    // A spotted hiding character by index, 0-based.
    // @param index : integer - 0 .. spottedCharacterCount-1.
    // @return Character|null - null when out of range.
    function spottedCharacter(index) {}
    // The diplomatic standing towards another faction, -1.0 to 1.0. Passing this faction itself reads its global standing. Medieval II only - null in Rome.
    // @param target : Faction
    // @return float|null
    function standingTowards(target) {}
    // Copy another faction's explored map into this one's. Tiles arrive explored, not watched, and no diplomatic bookkeeping is done.
    // @param from : Faction
    // @return bool
    function takeMapInfoFrom(from) {}
    // What this faction knows about one tile: 0 never seen and never revealable, 1 never seen, 2 explored, 3 or more currently watched.
    // @param x : integer
    // @param y : integer
    // @return integer|null - null when the tile is off the map.
    function tileVisibility(x, y) {}
    // A watchtower by index, 0-based.
    // @param index : integer - 0 .. watchtowerCount-1.
    // @return Watchtower|null - null when out of range.
    function watchtower(index) {}
}

// A faction's campaign AI controller. Held by faction id, so it stays usable outside the aiTurn hook.
class FactionAi {
    // Faction|null (read-only) - The faction this AI controller belongs to. Immutable - the controller is created with its faction.
    faction = null
    // integer (read-only) - That faction's id.
    factionId = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // FactionLtgd|null (read-only) - The long-term goal director: who to fight, who to ally with, how hard to defend.
    ltgd = null
    // FactionProductionAi|null (read-only) - The faction-wide production priorities and the per-region controllers under them.
    productionAi = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// The campaign AI's absolute picture of one faction. Recomputed at the start of that faction's AI turn, so it is at most one turn stale and a write biases exactly one turn.
class FactionAiStats {
    // integer (read/write) - Border shared with allies.
    alliedBorderLength = null
    // integer (read/write) - How many land armies.
    armyCount = null
    // integer (read/write) - Total land army strength.
    armyStrength = null
    // integer (read/write) - Mean land army strength.
    averageArmyStrength = null
    // integer (read/write) - Mean navy strength.
    averageNavyStrength = null
    // integer (read/write) - Mean settlement population.
    averageSettlementPopulation = null
    // integer (read/write) - Border shared with factions that are not allies.
    borderLength = null
    // integer (read/write) - Enemy strength already in or next to its regions.
    contestedEnemyStrength = null
    // integer (read/write) - How many factions it is at war with.
    enemyFactionCount = null
    // integer (read/write) - Army strength not tied up in garrisons - what it can actually attack with.
    freeArmyStrength = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read/write) - How many navies.
    navyCount = null
    // integer (read/write) - Total navy strength.
    navyStrength = null
    // integer (read/write) - Total civilian population, protectorates excluded.
    population = null
    // integer (read/write) - Military production power, in army strength points per turn.
    productionPower = null
    // integer (read/write) - The faction id it is a protectorate of, or -1. A value that is not a faction id is refused.
    protectorId = null
    // integer (read/write) - Total area in map tiles.
    tileCount = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One faction's AI stance towards one other faction: postures, priorities, diplomacy wants and the point totals behind them. Writing during the calculateLtgd hook is the intended way to steer the campaign AI.
class FactionAttitude {
    // integer (read/write) - How much it wants an alliance directed against this faction.
    allianceAgainstPoints = null
    // integer (read/write) - How much it wants to be allied.
    alliancePoints = null
    // bool (read/write) - The AI's own record of being at war. Rewritten from the diplomacy state every assessment.
    atWar = null
    // integer (read/write) - How badly it wants that defensive posture.
    defendPriority = null
    // integer (read/write) - 0 minimal, 1 normal, 2 raid, 3 frontline, 4 fortified, 5 in depth.
    defendType = null
    // integer (read/write) - How likely this faction is to succeed in invading us. `defendType` is derived from this.
    defensePoints = null
    // integer (read/write) - How much it wants this faction's territory.
    desirePoints = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read/write) - How badly it wants to invade. Organic band roughly 250-800; the strategy director hands its single attack slot to the highest.
    invadePriority = null
    // integer (read/write) - How good an idea invading looks. `invasionType` is derived from this.
    invasionPoints = null
    // integer (read/write) - 0 build up, 1 immediate, 2 raids, 3 opportunistic, 4 start planning, 5 do not invade.
    invasionType = null
    // bool (read/write) - Whether a naval or forced invasion may overwrite the computed stance. Medieval II only; reads false in Rome.
    mayForceInvade = null
    // bool (read/write) - Set when the invasion happens this turn regardless of the strength test.
    mustInvade = null
    // bool (read/write) - Whether it wants to offer protectorate status.
    offersProtection = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // bool (read/write) - Whether it wants an alliance.
    wantsAlliance = null
    // bool (read/write) - Whether it wants a ceasefire.
    wantsPeace = null
    // bool (read/write) - Whether it wants to become a protectorate.
    wantsProtection = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// What one faction thinks of another. Directed - read both directions for the symmetric picture.
class FactionDiplomacy {
    // integer (read-only) - Times aid was promised and not delivered.
    assistFailures = null
    // integer (read-only) - Times the first came to the second's aid.
    assists = null
    // integer (read/write) - Net denari the second owes the first. The engine only offers a delta, so the setter applies the difference.
    balance = null
    // integer (read-only) - Threats made and not followed through.
    emptyThreats = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // bool (read/write) - Whether the first may march through the second's territory. Writing also arms the escape window.
    hasMilitaryAccess = null
    // bool (read-only) - Whether the two have trade rights. Set it with Campaign.setStance.
    hasTradeRights = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - Whether the two have met. Writing true introduces them; they cannot be un-introduced.
    isKnown = null
    // bool (read-only) - Whether the first is the second's protectorate. Set it with Campaign.setStance.
    isProtectorate = null
    // bool (read/write) - Whether the first still trusts the second. One-way: it can be lost, not regained.
    isTrustworthy = null
    // bool (read-only) - Whether the last talks ended in agreement.
    lastMeetingSucceeded = null
    // integer (read-only) - Turns left to leave the second's land after access was revoked.
    leaveTerritoryTimer = null
    // integer (read-only) - The stance before the current one: 0 allied, 100 suspicious, 200 neutral, 400 hostile, 600 at war.
    previousState = null
    // integer (read/write) - Protectorate denari paid this turn.
    protectoratePayment = null
    // float (read/write) - How much the first likes the second, -1.0 to 1.0, clamped to the database's range on write. Medieval II only.
    standing = null
    // integer (read/write) - The current stance, same five values. Prefer Campaign.setStance - a write here moves the number without the message, the ally cascade or the AI's reaction.
    state = null
    // integer (read-only) - Meetings that ended in agreement.
    successfulMeetings = null
    // integer (read-only) - How many treaties the first has BROKEN with the second.
    treatiesBroken = null
    // integer (read/write) - Denari of tribute received each turn.
    tributePerTurn = null
    // integer (read/write) - Turns of tribute left to pay.
    tributeTurnsLeft = null
    // integer (read-only) - Total turns spent allied.
    turnsAllied = null
    // integer (read-only) - Turns as a protectorate. Medieval II only.
    turnsAsProtectorate = null
    // integer (read-only) - Turns at the current stance. Medieval II only; 0 in Rome.
    turnsAtCurrentStance = null
    // integer (read-only) - Total turns spent at war.
    turnsAtWar = null
    // integer (read/write) - Turns since an agreed ceasefire. Writing 0 resets it. Medieval II only.
    turnsSinceCeasefire = null
    // integer (read-only) - Rounds since the two last talked.
    turnsSinceLastMeeting = null
    // integer (read/write) - Rounds since the first last got map information from the second. Writing 0 stamps a fresh trade; any other value is refused.
    turnsSinceMapInfoTrade = null
    // integer (read-only) - Turns with military access. Medieval II only.
    turnsWithMilitaryAccess = null
    // integer (read-only) - Turns with trade rights. Medieval II only.
    turnsWithTradeRights = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - Threats made and kept.
    validThreats = null
    // integer (read-only) - Battles the first has won against the second.
    winsInBattle = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A faction's long-term goal director. Held by faction id, so it stays usable outside the calculateLtgd hook.
class FactionLtgd {
    // FactionAi|null (read-only) - The AI controller that owns this director.
    aiFaction = null
    // integer (read/write) - Enemy military strength in a position to reach us, as of the last assessment. Recomputed each AI turn.
    enemyFreeStrength = null
    // float (read/write) - That strength as a proportion of our own.
    enemyFreeStrengthBalance = null
    // Faction|null (read-only) - The faction whose goals this director manages.
    faction = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read/write) - The region the landing force would embark from, or -1.
    navalStagingRegionId = null
    // integer (read/write) - The region a landing would target, or -1. Writing a non-region is refused.
    navalTargetRegionId = null
    // bool (read/write) - Whether the director is planning an overseas landing.
    planningNavalInvasion = null
    // integer (read/write) - 0 intense war, 1 normal war, 2 skirmish, 3 build up, 4 survive.
    policy = null
    // integer (read/write) - 0 way too few, 1 insufficient, 2 barely adequate, 3 enough.
    troopStatus = null
    // integer (read/write) - Bit N is set when faction N is at war with one of our trusted allies. Only the first 32 factions fit; `isTrustedAllyEnemy` is correct past that.
    trustedAllyEnemyMask = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // This faction's whole stance towards one other faction.
    // @param targetFactionId : integer
    // @return FactionAttitude|null - null for an id with no row.
    function attitudeTowards(targetFactionId) {}
    // Clear every stance this director holds. The next assessment rebuilds them.
    // @return bool - always true.
    function clearAttitudes() {}
    // How many settlements in a region and its neighbours belong to a faction we intend to invade.
    // @param regionId : integer
    // @return integer
    function invasionTargetCount(regionId) {}
    // The same walk, summing invade priorities; a neighbouring region's settlements count half.
    // @param regionId : integer
    // @return integer
    function invasionTargetPriority(regionId) {}
    // Whether a faction is a trusted ally.
    // @param targetFactionId : integer
    // @return bool
    function isTrustedAlly(targetFactionId) {}
    // Whether a faction is at war with one of our trusted allies. Correct past faction 31, unlike the mask.
    // @param target : Faction
    // @return bool
    function isTrustedAllyEnemy(target) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Whether every land neighbour of a region is ours or a trusted ally's.
    // @param regionId : integer
    // @return bool
    function regionBordersOnlyTrusted(regionId) {}
}

// The campaign AI's picture of one faction's position relative to another. Not symmetric - (a, b) and (b, a) are different rows.
class FactionPairAiStats {
    // integer (read/write) - Free army strength in provinces bordering the other faction.
    frontlineStrength = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // bool (read/write) - Whether an alliance exists directed against the other faction.
    hasAllianceAgainst = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - Whether the other faction is the strongest of this one's neighbours.
    isStrongestNeighbour = null
    // bool (read/write) - ...and whether it is the weakest.
    isWeakestNeighbour = null
    // integer (read/write) - Shared border length, in tiles.
    sharedBorderLength = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A faction's global production controller: the build and recruit priorities every region is seeded from, plus the per-region controllers.
class FactionProductionAi {
    // FactionAi|null (read-only) - The AI controller that owns these priorities.
    aiFaction = null
    // integer (read-only) - Regions being run as balanced centres.
    balancedRegionCount = null
    // integer (read/write) - Building-production persona: 0 balanced, 1 religious, 2 trader, 3 comfort, 4 bureaucrat, 5 craftsman, 6 sailor, 7 fortified.
    buildingPersona = null
    // integer (read-only) - Regions being run as culture centres.
    culturalRegionCount = null
    // integer (read-only) - Regions being run as financial centres.
    financialRegionCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - Regions being run for population growth.
    growthRegionCount = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read-only) - Regions being run as military centres.
    militaryRegionCount = null
    // integer (read-only) - How many per-region production controllers this faction runs.
    regionControllerCount = null
    // integer (read/write) - Troop-production persona. Changes what the AI builds but NOT its sally and risk values, which were bound when the AI object was created.
    troopPersona = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // Read it back.
    // @param agentType : integer
    // @return integer|null
    function agentBias(agentType) {}
    // Read back a capability construction bias.
    // @param capability : integer
    // @return integer|null - null when out of range.
    function buildBias(capability) {}
    // Read it back.
    // @param agentType : integer
    // @return integer|null
    function buildForAgentBias(agentType) {}
    // Read it back.
    // @param unitCategory : integer
    // @return integer|null
    function buildForUnitBias(unitCategory) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Read it back.
    // @param unitCategory : integer
    // @return integer|null
    function recruitBias(unitCategory) {}
    // One per-region production controller by index. The reference is keyed by region, not by the index - the engine compacts the list when the faction loses a region.
    // @param index : integer - 0 .. regionControllerCount-1.
    // @return RegionProductionAi|null - null when out of range.
    function regionController(index) {}
    // Faction-wide bias towards recruiting one agent type.
    // @param agentType : integer
    // @param value : integer
    // @return bool
    function setAgentBias(agentType, value) {}
    // Faction-wide bias towards constructing buildings that grant one capability. The per-region controllers are re-seeded from this each production pass.
    // @param capability : integer - a buildingCapability index.
    // @param value : integer
    // @return bool - false when the index is out of range.
    function setBuildBias(capability, value) {}
    // Faction-wide bias towards buildings that recruit one agent type.
    // @param agentType : integer
    // @param value : integer
    // @return bool
    function setBuildForAgentBias(agentType, value) {}
    // Faction-wide bias towards buildings that recruit one unit category.
    // @param unitCategory : integer
    // @param value : integer
    // @return bool
    function setBuildForUnitBias(unitCategory, value) {}
    // Faction-wide bias towards recruiting one unit category.
    // @param unitCategory : integer
    // @param value : integer
    // @return bool
    function setRecruitBias(unitCategory, value) {}
}

// A faction's descr_sm_factions record. Addressed by faction id and alive for the whole process, including for factions that are not in the campaign. Everything on it is database state, not campaign state: it is NOT saved, so every edit has to be re-applied after a load.
class FactionRecord {
    // bool (read/write) - Whether the faction can build siege towers. M2 only.
    canBuildSiegeTowers = null
    // bool (read/write) - Whether the faction gets princesses. M2 only.
    canHavePrincess = null
    // bool (read/write) - Whether the faction hordes when it loses its last settlement.
    canHorde = null
    // bool (read/write) - Whether the faction can sap walls.
    canSap = null
    // bool (read/write) - Whether the faction's armies carry and suffer the plague. M2 only.
    canTransmitPlague = null
    // integer (read-only) - The record's culture index. Read-only: a live faction keeps a separate copy of its culture, and the portrait pools, settlement plans and reverse index are all built from the load-time value.
    cultureId = null
    // bool (read/write) - Whether disbanded units return to the recruitment pools. M2 only.
    disbandToPools = null
    // string (read-only) - The faction's name as shown to the player. Empty when the faction has no localised entry.
    displayName = null
    // integer (read-only) - The faction id this record belongs to.
    factionId = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // bool (read/write) - Whether the faction has a family tree. M2 only.
    hasFamilyTree = null
    // integer (read/write) - Largest percentage of a stack the horde fills, 0-100.
    hordeMaxPercentStack = null
    // integer (read/write) - Most units created when this faction hordes.
    hordeMaxUnits = null
    // integer (read/write) - Fewest named characters a horde keeps.
    hordeMinNamedCharacters = null
    // integer (read/write) - Fewest units created when this faction hordes.
    hordeMinUnits = null
    // integer (read/write) - Settlement population per horde unit. Must be positive - it is a divisor.
    hordePopPerUnit = null
    // integer (read/write) - How much the maximum drops each time the faction hordes again.
    hordeReductionPerHorde = null
    // integer (read/write) - Non-zero when the faction can be picked in a custom battle.
    inCustomBattles = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - The descr_sm_factions barbarian flag.
    isBarbarian = null
    // bool (read/write) - The descr_sm_factions eastern flag.
    isEastern = null
    // bool (read/write) - The descr_sm_factions roman flag.
    isRoman = null
    // bool (read/write) - The descr_sm_factions slave flag - NOT the campaign's one true slave faction, which is fixed at database open.
    isSlave = null
    // integer (read/write) - UI logo index. Resets on reload.
    logoIndex = null
    // string (read/write) - The internal faction name from descr_sm_factions.txt. Writing it breaks every data file and script that still names the old one.
    name = null
    // integer (read/write) - Bitmask of the unit-availability periods the faction may NOT be picked in. Medieval II only.
    periodsBlockedInCustomBattles = null
    // integer (read/write) - How strongly the campaign AI favours invading by sea.
    prefersNavalInvasions = null
    // integer (read/write) - Primary colour blue channel, 0-255. Resets on reload.
    primaryBlue = null
    // integer (read/write) - Primary colour green channel, 0-255. Resets on reload.
    primaryGreen = null
    // integer (read/write) - Primary colour red channel, 0-255. Resets on reload.
    primaryRed = null
    // integer (read/write) - The faction's DEFAULT religion index, -1 for none - a live faction's current religion is Faction.religionId. Medieval II only.
    religionId = null
    // integer (read/write) - Secondary colour blue channel, 0-255. Resets on reload.
    secondaryBlue = null
    // integer (read/write) - Secondary colour green channel, 0-255. Resets on reload.
    secondaryGreen = null
    // integer (read/write) - Secondary colour red channel, 0-255. Resets on reload.
    secondaryRed = null
    // integer (read/write) - The faction id that shadows this one, -1 for none.
    shadowedByFactionId = null
    // integer (read/write) - The faction id this one shadows, -1 for none.
    shadowsFactionId = null
    // integer (read/write) - Small UI logo index. Resets on reload.
    smallLogoIndex = null
    // integer (read/write) - The faction id this one is spawned by, -1 for none.
    spawnedByFactionId = null
    // integer (read/write) - The faction id spawned when this one revolts, -1 for none.
    spawnsOnRevoltId = null
    // integer (read/write) - Which banner set this faction flies, -1 for none. Resets on reload - Faction.setBannerFrom is the saved way to change a faction's whole identity.
    standardIndex = null
    // bool (read/write) - Whether the faction uses elective (teutonic) succession. M2 only.
    teutonicSuccession = null
    // integer (read/write) - The faction's triumph weight.
    triumphValue = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Set the battle model this faction's generals or named characters use.
    // @param model : string - a battle model name.
    // @param characterType : integer - general or named character only.
    // @return bool
    function setBattleModel(model, characterType) {}
    // Set the campaign-map model this faction uses for one character type at one rank level. Rome has a single level, so anything but 0 is refused there.
    // @param model : string - a strat model name.
    // @param characterType : integer
    // @param level : integer - 0-based rank level.
    // @return bool - false for an unknown model or an undeclared level.
    function setStratModel(model, characterType, level) {}
}

// One person as the family scroll draws them: their record, which generation they are in, and who sits next to and under them. Held as the character they show rather than as a pointer, so a leaf you kept keeps meaning that person and reads null once the scroll stops drawing them.
class FamilyLeaf {
    // integer (read-only) - How many children are DRAWN under this leaf, which is not always how many the character has: the scroll drops a daughter whose husband is already in the tree, and drops the descendants of anyone now in another faction.
    childCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // FamilyLeaf|null (read-only) - The leaf this one hangs under. Null for the root, and null for a spouse - the scroll draws a wife beside her husband rather than under her own parents.
    parent = null
    // CharacterRecord|null (read-only) - The character this leaf is drawn for.
    record = null
    // FamilyLeaf|null (read-only) - The leaf drawn alongside this one, or null for anyone unmarried or still a child.
    spouse = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // A child leaf by index.
    // @param index : integer - 0 .. childCount - 1.
    // @return FamilyLeaf|null - The child, or null when out of range.
    function child(index) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// The family tree the family scroll draws for one house. Reachable whether or not the scroll is open, so it is safe to fetch once and keep - `root` is what says which. Everything on it is the DISPLAY structure: who the scroll decided to draw and where. The people themselves are `CharacterRecord`s, reachable from every leaf.
class FamilyTree {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - How many generations deep the built tree is. 0 while the scroll is shut.
    generations = null
    // FamilyLeaf|null (read-only) - The leaf the cursor is over, or null. Real hover tracking, unlike the card manager's - the tree follows its own mouse-over so it can draw the tooltip.
    hoveredLeaf = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // FamilyLeaf|null (read-only) - The leaf at the top of the tree - the head of the house being shown. Null while the scroll is shut, which is the open/closed test: the engine builds the tree on open and deletes it on close.
    root = null
    // bool (read/write) - Whether EVERY leaf can be clicked rather than only the ones the campaign normally allows. Turning it on is how a script lets the player pick any member of the house.
    selectAnyLeaf = null
    // FamilyLeaf|null (read-only) - The leaf the player has clicked, or null. Cleared every time the tree is rebuilt.
    selectedLeaf = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// An .fbx file loaded at runtime. Load it once, then `place()` as many objects from it as you need. Nothing here is saved - re-load on campaign start.
class FbxModel {
    // integer (read-only) - Bones in the matrix palette. Bone 0 is the identity, so an unskinned model reports 1.
    boneCount = null
    // float (read-only) - Animation length in seconds; 0 when there is none.
    duration = null
    // integer (read-only) - Sampled animation frames; 1 when the file has no animation or its first animation never moves anything.
    frameCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read-only) - The id this model occupies in the Lua `M2TWEOPFBX` API. Only interesting when a Lua script shares the same models; nothing here asks for one.
    key = null
    // integer (read-only) - Objects currently placed with this model.
    objectCount = null
    // string (read-only) - The path the .fbx was loaded from.
    path = null
    // string (read-only) - The .dds bound when it draws. The .fbx's own materials are ignored.
    texture = null
    // integer (read-only) - Triangles in the imported mesh.
    triangleCount = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - Vertices after welding.
    vertexCount = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Place a new object using this model, at the origin, hidden nowhere and playing. Set its `position` and `size` next.
    // @return FbxObject|null - The new object.
    function place() {}
    // Unload the model and remove every object placed with it.
    // @return bool - True when it was loaded.
    function unload() {}
}

// One placed instance of an `FbxModel`. A decorative prop: it has no collision, nothing can select it, and it is not saved.
class FbxObject {
    // integer (read/write) - Where the object draws: 1 strategy map, 2 battle map, 0 both. Default 1. Any other value is refused.
    drawType = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read-only) - The id this object occupies in the Lua `M2TWEOPFBX` API. 0 for anything this API created.
    key = null
    // FbxModel|null (read-only) - The model this object draws.
    model = null
    // bool (read/write) - Whether the file's animation plays. False freezes it at the first frame.
    playing = null
    // table (read-only) - The object's world position as `{x, y, z}`. ⚠ ENGINE order - y is height. The Lua `M2TWEOPFBX.getFbxObjectCoords` puts height in z; this does not.
    position = null
    // float (read/write) - Uniform scale, default 0.001. Zero and negative values are refused.
    size = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // bool (read/write) - Whether the object is drawn.
    visible = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Remove this object. The model stays loaded.
    // @return bool - True when it existed.
    function remove() {}
    // Move the object. ⚠ ENGINE order - y is height.
    // @param x : float - World x.
    // @param y : float - Height.
    // @param z : float - World z.
    // @return bool - True; the write always happens.
    function setPosition(x, y, z) {}
}

// A fort. Addressed by the tile it stands on - forts have no stable index.
class Fort {
    // Army|null (read/write) - The garrison.
    army = null
    // integer (read-only) - Characters inside the fort.
    characterCount = null
    // integer (read-only) - Whose fort model is used.
    creatorCultureId = null
    // integer (read-only) - Who built the fort.
    creatorFactionId = null
    // integer (read-only) - The fort's wall tier. Medieval II only.
    fortificationLevel = null
    // bool (read/write) - Whether the gates stand open at battle start.
    gatesOpen = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // Character|null (read-only) - The garrison commander.
    governor = null
    // integer (read-only) - Turns the fort could resist.
    holdoutTurns = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // Faction|null (read/write) - Who holds the fort. Writing it runs the full residence transfer.
    owner = null
    // bool (read/write) - Whether the fort has the plague. Writing true infects it; false is refused - there is no cure entry point.
    plagued = null
    // bool (read-only) - Whether the garrison would surrender.
    readyToSurrender = null
    // integer (read-only) - The region the fort is in.
    regionId = null
    // bool (read/write) - Whether the garrison already sallied this turn.
    salliedOut = null
    // integer (read-only) - Armies besieging.
    siegeCount = null
    // integer (read-only) - How long the siege has run.
    siegeDuration = null
    // integer (read/write) - The rebel sub-faction of the garrison.
    subFactionId = null
    // bool (read-only) - Taken by a crusade. Medieval II only.
    takenByCrusade = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - The fort's tile x.
    x = null
    // integer (read-only) - The fort's tile y.
    y = null
    // Hand the fort to another faction. The garrison always goes with it.
    // @param faction : Faction
    // @param convertGarrison : bool - accepted and ignored.
    // @return bool
    function changeOwner(faction, convertGarrison) {}
    // A character inside, by index.
    // @param index : integer
    // @return Character|null
    function characterAt(index) {}
    // Whether the owner is allied to a faction.
    // @param factionId : integer
    // @return bool
    function isAllyTo(factionId) {}
    // Whether the owner is at war with a faction.
    // @param factionId : integer
    // @return bool
    function isEnemyTo(factionId) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // A besieging stack by index, 0-based. The siege's own numbers live on the army.
    // @param index : integer - 0 .. siegeCount-1.
    // @return Army|null - null when out of range.
    function siege(index) {}
}

// One guild: which building chain it needs and its three level thresholds. Medieval II only - every guild call reads empty on Rome.
class Guild {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// The campaign's jihad slot. Same shape as Crusade.
class Jihad {
    // integer (read-only) - The turn the join window closes.
    endTurn = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read-only) - The join window in turns.
    joinWindow = null
    // integer (read-only) - The religion index of "islam", or -1 when the mod has no such religion.
    muslimReligionId = null
    // integer (read-only) - How the last jihad ended: 0 none, 1 success, 2 failure, 3 cancelled.
    outcome = null
    // integer (read-only) - The turn the jihad was called.
    startTurn = null
    // Settlement|null (read-only) - The settlement the jihad is called against, or null.
    target = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // Whether a faction has fought at the target.
    // @param factionId : integer
    // @return bool
    function factionFought(factionId) {}
    // Whether a faction has reached the target region.
    // @param factionId : integer
    // @return bool
    function factionInTarget(factionId) {}
    // Whether a faction has joined.
    // @param factionId : integer
    // @return bool
    function factionJoined(factionId) {}
    // Whether a faction joined during the previous turn.
    // @param factionId : integer
    // @return bool
    function factionJoinedLastTurn(factionId) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Denari a faction is paid when the jihad succeeds.
    // @param factionId : integer
    // @return integer
    function rewardMoney(factionId) {}
    // How many of a faction's units get the experience bonus.
    // @param factionId : integer
    // @return integer
    function rewardUnits(factionId) {}
    // Set the denari reward for a faction.
    // @param factionId : integer
    // @param money : integer
    // @return bool
    function setRewardMoney(factionId, money) {}
    // Set how many of a faction's units get the experience bonus.
    // @param factionId : integer
    // @param units : integer
    // @return bool
    function setRewardUnits(factionId, units) {}
    // Call a jihad. Refused while one is already running.
    // @param target : Settlement
    // @param timeToJoin : integer - the join window in turns.
    // @param caller : Character - who called it; may be null.
    // @return bool
    function start(target, timeToJoin, caller) {}
    // End the running jihad and pay out.
    // @param result : integer - 0 none, 1 success, 2 failure, 3 cancelled.
    // @return bool
    function stop(result) {}
}

// A continent or island: the regions reachable from each other by land.
class LandMass {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The land mass index.
    index = null
    // integer (read-only) - Regions on this land mass.
    regionCount = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // A region id by index, 0-based.
    // @param index : integer
    // @return integer - -1 out of range.
    function regionId(index) {}
}

// A strategy-map overlay: one colour per map tile, painted by region or by tile, then composited over a background image. Reads null once released.
class MapImage {
    // bool (read/write) - Use the contrast-weighted blur rather than the plain one. Needs `useBlur` too.
    adaptiveBlur = null
    // float (read/write) - The blur's sigma, 1.0 by default. Negatives and NaN are refused.
    blurStrength = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - Height in map tiles.
    height = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - Whether `makeTexture` blurs the finished picture. True by default.
    useBlur = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - Width in map tiles.
    width = null
    // Add per-channel deltas to every tile of a region, clamped to 0-255. Deltas may be negative.
    // @param regionId : integer
    // @param r : integer
    // @param g : integer
    // @param b : integer
    // @param a : integer
    // @return bool - False when there is no such region, or no campaign.
    function addRegion(regionId, r, g, b, a) {}
    // Add per-channel deltas to one tile, clamped to 0-255.
    // @param x : integer
    // @param y : integer
    // @param r : integer
    // @param g : integer
    // @param b : integer
    // @param a : integer
    // @return bool - False when the tile is off the map.
    function addTile(x, y, r, g, b, a) {}
    // Reset every tile to transparent, keeping the buffer.
    // @return bool - False only when no campaign is running.
    function clear() {}
    // Write the tile colours to `<name>.bmp`, one pixel per tile, north up. Relative to the game directory unless the name is an absolute path; the directory has to exist already.
    // @param name : string - File name WITHOUT the .bmp extension.
    // @return bool - False when the write failed.
    function exportBmp(name) {}
    // Set every tile of a region to one colour. Channels are clamped to 0-255.
    // @param regionId : integer
    // @param r : integer
    // @param g : integer
    // @param b : integer
    // @param a : integer - Blend weight against the background, not a framebuffer alpha. 0 leaves the tile alone.
    // @return bool - False when there is no such region, or no campaign.
    function fillRegion(regionId, r, g, b, a) {}
    // Set one tile's colour. A clamp and a store - this is the call a full-map sweep makes tens of thousands of times, and it allocates nothing.
    // @param x : integer
    // @param y : integer
    // @param r : integer
    // @param g : integer
    // @param b : integer
    // @param a : integer
    // @return bool - False when the tile is off the map.
    function fillTile(x, y, r, g, b, a) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Load a background image, tint it by the tile colours, blur if `useBlur` is set, and register the result as a texture. The background must be a whole multiple of the map's tile grid in both axes or nothing is tinted (logged). NOT a per-frame call - it decodes a file and composites the whole picture. The handle from the previous call on this overlay is released, so rebuilding does not leak a texture per turn.
    // @param path : string - Full path to the background image.
    // @return table|null - {width, height, handle}, or null when the file will not decode.
    function makeTexture(path) {}
    // Release this overlay and the texture it last produced. Overlays are engine-owned, so nothing else knows when one is finished. Releasing twice is a no-op.
    // @return bool - True if this call was the one that freed it.
    function release() {}
}

// A trade resource standing on the map. Addressed by its tile.
class MapResource {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // bool (read-only) - Whether the type can have a mine.
    hasMine = null
    // integer (read-only) - The resource type index.
    id = null
    // string (read-only) - The resource's icon path.
    image = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - Whether the mine is built.
    mineBuilt = null
    // integer (read-only) - The region it counts towards.
    regionId = null
    // Settlement|null (read/write) - The settlement working this resource.
    settlement = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - The resource's trade value.
    value = null
    // integer (read-only) - The resource's tile x.
    x = null
    // integer (read-only) - The resource's tile y.
    y = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A line of text pinned to a strategy-map position. Reads null after `release`.
class MapText {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A font request. Opaque; pass it to `mapText.create`. ⚠ Recorded and ignored - arbitrary system fonts are not rasterised at runtime, so all map text draws in the built-in font.
class MapTextFont {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A mercenary pool from descr_mercenaries.txt. Addressed by its index, which the engine already treats as network-safe.
class MercenaryPool {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // string (read-only) - The pool's id.
    name = null
    // integer (read-only) - How many entries the pool has.
    unitCount = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // Append a new mercenary entry. Any `MercenaryPoolUnit` you are already holding stays valid across the append. Rome ignores the year window and the crusading flag.
    // @param unitTypeIndex : integer - EDU record index.
    // @param experience : integer
    // @param cost : integer
    // @param replenishMin : float
    // @param replenishMax : float
    // @param maxUnits : integer
    // @param startPool : float
    // @param startYear : integer - 0 disables.
    // @param endYear : integer - 0 disables.
    // @param crusading : integer - non-zero = crusading armies only.
    // @return MercenaryPoolUnit|null - null for an unknown EDU index.
    function addUnit(unitTypeIndex, experience, cost, replenishMin, replenishMax, maxUnits, startPool, startYear, endYear, crusading) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // An entry by index, 0-based.
    // @param index : integer
    // @return MercenaryPoolUnit|null
    function unit(index) {}
}

// One hireable entry in a mercenary pool. Addressed by (pool, entry).
class MercenaryPoolUnit {
    // float (read/write) - How many are available now. Replenishment is gradual, so this is a float.
    available = null
    // integer (read/write) - Hire cost.
    cost = null
    // integer (read/write) - Non-zero when only crusading armies may hire this. Medieval II only.
    crusadingOnly = null
    // integer (read/write) - Last year hireable. Medieval II only.
    endYear = null
    // integer (read-only) - Its slot in the pool.
    entryIndex = null
    // integer (read/write) - Experience the hired unit starts with.
    experience = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read/write) - The pool cap for this entry.
    maxUnits = null
    // MercenaryPool|null (read-only) - The owning pool.
    pool = null
    // integer (read-only) - Which pool it is in.
    poolIndex = null
    // float (read/write) - Maximum replenishment per turn.
    replenishMax = null
    // float (read/write) - Minimum replenishment per turn.
    replenishMin = null
    // integer (read/write) - First year hireable. Medieval II only.
    startYear = null
    // UnitType|null (read/write) - The unit type this entry hires.
    unitType = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Add or remove a religion requirement. Medieval II only.
    // @param religionId : integer
    // @param required : bool
    // @return bool
    function setReligion(religionId, required) {}
}

// One record of descr_mount.txt - the physical description of a mount. Addressed by its record index, which is stable for the process: the database is filled once at startup and never compacted.
class Mount {
    // float (read/write) - Height the unit banner floats at above the rider.
    bannerHeight = null
    // float (read/write) - Vertical offset applied when the mount is in water.
    buoyancyOffset = null
    // float (read/write) - Seconds between the elephant's own attacks.
    elephantAttackDelay = null
    // float (read/write) - Collision radius of the elephant's corpse.
    elephantDeadRadius = null
    // integer (read/write) - How many riders the howdah carries. Capped at 15: the seat array is exactly that long and the placement code walks this count.
    elephantRiderCount = null
    // float (read/write) - Height of the elephant's root node above the ground.
    elephantRootNodeHeight = null
    // float (read/write) - Radius of the tusk collision volume.
    elephantTuskRadius = null
    // float (read/write) - Forward offset of the tusk collision volume.
    elephantTuskZ = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // float (read/write) - Collision height.
    height = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // float (read/write) - Mass, for the charge impact solver. Zero or negative is refused - the solver divides by it.
    mass = null
    // string (read/write) - The skeleton / rig this mount uses. Writing it re-runs the model link for this record. Refused on a chariot or scorpion cart, whose model comes from the draught horse's record.
    model = null
    // integer (read/write) - 0 horse, 1 camel, 2 elephant, 3 chariot, 4 scorpion cart, 5 none. Moving into or out of the two towed classes is refused.
    mountClass = null
    // string (read/write) - The internal name. Writing it renames the record and rebuilds the by-name index, but every EDU `mount` line naming the old one stops resolving. Refused when the new name is already taken.
    name = null
    // float (read/write) - Offset of the collision box along the mount. Medieval II only; reads 0 on Rome, whose record has no such field.
    offsetY = null
    // float (read/write) - Collision radius, which is also the formation spacing floor. Negative refused.
    radius = null
    // float (read/write) - Collision half-extent across.
    radiusX = null
    // float (read/write) - Collision half-extent along.
    radiusY = null
    // table (read-only) - The rider's seat offset, as { x, y, z }. A snapshot: write it with `setRiderOffset`.
    riderOffset = null
    // float (read/write) - Height of the mount's root node above the ground. The horse block's - an elephant uses `elephantRootNodeHeight`.
    rootNodeHeight = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // One rider's seat in the howdah, as { x, y, z }. Null when the index is outside `elephantRiderCount`.
    // @param index : integer - 0-based rider slot.
    // @return table|null - The seat, or null.
    function elephantRiderSeat(index) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Move one rider's seat in the howdah.
    // @param index : integer - 0-based rider slot.
    // @param x : float - Across the elephant.
    // @param y : float - Up.
    // @param z : float - Along the elephant.
    // @return bool - False when the slot is out of range.
    function setElephantRiderSeat(index, x, y, z) {}
    // Move the rider's seat.
    // @param x : float - Across the mount.
    // @param y : float - Up.
    // @param z : float - Along the mount.
    // @return bool - True when the write happened.
    function setRiderOffset(x, y, z) {}
}

// The pathfinder's answer to where a character can go: a rectangle of tiles with, for each one, what it costs to get there and how many turns it takes. Most of the rectangle is usually NOT reachable, so test each tile. ⚠ Every read re-asks the question - cheap while the answer is still cached, a fresh flood when it is not. Pull what you need out in one pass; do not keep one across a turn.
class MovementExtents {
    // Character|null (read-only) - The character this was flooded for.
    character = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The character's slot in its verification table.
    index = null
    // integer (read-only) - Which zone-of-control rules this flood was run under.
    searchType = null
    // integer (read-only) - How many tiles the flood actually reached.
    totalTiles = null
    // integer (read-only) - How many turns of movement it covers. ⚠ May be MORE than was asked for: a flood that already reaches further is reused rather than redone, so filter on each tile's own `turns`.
    turns = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - The right edge. Inclusive.
    xMax = null
    // integer (read-only) - The left edge of the rectangle. Inclusive.
    xMin = null
    // integer (read-only) - The top edge. Inclusive.
    yMax = null
    // integer (read-only) - The bottom edge. Inclusive.
    yMin = null
    // Whether the character can actually get to a tile within this flood's range.
    // @param x : integer
    // @param y : integer
    // @return bool - false outside the rectangle and for a tile never reached.
    function canReach(x, y) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // What the flood found at one tile, as a table with `tile`, `moveCost`, `turns` and `inOpenList`.
    // @param x : integer
    // @param y : integer
    // @return table|null - null outside the rectangle. A tile INSIDE it that cannot be reached still returns a table - use `canReach`.
    function tileAt(x, y) {}
    // How many turns the character needs to reach a tile.
    // @param x : integer
    // @param y : integer
    // @return integer|null - null when it cannot get there at all.
    function turnsTo(x, y) {}
}

// A land frontier between two regions. Addressed by (owning region, slot).
class NeighbourRegion {
    // integer (read-only) - Ambush positions.
    ambushTileCount = null
    // integer (read-only) - Tiles bordering the neighbour.
    borderTileCount = null
    // Road|null (read-only) - The road across this frontier.
    connectingRoad = null
    // integer (read-only) - Passable border tiles.
    crossingCount = null
    // integer (read-only) - Defend-deep tiles.
    deepTileCount = null
    // integer (read-only) - Optimal defence positions.
    defenceTileCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - Whether the region-level pathfinder may cross. The one writable field here.
    isBlocked = null
    // float (read-only) - Movement points between the two settlements.
    moveCost = null
    // Region|null (read-only) - The region on the other side.
    region = null
    // integer (read-only) - The region on the other side, by id.
    regionId = null
    // integer (read-only) - Income from trading across here.
    tradeValue = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // An ambush position by index.
    // @param index : integer
    // @return Tile|null
    function ambushTile(index) {}
    // A border tile by index.
    // @param index : integer
    // @return Tile|null
    function borderTile(index) {}
    // A passable border tile by index.
    // @param index : integer
    // @return Tile|null
    function crossing(index) {}
    // A defend-deep tile by index.
    // @param index : integer
    // @return Tile|null
    function deepTile(index) {}
    // A defence position by index.
    // @param index : integer
    // @return Tile|null
    function defenceTile(index) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A capture point - what the engine calls a battle location.
class Plaza {
    // integer (read-only) - Which side is holding it, or -1.
    alliance = null
    // float (read-only) - How full the capture bar is, 0 to 1.
    control = null
    // float (read-only) - How much of the capture bar fills per second - the reciprocal of the hold time.
    controlPerSecond = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // float (read/write) - How many minutes it must be held for. Writable on Medieval II.
    holdMinutes = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - Whether it has been captured outright.
    isCaptured = null
    // bool (read-only) - Whether somebody currently holds it.
    isContested = null
    // float (read-only) - Its full width: the diameter for a circular location, twice the half-width for a rectangular one.
    sizeX = null
    // float (read-only) - Its full height.
    sizeY = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // float (read-only) - Its centre.
    x = null
    // float (read-only) - Its centre.
    y = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // How many soldiers of one side are standing on it.
    // @param alliance : integer - 0 .. 7.
    // @return integer
    function soldierCount(alliance) {}
}

// A port's land section. Addressed by its tile; the dock is a separate object on a separate tile.
class Port {
    // Army|null (read/write) - The fleet blockading the port. Writing it starts a blockade.
    blockadingArmy = null
    // integer (read-only) - Whose port model is used.
    cultureId = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // Faction|null (read/write) - Who controls the port. Writing it runs the engine's handover.
    owner = null
    // integer (read-only) - The region the port is in.
    regionId = null
    // Settlement|null (read/write) - The settlement the port belongs to.
    settlement = null
    // integer (read/write) - How long the blockade has run. Writing it re-arms the existing blockade.
    turnsBlocked = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - The port's tile x.
    x = null
    // integer (read-only) - The port's tile y.
    y = null
    // Where the port's dock sits, as a {x, y} table.
    // @return table|null
    function dockX() {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One descr_rebel_factions entry. Addressed by its record index, which is stable for the process and across save/load on the same data files.
class RebelFaction {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A rebel faction's look - banner colour, banner symbol, general models. Parallel to the record and addressed by the same index.
class RebelFactionStyle {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One unit row of one bucket. Addressed as (record, category, slot); the slot does shift when the bucket's count changes, which is the one place a held reference here can start naming a different row.
class RebelUnit {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One unit-category bucket of a rebel faction. Addressed as (record, category); it stays valid across save/load and reads null if the record stops existing.
class RebelUnitCategory {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One entry on a settlement's recruitment queue, handed to the removeFromUnitQueue hook while it is being removed. Gone afterwards.
class RecruitmentItem {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A region of the campaign map. Addressed by id; regions are created with the map and never destroyed.
class Region {
    // integer (read-only) - Armies in the region.
    armyCount = null
    // integer (read/write) - The map_regions.tga blue channel, 0-255.
    colourBlue = null
    // integer (read/write) - The map_regions.tga green channel, 0-255.
    colourGreen = null
    // integer (read/write) - The map_regions.tga red channel, 0-255.
    colourRed = null
    // integer (read-only) - Devastated fertile tiles.
    devastatedTileCount = null
    // string (read/write) - The province name shown to the player. Writing it sets the persisted override, so the rename survives a save.
    displayName = null
    // integer (read-only) - Tiles truncated by the map edge.
    edgeOfMapTileCount = null
    // Faction|null (read/write) - Who owns the region. Writing it runs the real capture path - settlement, garrison, shroud and borders all move and the capture triggers fire.
    faction = null
    // integer (read/write) - 0 ok, 1 hungry, 2-4 famine levels.
    famineThreat = null
    // integer (read/write) - The region's farming level.
    farmingLevel = null
    // integer (read-only) - Farmable tiles.
    fertileTileCount = null
    // integer (read-only) - Forts in the region.
    fortCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read/write) - 0 poor, 1 normal, 2 good, 3 excellent.
    harvestSuccess = null
    // integer (read-only) - The region id.
    id = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // Road|null (read-only) - The region's internal road.
    internalRoad = null
    // bool (read-only) - Whether the region is a peninsula.
    isPeninsular = null
    // bool (read-only) - Whether this is a sea region.
    isSea = null
    // LandMass|null (read-only) - The land mass.
    landMass = null
    // integer (read-only) - Invasion landing points.
    landingPointCount = null
    // string (read-only) - The legion name label.
    legionName = null
    // integer (read-only) - The faction the region reverts to.
    loyaltyFactionId = null
    // MercenaryPool|null (read/write) - The mercenary pool recruiting works from here. Writing it repoints the region but does not add it to the pool's own list.
    mercenaryPool = null
    // string (read-only) - The internal name from descr_regions.txt.
    name = null
    // integer (read-only) - Land frontiers.
    neighbourCount = null
    // integer (read-only) - Coastal patrol waypoints.
    patrolPointCount = null
    // integer (read-only) - Where the region's port sits, x.
    portEntranceX = null
    // integer (read-only) - Where the region's port sits, y.
    portEntranceY = null
    // string (read/write) - The rebel name shown to the player.
    rebelDisplayName = null
    // string (read-only) - The rebel faction that spawns here.
    rebelType = null
    // integer (read-only) - Map resources in the region.
    resourceCount = null
    // integer (read-only) - Bit N set when the region has resource type N. Only the first 32 fit - use hasResourceType past that.
    resourceTypeMask = null
    // integer (read/write) - 0 none, 1 dirt, 2 paved, 3 highway. Writing it re-stamps the road tiles.
    roadLevel = null
    // integer (read-only) - Regions reachable by sea.
    seaConnectedCount = null
    // integer (read-only) - Regions sending trade fleets here.
    seaImportCount = null
    // Settlement|null (read-only) - The settlement in this region.
    settlement = null
    // integer (read-only) - Settlements - one per region, so 0 or 1.
    settlementCount = null
    // string (read/write) - The settlement's name. Writing it retitles the settlement standing here.
    settlementName = null
    // integer (read-only) - Where the settlement stands, x.
    settlementX = null
    // integer (read-only) - Where the settlement stands, y.
    settlementY = null
    // integer (read-only) - Tiles the region covers.
    tileCount = null
    // integer (read-only) - The region's raw trade income.
    tradeValue = null
    // integer (read/write) - What holding the region is worth.
    triumphValue = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - Watchtowers in the region.
    watchtowerCount = null
    // An army by index, 0-based.
    // @param index : integer
    // @return Army|null
    function army(index) {}
    // A devastated tile by index, 0-based.
    // @param index : integer
    // @return Tile|null
    function devastatedTile(index) {}
    // A map-edge tile by index, 0-based.
    // @param index : integer
    // @return Tile|null
    function edgeOfMapTile(index) {}
    // Settlements here hostile to a faction. One per region, so 0 or 1.
    // @param factionId : integer
    // @return integer
    function enemySettlementsTo(factionId) {}
    // A farmable tile by index, 0-based.
    // @param index : integer
    // @return Tile|null
    function fertileTile(index) {}
    // A fort by index, 0-based.
    // @param index : integer
    // @return Fort|null
    function fort(index) {}
    // Whether the settlement belongs to a faction.
    // @param factionId : integer
    // @return bool
    function hasFaction(factionId) {}
    // Whether a named hidden resource is here.
    // @param name : string
    // @return bool
    function hasHiddenResource(name) {}
    // Whether a resource of this type is here.
    // @param resourceType : integer
    // @return bool
    function hasResourceType(resourceType) {}
    // Total strength of armies here hostile to a faction.
    // @param factionId : integer
    // @return integer
    function hostileArmiesStrength(factionId) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // A land frontier by index, 0-based.
    // @param index : integer
    // @return NeighbourRegion|null
    function neighbour(index) {}
    // Settlements here neither hostile nor allied to a faction.
    // @param factionId : integer
    // @return integer
    function neutralSettlementsTo(factionId) {}
    // A coastal patrol waypoint by index, 0-based.
    // @param index : integer
    // @return Tile|null
    function patrolPoint(index) {}
    // How much of a religion the region held N turns ago. 0 is the live figure. Medieval II only.
    // @param religionId : integer
    // @param turnsAgo : integer - 0 to 19.
    // @return float|null
    function religionHistory(religionId, turnsAgo) {}
    // A map resource by index, 0-based.
    // @param index : integer
    // @return MapResource|null
    function resource(index) {}
    // Summed trade value of every resource here.
    // @return integer
    function resourcesValue() {}
    // A sea frontier by index, 0-based.
    // @param index : integer
    // @return SeaConnectedRegion|null
    function seaConnected(index) {}
    // A sea frontier sending trade here, by index.
    // @param index : integer
    // @return SeaConnectedRegion|null
    function seaImport(index) {}
    // Turn a named hidden resource on or off. Not saved - rebuilt from descr_regions.
    // @param name : string
    // @param enable : bool
    // @return bool
    function setHiddenResource(name, enable) {}
    // A settlement by index. One settlement per region, so index 0 is it.
    // @param index : integer
    // @return Settlement|null
    function settlementAt(index) {}
    // One of the region's tiles by index.
    // @param index : integer
    // @return Tile|null
    function tileAt(index) {}
    // A watchtower by index, 0-based.
    // @param index : integer
    // @return Watchtower|null
    function watchtower(index) {}
}

// What the AI intends to build and recruit in ONE region. Held as (faction, region), so a controller for a region the faction has lost reads null.
class RegionProductionAi {
    // integer (read/write) - Local recruitment bias towards admirals.
    admiralBias = null
    // FactionAi|null (read-only) - The AI controller that owns this one.
    aiFaction = null
    // integer (read/write) - Local recruitment bias towards assassins.
    assassinBias = null
    // integer (read/write) - Local recruitment bias towards diplomats.
    diplomatBias = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - Whether the AI may construct buildings here.
    mayBuild = null
    // bool (read/write) - Whether the AI may set taxes and run the settlement mechanics here.
    mayManageMechanics = null
    // bool (read/write) - Whether the AI may recruit troops here.
    mayRecruit = null
    // integer (read/write) - Local recruitment bias towards merchants. Medieval II only.
    merchantBias = null
    // integer (read/write) - Local recruitment bias towards priests. Medieval II only; reads 0 in Rome.
    priestBias = null
    // integer (read/write) - 0 balanced, 1 finance, 2 military, 3 growth, 4 culture. Writing re-runs the controller's own filters.
    productionType = null
    // integer (read-only) - The region this controller runs.
    regionId = null
    // Settlement|null (read-only) - The settlement in that region, or null if it has none.
    settlement = null
    // integer (read/write) - Local recruitment bias towards spies.
    spyBias = null
    // bool (read-only) - Whether the settlement is under this faction's control right now. Recomputed every turn from ownership.
    underControl = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // Read it back.
    // @param capability : integer
    // @return integer|null
    function buildBias(capability) {}
    // Read a production hint back.
    // @param hint : integer
    // @return integer|null
    function hint(hint) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Read it back.
    // @param unitCategory : integer
    // @return integer|null
    function recruitBias(unitCategory) {}
    // This region's bias towards constructing buildings that grant one capability. Re-seeded from the faction-wide value each production pass, so the useful place to call it is the setProductionControllers hook.
    // @param capability : integer
    // @param value : integer
    // @return bool - false when the index is out of range.
    function setBuildBias(capability, value) {}
    // Set one of the region's production hints outright. The engine's own callers use fixed amounts (slight 50, normal 125, strong 200, very strong 300).
    // @param hint : integer - an AI_PROD_HINT index.
    // @param value : integer
    // @return bool - false when the index is out of range - Rome has 14 hints, Medieval II 15.
    function setHint(hint, value) {}
    // This region's bias towards recruiting one unit category.
    // @param unitCategory : integer
    // @param value : integer
    // @return bool
    function setRecruitBias(unitCategory, value) {}
}

// A road on the strategy map. Addressed by its slot in the road manager, which only ever grows.
class Road {
    // integer (read-only) - Tiles the road covers.
    coordCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The road's slot in the road manager.
    id = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - Whether the road still has an unbuilt remainder.
    isTruncated = null
    // integer (read-only) - The region it ends in.
    regionEnd = null
    // integer (read-only) - The region the road starts in.
    regionStart = null
    // integer (read/write) - Trade carried by this road.
    tradeValue = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // A tile the road runs through, as {x, y}.
    // @param index : integer
    // @return table|null
    function coord(index) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A sea frontier: a region reachable by ship, and the trade it carries.
class SeaConnectedRegion {
    // integer (read-only) - Income from sending a trade fleet.
    exportValue = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - Income from receiving one.
    importValue = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read-only) - Landing tiles this frontier offers.
    reachableTileCount = null
    // integer (read-only) - The region on the other side.
    regionId = null
    // integer (read-only) - Length of the cached sea route.
    tradeLaneLength = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // A landing tile by index, as a {tile, moveCost} table.
    // @param index : integer
    // @return table|null
    function reachableTile(index) {}
    // One step of the cached sea route, as a {x, y} table.
    // @param index : integer
    // @return table|null
    function tradeLaneCoord(index) {}
}

// A settlement - a city, a town or a castle. Held as a generation-counted handle, so a reference to one that has since been razed reads as null.
class Settlement {
    // RegionProductionAi|null (read-only) - The AI's production slot for this settlement's region, under its owner. Read-only: the slot is addressed by (faction, region), not held as a pointer.
    aiProductionController = null
    // Army|null (read-only) - The garrison stack. Immutable - moving a stack is the army surface's job.
    army = null
    // float (read/write) - Cosmetic strat position, x.
    bannerX = null
    // float (read/write) - Cosmetic strat position, y.
    bannerY = null
    // float (read/write) - Cosmetic strat position, height.
    bannerZ = null
    // integer (read/write) - The region's base farming rating as this settlement sees it. Recomputed at the start of a round.
    baseFertility = null
    // integer (read-only) - How many buildings the settlement has.
    buildingCount = null
    // integer (read-only) - How many characters are inside, majors included.
    characterCount = null
    // integer (read-only) - How many items are in the construction queue.
    constructionQueueCount = null
    // string (read/write) - The name shown to the player.
    displayName = null
    // integer (read-only) - The current wall tier.
    fortificationLevel = null
    // float (read/write) - Conversion rate towards the founding faith. Medieval II only.
    foundingConversionRate = null
    // bool (read/write) - Whether the gates are open for the next battle.
    gatesOpen = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // Character|null (read/write) - The governing character. Writing appoints; writing null makes the current one leave the post.
    governor = null
    // integer (read/write) - Consecutive years the governor has held the post.
    governorYearsInPost = null
    // integer (read-only) - Last turn's harvest status. Medieval II only.
    harvestSuccess = null
    // bool (read-only) - Whether it has a port.
    hasPort = null
    // integer (read-only) - How many more turns it can resist. Computed on demand, so read-only.
    holdoutTurns = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - Whether this is the owner's capital. Writing true moves the capital here; writing false is refused.
    isCapital = null
    // bool (read/write) - Whether this is a castle. Writing runs the real city/castle conversion. Medieval II only.
    isCastle = null
    // bool (read-only) - Always false: a region holds exactly one settlement, so there are no minor settlements.
    isMinorSettlement = null
    // Character|null (read/write) - Last year's governor.
    lastGovernor = null
    // integer (read/write) - Faction id of the last horde that resettled here.
    lastHordeFactionId = null
    // integer (read/write) - 0 village .. 5 huge city. Writing upwards runs the real upgrade per tier; downwards is refused.
    level = null
    // string (read/write) - The internal descr_strat label. Writing renames it in place - everything that resolves the old name stops working, and it is logged loudly.
    name = null
    // Faction (read/write) - The owning faction. Writing hands the settlement over through the real capture path, which evacuates the garrison and fires the capture triggers.
    owner = null
    // float (read/write) - Conversion rate towards the owner's faith. Medieval II only.
    ownerConversionRate = null
    // integer (read/write) - Civilians the plague has killed here.
    plagueDeaths = null
    // integer (read/write) - Turns the plague has been here.
    plagueTurns = null
    // bool (read/write) - Whether the plague is here. Writing sets the state; it does not roll the spread.
    plagued = null
    // integer (read-only) - The faction whose town plan and models this settlement wears. Immutable - only a culture conversion moves it.
    planFactionId = null
    // integer (read/write) - The population. Writing clamps to the level minimum and posts the change to the faction score.
    population = null
    // integer (read/write) - The population when the siege began.
    populationAtSiegeStart = null
    // Port|null (read/write) - The settlement's port. Writing attaches it (null detaches); refused for a port another settlement already owns.
    port = null
    // Character|null (read/write) - The admiral commanding the settlement's navy.
    portAdmiral = null
    // integer (read-only) - Faction id of the previous owner.
    previousOwnerId = null
    // bool (read-only) - ⚠ Always false - nothing marks a provoked revolt apart from a natural one.
    provokedRebellion = null
    // integer (read-only) - Not a separate value any more; reads 100. Health is a public-order and growth pip, computed from buildings.
    publicHealth = null
    // integer (read-only) - Last turn's public order. A snapshot.
    publicOrderLastTurn = null
    // bool (read/write) - Whether it will give up if the siege continues.
    readyToSurrender = null
    // integer (read/write) - The settlement's rebelliousness.
    rebelFactionChance = null
    // integer (read-only) - How many pooled-unit recruitment capabilities are active here. Medieval II only.
    recruitCapabilityCount = null
    // integer (read-only) - How many pooled-unit entries are banked here. Medieval II only.
    recruitPoolCount = null
    // bool (read/write) - Stops the recruitment pools replenishing. Medieval II only.
    recruitPoolFrozen = null
    // integer (read-only) - How many items are in the recruitment queue.
    recruitmentQueueCount = null
    // integer (read-only) - The region this settlement sits in. Immutable.
    regionId = null
    // integer (read-only) - How many trade resources the settlement collects.
    resourceCount = null
    // bool (read/write) - Whether the garrison has already sallied this turn.
    salliedOut = null
    // integer (read/write) - Non-zero schedules a scripted rebellion. Clearing it is refused - it is a one-shot request the engine consumes.
    scriptRebel = null
    // integer (read/write) - Civilians lost to the current siege.
    siegeCasualties = null
    // integer (read-only) - How many armies are besieging this settlement.
    siegeCount = null
    // integer (read/write) - Turns the current siege has lasted.
    siegeDuration = null
    // integer (read-only) - Denarii spent on construction so far this turn.
    spentOnConstruction = null
    // integer (read-only) - Denarii spent on recruitment so far this turn.
    spentOnRecruitment = null
    // integer (read-only) - Denarii spent on training so far this turn.
    spentOnTraining = null
    // integer (read-only) - The descr_rebel_factions index this settlement revolts to, or -1 when it has none.
    subFactionId = null
    // Crusade|null (read-only) - The crusade that took this settlement, or null. A settlement taken by a jihad reads null. Medieval II only, and read-only: the residence registers itself as a listener on capture and unregisters when the crusade ends.
    takenByCrusade = null
    // integer (read/write) - 0 low, 1 normal, 2 high, 3 extortionate. Writing re-runs the mechanics.
    taxLevel = null
    // integer (read-only) - The settlement's strat-map tile x. Immutable at runtime.
    tileX = null
    // integer (read-only) - The settlement's strat-map tile y.
    tileY = null
    // bool (read/write) - Whether trade income is blocked.
    tradeBlocked = null
    // integer (read/write) - Faction id this settlement was traded from, or -1 when taken by force.
    tradedFromId = null
    // integer (read/write) - Extra turns of unrest - the add_settlement_turmoil counter. Medieval II only.
    turmoil = null
    // integer (read/write) - Turns the current owner has held it.
    turnsOwned = null
    // integer (read/write) - Turns since this settlement last revolted.
    turnsSinceRebellion = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read/write) - The year it was founded.
    yearFounded = null
    // The recruitment capability for one agent type as {value, bonus}.
    // @param agentType : integer
    // @return table|null
    function agentCapability(agentType) {}
    // The agent LIMIT capability for one agent type - the real limit, not the recruitment capability. Medieval II only.
    // @param agentType : integer
    // @return table|null
    function agentLimit(agentType) {}
    // How many agents of one type are in the recruitment queue. Counted from the queue, so it cannot drift from it.
    // @param agentType : integer - 0 spy, 1 assassin, 2 diplomat, 3 admiral, 4 merchant, 5 priest.
    // @return integer
    function agentsInQueue(agentType) {}
    // A building by index, 0-based.
    // @param index : integer - 0 .. buildingCount-1.
    // @return Building|null
    function building(index) {}
    // The settlement's building of a chain, or null.
    // @param chainName : string - e.g. "hinterland_roads".
    // @return Building|null
    function buildingOfChain(chainName) {}
    // Whether this settlement satisfies a building level's build guard - the condition block, not affordability.
    // @param buildingType : BuildingType
    // @param level : integer
    // @return bool
    function canConstruct(buildingType, level) {}
    // One of the settlement's capability values as {value, bonus}.
    // @param capabilityType : integer
    // @return table|null
    function capability(capabilityType) {}
    // Hand the settlement to another faction.
    // @param faction : Faction
    // @param convertGarrison : bool - accepted; the garrison is evacuated either way.
    // @return bool
    function changeOwner(faction, convertGarrison) {}
    // A character inside the settlement, 0-based.
    // @param index : integer - 0 .. characterCount-1.
    // @return Character|null
    function character(index) {}
    // One available construction item as a table, 0-based.
    // @param index : integer - 0 .. constructionOptions().count-1.
    // @return table|null
    function constructionOption(index) {}
    // A summary of what could be started right now: count, totalCost, totalTime.
    // @return table|null
    function constructionOptions() {}
    // Create a building at an export_descr_buildings level, complete, right now. Refused when the settlement already has one of that chain.
    // @param levelName : string
    // @return Building|null
    function createBuilding(levelName) {}
    // Create the garrison stack for an empty settlement, or hand back the existing one.
    // @return Army|null
    function createGarrisonArmy() {}
    // Give the settlement a port. The coordinates are accepted and ignored - the engine picks the coastal tile from the settlement's own region.
    // @param x : integer - ignored.
    // @param y : integer - ignored.
    // @param recalculate : bool - re-run the settlement's economy afterwards.
    // @return bool
    function createPort(x, y, recalculate) {}
    // Destroy the settlement's building of a chain.
    // @param chainName : string
    // @param refundMoney : bool
    // @return bool
    function destroyBuilding(chainName, refundMoney) {}
    // Standing points with one guild. Medieval II only.
    // @param guildId : integer
    // @return integer
    function guildStanding(guildId) {}
    // Whether the settlement has a building at (or above) a named level.
    // @param levelName : string
    // @param exact : bool - true = exactly that level.
    // @return bool
    function hasBuildingLevel(levelName, exact) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Put an available construction item in the queue and pay for it.
    // @param index : integer
    // @return bool
    function queueConstructionOption(index) {}
    // Put an available recruitment item in the queue and pay for it.
    // @param index : integer
    // @return bool
    function queueRecruitmentOption(index) {}
    // An item in the construction queue as a table, 0-based.
    // @param index : integer - 0 .. constructionQueueCount-1.
    // @return table|null
    function queuedConstruction(index) {}
    // An item in the recruitment queue as a table, 0-based.
    // @param index : integer - 0 .. recruitmentQueueCount-1.
    // @return table|null
    function queuedRecruitment(index) {}
    // One pooled-unit recruitment capability - the recruit_pool line - as a table. Medieval II only.
    // @param index : integer
    // @return table|null
    function recruitCapability(index) {}
    // One banked pool entry as a table. Medieval II only.
    // @param index : integer - 0 .. recruitPoolCount-1.
    // @return table|null
    function recruitPool(index) {}
    // One available recruitment item as a table, 0-based.
    // @param index : integer
    // @return table|null
    function recruitmentOption(index) {}
    // A summary of what could be recruited right now.
    // @return table|null
    function recruitmentOptions() {}
    // The share of the population following one religion, 0.0 to 1.0. Medieval II reads the region's histogram; Rome reads the settlement's belief profile.
    // @param religionId : integer
    // @return float|null
    function religion(religionId) {}
    // A trade resource by index, 0-based.
    // @param index : integer - 0 .. resourceCount-1.
    // @return MapResource|null - null when out of range.
    function resource(index) {}
    // The same, on an item in the available-options list. A write here is carried into the queue by a later queueConstructionOption on the same index - the snapshot entry is copied as it stands.
    // @param index : integer
    // @param field : integer - a ConstructionItemField value.
    // @param value : integer
    // @return bool
    function setConstructionOption(index, field, value) {}
    // Set (not add) standing with one guild.
    // @param guildId : integer
    // @param standing : integer
    // @return bool
    function setGuildStanding(guildId, standing) {}
    // Write one field of a queued construction item. Only 9 (percentBuilt) and 10 (frozen) are performed; every other field is a logged functional refusal, because the item's cost, level and references are set together when it is created.
    // @param index : integer - 0 .. constructionQueueCount-1.
    // @param field : integer - a ConstructionItemField value.
    // @param value : integer
    // @return bool - whether the write happened.
    function setQueuedConstruction(index, field, value) {}
    // Write one field of a queued recruitment item. Only 5 (experience), 6 (armourUpgrade), 7 (weaponUpgrade) and 14 (frozen) are performed; the rest are logged functional refusals, because the item's union and its type tag are set together with the cost and the people count.
    // @param index : integer - 0 .. recruitmentQueueCount-1.
    // @param field : integer - a RecruitmentItemField value.
    // @param value : integer
    // @return bool - whether the write happened.
    function setQueuedRecruitment(index, field, value) {}
    // Set a pooled unit's banked amount. Keyed by unit-db index, not by pool slot - the slot list compacts whenever a pool empties. Medieval II only.
    // @param unitTypeIndex : integer
    // @param available : float
    // @return bool
    function setRecruitPool(unitTypeIndex, available) {}
    // The same, on an item in the available-options list. This is how a script recruits a unit at a different experience or upgrade level: write the option, then queueRecruitmentOption the same index.
    // @param index : integer
    // @param field : integer - a RecruitmentItemField value.
    // @param value : integer
    // @return bool
    function setRecruitmentOption(index, field, value) {}
    // Set one religion's share and rescale the rest so the histogram still sums to 1. Medieval II only.
    // @param religionId : integer
    // @param value : float - 0.0 to 1.0.
    // @return bool
    function setReligion(religionId, value) {}
    // A besieging stack by index, 0-based. The siege's own numbers live on the army - see Army.siegeTurns and friends.
    // @param index : integer - 0 .. siegeCount-1.
    // @return Army|null - null when out of range.
    function siege(index) {}
    // This turn's growth, order and money breakdown as a table of 51 numbers. A snapshot - writing into the table changes nothing.
    // @return table|null
    function stats() {}
    // The same numbers as they were last turn.
    // @return table|null
    function statsLastTurn() {}
    // Upgrade one level through the real path.
    // @return bool
    function upgrade() {}
}

// The settlement info scroll, while it is open. Reads null when it is not.
class SettlementInfoScroll {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // Settlement|null (read-only) - The settlement the open scroll is showing.
    settlement = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One siege engine. Addressed by the battle-unique id it already carries, so it survives the engine list being compacted.
class SiegeEngine {
    // float (read-only) - Its facing in radians.
    angle = null
    // Unit|null (read-only) - The unit crewing it, or null.
    crew = null
    // float (read-only) - How far the fire has taken hold.
    fireLevel = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read/write) - Its remaining health. Writing zero does NOT run the death notification.
    health = null
    // integer (read-only) - Its battle-unique id.
    id = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - Whether it is on fire. Writing true ignites it; writing false is refused, because ignition only goes one way.
    isBurning = null
    // float (read-only) - Its physical mass.
    mass = null
    // Unit|null (read-only) - The unit that crewed it before, or null.
    previousCrew = null
    // EngineRecord|null (read-only) - The descr_engines row this engine was built from. Null only while one is still being built.
    record = null
    // integer (read-only) - Its class from descr_engines - the fine-grained one, not the four-value type the crewing unit carries.
    type = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // float (read-only) - Its position. x and z are the ground plane, y is the height.
    x = null
    // float (read-only) - Its height.
    y = null
    // float (read-only) - Its position.
    z = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A sound file a script loaded. Opaque - pass it back to the `sound` functions. Reads null once released, and ids are never reused.
class Sound {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// The AI's read of the battlefield: the hills worth defending, the ridge lines that bound them, and the playable area's dimensions.
class TerrainFeatures {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - How many hills.
    hillCount = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // float (read-only) - The playable area's height.
    length = null
    // float (read-only) - Half of it.
    lengthHalf = null
    // float (read-only) - One percent of the height.
    lengthOnePercent = null
    // integer (read-only) - How many ridge line segments.
    lineCount = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // float (read-only) - The playable area's width.
    width = null
    // float (read-only) - Half of it.
    widthHalf = null
    // float (read-only) - One percent of the width - the unit the AI's distance thresholds are in.
    widthOnePercent = null
    // A hill by index, 0-based.
    // @param index : integer
    // @return TerrainHill|null
    function hill(index) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // A ridge line segment by index, 0-based.
    // @param index : integer
    // @return TerrainLine|null
    function line(index) {}
}

// A hill the AI considers worth defending.
class TerrainHill {
    // float (read-only) - Its defensible length. Not an enclosed area.
    defensibleLength = null
    // TerrainLine|null (read-only) - The first segment of its ridge line.
    firstLine = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // float (read-only) - Its radius.
    radius = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // float (read-only) - Its centre.
    x = null
    // float (read-only) - Its centre height.
    y = null
    // float (read-only) - Its centre.
    z = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One segment of a ridge line. Built when the battle map opens and never moved, so entirely read-only.
class TerrainLine {
    // float (read-only) - The segment's end.
    endX = null
    // float (read-only) - The segment's end height.
    endY = null
    // float (read-only) - The segment's end.
    endZ = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // TerrainLine|null (read-only) - The segment joined to this one's end, or null.
    nextSegment = null
    // TerrainLine|null (read-only) - The segment joined to this one's start, or null.
    previousSegment = null
    // float (read-only) - The segment's start. x and z are the ground plane, y is the height.
    startX = null
    // float (read-only) - The segment's start height.
    startY = null
    // float (read-only) - The segment's start.
    startZ = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One tile of the strategy map. Addressed by its coordinates, so it never goes stale - `valid` means "this coordinate is on the current map".
class Tile {
    // Character|null (read-only) - The first character standing here.
    character = null
    // integer (read-only) - How many characters are standing here.
    characterCount = null
    // integer (read-only) - Choke value; negative is a dead end.
    choke = null
    // integer (read-only) - The climate index.
    climate = null
    // integer (read-only) - 0 ok, 1-3 despoiled, 4 pillaged.
    devastationLevel = null
    // integer (read-only) - Non-zero during an earthquake.
    earthquakeLevel = null
    // integer (read-only) - Which faction's influence covers the tile.
    factionId = null
    // integer (read-only) - Non-zero while flooded.
    floodLevel = null
    // Fort|null (read-only) - The fort.
    fort = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The strategic ground type index.
    groundType = null
    // bool (read-only) - An army.
    hasArmy = null
    // bool (read-only) - A cliff.
    hasCliff = null
    // bool (read-only) - A river ford.
    hasCrossing = null
    // bool (read-only) - A port dock.
    hasDock = null
    // bool (read-only) - A fort.
    hasFort = null
    // bool (read-only) - A navy.
    hasNavy = null
    // bool (read-only) - A port's land section.
    hasPort = null
    // bool (read-only) - A river, river source or ford.
    hasRiver = null
    // bool (read-only) - A river source.
    hasRiverSource = null
    // bool (read-only) - Any road.
    hasRoad = null
    // bool (read-only) - A sea ford. Medieval II only.
    hasSeaCrossing = null
    // bool (read-only) - A settlement.
    hasSettlement = null
    // bool (read-only) - A volcano.
    hasVolcano = null
    // bool (read-only) - A watchtower.
    hasWatchtower = null
    // integer (read-only) - The climate's heat value.
    heat = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - A region border tile.
    isBorder = null
    // bool (read-only) - Whether the forest has been cleared.
    isDeforested = null
    // bool (read-only) - Whether the devastation level is non-zero.
    isDevastated = null
    // bool (read-only) - Whether the ground type is impassable.
    isImpassable = null
    // bool (read-only) - Whether the tile is land.
    isLand = null
    // bool (read-only) - Coast, land side.
    isLandCoast = null
    // bool (read-only) - Burned by a volcano or a fire.
    isScorched = null
    // bool (read-only) - Coast, sea side.
    isSeaCoast = null
    // bool (read-only) - A natural trade route runs through.
    isTradeRoute = null
    // float (read-only) - The climate movement-point scalar for entering.
    movementModifier = null
    // Port|null (read-only) - The port's land section.
    port = null
    // integer (read-only) - Which region owns the tile.
    regionId = null
    // MapResource|null (read-only) - The map resource.
    resource = null
    // Road|null (read-only) - The road running through here.
    road = null
    // integer (read-only) - 0 none, 1 dirt, 2 paved, 3 highway.
    roadLevel = null
    // Settlement|null (read-only) - The settlement.
    settlement = null
    // integer (read-only) - Non-zero while storming.
    stormLevel = null
    // float (read-only) - Terrain height in metres.
    terrainHeight = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - Non-zero while erupting.
    volcanoLevel = null
    // Watchtower|null (read-only) - The watchtower.
    watchtower = null
    // integer (read-only) - Tile x.
    x = null
    // integer (read-only) - Tile y.
    y = null
    // A character on this tile by index, 0-based.
    // @param index : integer
    // @return Character|null
    function characterAt(index) {}
    // Whether a faction has an army on or next to this tile. Medieval II only.
    // @param factionId : integer
    // @return bool
    function factionHasArmyNear(factionId) {}
    // Whether a faction has a character on this tile. Medieval II only.
    // @param factionId : integer
    // @return bool
    function factionHasCharacterOn(factionId) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Set the choke value.
    // @param value : integer
    // @return bool
    function setChoke(value) {}
    // Clear or restore the forest. Also kicks the pathfinder's cost cache.
    // @param value : bool
    // @return bool
    function setDeforested(value) {}
    // Set the devastation level, clamped to 7.
    // @param level : integer
    // @return bool
    function setDevastationLevel(level) {}
    // Set the ground type. Also kicks the pathfinder's per-tile cost cache.
    // @param groundType : integer
    // @return bool
    function setGroundType(groundType) {}
    // Set the movement scalar. Also kicks the pathfinder's cost cache.
    // @param modifier : float
    // @return bool
    function setMovementModifier(modifier) {}
}

// One trait held by one character - a node of that character's trait list. The reference carries the owning record, so it goes stale when the character loses the trait or the record dies.
class Trait {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // bool (read-only) - Whether the level this character is at carries an epithet.
    hasEpithet = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read-only) - The level this character has reached.
    level = null
    // TraitLevel (read-only) - The database record for the level this character is at.
    levelEntry = null
    // string (read-only) - The trait's internal name.
    name = null
    // Trait (read-only) - The next trait in this character's list, or null at the end.
    next = null
    // CharacterRecord (read-only) - The character record whose list this trait is in.
    owner = null
    // integer (read/write) - The accumulated points. Writing re-runs the level threshold scan so the level follows, but does NOT move the attribute effects - use `CharacterRecord.addTraitPoints` for that.
    points = null
    // Trait (read-only) - The previous trait in this character's list, or null at the start.
    previous = null
    // TraitType (read-only) - The trait's database record: levels, anti-traits, exclusions.
    traitType = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One level of one trait definition: its threshold, its localised strings and its attribute effects.
class TraitLevel {
    // string (read/write) - The displayed description.
    description = null
    // integer (read-only) - How many attribute effects it carries.
    effectCount = null
    // string (read/write) - The displayed effects text.
    effectsDescription = null
    // string (read/write) - The epithet this level grants, if any.
    epithetDescription = null
    // string (read/write) - The message shown when the level is gained.
    gainDescription = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read-only) - The level number.
    level = null
    // string (read/write) - The message shown when the level is lost.
    loseDescription = null
    // string (read/write) - The level's displayed name.
    name = null
    // integer (read/write) - How many trait points reach this level. The thresholds have to stay ascending - the engine scans them backwards - so a negative value is refused.
    threshold = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // One of this level's attribute effects, as a read-only table with `id` and `value`.
    // @param index : integer - 0 .. effectCount-1.
    // @return table|null - null when out of range.
    function getEffect(index) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One export_descr_character_traits.txt trait definition, shared by every character who has the trait.
class TraitType {
    // integer (read-only) - How many anti-traits it lists.
    antiTraitCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The trait's position in the trait database.
    index = null
    // bool (read/write) - Whether the trait is hidden from the player.
    isHidden = null
    // integer (read-only) - ONE OVER the number of authored levels: index 0 of the level array is a synthetic level-0 entry the parser pushes before reading any Level line. `getLevel` adds the 1 for you.
    levelCount = null
    // string (read/write) - The internal name. Renaming breaks every trigger that names the old one; logged loudly.
    name = null
    // integer (read/write) - The level below which this trait can no longer fall once reached.
    noGoingBackLevel = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // One anti-trait by index.
    // @param index : integer
    // @return TraitType|null
    function getAntiTrait(index) {}
    // One authored level, 0-based - `getLevel(0)` is the first real one.
    // @param index : integer - 0 .. levelCount-2.
    // @return TraitLevel|null
    function getLevel(index) {}
    // Whether the anti-trait at this index is a LethalAntiTraits entry: gaining any points of it removes the host trait entirely, rather than draining it point-for-point.
    // @param index : integer
    // @return bool
    function isAntiTraitLethal(index) {}
    // Whether a character type may hold this trait.
    // @param characterType : integer
    // @return bool
    function isCharacterTypeValid(characterType) {}
    // Whether a culture is barred from this trait.
    // @param cultureId : integer
    // @return bool
    function isCultureExcluded(cultureId) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// What the player currently has selected, and the unit cards along the bottom of the screen. One per game; reach it with `ui.cardManager()`.
class UiCardManager {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // Character|null (read/write) - The character the player has selected, or null. Writing it selects that character, without the click's voice-over.
    selectedCharacter = null
    // Character|null (read-only) - The selected character, but only while it belongs to somebody other than the player.
    selectedEnemyCharacter = null
    // Fort|null (read-only) - The selected fort, but only while it belongs to somebody other than the player.
    selectedEnemyFort = null
    // Settlement|null (read-only) - The selected settlement, but only while it belongs to somebody other than the player. Null otherwise, including when the player's own is selected.
    selectedEnemySettlement = null
    // Fort|null (read/write) - The fort the player has selected, or null. Writing it selects that fort.
    selectedFort = null
    // Settlement|null (read/write) - The settlement the player has selected, or null. Writing it SELECTS that settlement: the cards, the scroll and the highlight all follow.
    selectedSettlement = null
    // integer (read-only) - How many unit cards are selected right now.
    selectedUnitCount = null
    // integer (read-only) - How many unit cards exist right now - the whole displayed army, not just the selected part.
    unitCardCount = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // The unit behind the n-th SELECTED unit card. A card has no identity worth handing out, so this returns the unit.
    // @param index : integer - 0 .. selectedUnitCount - 1.
    // @return Unit|null - The unit, or null.
    function selectedUnit(index) {}
    // The unit behind the n-th unit card, selected or not. Works in battle and on the campaign map.
    // @param index : integer - 0 .. unitCardCount - 1.
    // @return Unit|null - The unit, or null.
    function unitAt(index) {}
}

// A node in the game's own (non-ImGui) UI tree: a scroll, a frame, a button, a string. Held as a name path rather than a pointer, so it survives its scroll closing and reopening and reads null while it is shut - never dangling.
class UiElement {
    // integer (read-only) - How many children this element has. Read-only - the count is the child array's, and writing it would only desynchronise the two.
    childCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read/write) - Height in UI pixels. A negative height is refused.
    height = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // string (read-only) - The name the layout file gives this element, or "" for the many that are unnamed. Only named elements can be found by `ui.element()`.
    name = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read/write) - Width in UI pixels. A negative width is refused.
    width = null
    // integer (read/write) - Screen x of the element's top-left, as rendered. Writing it moves the element and its children so that the rendered position lands on the value written. The engine recomputes rendered positions from the parent chain, so an element inside a scroll follows the scroll again the next time the scroll moves.
    x = null
    // integer (read/write) - Screen y of the element's top-left. Same rules as `x`.
    y = null
    // A child element by index.
    // @param index : integer - 0 .. childCount - 1.
    // @return UiElement|null - The child, or null when out of range.
    function child(index) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Press the element, as a mouse click would. Goes through the element's real handlers - a button flips its selected state, fires the `ButtonPressed` trigger and runs its action - so it does what clicking does, minus the keyboard-focus and drag bookkeeping a real click also moves around. Only meaningful on things that respond to a click.
    // @return bool - False when the element is not on screen and taking input, in which case nothing was pressed.
    function press() {}
}

// One unit inside an army. Held as a generation-counted handle, so a reference to a destroyed unit reads as null.
class Unit {
    // integer (read-only) - The same as an index. Faster.
    actionStatus = null
    // string (read-only) - What the unit is doing, as a name.
    actionStatusName = null
    // integer|null (read-only) - ⚠ Always null. It would be a per-order action code read out of the unit's target array; orders here are a task stack, and the numbers actionStatus reports come from a different scale. Use actionStatus.
    actionType = null
    // UnitAiData|null (read-only) - What the battle AI is currently thinking about this unit. Null unless the unit is under battle-AI control.
    aiData = null
    // integer (read-only) - Missiles left across the unit.
    ammo = null
    // integer (read-only) - Missiles the unit started with.
    ammoMax = null
    // float (read/write) - Facing, in degrees.
    angle = null
    // integer (read/write) - Base armour plus armour upgrades.
    armourInBattle = null
    // integer (read/write) - Armour upgrade level. The engine's setter only raises, never lowers.
    armourLevel = null
    // Army|null (read/write) - The stack this unit belongs to. Writing TRANSFERS it, unhooking it from the old stack's list.
    army = null
    // integer (read/write) - Base attack plus weapon upgrades, as used in combat.
    attackInBattle = null
    // bool (read/write) - Whether the enemy can see the unit. Writing true also latches hasBeenSeen.
    canBeSeen = null
    // integer (read/write) - Charge attack bonus, 0-63.
    chargeBonus = null
    // integer (read/write) - How fast the charge bonus decays, 0-3.
    chargeDecay = null
    // integer (read-only) - How the unit is doing in melee: 0 not in combat, 1 winning big .. 7 losing big.
    combatStatus = null
    // integer (read/write) - Who drives this unit: 0 player, 1 AI, 2 script, 3 formerly-scripted.
    controlStatus = null
    // Crusade|null (read/write) - The crusade this unit has joined, or null. A unit on a jihad reads null - both hang off one engine pointer, so this tests the type. Writing joins; writing null abandons. Medieval II only.
    crusade = null
    // integer (read-only) - Crusade participation state. Medieval II only.
    crusadeState = null
    // float (read-only) - Where the current move order ends.
    destinationX = null
    // float (read-only) - See destinationX.
    destinationY = null
    // integer (read-only) - Enemy units in contact.
    engagedCount = null
    // integer (read/write) - Experience 0-9. Written down to every soldier and then re-derived, which is the only way it sticks.
    experience = null
    // integer (read-only) - Fatigue as a 6-step level, 0 fresh .. 5 most tired.
    fatigue = null
    // integer (read-only) - See flankRightState.
    flankLeftState = null
    // Unit|null (read-only) - See flankRightThreat.
    flankLeftThreat = null
    // integer (read-only) - See flankRightState.
    flankRearState = null
    // Unit|null (read-only) - See flankRightThreat.
    flankRearThreat = null
    // integer (read-only) - 0 threatened, 1 open, 2 secure.
    flankRightState = null
    // Unit|null (read-only) - The unit threatening that flank.
    flankRightThreat = null
    // integer (read/write) - Extra hit chance from the current formation.
    formationAttBonus = null
    // integer (read/write) - Extra armour from the current formation.
    formationDefBonus = null
    // integer (read-only) - The unit's current formation type.
    formationType = null
    // Character|null (read/write) - The named general whose bodyguard this is. Writing null detaches.
    general = null
    // integer (read/write) - The general's bonus applied to this unit.
    generalsBonus = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // UnitGroup|null (read/write) - The unit group this unit is in. Writing null removes it.
    group = null
    // bool (read-only) - Whether the enemy has ever seen the unit.
    hasBeenSeen = null
    // bool (read/write) - Whether this reinforcement has entered the playable area. Medieval II only.
    hasMarchedOn = null
    // bool (read-only) - Whether the unit has an attack target.
    hasTargets = null
    // bool (read/write) - Whether the unit is near a great cross. Medieval II only.
    holyInspired = null
    // integer (read-only) - The unit's stable id, 0 once it is defunct.
    id = null
    // bool (read-only) - Whether every man is close enough to his slot.
    inFormation = null
    // integer (read-only) - Gatehouse tunnels occupied.
    inGateHouseCount = null
    // integer (read-only) - Siege-tower platforms occupied.
    inTowerCount = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - Close rather than loose spacing. Writing re-spaces the formation.
    isCloseFormation = null
    // bool (read-only) - Whether the unit has joined a crusade or a jihad.
    isCrusading = null
    // bool (read-only) - Whether the unit has no men left.
    isDead = null
    // bool (read-only) - Whether an enemy is in contact.
    isEngaged = null
    // bool (read-only) - Whether the unit is firing or reloading.
    isFiring = null
    // bool (read/write) - Whether no order is queued. Writing true halts the unit.
    isHalted = null
    // bool (read/write) - Whether the unit is hidden. Battle only.
    isHidden = null
    // bool (read-only) - Whether the unit is idling, hiding, taunting, celebrating or ready.
    isIdle = null
    // bool (read/write) - Whether the unit is infighting. Medieval II only. Writing true requests it.
    isInfighting = null
    // bool (read/write) - Whether this instance was hired as a mercenary.
    isMercenary = null
    // bool (read-only) - Whether any of it is on a wall, tower or gatehouse.
    isOnWalls = null
    // bool (read-only) - Whether the unit is set to run.
    isRunning = null
    // bool (read-only) - Whether anything is shooting at it - missile or artillery, tower or unit.
    isUnderFire = null
    // integer (read/write) - Morale as a 7-step state, 0 berserk .. 6 routing. Writing LOCKS it there - the only write that survives the next tick.
    morale = null
    // integer (read-only) - The unit's mount class.
    mountClass = null
    // float (read/write) - Campaign movement points left.
    movePoints = null
    // string (read/write) - The unit's custom (legion) name. Nothing populates it at recruit time, so it reads "" unless a script or a save set it.
    name = null
    // integer (read-only) - Enemy units in close proximity, max 4.
    nearbyEnemyCount = null
    // integer (read-only) - Friendly units in close proximity, max 4.
    nearbyFriendlyCount = null
    // integer (read-only) - Wall platforms this unit occupies.
    onWallsCount = null
    // integer (read-only) - The unit's ration stock, re-seeded every turn.
    rations = null
    // Settlement|null (read/write) - The settlement retraining this unit.
    retrainingSettlement = null
    // integer (read-only) - Siege engines this unit carries.
    siegeEngineCount = null
    // integer (read/write) - Men on the campaign map. Writing 0 or less kills the unit; growing replenishes; shrinking removes soldiers properly rather than truncating a count.
    soldiers = null
    // integer (read-only) - Men who have fled the battlefield.
    soldiersFled = null
    // integer (read-only) - Men still alive on the battlefield.
    soldiersInBattle = null
    // integer (read-only) - The type's full strength at the current size setting.
    soldiersMax = null
    // bool (read/write) - Whether the special ability is running.
    specialAbilityActive = null
    // bool (read/write) - Whether the stakes are planted. Medieval II only.
    stakesUsed = null
    // integer (read-only) - Buildings shooting at this unit, missiles and artillery both.
    towersFiringAtCount = null
    // UnitType|null (read/write) - The unit's EDU record. Writing it retypes the unit and re-derives its soldier data, movement points and rations.
    type = null
    // bool (read/write) - Whether the last fire order failed. Medieval II only.
    unableToFire = null
    // integer (read-only) - Units shooting at this unit, missiles and artillery both.
    unitsFiringAtCount = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read/write) - Weapon upgrade level. Only raises, as above.
    weaponLevel = null
    // float (read-only) - The unit's formation origin. Use placeAt to move it.
    x = null
    // float (read-only) - Height.
    y = null
    // float (read-only) - See x.
    z = null
    // Attack a battle building, docking towers and ladders included.
    // @param building : BuildingBattle
    // @return bool
    function attackBuilding(building) {}
    // Sweep an arc in front and attack the nearest enemy in it.
    // @param arcDegrees : float - the half-arc.
    // @param run : bool
    // @return bool - false when nothing was found.
    function attackClosest(arcDegrees, run) {}
    // Attack another unit. A missile unit out of ammo uses its secondary weapon.
    // @param target : Unit
    // @param run : bool
    // @return bool
    function attackUnit(target, run) {}
    // Change the unit's formation.
    // @param formationType : integer
    // @return bool
    function changeFormation(formationType) {}
    // Order the unit to pick up one of its siege engines, by index.
    // @param engineIndex : integer
    // @return bool
    function collectEngine(engineIndex) {}
    // Plant stakes, retracting an existing field first. Medieval II only.
    // @return bool
    function deployStakes() {}
    // An engaged enemy unit.
    // @param index : integer
    // @return Unit|null
    function engaged(index) {}
    // Stop whatever the unit is doing.
    // @return bool
    function halt() {}
    // Whether the EDU record carries an attribute.
    // @param attribute : string
    // @return bool
    function hasAttribute(attribute) {}
    // Whether guard mode / fire at will / skirmish is on.
    // @param property : integer - 1 guard, 2 fire at will, 4 skirmish.
    // @return bool
    function hasBattleProperty(property) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Remove the unit from its stack and destroy it. A named general's bodyguard takes the general with it.
    // @return bool
    function kill() {}
    // Move relative to the unit's own facing and front.
    // @param x : float
    // @param y : float
    // @param run : bool
    // @return bool
    function moveRelative(x, y, run) {}
    // Order the unit to a battlefield position. Issue-and-return: true means accepted, not arrived.
    // @param x : float
    // @param y : float
    // @param run : bool
    // @return bool
    function moveTo(x, y, run) {}
    // Close to exactly primary missile range. Does nothing when already inside it.
    // @param target : Unit
    // @param run : bool
    // @return bool
    function moveToMissileRange(target, run) {}
    // Move to a position with a given frontage and facing.
    // @param x : float
    // @param y : float
    // @param widthInMen : integer - 0 leaves it alone.
    // @param angle : float - degrees.
    // @param run : bool
    // @return bool
    function moveToOrientation(x, y, widthInMen, angle, run) {}
    // A nearby enemy unit.
    // @param index : integer
    // @return Unit|null
    function nearbyEnemy(index) {}
    // A nearby friendly unit.
    // @param index : integer
    // @return Unit|null
    function nearbyFriendly(index) {}
    // Teleport the unit into position, clearing its order queue.
    // @param x : float
    // @param y : float
    // @param angle : float - degrees.
    // @param widthInMen : integer - 0 leaves the frontage alone.
    // @return bool
    function placeAt(x, y, angle, widthInMen) {}
    // Hand the unit back to whoever should be driving it. Battle only.
    // @return bool
    function release() {}
    // Turn one of guard mode / fire at will / skirmish on or off.
    // @param property : integer
    // @param value : bool
    // @return bool
    function setBattleProperty(property, value) {}
    // Set experience, armour and weapon at once and recompute the combat totals.
    // @param experience : integer
    // @param armourLevel : integer
    // @param weaponLevel : integer
    // @return bool
    function setParams(experience, armourLevel, weaponLevel) {}
    // Set the unit to run or walk.
    // @param run : bool
    // @return bool
    function setRunning(run) {}
    // A siege engine this unit carries, 0-based.
    // @param index : integer - 0 .. siegeEngineCount-1.
    // @return SiegeEngine|null - null when out of range.
    function siegeEngine(index) {}
    // The unit this one is attacking.
    // @return Unit|null
    function targetUnit() {}
    // Make the unit taunt.
    // @return bool
    function taunt() {}
    // Turn to an absolute or relative angle.
    // @param angle : float - degrees.
    // @param relative : bool
    // @return bool
    function turn(angle, relative) {}
    // A unit shooting at this one.
    // @param index : integer
    // @return Unit|null
    function unitFiringAt(index) {}
    // Use the unit's special ability.
    // @param heroOnly : bool - true refuses when it has none.
    // @return bool
    function useSpecialAbility(heroOnly) {}
}

// The battle AI's working notes on one unit: which objective has claimed it, whether the melee manager has taken it over, and where the AI wants it standing. Rewritten every AI tick - read it, do not keep it.
class UnitAiData {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // UnitGroup|null (read-only) - The AI's own unit group. ⚠ Reads null, and will keep reading null: a UnitGroup names one of an army's twenty numbered group slots and the AI builds its groups outside the army. Use `groupUnitCount` / `groupUnitsInMelee`, or `Unit.group`.
    group = null
    // integer (read-only) - How many units the AI group controls. 0 when the unit is in no AI group.
    groupUnitCount = null
    // integer (read-only) - How many of that group's units the melee manager currently has.
    groupUnitsInMelee = null
    // bool (read-only) - Whether the melee manager, rather than the unit's group, is giving this unit its orders.
    inMelee = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read-only) - Whether another objective may claim this unit.
    isAvailable = null
    // integer (read-only) - What the AI wants the melee manager to do with this unit - attack, hold, pull back.
    meleeHint = null
    // BattleObjective|null (read-only) - The objective that has claimed this unit, or null when none has.
    objective = null
    // bool (read-only) - The melee manager has just let this unit go and it is waiting for a fresh order.
    releasedFromMelee = null
    // float (read-only) - Where the AI wants the middle of this unit's front rank.
    targetX = null
    // float (read-only) - The other half of `targetX`.
    targetY = null
    // Unit|null (read-only) - The unit these notes are about.
    unit = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A battle unit group. Groups are pre-allocated slots on an army, so a reference is (army, slot, the slot's reuse counter): it goes stale when the army dies and also when the slot is handed to a different group, so a reference held across a disband reads null rather than naming the new group.
class UnitGroup {
    // float (read/write) - The group's facing, degrees.
    angle = null
    // integer (read-only) - The active automation order: 0 none, 1 defend, 2 attack.
    automationType = null
    // float (read-only) - Radius of the defended area.
    defendRadius = null
    // float (read-only) - Centre of the defended area.
    defendX = null
    // float (read-only) - See defendX.
    defendY = null
    // integer (read-only) - Units the group's FORMATION holds. Lags the other two until the next reshuffle.
    formationUnitCount = null
    // integer (read-only) - Units following the group's formation.
    formedCount = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - Units that have been given their own orders and broken off.
    independantCount = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // string (read/write) - The battle-script label this group was defined under, "" for none. It is the DSL's own label table, so a name set here is what the `unit_group_*` script commands resolve.
    label = null
    // integer (read-only) - The pending automation order, promoted by the automation task.
    pendingAutomationType = null
    // float (read-only) - See pendingAutomationType.
    pendingDefendRadius = null
    // float (read-only) - See pendingAutomationType.
    pendingDefendX = null
    // float (read-only) - See pendingAutomationType.
    pendingDefendY = null
    // Unit|null (read-only) - See pendingAutomationType.
    pendingTargetUnit = null
    // Unit|null (read-only) - The unit the group is automating an attack on.
    targetUnit = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // float (read/write) - The centre of the group's front rank.
    x = null
    // float (read/write) - See x.
    y = null
    // Add a unit and mark it script-controlled.
    // @param unit : Unit - must be in no group already.
    // @return bool
    function addUnit(unit) {}
    // Automate an attack on the nearest unit of another group.
    // @param target : UnitGroup
    // @return bool
    function attackGroup(target) {}
    // Turn the group's own AI on or off. Clears the order queue.
    // @param enable : bool
    // @return bool
    function automate(enable) {}
    // Queue an automated attack. Automation is switched on first if it is not already - the engine asserts otherwise.
    // @param target : Unit
    // @return bool
    function automateAttack(target) {}
    // Queue an automated defence of an area.
    // @param x : float
    // @param y : float
    // @param radius : float - 0 or less uses the engine default of 50.
    // @return bool
    function automateDefend(x, y, radius) {}
    // Change every member unit's own formation, broken-off units included.
    // @param formationType : integer
    // @return bool
    function changeUnitFormation(formationType) {}
    // Disband the group: the label is dropped, every member is released and the slot goes back in the pool. Every reference to it reads null afterwards.
    // @return bool
    function disband() {}
    // A unit following the formation.
    // @param index : integer
    // @return Unit|null
    function formed(index) {}
    // Stop the group.
    // @return bool
    function halt() {}
    // A unit that has broken off.
    // @param index : integer
    // @return Unit|null
    function independant(index) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Move keeping the group formation.
    // @param x : float
    // @param y : float
    // @param run : bool
    // @return bool
    function moveFormed(x, y, run) {}
    // Move formed, relative to the group's own facing.
    // @param x : float
    // @param y : float
    // @param run : bool
    // @return bool
    function moveRelativeFormed(x, y, run) {}
    // Move unformed, relative to the group's own facing.
    // @param x : float
    // @param y : float
    // @param run : bool
    // @return bool
    function moveRelativeUnformed(x, y, run) {}
    // The same, against every unit of another group.
    // @param target : UnitGroup
    // @param run : bool
    // @return bool
    function moveToMissileRangeOfGroup(target, run) {}
    // Shift the group by the smallest step that brings its shortest-ranged member into missile range of a unit. Does nothing if any member is already in range.
    // @param target : Unit
    // @param run : bool
    // @return bool
    function moveToMissileRangeOfUnit(target, run) {}
    // Move without the group formation; each unit keeps its own.
    // @param x : float
    // @param y : float
    // @param run : bool
    // @return bool
    function moveUnformed(x, y, run) {}
    // Teleport the whole group into position.
    // @param x : float
    // @param y : float
    // @param angle : float - degrees.
    // @return bool
    function placeAt(x, y, angle) {}
    // Remove a unit. The group disbands once it is empty.
    // @param unit : Unit
    // @return bool
    function removeUnit(unit) {}
    // Turn the group.
    // @param angle : float - degrees.
    // @param relative : bool
    // @return bool
    function turn(angle, relative) {}
}

// The unit info scroll, while it is open. Reads null when it is not.
class UnitInfoScroll {
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // Unit|null (read-only) - The unit the scroll is about, or null when it is previewing a type instead.
    unit = null
    // UnitType|null (read-only) - The EDU record the scroll is previewing - a recruitment queue entry, a mercenary on offer, a browser preview. Null whenever `unit` answers: a unit that exists carries its own type.
    unitType = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// One record in export_descr_unit: the TYPE a unit is, not a unit. Everything here is live and shared - a write changes the type for every unit of it, everywhere, immediately. The engine saves no change; re-apply from your own state after a load.
class UnitType {
    // integer (read/write) - Hit points per animal or extra.
    animalHealth = null
    // integer (read/write) - Cost of one armour upgrade.
    armourUpgradeCost = null
    // bool (read/write) - In the faction's random general-unit rotation.
    bodyguardPool = null
    // bool (read/write) - Can be part of a horde.
    canHorde = null
    // bool (read/write) - Can adopt the phalanx formation.
    canPhalanx = null
    // bool (read/write) - Can dig a sap.
    canSap = null
    // bool (read/write) - Can swim rivers.
    canSwim = null
    // bool (read/write) - Can withdraw from the field.
    canWithdraw = null
    // string (read/write) - Unit card image name.
    cardImage = null
    // integer (read/write) - UNIT_CATEGORY. Changing it re-routes the attack and defence slots.
    category = null
    // float (read/write) - Metres at which the unit begins its charge.
    chargeDistance = null
    // string (read/write) - The long description.
    description = null
    // string (read/write) - The string-table key the localised strings and both images derive from.
    dictionary = null
    // integer (read/write) - UNIT_DISCIPLINE.
    discipline = null
    // string (read/write) - The displayed unit name. Setting it needs no data/text entry.
    displayName = null
    // integer (read-only) - Animals or engines attached to the unit.
    extrasCount = null
    // integer (read/write) - Fatigue modifier, -20..20.
    fatigueModifier = null
    // bool (read/write) - Ignores fear; morale pins at high.
    fearless = null
    // integer (read/write) - Combat modifier in forest.
    forestModifier = null
    // bool (read/write) - Eligible for a settlement's free-upkeep slots.
    freeUpkeep = null
    // bool (read/write) - Can be a general's bodyguard.
    generalUnit = null
    // bool (read/write) - The post-reform bodyguard.
    generalUnitUpgrade = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read/write) - Hit points per soldier.
    health = null
    // float (read/write) - Soldier height.
    height = null
    // bool (read/write) - Can hide on any terrain.
    hideAnywhere = null
    // bool (read/write) - Can hide in forest.
    hideForest = null
    // bool (read/write) - Can hide in long grass.
    hideLongGrass = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool (read/write) - Never runs out of missiles.
    infiniteAmmo = null
    // string (read/write) - Unit information image name.
    infoImage = null
    // float (read/write) - Soldier mass; drives shoving and knockback.
    mass = null
    // bool (read/write) - Hired from a pool rather than recruited.
    mercenary = null
    // integer (read/write) - Flat morale bonus.
    morale = null
    // Mount|null (read-only) - The descr_mount record this unit rides, or null when it rides none. The record is shared: every unit type naming the same mount sees the same object, so a write through it changes them all. `mountName` is the same thing by name.
    mount = null
    // string (read/write) - The descr_mount record this cavalry rides, by name.
    mountName = null
    // float (read/write) - Battle movement multiplier; 1.0 is unmodified.
    moveSpeedModifier = null
    // string (read/write) - The record's export_descr_unit name. Renaming is refused when the new name is taken; the record index never moves, because saves hold it.
    name = null
    // bool (read/write) - Barred from custom and multiplayer battles.
    noCustom = null
    // bool (read/write) - Ignores the unit-size multiplier.
    noScale = null
    // integer (read-only) - How many officers the unit has.
    officerCount = null
    // bool (read/write) - Counts as peasantry for population and order.
    peasant = null
    // string|null (read-only) - Primary-weapon skeleton of the bound battle model. Null in Rome.
    primaryAnim = null
    // float (read/write) - Soldier collision radius. Close-formation spacing is derived from it. The engine calls it the unit's `width`.
    radius = null
    // integer (read/write) - Recruitment cost in denarii.
    recruitCost = null
    // integer (read/write) - Recruitment points the unit costs to raise.
    recruitPoints = null
    // integer (read/write) - Campaign AI recruitment bias.
    recruitPriorityOffset = null
    // float (read/write) - The engine's rough combat power per man. Derived; a write biases the campaign AI until the next recalculation.
    roughPowerPerMan = null
    // float (read/write) - Rough combat power for the whole unit.
    roughPowerTotal = null
    // integer (read/write) - Combat modifier on sand.
    sandModifier = null
    // integer (read/write) - Combat modifier on scrubland.
    scrubModifier = null
    // bool (read/write) - Travels by sea without a ship.
    seaFaring = null
    // string|null (read-only) - Secondary-weapon skeleton. Null in Rome.
    secondaryAnim = null
    // string (read/write) - The one-line tooltip description.
    shortDescription = null
    // bool (read/write) - Lone hero: the soldier count is the total.
    singleEntity = null
    // bool (read/write) - Spawns in revolts where it can be recruited.
    slave = null
    // integer (read/write) - Combat modifier in snow.
    snowModifier = null
    // integer (read/write) - Men in a normal-size unit, before the size multiplier.
    soldierCount = null
    // string (read/write) - The battle model the soldiers use. Setting it re-binds the model and is refused mid-battle.
    soldierModel = null
    // integer (read/write) - UNIT_TRAINING.
    training = null
    // integer (read/write) - Custom-battle price and the engine's combat-worth measure.
    trueCost = null
    // integer (read/write) - UNIT_CLASS: light, heavy, missile, skirmish, spearmen.
    unitClass = null
    // integer (read/write) - Per-turn upkeep.
    upkeep = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read/write) - Which voice set the unit speaks with.
    voiceType = null
    // integer (read/write) - Cost of one weapon upgrade.
    weaponUpgradeCost = null
    // Missiles carried per man for one weapon slot.
    // @param slot : integer
    // @return integer|null
    function ammo(slot) {}
    // The armour value of one defence block.
    // @param slot : integer - 0 soldier, 1 engine, 2 mount, 3 animal.
    // @return integer|null
    function armour(slot) {}
    // The armour value at which a tier takes over; -1 out of range.
    // @param tier : integer
    // @return integer
    function armourLevel(tier) {}
    // The battle model a tier uses; empty out of range.
    // @param tier : integer
    // @return string
    function armourModel(tier) {}
    // How many armour upgrade tiers the record declares.
    // @return integer
    function armourTierCount() {}
    // The attack value of one weapon slot.
    // @param slot : integer - 0 primary, 1 secondary, 2 engine secondary, 3 engine, 4 mount, 5 animal.
    // @return integer|null - Null when the slot does not exist in this port.
    function attack(slot) {}
    // The charge bonus of one weapon slot.
    // @param slot : integer
    // @return integer|null
    function charge(slot) {}
    // The parry / defence skill of one defence block.
    // @param slot : integer
    // @return integer|null
    function defence(slot) {}
    // Whether the record carries an export_descr_unit attribute, by keyword.
    // @param attribute : string
    // @return bool
    function hasAttribute(attribute) {}
    // Whether a faction may field this type in an availability period (0-3). Rome has no periods and answers with the flat ownership.
    // @param era : integer
    // @param factionId : integer
    // @return bool
    function hasEraOwnership(era, factionId) {}
    // Whether a faction may field this type.
    // @param factionId : integer
    // @return bool
    function hasOwnership(factionId) {}
    // Whether a weapon slot halves the target's armour.
    // @param slot : integer
    // @return bool|null
    function isArmourPiercing(slot) {}
    // Whether a weapon slot is a ranged weapon.
    // @param slot : integer
    // @return bool|null
    function isMissile(slot) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Maximum range in metres of one weapon slot.
    // @param slot : integer
    // @return integer|null
    function range(slot) {}
    // Set the ammunition of one weapon slot.
    // @param slot : integer
    // @param value : integer
    // @return bool
    function setAmmo(slot, value) {}
    // Set the armour value of one defence block.
    // @param slot : integer
    // @param value : integer
    // @return bool
    function setArmour(slot, value) {}
    // Set the armour value at which a tier takes over.
    // @param tier : integer
    // @param level : integer
    // @return bool
    function setArmourLevel(tier, level) {}
    // Set the battle model a tier uses. Collapses the tier to that one model, and is refused mid-battle.
    // @param tier : integer
    // @param model : string
    // @return bool
    function setArmourModel(tier, model) {}
    // Set the armour-piercing flag.
    // @param slot : integer
    // @param on : bool
    // @return bool
    function setArmourPiercing(slot, on) {}
    // Set the attack value of one weapon slot. The staged slot the loader routes from is written too, so the value survives the recalculation the write triggers.
    // @param slot : integer
    // @param value : integer
    // @return bool
    function setAttack(slot, value) {}
    // Set the charge bonus of one weapon slot.
    // @param slot : integer
    // @param value : integer
    // @return bool
    function setCharge(slot, value) {}
    // Set the defence skill.
    // @param slot : integer
    // @param value : integer
    // @return bool
    function setDefence(slot, value) {}
    // Grant or revoke period ownership. Medieval II only.
    // @param era : integer
    // @param factionId : integer
    // @param owned : bool
    // @return bool
    function setEraOwnership(era, factionId, owned) {}
    // Make a weapon slot ranged or melee.
    // @param slot : integer
    // @param on : bool
    // @return bool
    function setMissile(slot, on) {}
    // Grant or revoke a faction's ownership. Edits the ownership token list, which is what the faction bitmask is folded from, so the change survives a recalculation. Existing recruitment pools are game state and are not purged.
    // @param factionId : integer
    // @param owned : bool
    // @return bool
    function setOwnership(factionId, owned) {}
    // Set the range of one weapon slot.
    // @param slot : integer
    // @param value : integer
    // @return bool
    function setRange(slot, value) {}
    // Set the shield value.
    // @param slot : integer
    // @param value : integer
    // @return bool
    function setShield(slot, value) {}
    // Set the soldiers' battle model, name and binding together. Refused mid-battle.
    // @param model : string
    // @return bool
    function setSoldierModel(model) {}
    // Set the anti-cavalry bonus.
    // @param slot : integer
    // @param value : integer
    // @return bool
    function setSpearBonus(slot, value) {}
    // The shield value of one defence block.
    // @param slot : integer
    // @return integer|null
    function shield(slot) {}
    // The anti-cavalry bonus of one weapon slot, as the single 0-12 number it is.
    // @param slot : integer
    // @return integer|null
    function spearBonus(slot) {}
}

// A watchtower. Addressed by its tile.
class Watchtower {
    // Army|null (read/write) - The army occupying the tower.
    blockingArmy = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // Faction|null (read/write) - Who owns the tower. Writing it runs the handover.
    owner = null
    // integer (read-only) - The region the tower is in.
    regionId = null
    // Settlement|null (read-only) - The settlement it hangs off.
    settlement = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // integer (read-only) - The tower's tile x.
    x = null
    // integer (read-only) - The tower's tile y.
    y = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// The live weather block: the fog range, the wind strength and the current precipitation.
class Weather {
    // float (read-only) - Distance at which fog is total. Medieval II only.
    fogMax = null
    // float (read-only) - Distance at which fog starts. Medieval II only; 0 in Rome, whose weather block carries no authored fog range.
    fogMin = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // integer (read-only) - How heavy the precipitation is.
    rainLevel = null
    // integer (read-only) - The current precipitation type.
    rainType = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // float (read-only) - Current wind strength.
    windStrength = null
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
}

// A faction's victory condition, as written in the campaign's victory-conditions file. Read-only throughout.
class WinCondition {
    // integer (read-only) - The faction this condition belongs to.
    factionId = null
    // integer (read-only) - The slot's reuse counter; 0 for the id-addressed types. Together with index it is the reference's whole identity, and it is what makes a stale reference detectable after the slot is handed to a different object.
    generation = null
    // integer (read-only) - The object's slot in its verification table. For the id-addressed types (Faction, Region) this is the id itself.
    index = null
    // bool|null (read-only) - Whether this is the short campaign's condition. Medieval II only; null in Rome, which uses a different kind of condition rather than a flag.
    isShortVictory = null
    // integer (read-only) - Which kind of condition this is, as a number. ⚠ The numbering differs between the two games; compare `kindName` instead.
    kind = null
    // string (read-only) - Which kind of condition this is: "land_owner", "tycoon", "time_limit", "outlive_factions", "hold_regions", and in Rome "imperator", "take_rome" and "alexander_lives".
    kindName = null
    // integer|null (read-only) - The treasury that wins the campaign. Null unless this is a treasury condition.
    moneyTarget = null
    // integer (read-only) - How many regions the condition names by hand. 0 when it names none.
    regionToHoldCount = null
    // integer (read-only) - How many regions have to be held in total, counting the ones named individually and any others. 0 for a condition that does not count regions.
    regionsRequired = null
    // string (read-only) - The heading shown above this condition, in the player's language.
    title = null
    // integer|null (read-only) - The turn the campaign ends on. Null unless this is a turn-limit condition.
    turnLimit = null
    // bool (read-only) - True while the object this reference names is still alive. Every other member of a dead reference reads null; reading one is never an error.
    valid = null
    // The full text of the condition in the player's language, counted against one faction's current holdings.
    // @param faction : Faction - whose progress to count.
    // @return string|null - null for a null or dead faction.
    function descriptionFor(faction) {}
    // The `valid` property, for callers who prefer a call.
    // @return bool - True while the object is still alive.
    function isValid() {}
    // Whether this condition requires a particular faction to be destroyed first.
    // @param factionId : integer
    // @return bool - false when it does not.
    function outlivesFaction(factionId) {}
    // The same entry as `regionToHoldName`, as a region.
    // @param index : integer - 0 .. regionToHoldCount-1.
    // @return Region|null - null when the index is out of range, before the campaign map is loaded, or when no region has that name.
    function regionToHold(index) {}
    // The name of one named region, as written in the victory conditions - which may be a region name or a settlement name.
    // @param index : integer - 0 .. regionToHoldCount-1.
    // @return string|null - null when the index is out of range.
    function regionToHoldName(index) {}
    // How many turns in a row that region has to be held before it counts. 0 means owning it when the rest of the condition comes true is enough.
    // @param index : integer - 0 .. regionToHoldCount-1.
    // @return integer|null - null when the index is out of range.
    function regionToHoldTurns(index) {}
}

// The buildings database. Everything here edits the LIVE database: an edit applies immediately, to every settlement, and is NOT saved - the engine writes no database tables into a save, so a script that changes the database re-applies its changes on load from its own state. Writes run functional checks only: they refuse what would corrupt the engine and allow everything a player merely could not do.
::buildings <- {
    // Append a value capability to one of the level's lists. Takes effect immediately - the settlement and faction capability caches are recomputed before this returns.
    // @param level : BuildingLevel
    // @param chain : integer
    // @param capabilityType : integer
    // @param value : integer
    // @param bonus : bool - True puts the value in the additive bonus half.
    // @param condition : string - Condition text WITHOUT the `requires` keyword, e.g. "factions { england, }". Empty for unconditional; one that does not compile is refused.
    // @return BuildingCapability|null - The new line, or null if refused.
    function addCapability(level, chain, capabilityType, value, bonus, condition) {}
    // Append a recruitment pool. Refused on Rome, which has no pooling.
    // @param level : BuildingLevel
    // @param unitIndex : integer
    // @param initialSize : float
    // @param gainPerTurn : float
    // @param maxSize : float
    // @param experience : integer
    // @param retrainOnly : bool - Retrain here but do not recruit fresh.
    // @param condition : string
    // @return BuildingRecruitPool|null
    function addRecruitPool(level, unitIndex, initialSize, gainPerTurn, maxSize, experience, retrainOnly, condition) {}
    // Can this faction build ANY level of the chain? Reads the live per-level faction mask - the fold of the chain's restrictions, each level's build guard and the upgrade edges - not what the file literally said.
    // @param building : BuildingType
    // @param factionType : integer
    // @return bool
    function availableToFaction(building, factionType) {}
    // A chain by record index.
    // @param index : integer
    // @return BuildingType|null
    function byIndex(index) {}
    // A chain by its internal name.
    // @param name : string
    // @return BuildingType|null
    function byName(name) {}
    // One capability line, 0-based.
    // @param level : BuildingLevel
    // @param chain : integer
    // @param index : integer
    // @return BuildingCapability|null
    function capability(level, chain, index) {}
    // The line's base value; -1 means it contributes through the bonus instead.
    // @param node : BuildingCapability
    // @return float
    function capabilityBase(node) {}
    // The line's additive bonus.
    // @param node : BuildingCapability
    // @return float
    function capabilityBonus(node) {}
    // The line's CAPABILITY_CATEGORY: 0 value, 1 recruit, 2 agent, 3 agent limit, 4 ancillary, 5 recruitment pool. Decides which payload field means anything.
    // @param node : BuildingCapability
    // @return integer
    function capabilityCategory(node) {}
    // How many lines one of a level's three capability lists holds. removeCapability drops it and shifts every later line down one, so a loop that removes as it goes has to walk backwards.
    // @param level : BuildingLevel
    // @param chain : integer - 0 value capabilities, 1 recruitment and agents, 2 faction capabilities.
    // @return integer
    function capabilityCount(level, chain) {}
    // The line's UI display control: -1 engine auto-text, -2 hidden, otherwise an index into the database's display-string table.
    // @param node : BuildingCapability
    // @return integer
    function capabilityDisplayRef(node) {}
    // Pool starting size; 0 unless the line is a pool, and always 0 on Rome.
    // @param node : BuildingCapability
    // @return float
    function capabilityInitialUnits(node) {}
    // Pool cap.
    // @param node : BuildingCapability
    // @return float
    function capabilityMaxUnits(node) {}
    // The line's subject - a capability type, an agent type, an ancillary or a unit index, depending on the category. They are one union.
    // @param node : BuildingCapability
    // @return integer
    function capabilityPayload(node) {}
    // Pool replenishment per turn.
    // @param node : BuildingCapability
    // @return float
    function capabilityReplenishment(node) {}
    // Can this pool only retrain, not recruit fresh?
    // @param node : BuildingCapability
    // @return bool
    function capabilityRetrainOnly(node) {}
    // BUILDING_CLASSIFICATION index: 0 fortification, 1 infrastructure, 2 military, 3 religious, 4 conversion, 5 guild, 6 other.
    // @param building : BuildingType
    // @return integer
    function classification(building) {}
    // The core chain - the one whose level IS the settlement tier.
    // @param forCastle : bool
    // @return BuildingType|null
    function coreBuilding(forCastle) {}
    // How many building chains the database holds.
    // @return integer
    function count() {}
    // The chain that provides the settlement's walls.
    // @param forCastle : bool
    // @return BuildingType|null
    function defencesBuilding(forCastle) {}
    // The chain's displayed name - the heading the building browser puts over the whole thread. Not the per-level name; that is levelText.
    // @param building : BuildingType
    // @return string
    function displayName(building) {}
    // The building chain this guild is built as.
    // @param guild : Guild
    // @return BuildingType|null
    function guildBuilding(guild) {}
    // A guild by index.
    // @param index : integer
    // @return Guild|null
    function guildByIndex(index) {}
    // A guild by internal name.
    // @param name : string
    // @return Guild|null
    function guildByName(name) {}
    // How many guilds the database holds. Always 0 on Rome.
    // @return integer
    function guildCount() {}
    // A guild's internal name.
    // @param guild : Guild
    // @return string
    function guildName(guild) {}
    // Points needed for one guild level.
    // @param guild : Guild
    // @param level : integer - 0, 1 or 2.
    // @return integer
    function guildThreshold(guild, level) {}
    // How many hidden resources the database declares - what `hidden_resource` build guards test against.
    // @return integer
    function hiddenResourceCount() {}
    // A hidden resource's name by index.
    // @param index : integer
    // @return string
    function hiddenResourceName(index) {}
    // Is this the settlement's core chain?
    // @param building : BuildingType
    // @return bool
    function isCore(building) {}
    // Does this chain provide the settlement's defences?
    // @param building : BuildingType
    // @return bool
    function isDefences(building) {}
    // Is this farmland?
    // @param building : BuildingType
    // @return bool
    function isFarm(building) {}
    // Is this a hinterland (region-wide) chain rather than a settlement one?
    // @param building : BuildingType
    // @return bool
    function isHinterland(building) {}
    // Is this the port chain?
    // @param building : BuildingType
    // @return bool
    function isPort(building) {}
    // Is this a temple? Temples are mutually exclusive within a settlement.
    // @param building : BuildingType
    // @return bool
    function isTemple(building) {}
    // One level of a chain, 0-based.
    // @param building : BuildingType
    // @param index : integer
    // @return BuildingLevel|null
    function level(building, index) {}
    // May a castle build this level? Always true on Rome.
    // @param level : BuildingLevel
    // @return bool
    function levelAvailableCastle(level) {}
    // May a city build this level? Always true on Rome.
    // @param level : BuildingLevel
    // @return bool
    function levelAvailableCity(level) {}
    // Can this faction build this particular level?
    // @param level : BuildingLevel
    // @param factionType : integer
    // @return bool
    function levelAvailableToFaction(level, factionType) {}
    // Turns to build, which the engine calls construction points.
    // @param level : BuildingLevel
    // @return integer
    function levelBuildTime(level) {}
    // Construction cost in denarii.
    // @param level : BuildingLevel
    // @return integer
    function levelCost(level) {}
    // How many levels the chain has. Not changeable at runtime - resizing the level array dangles every live building that points into it.
    // @param building : BuildingType
    // @return integer
    function levelCount(building) {}
    // A level's culture-independent fallback image path.
    // @param level : BuildingLevel
    // @param kind : integer
    // @return string
    function levelDefaultImage(level, kind) {}
    // A level's image path for one CULTURE, falling back to the default.
    // @param level : BuildingLevel
    // @param cultureType : integer
    // @param kind : integer - 0 card, 1 constructed, 2 under construction.
    // @return string
    function levelImage(level, cultureType, kind) {}
    // A level's position in its chain, or -1.
    // @param level : BuildingLevel
    // @return integer
    function levelIndex(level) {}
    // Smallest settlement tier that may build this level.
    // @param level : BuildingLevel
    // @return integer
    function levelMinSettlement(level) {}
    // A level's internal name.
    // @param level : BuildingLevel
    // @return string
    function levelName(level) {}
    // The chain a level belongs to.
    // @param level : BuildingLevel
    // @return BuildingType|null
    function levelOwner(level) {}
    // Positive city-only, negative castle-only, 0 both. Always 0 on Rome.
    // @param level : BuildingLevel
    // @return integer
    function levelSettlementType(level) {}
    // A level's displayed text for one faction, after the faction -> culture -> generic fallback.
    // @param level : BuildingLevel
    // @param factionType : integer
    // @param kind : integer - 0 name, 1 description, 2 short description.
    // @return string
    function levelText(level, factionType, kind) {}
    // A chain's internal name.
    // @param building : BuildingType
    // @return string
    function name(building) {}
    // How many plugins the chain has. Plugins are read-only everywhere - the engine's plugin path is half-retired.
    // @param building : BuildingType
    // @return integer
    function pluginCount(building) {}
    // How many levels a plugin has.
    // @param building : BuildingType
    // @param plugin : integer
    // @return integer
    function pluginLevelCount(building, plugin) {}
    // A plugin's name.
    // @param building : BuildingType
    // @param plugin : integer
    // @return string
    function pluginName(building, plugin) {}
    // The chain the engine treats as the port. Rome has one and returns it either way.
    // @param forCastle : bool
    // @return BuildingType|null
    function portBuilding(forCastle) {}
    // One line of the recruitment list (chain 1), presented as a pool. Check its category: the same list also holds agents, limits and ancillaries.
    // @param level : BuildingLevel
    // @param index : integer
    // @return BuildingRecruitPool|null
    function recruitPool(level, index) {}
    // The building's religion handle, -1 for none. Always -1 on Rome.
    // @param building : BuildingType
    // @return integer
    function religion(building) {}
    // Remove one capability line. The node and its guard are freed, the count drops and every later line shifts down one.
    // @param level : BuildingLevel
    // @param chain : integer
    // @param index : integer
    // @return bool
    function removeCapability(level, chain, index) {}
    // Remove one recruitment line. Same semantics as removeCapability.
    // @param level : BuildingLevel
    // @param index : integer
    // @return bool
    function removeRecruitPool(level, index) {}
    // Set the base value.
    // @param node : BuildingCapability
    // @param value : float
    // @return bool
    function setCapabilityBase(node, value) {}
    // Set the additive bonus.
    // @param node : BuildingCapability
    // @param value : float
    // @return bool
    function setCapabilityBonus(node, value) {}
    // Reinterpret the line as another category. Does NOT convert it - the payload is left as it was.
    // @param node : BuildingCapability
    // @param category : integer
    // @return bool
    function setCapabilityCategory(node, category) {}
    // Set the line's UI display control; -2 hides it from the building browser without changing what it does.
    // @param node : BuildingCapability
    // @param ref : integer
    // @return bool
    function setCapabilityDisplayRef(node, ref) {}
    // Set the pool's starting size. Refused on Rome.
    // @param node : BuildingCapability
    // @param value : float
    // @return bool
    function setCapabilityInitialUnits(node, value) {}
    // Set the pool cap. Lowering it does not drain a banked surplus. Refused on Rome.
    // @param node : BuildingCapability
    // @param value : float
    // @return bool
    function setCapabilityMaxUnits(node, value) {}
    // Set the line's subject.
    // @param node : BuildingCapability
    // @param payload : integer
    // @return bool
    function setCapabilityPayload(node, payload) {}
    // Set the pool's replenishment. Does not retroactively adjust an already-banked surplus. Refused on Rome.
    // @param node : BuildingCapability
    // @param value : float
    // @return bool
    function setCapabilityReplenishment(node, value) {}
    // Make the pool retrain-only, or not.
    // @param node : BuildingCapability
    // @param value : bool
    // @return bool
    function setCapabilityRetrainOnly(node, value) {}
    // Set the classification. Out of range is refused.
    // @param building : BuildingType
    // @param classification : integer
    // @return bool
    function setClassification(building, classification) {}
    // Mark or unmark the chain as the settlement core.
    // @param building : BuildingType
    // @param value : bool
    // @return bool
    function setCore(building, value) {}
    // Mark or unmark the chain as the defences building.
    // @param building : BuildingType
    // @param value : bool
    // @return bool
    function setDefences(building, value) {}
    // Set the chain's displayed name. The override survives later edits to the building; an already-open scroll keeps its old text until it re-initialises.
    // @param building : BuildingType
    // @param text : string
    // @return bool
    function setDisplayName(building, text) {}
    // Mark or unmark the chain as farmland.
    // @param building : BuildingType
    // @param value : bool
    // @return bool
    function setFarm(building, value) {}
    // Point the guild at a different building chain.
    // @param guild : Guild
    // @param building : BuildingType
    // @return bool
    function setGuildBuilding(guild, building) {}
    // Rename a guild. There is no name index to rebuild - lookups are a linear scan.
    // @param guild : Guild
    // @param name : string
    // @return bool
    function setGuildName(guild, name) {}
    // Set the points needed for one guild level. Takes effect on the next evaluation.
    // @param guild : Guild
    // @param level : integer
    // @param threshold : integer
    // @return bool
    function setGuildThreshold(guild, level, threshold) {}
    // Mark or unmark the chain as a hinterland building.
    // @param building : BuildingType
    // @param value : bool
    // @return bool
    function setHinterland(building, value) {}
    // Set the build time. Same queued-item caveat as the cost.
    // @param level : BuildingLevel
    // @param turns : integer
    // @return bool
    function setLevelBuildTime(level, turns) {}
    // Set the construction cost. Anything ALREADY in a construction queue keeps the price it was charged - that is banked game state and refunds pay out against it.
    // @param level : BuildingLevel
    // @param cost : integer
    // @return bool
    function setLevelCost(level, cost) {}
    // Override the culture-independent fallback image path.
    // @param level : BuildingLevel
    // @param kind : integer
    // @param path : string
    // @return bool
    function setLevelDefaultImage(level, kind, path) {}
    // Override a level's image path for one culture. ⚠ A texture already loaded under the old path stays on screen until the owning scroll re-initialises - the card texture manager has no eviction call the data layer may use.
    // @param level : BuildingLevel
    // @param cultureType : integer
    // @param kind : integer
    // @param path : string
    // @return bool
    function setLevelImage(level, cultureType, kind, path) {}
    // Set the minimum settlement tier.
    // @param level : BuildingLevel
    // @param settlementLevel : integer
    // @return bool
    function setLevelMinSettlement(level, settlementLevel) {}
    // Rename a level. Same re-resolution as renaming a chain.
    // @param level : BuildingLevel
    // @param name : string
    // @return bool
    function setLevelName(level, name) {}
    // Set city/castle restriction. Refused on Rome, which has no such split.
    // @param level : BuildingLevel
    // @param settlementType : integer
    // @return bool
    function setLevelSettlementType(level, settlementType) {}
    // Override a level's displayed text for one faction, or for every faction with a negative factionType. The override is kept by the engine and re-applied whenever the string table is re-resolved, so a later edit to the building does not revert it. An already-open scroll keeps its old text.
    // @param level : BuildingLevel
    // @param factionType : integer - Negative for every faction.
    // @param kind : integer
    // @param text : string
    // @return bool
    function setLevelText(level, factionType, kind, text) {}
    // Rename a chain. The OLD name stops resolving immediately, including for anything that looks buildings up by name, and everything name-derived (the display strings, all three image paths) is re-resolved against the new one.
    // @param building : BuildingType
    // @param name : string
    // @return bool
    function setName(building, name) {}
    // Mark or unmark the chain as the port.
    // @param building : BuildingType
    // @param value : bool
    // @return bool
    function setPort(building, value) {}
    // Set the building's religion handle; -1 for none. Refused on Rome.
    // @param building : BuildingType
    // @param religion : integer
    // @return bool
    function setReligion(building, religion) {}
    // Mark or unmark the chain as a temple.
    // @param building : BuildingType
    // @param value : bool
    // @return bool
    function setTemple(building, value) {}
}

// descr_campaign_db, the campaign rules database. Medieval II only - Rome has no such file and every row reads a neutral value and refuses the write there.
::campaignDb <- {
}

// 41 further settings from the same file. Every one is a live database value: a write takes effect at the next read, and nothing caches any of them. NOT saved - re-apply after a load.
::campaignDb.extra <- {
    // Grant a pool its initial stock when the capping building appears.
    // @return bool - The current value.
    function addInitialWithCaps() {}
    // Agents may hide from enemy detection.
    // @return bool - The current value.
    function agentsCanHide() {}
    // The AI may build forts on resource tiles.
    // @return bool - The current value.
    function allowResourceForts() {}
    // Use the alternative public-order colour ramp on the settlement panel.
    // @return bool - The current value.
    function altSettOrderColors() {}
    // Use the alternative religious-unrest formula.
    // @return bool - The current value.
    function alternativeReligiousUnrest() {}
    // A bribed family member joins the briber's family tree instead of becoming a captain.
    // @return bool - The current value.
    function bribeToFamilyTree() {}
    // The rebel / slave faction may ransom captives.
    // @return bool - The current value.
    function captiveRansomForSlave() {}
    // How far a chivalry score has to be from zero before the UI labels the character.
    // @return integer - The current value.
    function chivalryDisplayThreshold() {}
    // Clear a recruitment pool when the settlement loses the building that capped it.
    // @return bool - The current value.
    function clearPoolsWithCaps() {}
    // Floor, in percent, on a denounce attempt's success chance.
    // @return integer - The current value.
    function denounceChanceMin() {}
    // Enable the `bananarepublic` console cheat.
    // @return bool - The current value.
    function enableBananaRepublicCheat() {}
    // Show event messages in hotseat play.
    // @return bool - The current value.
    function enableHotseatMessages() {}
    // Honour per-unit accent overrides in speech selection.
    // @return bool - The current value.
    function enableUnitAccentOverrides() {}
    // A faction at war refuses gifts outright.
    // @return bool - The current value.
    function enemiesRejectGifts() {}
    // Clamp a banked pool down when its maximum drops.
    // @return bool - The current value.
    function forceClampToMax() {}
    // The SETTLEMENT_FORTIFICATION_LEVEL a player-built fort gets.
    // @return integer - The current value.
    function fortFortificationLevel() {}
    // Base conversion rate a region gets from the faction that founded its settlement.
    // @return float - The current value.
    function foundingConversionDefaultRate() {}
    // Per-wall-level scale on a gate's boiling-oil strength in auto-resolve.
    // @return float - The current value.
    function gateDefenceStrengthOilLevelModifier() {}
    // Piety multiplier in a governor's conversion contribution.
    // @return float - The current value.
    function governorConversionRateModifier() {}
    // Flat term in a governor's conversion contribution.
    // @return float - The current value.
    function governorConversionRateOffset() {}
    // Floor on an inquisitor's chance to condemn a target.
    // @return float - The current value.
    function inquisitorCrtChanceMin() {}
    // Let inquisitors pick targets out of crusading armies.
    // @return bool - The current value.
    function inquisitorTargetCrusades() {}
    // Inquisitors may target faction heirs.
    // @return bool - The current value.
    function inquisitorTargetHeirs() {}
    // Inquisitors may target faction leaders.
    // @return bool - The current value.
    function inquisitorTargetLeaders() {}
    // A character who turns heretic keeps the portrait he had.
    // @return bool - The current value.
    function keepOriginalHereticPortraits() {}
    // How strongly neighbouring regions pull a region's religion towards theirs.
    // @return float - The current value.
    function neighbourNormaliseWeight() {}
    // The SETTLEMENT_LEVEL from which a castle always has wall towers.
    // @return integer - The current value.
    function noTowersOnlyForCastleLevel() {}
    // Base conversion rate a region gets from its current owner.
    // @return float - The current value.
    function ownerConversionDefaultRate() {}
    // Sort the recruitment list by the simple order rather than by category.
    // @return bool - The current value.
    function recruitmentSortSimple() {}
    // A revolt may spawn more than one stack.
    // @return bool - The current value.
    function revoltAdditionalArmies() {}
    // Crusading armies can revolt.
    // @return bool - The current value.
    function revoltCrusadingArmies() {}
    // Show games and races as two entries rather than one.
    // @return bool - The current value.
    function separateGamesRaces() {}
    // Grant a pool its initial stock when the capping building appears.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setAddInitialWithCaps(value) {}
    // Agents may hide from enemy detection.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setAgentsCanHide(value) {}
    // The AI may build forts on resource tiles.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setAllowResourceForts(value) {}
    // Use the alternative public-order colour ramp on the settlement panel.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setAltSettOrderColors(value) {}
    // Use the alternative religious-unrest formula.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setAlternativeReligiousUnrest(value) {}
    // A bribed family member joins the briber's family tree instead of becoming a captain.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setBribeToFamilyTree(value) {}
    // The rebel / slave faction may ransom captives.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setCaptiveRansomForSlave(value) {}
    // How far a chivalry score has to be from zero before the UI labels the character.
    // @param value : integer - New value.
    // @return bool - True when the write happened.
    function setChivalryDisplayThreshold(value) {}
    // Clear a recruitment pool when the settlement loses the building that capped it.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setClearPoolsWithCaps(value) {}
    // Floor, in percent, on a denounce attempt's success chance.
    // @param value : integer - New value.
    // @return bool - True when the write happened.
    function setDenounceChanceMin(value) {}
    // Enable the `bananarepublic` console cheat.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setEnableBananaRepublicCheat(value) {}
    // Show event messages in hotseat play.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setEnableHotseatMessages(value) {}
    // Honour per-unit accent overrides in speech selection.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setEnableUnitAccentOverrides(value) {}
    // A faction at war refuses gifts outright.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setEnemiesRejectGifts(value) {}
    // Clamp a banked pool down when its maximum drops.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setForceClampToMax(value) {}
    // The SETTLEMENT_FORTIFICATION_LEVEL a player-built fort gets.
    // @param value : integer - New value.
    // @return bool - True when the write happened.
    function setFortFortificationLevel(value) {}
    // Base conversion rate a region gets from the faction that founded its settlement.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setFoundingConversionDefaultRate(value) {}
    // Per-wall-level scale on a gate's boiling-oil strength in auto-resolve.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setGateDefenceStrengthOilLevelModifier(value) {}
    // Piety multiplier in a governor's conversion contribution.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setGovernorConversionRateModifier(value) {}
    // Flat term in a governor's conversion contribution.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setGovernorConversionRateOffset(value) {}
    // Floor on an inquisitor's chance to condemn a target.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setInquisitorCrtChanceMin(value) {}
    // Let inquisitors pick targets out of crusading armies.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setInquisitorTargetCrusades(value) {}
    // Inquisitors may target faction heirs.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setInquisitorTargetHeirs(value) {}
    // Inquisitors may target faction leaders.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setInquisitorTargetLeaders(value) {}
    // A character who turns heretic keeps the portrait he had.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setKeepOriginalHereticPortraits(value) {}
    // How strongly neighbouring regions pull a region's religion towards theirs.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setNeighbourNormaliseWeight(value) {}
    // The SETTLEMENT_LEVEL from which a castle always has wall towers.
    // @param value : integer - New value.
    // @return bool - True when the write happened.
    function setNoTowersOnlyForCastleLevel(value) {}
    // Base conversion rate a region gets from its current owner.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setOwnerConversionDefaultRate(value) {}
    // Sort the recruitment list by the simple order rather than by category.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setRecruitmentSortSimple(value) {}
    // A revolt may spawn more than one stack.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setRevoltAdditionalArmies(value) {}
    // Crusading armies can revolt.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setRevoltCrusadingArmies(value) {}
    // Show games and races as two entries rather than one.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setSeparateGamesRaces(value) {}
    // How many default defensive attacks a settlement makes in auto-resolve.
    // @param value : integer - New value.
    // @return bool - True when the write happened.
    function setSettDefenceStrengthNumDefaultAttacks(value) {}
    // The SETTLEMENT_LEVEL from which a castle cannot be assaulted without siege gear.
    // @param value : integer - New value.
    // @return bool - True when the write happened.
    function setSiegeGearRequiredForCastleLevel(value) {}
    // Multiplier on a spy's conversion contribution in a foreign region.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setSpyConversionRateForeignModifier(value) {}
    // Multiplier on a spy's conversion contribution in a friendly region.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setSpyConversionRateModifier(value) {}
    // Flat term in a spy's conversion contribution.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setSpyConversionRateOffset(value) {}
    // Rescale a spy's success chance across the min / max band instead of clamping to it.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setSpyRescaleChance(value) {}
    // Auto-resolve lets a settlement switch between exposed and protected defence.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setSwitchableDefenceExposed(value) {}
    // Diplomacy tracks a running balance owed rather than settling each deal outright.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setUseBalanceOwed(value) {}
    // Multiplier on a witch's religious conversion rate.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setWitchConversionRateModifier(value) {}
    // How many default defensive attacks a settlement makes in auto-resolve.
    // @return integer - The current value.
    function settDefenceStrengthNumDefaultAttacks() {}
    // The SETTLEMENT_LEVEL from which a castle cannot be assaulted without siege gear.
    // @return integer - The current value.
    function siegeGearRequiredForCastleLevel() {}
    // Multiplier on a spy's conversion contribution in a foreign region.
    // @return float - The current value.
    function spyConversionRateForeignModifier() {}
    // Multiplier on a spy's conversion contribution in a friendly region.
    // @return float - The current value.
    function spyConversionRateModifier() {}
    // Flat term in a spy's conversion contribution.
    // @return float - The current value.
    function spyConversionRateOffset() {}
    // Rescale a spy's success chance across the min / max band instead of clamping to it.
    // @return bool - The current value.
    function spyRescaleChance() {}
    // Auto-resolve lets a settlement switch between exposed and protected defence.
    // @return bool - The current value.
    function switchableDefenceExposed() {}
    // Diplomacy tracks a running balance owed rather than settling each deal outright.
    // @return bool - The current value.
    function useBalanceOwed() {}
    // Multiplier on a witch's religious conversion rate.
    // @return float - The current value.
    function witchConversionRateModifier() {}
}

// What the campaign difficulty currently does. ⚠ DERIVED, not stored: AI_CHEAT_MANAGER recomputes the whole block from the difficulty level at the start of every faction's turn, so every setter here refuses and says so. Read it to find out what the AI is getting; change it by changing the difficulty.
::difficulty <- {
    // Whether the AI is allowed to hire mercenaries at the current difficulty.
    // @return bool - The current value.
    function aiHireMercenaries() {}
    // Multiplier on brigand spawn frequency in AI territory.
    // @return float - The current value.
    function brigandChanceAi() {}
    // Multiplier on brigand spawn frequency in the human player's territory.
    // @return float - The current value.
    function brigandChancePlayer() {}
    // Whether brigand stacks are allowed to attack the human player's settlements.
    // @return bool - The current value.
    function brigandControllerTargetSettlements() {}
    // The original game's veto on the AI attacking another AI's defended settlement. No longer used - difficulty biases what the AI wants rather than vetoing its decisions.
    // @return bool - The current value.
    function dontAttackAiDefenders() {}
    // Flat experience bonus on units the AI recruits.
    // @return integer - The current value.
    function experienceBonusAi() {}
    // Multiplier on the HUMAN player's farming income. Always 1.0, for the same reason.
    // @return float - The current value.
    function farmingIncomeModifierPlayer() {}
    // The original game's forced naval invasion. No longer used - difficulty biases what the AI wants rather than forcing its decisions.
    // @return bool - The current value.
    function forceNavalInvasions() {}
    // Flat per-turn money the AI is handed.
    // @return integer - The current value.
    function incomeBonusAi() {}
    // Multiplier on AI income at the current difficulty.
    // @return float - The current value.
    function incomeModifierAi() {}
    // The original game's "force the AI to declare war after N turns of peace with the player". No longer used: difficulty biases what the AI wants, it never overrides what it is allowed to decide.
    // @return integer - The current value.
    function maxPlayerPeaceTurns() {}
    // The original game's public-order penalty scaled off settlement growth. No longer used - growth feeds order through the settlement's own model and difficulty does not touch it.
    // @return integer - The current value.
    function orderFromGrowth() {}
    // How much more the AI values a region the human player owns when it picks targets.
    // @return float - The current value.
    function playerRegionValueModifier() {}
    // Flat population-growth bonus the AI gets.
    // @return integer - The current value.
    function popGrowthBonusAi() {}
    // Flat public-order bonus the AI gets.
    // @return integer - The current value.
    function publicOrderBonusAi() {}
    // Whether the AI is allowed to hire mercenaries at the current difficulty.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setAiHireMercenaries(value) {}
    // Multiplier on brigand spawn frequency in AI territory.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setBrigandChanceAi(value) {}
    // Multiplier on brigand spawn frequency in the human player's territory.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setBrigandChancePlayer(value) {}
    // Whether brigand stacks are allowed to attack the human player's settlements.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setBrigandControllerTargetSettlements(value) {}
    // The original game's veto on the AI attacking another AI's defended settlement. No longer used - difficulty biases what the AI wants rather than vetoing its decisions.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setDontAttackAiDefenders(value) {}
    // Flat experience bonus on units the AI recruits.
    // @param value : integer - New value.
    // @return bool - True when the write happened.
    function setExperienceBonusAi(value) {}
    // Multiplier on the HUMAN player's farming income. Always 1.0, for the same reason.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setFarmingIncomeModifierPlayer(value) {}
    // The original game's forced naval invasion. No longer used - difficulty biases what the AI wants rather than forcing its decisions.
    // @param value : bool - New value.
    // @return bool - True when the write happened.
    function setForceNavalInvasions(value) {}
    // Flat per-turn money the AI is handed.
    // @param value : integer - New value.
    // @return bool - True when the write happened.
    function setIncomeBonusAi(value) {}
    // Multiplier on AI income at the current difficulty.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setIncomeModifierAi(value) {}
    // The original game's "force the AI to declare war after N turns of peace with the player". No longer used: difficulty biases what the AI wants, it never overrides what it is allowed to decide.
    // @param value : integer - New value.
    // @return bool - True when the write happened.
    function setMaxPlayerPeaceTurns(value) {}
    // The original game's public-order penalty scaled off settlement growth. No longer used - growth feeds order through the settlement's own model and difficulty does not touch it.
    // @param value : integer - New value.
    // @return bool - True when the write happened.
    function setOrderFromGrowth(value) {}
    // How much more the AI values a region the human player owns when it picks targets.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setPlayerRegionValueModifier(value) {}
    // Flat population-growth bonus the AI gets.
    // @param value : integer - New value.
    // @return bool - True when the write happened.
    function setPopGrowthBonusAi(value) {}
    // Flat public-order bonus the AI gets.
    // @param value : integer - New value.
    // @return bool - True when the write happened.
    function setPublicOrderBonusAi(value) {}
    // Multiplier on the HUMAN player's tax income. Always 1.0: difficulty never alters the player's own economy.
    // @param value : float - New value.
    // @return bool - True when the write happened.
    function setTaxIncomeModifierPlayer(value) {}
    // Multiplier on the HUMAN player's tax income. Always 1.0: difficulty never alters the player's own economy.
    // @return float - The current value.
    function taxIncomeModifierPlayer() {}
}

// Event registration. `events.on(name, fn)` attaches a handler to one engine event; handlers compose, run in registration order, and one that throws is logged and does not stop the others. Two families share this table and a script author does not need to care which is which: the engine's own trigger events, which hand the handler a payload object whose fields are read by name, and the hand-placed lifecycle hooks, which have their own argument lists.
::events <- {
    // Drops every handler registered on this table. Used by script_reload; a per-handler off() is WP3.0's design work.
    function clear() {}
    // Registers a handler for one event. Throws on an unknown name - a typo is silence forever otherwise.
    // @param name : string - The event name, as listed on this page. Engine trigger tokens are spelled without an "on" prefix.
    // @param handler : function - Called with the event's arguments. A trigger event passes one payload object; a lifecycle hook passes its own arguments.
    function on(name, handler) {}
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // AbandonShowMe
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // AcceptBribe
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // AcquiredAncillary
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // AcquisitionMission
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // AddedToBuildingQueue
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // AddedToTrainingQueue
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // AdviceSupressed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // AgentCreated
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // ArmyTakesCrusadeTarget
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // AssassinCaughtAttackingPope
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // AssassinationMission
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleAiCommenced
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleArmyHalfDestroyed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleArmyRouted
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleArmyTired
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleBattleGatesDestroyedByEngine
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleConflictPhaseCommenced
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleDelayPhaseCommenced
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleDeploymentPhaseCommenced
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleDominatingPlaza
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleEnemyArmyHalfDestroyed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleEnemyAttacksSettlementBuilding
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleEnemySiegeEngineDestroyed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleEnemyUnitAttacksPlayerUnit
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleEnemyUnitGoesBerserk
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleEnemyUnitRouts
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleEngineUnmanned
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleFinished
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleGatesAttackedByEnemyEngine
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleGatesAttackedByEngine
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleGatesAttackedByPlayerEngine
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleGeneralKilled
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleGeneralRouted
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattlePlayerArmyHalfDestroyed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattlePlayerAttacksSettlementBuilding
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattlePlayerSiegeEngineDestroyed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattlePlayerUnderAttackIdle
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattlePlayerUnitAttacksEnemyUnit
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattlePlayerUnitGoesBerserk
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattlePlayerUnitRouts
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleReinforcementsArrive
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleSiegeEngineDestroyed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleSiegeEngineDocksWall
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleSpySuccess
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleStopsWinningPlaza
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleTideofBattle
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleUnitGoesBerserk
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleUnitRouts
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleWallsBreachedByEngine
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleWallsCaptured
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleWinningCombat
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BattleWinningPlaza
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BecomesFactionHeir
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BecomesFactionLeader
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // Birth
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BriberyMission
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BrotherAdopted
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BuildingCompleted
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // BuildingDestroyed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // ButtonPressed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CapturedCharacterRansomed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CapturedCharacterReleased
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CardinalPromoted
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CardinalRemoved
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CeasedFactionHeir
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CeasedFactionLeader
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CharacterAttacksCrusadingGeneral
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CharacterBecomesAFather
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CharacterComesOfAge
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CharacterDamagedByDisaster
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CharacterMarries
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CharacterMarriesPrincess
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CharacterNearHeretic
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CharacterNearWitch
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CharacterPanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CharacterSelected
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CharacterTurnEnd
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CharacterTurnEndInSettlement
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CharacterTurnStart
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CityRebels
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CityRiots
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CitySacked
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CollegeOfCardinalsPanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // ConstructionPanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CrusadeCalled
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // CrusadeEnds
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // DeclineAutomatedSettlementManagement
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // Demeanour
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // DenouncementMission
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // DiplomacyMission
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // DiplomacyPanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // DiplomatSelected
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // DiplomaticStandingPanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // Disaster
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // DishonestTransgression
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // EnemyCharacterSelected
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // EscPressed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // EventCounter
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // ExecutesASpyOnAMission
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // ExecutesAnAssassinOnAMission
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // ExterminatePopulation
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FactionAllianceDeclared
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FactionBreakAlliance
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FactionDestroyed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FactionExcommunicated
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FactionLeaderPrisonersRansomedCaptive
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FactionLeaderPrisonersRansomedCaptor
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FactionNewCapital
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FactionSummaryPanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FactionTradeAgreementMade
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FactionTurnEnd
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FactionTurnStart
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FactionWarDeclared
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FamilyTreePanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FatherDiesNatural
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // FinancesPanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // Forgiveness
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GameReloaded
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GeneralAbandonCrusade
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GeneralArrivesCrusadeTargetRegion
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GeneralAssaultsGeneral
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GeneralAssaultsResidence
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GeneralCaptureResidence
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GeneralCaptureSettlement
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GeneralDevastatesTile
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GeneralJoinCrusade
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GeneralPrisonersRansomedCaptive
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GeneralPrisonersRansomedCaptor
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GeneralTakesCrusadeTarget
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GiveMoney
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GiveSettlement
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GovernorAgentCreated
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GovernorBuildingCompleted
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GovernorBuildingDestroyed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GovernorCityRebels
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GovernorCityRiots
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GovernorPlugInCompleted
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GovernorThrowGames
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GovernorThrowRaces
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GovernorUnitTrained
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GuildDestroyed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // GuildUpgraded
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // HireMercenaries
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // HireMercenariesPanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // HordeFormed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // Idle
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // IncomingMessage
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // InquisitorAppointed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // Insurrection
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // InterFactionMarriage
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // LeaderDestroyedFaction
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // LeaderMissionFailed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // LeaderMissionSuccess
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // LeaderOrderedAssassination
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // LeaderOrderedBribery
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // LeaderOrderedDiplomacy
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // LeaderOrderedSabotage
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // LeaderOrderedSpyingMission
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // LesserGeneralOfferedForAdoption
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // MarriageAllianceOffered
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // MarriageAlliancePossible
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // MarriageMission
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // MessageClosed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // MessageOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // MissionFinished
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // MultiTurnMove
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // NavalAutoResolvePanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // NavalPreBattleScrollAdviceRequested
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // NewAdmiralCreated
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // NewTurnStart
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // ObjSeen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // OccupySettlement
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // OfferedForAdoption
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // OfferedForMarriage
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // PlugInCompleted
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // PopeAcceptsCrusadeTarget
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // PopeElected
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // PopeRejectsCrusadeTarget
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // PostBattle
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // PreBattle
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // PreBattlePanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // PreBattleScrollAdviceRequested
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // PreBattleWithdrawal
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // PreFactionTurnStart
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // PriestBecomesHeretic
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // RecruitmentPanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // RefuseBribe
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // RequestBuildingAdvice
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // RequestMercenariesAdvice
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // RequestTrainingAdvice
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SabotageMission
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SackSettlement
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // ScriptedAdvice
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // ScrollAdviceRequested
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // ScrollClosed
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // ScrollOpened
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SettlementConverted
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SettlementPanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SettlementScrollAdviceRequested
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SettlementSelected
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SettlementTurnEnd
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SettlementTurnStart
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SettlementUpgraded
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // ShortcutTriggered
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SiegeEquipmentCompleted
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SpyMission
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SufferAcquisitionAttempt
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SufferAssassinationAttempt
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SufferDenouncementAttempt
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // SufferMarriageAttempt
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // TileSeen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // TradePanelOpen
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // Transgression
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // UIElementVisible
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // UngarrisonedFort
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // UngarrisonedSettlement
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // UnitDisbanded
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // UnitTrained
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // UnitsDesertCrusade
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // UpdateAttitude
    // Event: Engine trigger event. The handler takes one payload argument; the fields this event carries are readable off it by name, and a field it does not carry reads null.
    // VotedForPope
    // Event: A faction's campaign AI has been initialised for the turn and is about to make its decisions. The AI object is handed over as a borrowed, writable view that dies when the handler returns.
    // aiTurn
    // Event: One battle simulation tick. Hot: runs many times a second for the length of a battle.
    // battleTick
    // Event: The long-term goal director has finished reading its per-turn parameters. Handed over as a borrowed, writable view that dies when the handler returns.
    // calculateLtgd
    // Event: The engine is scoring how strong a unit type is for the campaign AI: recruitment choices, army strength, balance of power, the pre-battle odds text. Return a replacement value or nil. Not used by autoresolve.
    // calculateUnitValue
    // Event: The campaign map is open and its models and textures are loaded. Fires EVERY time the strat map opens, including the return from a battle - anything stamped onto a model has to be restamped here.
    // campaignMapLoaded
    // Event: One campaign-map simulation tick. Hot: this runs many times a second while the campaign map is up, and does not run during a battle.
    // campaignTick
    // Event: The player clicked a campaign-map tile that has a character on it. Fires before clickAtTile, and fires whether or not the character is the one that ends up selected.
    // characterClicked
    // Event: A campaign-map character is being destroyed, for any reason. The reference is still live inside the handler and dead immediately after.
    // characterDied
    // Event: A character is about to change faction: bribery, defection, marriage, or a faction dying. The character still belongs to the old faction inside the handler.
    // characterSwitchFaction
    // Event: The player clicked the campaign map; the arguments are the tile the click resolved to.
    // clickAtTile
    // Event: A campaign save is being written. Return an array of paths to files the handler has already written; their contents are embedded in the save and handed back to loadSaveFile.
    // createSaveFile
    // Event: The graphics device is about to be reset or resized; drop anything holding a device resource.
    // deviceLost
    // Event: The graphics device has been reset or resized; device resources can be rebuilt.
    // deviceReset
    // Event: Once per rendered frame, inside the open ImGui frame. The only place ImGui calls are legal.
    // draw
    // Event: A siege has ended, with any outcome. The arguments are the besieged place's map coordinates.
    // endSiege
    // Event: A campaign is being left for the main menu.
    // exitToMenu
    // Event: A faction has been eliminated. Fires before its armies and settlements are handed on.
    // factionDied
    // Event: The player clicked a faction's symbol on the faction-selection screen.
    // factionSymbolSelect
    // Event: The engine is deciding what fortification a besieged settlement has, which is what decides the siege equipment the attacker can build. Return (level, isCastle) to override, nil to leave it. Only the level is consumed; the second value is accepted but has no effect.
    // fortificationLevel
    // Event: Legacy alias for unitDbParsed; fires immediately before it, at the same site. Both names are kept for scripts written against older versions.
    // gameDbsRead
    // Event: The game has reached the main menu; every database has been read.
    // gameInit
    // Event: A campaign save carrying embedded script files is being loaded. The argument is an array of paths to those files, extracted to a scratch directory; they are deleted after the handler returns, so read them now.
    // loadSaveFile
    // Event: The ImGui backend has just (re)built its device objects and font atlas; add custom fonts here.
    // loadingFonts
    // Event: A brand new campaign's world data has been built. Loading a save does not come through here - the GameReloaded trigger event is that path's signal.
    // newGameLoaded
    // Event: The Start Campaign button was pressed. Nothing is loaded yet - no world, no map, no factions.
    // newGameStart
    // Event: The scripting runtime has finished loading the entry script. Registries are in scope; there is no game yet.
    // pluginLoad
    // Event: A unit is being taken off a settlement's recruitment queue, for any reason. The item is a borrowed view and is gone by the time the handler returns.
    // removeFromUnitQueue
    // Event: The engine has picked a battle-map settlement package. Return a different package name to override it, or nil to leave it. A name outside the chosen package's group is ignored.
    // selectWorldpkgdesc
    // Event: A faction's production priorities are computed and about to be pushed to its per-region production controllers. Borrowed, writable view; dies when the handler returns.
    // setProductionControllers
    // Event: An army has been created by the spawn_army campaign-script command.
    // spawnArmy
    // Event: A siege has begun. The arguments are the besieged place's map coordinates.
    // startSiege
    // Event: A new campaign turn has begun; the argument is the new turn number.
    // turnChanged
    // Event: Every unit record has been read from export_descr_unit.txt and nothing derived from them has run yet. Register new unit types here: the buildings DB is parsed after this and resolves unit names against what this hook left behind.
    // unitDbParsed
    // Event: The world has just been torn down: exiting to the menu, starting a new campaign, or loading a save. Every reference a script is holding is dead after this.
    // unloadCampaign
}

// Runtime .fbx models and the props placed with them. A table rather than an object: there is one registry and it has no state of its own.
::fbx <- {
    // Find a model by the id it has in the Lua `M2TWEOPFBX` API. Only useful alongside a script that uses that API.
    // @param key : integer - The key.
    // @return FbxModel|null - The model, or null.
    function find(key) {}
    // Find an object by the id it has in the Lua `M2TWEOPFBX` API. Only useful alongside a script that uses that API; ids are not unique and this returns the first match.
    // @param key : integer - The key.
    // @return FbxObject|null - The object, or null.
    function findObject(key) {}
    // Load an .fbx and the texture to draw it with. The file's own materials are ignored - one texture covers the whole model. Null and a logged reason when the file cannot be read, or when it is beyond what the engine can draw: over 21844 triangles, over 72 bones, or no meshes at all.
    // @param modelPath : string - Path to the .fbx.
    // @param texturePath : string - Path to the .dds.
    // @return FbxModel|null - The loaded model.
    function load(modelPath, texturePath) {}
}

// The running game: where it is installed, what its databases say, what is on the map, and the campaign-script bridge.
::game <- {
    // How many climates the map declares.
    // @return integer - Climate count.
    function climateCount() {}
    // A climate's index by name.
    // @param name : string - Climate name.
    // @return integer - The index, or -1.
    function climateId(name) {}
    // A climate's internal name.
    // @param index : integer - Climate index.
    // @return string - The name, or empty.
    function climateName(index) {}
    // Copy a file or directory tree on the real filesystem, overwriting. OS paths, not VFS paths - this is for staging generated data next to the mod, and it is not sandboxed.
    // @param from : string - Source path.
    // @param to : string - Destination path.
    // @return bool - True when the copy happened.
    function copyFile(from, to) {}
    // How many cultures the data files declare.
    // @return integer - Culture count.
    function cultureCount() {}
    // A culture's index by name.
    // @param name : string - Culture name.
    // @return integer - The index, or -1.
    function cultureId(name) {}
    // A culture's internal name, as spelled in descr_cultures.txt.
    // @param index : integer - Culture index.
    // @return string - The name, or an empty string.
    function cultureName(index) {}
    // Evaluate one campaign-script condition line against the event trigger currently in scope, or against a null trigger when there is none.
    // @param condition : string - e.g. "I_TurnNumber > 5".
    // @return bool - The condition's value; false when it does not parse.
    function evaluateCondition(condition) {}
    // An event counter - the family `set_event_counter` writes and `I_EventCounter` tests. Null when there is no such counter, which is a different answer from 0.
    // @param name : string - Counter name.
    // @return integer|null - The value, or null.
    function eventCounter(name) {}
    // A faction by its index in the campaign's faction list.
    // @param index : integer - 0-based index.
    // @return Faction|null - The faction, or null.
    function faction(index) {}
    // How many factions are in the running campaign.
    // @return integer - Faction count.
    function factionCount() {}
    // The parsed descr_sm_factions record for a faction id: colours, banners, horde settings, custom-battle availability. Exists whether or not that faction is in the running campaign, which is what separates it from Faction. Nothing on it is saved - it is rebuilt from the data files on every load, so re-apply changes after loading.
    // @param factionId : integer - Faction id.
    // @return FactionRecord|null - The record, or null.
    function factionRecord(factionId) {}
    // How many faction records the data files declare. Not the number of factions in the campaign.
    // @return integer - Record count.
    function factionRecordCount() {}
    // A strategic ground type's movement cost multiplier.
    // @param groundType : integer - Ground-type index.
    // @return float|null - The cost, or null.
    function groundMoveCost(groundType) {}
    // Is a tile on the map, passable and unoccupied - the three things that make a spawn coordinate usable.
    // @param x : integer - Tile x.
    // @param y : integer - Tile y.
    // @return bool - True when the tile is usable.
    function isTileFree(x, y) {}
    // Is a tile currently visible to a faction. Having been seen once does not count.
    // @param faction : Faction - The faction.
    // @param x : integer - Tile x.
    // @param y : integer - Tile y.
    // @return bool|null - Visibility, or null for a dead faction or an off-map tile.
    function isTileVisible(faction, x, y) {}
    // Load a campaign save. Queued: the swap happens at the top of the next frame, so the calling script runs to its end first.
    // @param path : string - Save name or path.
    // @return bool - True when the load was queued.
    function load(path) {}
    // The faction the human is playing in the running campaign. Not the front-end selection - that one only means anything before the campaign starts.
    // @return integer - Faction id, or -1.
    function localFactionId() {}
    // Write a line to the engine log under the script channel.
    // @param message : string - The line.
    function log(message) {}
    // The last component of modPath().
    // @return string - e.g. "bare_geomod".
    function modName() {}
    // The active mod's directory, relative to the game root.
    // @return string - e.g. "mods/bare_geomod"; empty with no mod.
    function modPath() {}
    // Play a sound event by its enum value.
    // @param soundEvent : integer - Sound event enum value.
    // @return bool - True when the event was dispatched.
    function playSound(soundEvent) {}
    // The directory the Lua entry script was loaded from. Of interest to a Squirrel mod only when it has to find files a Lua mod put there.
    // @return string - Path with a trailing separator, or empty.
    function pluginPath() {}
    // The faction that owns a region. The true owner, not the fog-of-war-filtered one.
    // @param regionId : integer - Region id.
    // @return Faction|null - The owner, or null.
    function regionOwner(regionId) {}
    // How many religions the data files declare. 0 on Rome.
    // @return integer - Religion count.
    function religionCount() {}
    // A religion's index by name. Medieval only.
    // @param name : string - Religion name.
    // @return integer - The index, or -1.
    function religionId(name) {}
    // A religion's internal name. Medieval only; Rome has no religion database and answers with an empty string.
    // @param index : integer - Religion index.
    // @return string - The name, or an empty string.
    function religionName(index) {}
    // Restart the script world with validation: a candidate pair of VMs is built and `persistent` carried across, and the swap only happens on a clean load. Calling this from a script destroys the closure that called it, so it is the last thing that script does.
    // @return bool - True when the new script world is live.
    function reloadScripts() {}
    // Run one dev-console verb. Returns the console's message, EMPTY when it had nothing to say.
    // @param command : string - Verb name.
    // @param args : string - The rest of the line; pass "" for none.
    // @return string - The console's message, or an empty string.
    function runConsoleCommand(command, args) {}
    // Run one campaign-script command through the engine's own parser and token table. A scope-opening command (if / while / monitor_event) always fails: its terminator is not on the line.
    // @param command : string - The bare token, e.g. "set_event_counter".
    // @param args : string - The rest of the line; pass "" for none.
    // @return bool - True when the command parsed and ran.
    function runScriptCommand(command, args) {}
    // Write a campaign save, synchronously. A bare name lands in the mod's saves folder; a path with a separator is used verbatim, relative to the game root.
    // @param path : string - Save name or path.
    // @return bool - True when the file is on disk.
    function save(path) {}
    // How many ancillaries one character may hold; the default is 8. The 127 ceiling is the save format's. Medieval only.
    // @param limit : integer - 0 to 127.
    // @return bool - True when the write happened.
    function setAncillaryLimit(limit) {}
    // Combat points granted per armour-upgrade level; vanilla is 2 in both ports.
    // @param points : integer - Points per level.
    // @return bool - True when the write happened.
    function setArmourUpgradePoints(points) {}
    // Set an event counter, creating it when absent. Goes through the engine's own command, so a monitor watching the counter fires.
    // @param name : string - Counter name.
    // @param value : integer - New value.
    // @return bool - True when the write happened.
    function setEventCounter(name, value) {}
    // Set a ground type's movement cost. The pathfinder's precomputed per-tile entry costs are invalidated with it, so the change is visible on the next move.
    // @param groundType : integer - Ground-type index.
    // @param cost : float - New cost.
    // @return bool - True when the write happened.
    function setGroundMoveCost(groundType, cost) {}
    // Skip the EDU ownership test in the recruitment filter, so a settlement may recruit a unit whose ownership line does not name its faction. For mods that build their roster at runtime. Scope: the recruitment filter and the EDB recruit-line cross-check only. Custom battles, the editors, bribery, mercenaries, bodyguards, rebel spawns and the AI's production shortlist all still honour ownership. Not saved.
    // @param ignore : bool - True to skip the test.
    // @return bool - True when the write happened.
    function setIgnoreRecruitmentOwnership(ignore) {}
    // Replace an existing strat-screen string. That table's key space is frozen at compile time, so a new key cannot be added.
    // @param key : string - The key.
    // @param value : string - The new text.
    // @return bool - True when the key existed and was rewritten.
    function setStratText(key, value) {}
    // Replace an EXISTING key's text, in memory, for the rest of the session. Not saved: re-apply on load. An unknown key is refused rather than inserted.
    // @param key : string - The key.
    // @param value : string - The new text.
    // @return bool - True when the key existed and was rewritten.
    function setText(key, value) {}
    // Watchtower sight range in tiles; the vanilla value is 10. Every existing watchtower's fog of war is recomputed on the spot, so the change shows immediately. Range 0 to 64. Not saved - re-apply on load.
    // @param tiles : integer - Sight range, 0 to 64.
    // @return bool - True when the write happened.
    function setWatchtowerRange(tiles) {}
    // Combat points granted per weapon-upgrade level; the vanilla value is 3 on Medieval and 2 on Rome. Combat, the unit card, the tooltips and the AI's strength evaluation all read the same number, so they move together.
    // @param points : integer - Points per level.
    // @return bool - True when the write happened.
    function setWeaponUpgradePoints(points) {}
    // Show a historic-event message to the player. The title and body are given directly; nothing is looked up in historic_events.txt.
    // @param picture : string - Event picture name.
    // @param title : string - Message title.
    // @param body : string - Message body.
    // @return bool - True when the message was raised.
    function showHistoricEvent(picture, title, body) {}
    // Look a key up in the strat-screen string table.
    // @param key : string - The key.
    // @return string - The text, or an empty string.
    function stratText(key) {}
    // Look a key up in the expanded string table (expanded.txt on Medieval, expanded_bi.txt on Rome).
    // @param key : string - The key.
    // @return string - The text, or an empty string.
    function text(key) {}
    // The movement cost of stepping between two ADJACENT tiles. One edge of the pathfinder's graph, not a path solve.
    // @param fromX : integer - From x.
    // @param fromY : integer - From y.
    // @param toX : integer - To x, adjacent.
    // @param toY : integer - To y, adjacent.
    // @return float|null - The cost, or null when either tile is off-map.
    function tileMoveCost(fromX, fromY, toX, toY) {}
    // The region a tile belongs to.
    // @param x : integer - Tile x.
    // @param y : integer - Tile y.
    // @return integer|null - Region id, or null for an off-map tile.
    function tileRegionId(x, y) {}
    // Show or hide the in-game console.
    // @return bool - Always true.
    function toggleConsole() {}
}

// The campaign-map camera.
::game.camera <- {
    // Put the camera on a tile immediately.
    // @param x : integer - Tile x.
    // @param y : integer - Tile y.
    // @return bool - True when the camera moved.
    function jumpTo(x, y) {}
    // Glide the camera to a tile. Issues the move; the camera arrives over the next few frames.
    // @param x : integer - Tile x.
    // @param y : integer - Tile y.
    // @return bool - True when the move was issued.
    function moveTo(x, y) {}
    // Set the camera zoom. 0 is right up close, 1 is far out; the engine clamps.
    // @param zoom : float - 0 to 1.
    // @return bool - True when the zoom was applied.
    function setZoom(zoom) {}
}

// The two descr_campaign_db display numbers a script has a real use for. Medieval only - Rome has no campaign database, and both rows refuse there.
::game.displayDb <- {
    // Set the army strength bar's scale-switch point.
    // @param limit : integer - New limit.
    // @return bool - True when the write happened.
    function setSoldierBarLimit(limit) {}
    // Set the soldiers-per-strength-bar-level count.
    // @param scale : integer - New value.
    // @return bool - True when the write happened.
    function setSoldierBarScale(scale) {}
    // Soldier count above which the army strength bar switches scale.
    // @return integer - The limit.
    function soldierBarLimit() {}
    // Soldiers per army-strength-bar level. Setting it absurdly high is how mods hide the strength display entirely.
    // @return integer - Soldiers per level.
    function soldierBarScale() {}
}

// Extra .cas models on the campaign map, unit sprites and banner symbols.
::game.models <- {
    // Register a .cas strategy-map model under a number of your choosing, for `setOnTile` and `drawAt` to use later. Registering the same number twice replaces it. The file is not read until something draws it, so this is safe before the map is up. `isSettlement` makes the model composite with alpha and be clickable, which is what a settlement needs.
    // @param path : string - Path from the mod folder.
    // @param modelId : integer - The number to use it by later.
    // @param isSettlement : bool - True for anything standing in for a settlement.
    // @return bool - True when the id was registered.
    function add(path, modelId, isSettlement) {}
    // Register a banner symbol - a rectangle of a .tga - under a name, for a rebel faction's `bannerSymbol` to name later. The four coordinates are fractions of the picture, 0 to 1. The two calls may come in either order: a symbol name is resolved when a standard is drawn, not when it is set.
    // @param name : string - The name to register it under.
    // @param filePath : string - Path to the tga, from the game folder.
    // @param topLeftX : float - Left edge, as a fraction of the width.
    // @param topLeftY : float - Top edge, as a fraction of the height.
    // @param bottomRightX : float - Right edge, as a fraction of the width.
    // @param bottomRightY : float - Bottom edge, as a fraction of the height.
    // @return bool - True when the texture loaded and the name was registered.
    function addBanner(name, filePath, topLeftX, topLeftY, bottomRightX, bottomRightY) {}
    // Register a campaign-map character model - a general, an agent - under a name that descr_character.txt or `character:setCharacterModel` can then use.
    // @param skeletonName : string - Strat animation set, e.g. "strat_named_with_army".
    // @param casPath : string - Path to the model .cas.
    // @param shadowCasPath : string - Path to the shadow .cas.
    // @param typeName : string - The name to register the model under.
    // @param texturePath : string - Path to the .tga.
    // @param scale : float - Model scale; must be positive.
    // @return bool - True when everything loaded and the name was free.
    function addCharacter(skeletonName, casPath, shadowCasPath, typeName, texturePath, scale) {}
    // Does a battle model of this name exist - a `type` out of descr_model_battle, not one of the strategy models above.
    // @param modelName : string - Battle model name.
    // @return bool - True when the model database has it.
    function battleModelExists(modelName) {}
    // Drop the model override on a tile.
    // @param x : integer - Tile x.
    // @param y : integer - Tile y.
    // @return bool - True when there was one.
    function clearOnTile(x, y) {}
    // Draw a registered model at a tile with nothing behind it - no object, no selection, no fog of war. Calling it again with the same number at another tile draws it in both places.
    // @param modelId : integer - The registered number.
    // @param x : integer - Tile x.
    // @param y : integer - Tile y.
    // @param scale : float - Uniform scale; 1.0 is the model's own size.
    // @return bool - True when the model id and the tile are both valid.
    function drawAt(modelId, x, y, scale) {}
    // Is a model registered under this number.
    // @param modelId : integer - The number.
    // @return bool - True when it is.
    function exists(modelId) {}
    // Render the unit sprite sheet for one battle model. Refuses a model the database does not have and a model marked `no_sprites`; Rome has no sprite generator and always refuses.
    // @param modelName : string - Battle model name.
    // @return bool - True when the sprites were generated.
    function generateSprite(modelName) {}
    // Point a strategy tile at a different custom battle map, and it wins over a custom_tiles_db.txt entry for the same tile. The filename is relative to the campaign's `custom_tiles` folder. Not saved, so re-apply it after loading. Rome custom tiles carry only the map file, so weather and daytime are ignored there.
    // @param label : string - A name for the entry; must not be empty.
    // @param x : integer - Tile x.
    // @param y : integer - Tile y.
    // @param fileName : string - Battle map file, e.g. "hornburg_amb.wfc".
    // @param weather : string - Weather pattern name, e.g. "clear".
    // @param dayTime : string - sunrise, morning, midday, afternoon, sunset or night.
    // @return bool - True when the tile and the filename are both valid.
    function replaceBattleMap(label, x, y, fileName, weather, dayTime) {}
    // Put a registered model on whatever stands on a tile - a settlement, a fort and its walls, a port and its dock, a watchtower or a resource. Pass the same number twice when the object has only one model. The override is remembered against the tile, so it survives a settlement upgrade and a load - but it is not saved, so re-apply it after loading.
    // @param x : integer - Tile x.
    // @param y : integer - Tile y.
    // @param modelId : integer - Main model.
    // @param secondModelId : integer - Fort wall or port dock model.
    // @return bool - True when the tile and the model id are both valid.
    function setOnTile(x, y, modelId, secondModelId) {}
    // Take down every model drawn under this number, at every tile.
    // @param modelId : integer - The registered number.
    // @return bool - True when something was being drawn.
    function stopDrawing(modelId) {}
}

// The preferences a script has any business touching. Deliberately short - the graphics and hotseat settings no campaign script has a reason to write are not here.
::game.options <- {
    // Is end-of-turn autosave on.
    // @return bool - True when on.
    function autosave() {}
    // Battle difficulty level.
    // @return integer - The level.
    function battleDifficulty() {}
    // Campaign difficulty level.
    // @return integer - The level.
    function campaignDifficulty() {}
    // Campaign-map game speed multiplier.
    // @return integer - The multiplier.
    function campaignSpeed() {}
    // Are historic events suppressed.
    // @return bool - True when suppressed.
    function disableEvents() {}
    // Is fog of war on.
    // @return bool - True when on.
    function fogOfWar() {}
    // Soldier cap for a battle.
    // @return integer - The cap.
    function maxSoldiersOnBattlefield() {}
    // Turn end-of-turn autosave on or off.
    // @param enabled : bool - New state.
    // @return bool - True when the write happened.
    function setAutosave(enabled) {}
    // Set the battle difficulty level.
    // @param level : integer - The level.
    // @return bool - True when the write happened.
    function setBattleDifficulty(level) {}
    // Set the campaign difficulty level.
    // @param level : integer - The level.
    // @return bool - True when the write happened.
    function setCampaignDifficulty(level) {}
    // Set the campaign-map game speed multiplier. 0 or less is refused: it hangs the campaign map, and the engine's next preference pass would rewrite it anyway.
    // @param speed : integer - Multiplier, greater than 0.
    // @return bool - True when the write happened.
    function setCampaignSpeed(speed) {}
    // Suppress or allow historic events.
    // @param disabled : bool - New state.
    // @return bool - True when the write happened.
    function setDisableEvents(disabled) {}
    // Turn fog of war on or off.
    // @param enabled : bool - New state.
    // @return bool - True when the write happened.
    function setFogOfWar(enabled) {}
    // Set the soldier cap for a battle.
    // @param cap : integer - New cap.
    // @return bool - True when the write happened.
    function setMaxSoldiersOnBattlefield(cap) {}
    // Set whether the camera follows AI factions.
    // @param mode : integer - 0 follow, 1 skip.
    // @return bool - True when the write happened.
    function setSkipAiFactions(mode) {}
    // Set the unit size bucket.
    // @param bucket : integer - Bucket ordinal.
    // @return bool - True when the write happened.
    function setUnitSize(bucket) {}
    // Does the camera follow AI factions on their turn: 0 follow, 1 skip.
    // @return integer - The mode.
    function skipAiFactions() {}
    // Unit size bucket: small, normal, large, huge.
    // @return integer - The bucket ordinal.
    function unitSize() {}
}

// Script-created strategy-map overlays. An overlay is one colour per map TILE; `makeTexture` is what turns it into something drawable.
::mapImages <- {
    // Create an overlay sized to the strategy map that is currently open.
    // @return MapImage|null - null when no campaign is running, or when 256 overlays are already live and none has been released.
    function create() {}
    // How many overlays exist right now. A leak check: this should be a small constant, not a number that climbs with the turn counter.
    // @return integer
    function liveCount() {}
}

// Text drawn on the strategy map, anchored to a tile and sized in map tiles so it scales with the camera. Nothing draws outside the campaign map.
::mapText <- {
    // How many map text objects exist right now, drawn or not.
    // @return integer
    function count() {}
    // Create a line of map text. Nothing draws until `show` or `showOnce`.
    // @param font : MapTextFont - A font handle. Null is accepted.
    // @param text : string - UTF-8 text.
    // @return MapText - The new object.
    function create(font, text) {}
    // Record a font request. ⚠ The request is ignored; see the class note.
    // @param name : string - Font family name.
    // @param weight : integer - GDI weight, e.g. 400 normal, 700 bold. Recorded only.
    // @param italic : bool - Recorded only.
    // @return MapTextFont - The handle.
    function createFont(name, weight, italic) {}
    // The family name the font was created with.
    // @param font : MapTextFont - The handle.
    // @return string|null
    function fontName(font) {}
    // Stop drawing. The object stays alive.
    // @param text : MapText - The handle.
    // @return bool
    function hide(text) {}
    // Whether the text is currently being drawn.
    // @param text : MapText - The handle.
    // @return bool
    function isShown(text) {}
    // Destroy the text. The handle reads null afterwards.
    // @param text : MapText - The handle.
    // @return bool
    function release(text) {}
    // Release a font handle. Text made with it keeps drawing.
    // @param font : MapTextFont - The handle.
    // @return bool
    function releaseFont(font) {}
    // Multiply the current size. ⚠ CUMULATIVE - two calls compound, they do not replace each other.
    // @param text : MapText - The handle.
    // @param factor : float - Must be greater than zero.
    // @return bool
    function scale(text, factor) {}
    // Set the colour. Channels are 0-255 and are clamped. ⚠ Note the argument order: ALPHA FIRST.
    // @param text : MapText - The handle.
    // @param a : integer - Alpha.
    // @param r : integer - Red.
    // @param g : integer - Green.
    // @param b : integer - Blue.
    // @return bool
    function setColour(text, a, r, g, b) {}
    // Place the text. x and y are map tiles (fractional is fine); z is a height above the ground under that tile, also in map tiles.
    // @param text : MapText - The handle.
    // @param x : float - Map tile x.
    // @param y : float - Map tile y.
    // @param z : float - Height above the ground.
    // @return bool
    function setCoords(text, x, y, z) {}
    // Set the em height of the text in map tiles, absolutely. The drawn size is this times whatever `scale` has accumulated, so use one or the other.
    // @param text : MapText - The handle.
    // @param size : float - Em height in map tiles. 1.0 is one tile.
    // @return bool
    function setSize(text, size) {}
    // Draw every frame until `hide`.
    // @param text : MapText - The handle.
    // @return bool
    function show(text) {}
    // Draw for exactly one frame. For calling from a per-frame handler.
    // @param text : MapText - The handle.
    // @return bool
    function showOnce(text) {}
    // The string the object was created with.
    // @param text : MapText - The handle.
    // @return string|null
    function text(text) {}
}

// The descr_mount database: one record per horse, camel, elephant, chariot or scorpion cart the data files declare. Process-lifetime, not campaign state - an edit is NOT saved and has to be re-applied after a load.
::mounts <- {
    // A mount record by index.
    // @param index : integer - 0-based record index.
    // @return Mount|null - The record, or null.
    function at(index) {}
    // A mount record by its internal name.
    // @param name : string - As spelled in descr_mount.txt.
    // @return Mount|null - The record, or null when undeclared.
    function byName(name) {}
    // How many mount records descr_mount.txt declares.
    // @return integer - Record count; 0 before load.
    function count() {}
    // The mount a unit type rides.
    // @param type : UnitType - The unit type.
    // @return Mount|null - The record, or null when it rides none.
    function ofUnitType(type) {}
}

// The rebel factions database - who revolts where, with what, and what it looks like. Everything here edits the LIVE database: an edit applies immediately and is NOT saved, so a script that changes it re-applies from its own state on load. Writes run functional checks only: they refuse what would corrupt the engine (an unknown unit type, a count past the array, a duplicate name) and allow everything a player merely could not do.
::rebels <- {
    // Add a strategy-map model this faction's generals may use. Every rebel general of this faction already on the map is re-stamped immediately; which model a given general gets is a hash of his own id, so it is stable for his lifetime.
    // @param style : RebelFactionStyle
    // @param modelName : string
    // @return bool - False for an empty name.
    function addCharacterModel(style, modelName) {}
    // A rebel faction by record index.
    // @param index : integer
    // @return RebelFaction|null
    function at(index) {}
    // The banner colour override packed as 0xRRGGBB, or -1 when the faction has none and its stacks fly the slave faction's colour.
    // @param style : RebelFactionStyle
    // @return integer
    function bannerColour(style) {}
    // Whether the banner colour override is in use.
    // @param style : RebelFactionStyle
    // @return bool
    function bannerEnabled(style) {}
    // The banner symbol name last set, or empty.
    // @param style : RebelFactionStyle
    // @return string
    function bannerSymbol(style) {}
    // A rebel faction by its internal name.
    // @param name : string
    // @return RebelFaction|null
    function byName(name) {}
    // The rebel category: 0 brigands, 1 pirates, 2 peasant revolts, 3 gladiator revolt.
    // @param faction : RebelFaction
    // @return integer
    function category(faction) {}
    // One unit row of a bucket.
    // @param category : RebelUnitCategory
    // @param index : integer
    // @return RebelUnit|null
    function categoryUnitAt(category, index) {}
    // How many unit rows a bucket holds.
    // @param category : RebelUnitCategory
    // @return integer
    function categoryUnitCount(category) {}
    // The weight in the per-region rebel-type roll.
    // @param faction : RebelFaction
    // @return integer
    function chance(faction) {}
    // One character model by position.
    // @param style : RebelFactionStyle
    // @param index : integer
    // @return string
    function characterModelAt(style, index) {}
    // How many character models this faction has been given.
    // @param style : RebelFactionStyle
    // @return integer
    function characterModelCount(style) {}
    // Drop every character model. `addCharacterModel` appends, so a setup that runs twice would otherwise list each model twice.
    // @param style : RebelFactionStyle
    // @return bool
    function clearCharacterModels(style) {}
    // How many rebel factions the database holds.
    // @return integer
    function count() {}
    // The localised name the player sees on a stack of these rebels. Read-only - it comes from the rebel_faction_descr string table.
    // @param faction : RebelFaction
    // @return string
    function displayName(faction) {}
    // The record index. Read-only: saves store it and read it back as an array subscript.
    // @param faction : RebelFaction
    // @return integer
    function index(faction) {}
    // The internal name from descr_rebel_factions.txt.
    // @param faction : RebelFaction
    // @return string
    function name(faction) {}
    // Set the banner colour and switch the override on. Shows on the next frame - the standard reads it at draw time. An army that sets its own banner colour still wins over this.
    // @param style : RebelFactionStyle
    // @param red : integer - 0-255.
    // @param green : integer - 0-255.
    // @param blue : integer - 0-255.
    // @return bool - False when a channel is out of range.
    function setBannerColour(style, red, green, blue) {}
    // Switch the banner colour override on or off without changing the channels.
    // @param style : RebelFactionStyle
    // @param enabled : bool
    // @return bool
    function setBannerEnabled(style, enabled) {}
    // Name the symbol shown on this faction's standards. ⚠ Stored and readable, but the symbol does not change yet: a rebel stack still flies its culture's rebel standard.
    // @param style : RebelFactionStyle
    // @param bannerName : string
    // @return bool
    function setBannerSymbol(style, bannerName) {}
    // Set the rebel category.
    // @param faction : RebelFaction
    // @param category : integer - 0-3.
    // @return bool - False when out of range.
    function setCategory(faction, category) {}
    // Set how many rows of a bucket are live. Clamped to the engine's 20-slot array, because every consumer subscripts it with this; recomputes the record's total.
    // @param category : RebelUnitCategory
    // @param count : integer - 0-20.
    // @return bool
    function setCategoryUnitCount(category, count) {}
    // Set the spawn weight. Negative values are refused - they corrupt the running total the roll divides by.
    // @param faction : RebelFaction
    // @param chance : integer - 0 or more.
    // @return bool
    function setChance(faction, chance) {}
    // Rename the record. Re-keys every map region that named the old spelling - regions point at their rebel faction by name. Refused for an empty or duplicate name.
    // @param faction : RebelFaction
    // @param name : string
    // @return bool - False when the name is empty or already taken.
    function setName(faction, name) {}
    // Set the armour upgrade level.
    // @param unit : RebelUnit
    // @param level : integer
    // @return bool
    function setUnitArmour(unit, level) {}
    // Set the row's tag. Does not move the row between buckets - the bucket is half of the row's address.
    // @param unit : RebelUnit
    // @param category : integer
    // @return bool
    function setUnitCategory(unit, category) {}
    // Set the starting experience.
    // @param unit : RebelUnit
    // @param experience : integer
    // @return bool
    function setUnitExperience(unit, experience) {}
    // Point the row at a different unit type. Refused for a name the unit database does not have: the revolt path indexes the lookup result without checking it.
    // @param unit : RebelUnit
    // @param name : string
    // @return bool
    function setUnitName(unit, name) {}
    // Set the men count. -1 restores the unit type's own size.
    // @param unit : RebelUnit
    // @param count : integer - -1, or 0-500.
    // @return bool
    function setUnitSoldierCount(unit, count) {}
    // Set the weapon upgrade level.
    // @param unit : RebelUnit
    // @param level : integer
    // @return bool
    function setUnitWeapon(unit, level) {}
    // The look attached to the rebel faction with this name. The house spelling of `M2TWEOP.getRebelFaction`.
    // @param name : string
    // @return RebelFactionStyle|null
    function styleByName(name) {}
    // The look attached to a rebel faction.
    // @param faction : RebelFaction
    // @return RebelFactionStyle|null
    function styleOf(faction) {}
    // The record a look belongs to.
    // @param style : RebelFactionStyle
    // @return RebelFaction|null
    function styleRecord(style) {}
    // How many unit types this faction declares across all six buckets. Derived and read-only; it is recomputed whenever a bucket changes.
    // @param faction : RebelFaction
    // @return integer
    function totalUnitCount(faction) {}
    // The armour upgrade level the raised unit starts with.
    // @param unit : RebelUnit
    // @return integer
    function unitArmour(unit) {}
    // The row's UNIT_CATEGORY tag.
    // @param unit : RebelUnit
    // @return integer
    function unitCategory(unit) {}
    // One of the six unit-category buckets.
    // @param faction : RebelFaction
    // @param category : integer - 0-5.
    // @return RebelUnitCategory|null
    function unitCategoryAt(faction, category) {}
    // The experience the raised unit starts with, from the `exp` token in descr_rebel_factions.
    // @param unit : RebelUnit
    // @return integer
    function unitExperience(unit) {}
    // The unit type this row raises.
    // @param unit : RebelUnit
    // @return string
    function unitName(unit) {}
    // How many men the row raises, or -1 for the unit type's own size.
    // @param unit : RebelUnit
    // @return integer
    function unitSoldierCount(unit) {}
    // The weapon upgrade level the raised unit starts with.
    // @param unit : RebelUnit
    // @return integer
    function unitWeapon(unit) {}
}

// Information about the engine and the scripting API itself. Available in every phase, before any game exists.
::scripting <- {
    // The scripting API version this build presents. Bumped when a published name changes meaning, never for additions.
    // @return integer - Monotonically increasing API version.
    function apiVersion() {}
    // The build identifier of the running engine. Free-form; useful in a bug report, not something to parse.
    // @return string - Build watermark, e.g. "development x64 a1b2c3d".
    function engineVersion() {}
    // Which game this is. A mod that supports both has to branch somewhere; branch on this rather than on whether some accessor happens to exist.
    // @return string - "medieval2" or "romans".
    function port() {}
}

// Script-loaded sound effects, played on the game's own channel pool so they obey the volume sliders and stop with everything else. WAV always; OGG/Vorbis and MP3 when the matching Miles ASI decoder is present, which it is in a stock install. No FLAC - there is no decoder for it.
::sound <- {
    // Load a sound file. The path goes through the VFS, so a sound inside a mounted .pack works as well as a loose file.
    // @param path : string - Path to the sound file.
    // @return Sound|null - The handle, or null if the file is missing or undecodable.
    function create(path) {}
    // Whether a channel is currently playing this sound.
    // @param sound : Sound - The handle.
    // @return bool
    function isPlaying(sound) {}
    // Whether the next `play` will loop.
    // @param sound : Sound - The handle.
    // @return bool
    function looping(sound) {}
    // The path the sound was loaded from, for a diagnostic.
    // @param sound : Sound - The handle.
    // @return string|null
    function path(sound) {}
    // Hold the position; `play` resumes from it.
    // @param sound : Sound - The handle.
    // @return bool - True if something was playing.
    function pause(sound) {}
    // Start it, or resume it if it was paused. False when sound is off in the options, a loading screen is up, or the channel pool is full.
    // @param sound : Sound - The handle.
    // @return bool - True if a channel started or resumed.
    function play(sound) {}
    // Current playing position in milliseconds, or null when nothing is playing.
    // @param sound : Sound - The handle.
    // @return integer|null - Milliseconds from the start.
    function positionMs(sound) {}
    // Stop it and free it. The handle reads null afterwards.
    // @param sound : Sound - The handle.
    // @return bool - True if there was a sound to release.
    function release(sound) {}
    // Seek. Only works while the sound is playing - there is nothing to seek before the channel launches.
    // @param sound : Sound - The handle.
    // @param milliseconds : integer - New position from the start. Negative is refused.
    // @return bool - True if the seek happened.
    function seek(sound, milliseconds) {}
    // Set whether the sound loops. Looping is latched by the channel when playback starts, so this takes effect on the NEXT `play`, not on one already running.
    // @param sound : Sound - The handle.
    // @param looping : bool
    // @return bool - True if the sound is alive.
    function setLooping(sound, looping) {}
    // Volume of the live channel, 0.0 silent to 1.0 the volume the options give it. Applies to the current playback only; a fresh `play` starts at full again.
    // @param sound : Sound - The handle.
    // @param volume : float - 0.0 to 1.0. Clamped.
    // @return bool - True if a channel was there to set.
    function setVolume(sound, volume) {}
    // Stop and rewind. The handle stays usable.
    // @param sound : Sound - The handle.
    // @return bool - True if something was playing.
    function stop(sound) {}
}

// The strategy map: its dimensions and the roots of everything on it. A table rather than an object, because there is only ever one map and Squirrel table slots cannot be live fields.
::stratMap <- {
    // Find a region by its descr_regions name.
    // @param name : string
    // @return Region|null
    function findRegion(name) {}
    // Find a settlement by its internal name. Walks the regions - a setup-time call, not a per-frame one.
    // @param name : string
    // @return Settlement|null
    function findSettlement(name) {}
    // Find a tile at or near a position a character of the given type can stand on. Medieval II only.
    // @param x : integer
    // @param y : integer
    // @param characterType : integer
    // @return table|null - a {x, y} table, or null.
    function findValidTileNear(x, y, characterType) {}
    // Map height in tiles.
    // @return integer
    function height() {}
    // Whether a coordinate pair is on the map.
    // @param x : integer
    // @param y : integer
    // @return bool
    function isInBounds(x, y) {}
    // Whether a campaign map is open.
    // @return bool
    function isLoaded() {}
    // Snap the strategy camera to a tile.
    // @param x : integer
    // @param y : integer
    // @return bool
    function jumpCamera(x, y) {}
    // A sea ford's coordinates. Medieval II only.
    // @param index : integer
    // @return table|null - null when out of range or in Rome.
    function landConnection(index) {}
    // How many cross-water land connections (sea fords). 0 in Rome.
    // @return integer
    function landConnectionCount() {}
    // A land mass by index.
    // @param index : integer
    // @return LandMass|null
    function landMass(index) {}
    // How many continents and islands.
    // @return integer
    function landMassCount() {}
    // Slide the strategy camera to a tile.
    // @param x : integer
    // @param y : integer
    // @return bool
    function moveCamera(x, y) {}
    // The route the campaign pathfinder would walk between two tiles, without moving anything. Zones of control are ignored. One A* flood over the tile grid - fine in a handler or a setup pass, far too expensive per frame.
    // @param fromX : integer
    // @param fromY : integer
    // @param destX : integer
    // @param destY : integer
    // @param characterType : integer - movement class; -1 for any land mover. The naval class routes over water.
    // @param factionId : integer - whose passability applies to settlements, docks and occupied tiles; -1 for terrain only.
    // @return table|null - `{ cost, tiles }` - `tiles` is a one-based array of `{x, y}` from the starting tile to the destination. Null when a coordinate is off the map or no route exists.
    function movePath(fromX, fromY, destX, destY, characterType, factionId) {}
    // Recompute every region's frontier tile lists. Expensive - it walks the whole map.
    // @return bool
    function rebuildFrontiers() {}
    // A region by id.
    // @param id : integer
    // @return Region|null - null when out of range.
    function region(id) {}
    // How many regions.
    // @return integer
    function regionCount() {}
    // Set the movement-extents colour for enemy armies. Shipped yellow is (255, 255, 0).
    // @param red : integer - 0-255.
    // @param green : integer - 0-255.
    // @param blue : integer - 0-255.
    // @param alpha : integer - interior alpha 0-255; negative leaves it.
    // @param borderAlpha : integer - rim alpha 0-255; negative leaves it.
    // @return bool - false when a colour channel is out of range.
    function setEnemyExtentsColour(red, green, blue, alpha, borderAlpha) {}
    // Set the movement-extents colour for your own armies. Shipped green is (0, 255, 32). A negative alpha leaves that alpha alone. Not saved.
    // @param red : integer - 0-255.
    // @param green : integer - 0-255.
    // @param blue : integer - 0-255.
    // @param alpha : integer - interior alpha 0-255; negative leaves it.
    // @param borderAlpha : integer - rim alpha 0-255; negative leaves it.
    // @return bool - false when a colour channel is out of range.
    function setOwnExtentsColour(red, green, blue, alpha, borderAlpha) {}
    // Set the zone-of-control colour. Shipped crimson is (190, 35, 30). `alpha` is the stamp weight, not a rim alpha; negative keeps the engine's own.
    // @param red : integer - 0-255.
    // @param green : integer - 0-255.
    // @param blue : integer - 0-255.
    // @param alpha : integer - stamp weight 0-255; negative keeps the default.
    // @return bool - false when a colour channel is out of range.
    function setZocColour(red, green, blue, alpha) {}
    // A tile by coordinates.
    // @param x : integer
    // @param y : integer
    // @return Tile|null - null when off the map.
    function tile(x, y) {}
    // A volcano's coordinates, as a {x, y} table.
    // @param index : integer
    // @return table|null - null when out of range.
    function volcano(index) {}
    // How many volcanoes.
    // @return integer
    function volcanoCount() {}
    // Map width in tiles.
    // @return integer
    function width() {}
    // Set the strategy camera zoom.
    // @param distance : float
    // @return bool
    function zoomCamera(distance) {}
}

// The game's own UI: find an element, ask what is selected. This reads and pokes the UI the layout files built - it cannot create any. See the ImGui surface for that.
::ui <- {
    // The building info scroll, or null while it is closed.
    // @return BuildingInfoScroll|null - The scroll, or null.
    function buildingScroll() {}
    // The card manager. Always present, in battle and on the campaign map.
    // @return UiCardManager - The card manager.
    function cardManager() {}
    // Find a UI element by name. The element must be OPEN - a name that belongs to a scroll nobody has opened reads null.
    // @param name : string - The layout's name, e.g. "finance_scroll".
    // @return UiElement|null - The element, or null.
    function element(name) {}
    // The family tree the family scroll draws. Unlike the info scrolls, this answers whether or not the scroll is open - the tree reports being shut by having no `root` - so it is safe to fetch once and keep. Null only when there is no campaign UI at all.
    // @return FamilyTree|null - The tree, or null outside the campaign map.
    function familyTree() {}
    // The settlement info scroll, or null while it is closed.
    // @return SettlementInfoScroll|null - The scroll, or null.
    function settlementScroll() {}
    // The unit info scroll, or null while it is closed.
    // @return UnitInfoScroll|null - The scroll, or null.
    function unitScroll() {}
}

// The unit-type registry: look records up, and create new ones. A created type is a real export_descr_unit record appended to the table, so the buildings database, descr_strat and the recruitment pools see it with no translation. Create types from the unitDbParsed hook - after the last record is read and before anything derived from the table has run.
::units <- {
    // Look a unit type up by record index.
    // @param index : integer
    // @return UnitType|null
    function at(index) {}
    // Clone an existing type under the name "<base>_<key>".
    // @param baseIndex : integer - Record index of the type to copy.
    // @param key : integer - A number that identifies the new type to your script.
    // @return UnitType|null - Null when the base does not exist or the key is taken.
    function clone(baseIndex, key) {}
    // How many unit types the database holds.
    // @return integer
    function count() {}
    // Create a type from a text file holding ONE export_descr_unit record.
    // @param path : string
    // @param key : integer
    // @return UnitType|null
    function createFromFile(path, key) {}
    // The first type a faction owns that is flagged as a bodyguard.
    // @param factionId : integer
    // @param upgraded : bool - True for the post-reform bodyguard.
    // @return UnitType|null
    function generalUnit(factionId, upgraded) {}
    // Look a unit type up by its export_descr_unit name.
    // @param name : string
    // @return UnitType|null
    function get(name) {}
    // The record index of a unit type by name; -1 when unknown.
    // @param name : string
    // @return integer
    function indexOf(name) {}
}

// The traits and ancillaries databases (export_descr_character_traits.txt and export_descr_ancillaries.txt). Process-lifetime records, not campaign state: an edit through one of these is NOT saved and has to be re-applied after a load.
::vnv <- {
    // An ancillary record by its internal name.
    // @param name : string - The ancillary name.
    // @return Ancillary|null - The record, or null.
    function ancillary(name) {}
    // An ancillary record by index.
    // @param index : integer - 0-based DB index.
    // @return Ancillary|null - The record, or null.
    function ancillaryAt(index) {}
    // How many ancillary records the data files declare.
    // @return integer - Record count.
    function ancillaryCount() {}
    // A trait record by its internal name.
    // @param name : string - The trait name.
    // @return TraitType|null - The record, or null.
    function trait(name) {}
    // A trait record by index.
    // @param index : integer - 0-based DB index.
    // @return TraitType|null - The record, or null.
    function traitAt(index) {}
    // How many trait records the data files declare.
    // @return integer - Record count.
    function traitCount() {}
}

