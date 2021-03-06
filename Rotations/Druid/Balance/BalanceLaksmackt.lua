local rotationName = "Laksmackt" -- Change to name of profile listed in options drop down

---------------
--- Toggles ---
---------------
local function createToggles()
    -- Define custom toggles
    -- Rotation Button
    RotationModes = {
        [1] = { mode = "Auto", value = 1, overlay = "Automatic Rotation", tip = "Swaps between Single and Multiple based on number of enemies in range.", highlight = 1, icon = br.player.spell.moonfire },
        [2] = { mode = "Mult", value = 2, overlay = "Multi Target rotation", tip = "Multi Target rotation", highlight = 1, icon = br.player.spell.starfall },
        [3] = { mode = "Sing", value = 3, overlay = "Force single target", tip = "Force single target", highlight = 0, icon = br.player.spell.wrath },
        [4] = { mode = "Off", value = 4, overlay = "DPS Rotation Disabled", tip = "Disable DPS Rotation", highlight = 0, icon = br.player.spell.soothe }
    };
    CreateButton("Rotation", 1, 0)

    -- Cooldown Button
    CooldownModes = {
        [1] = { mode = "Auto", value = 1, overlay = "Cooldowns Automated", tip = "Automatic Cooldowns - Boss Detection.", highlight = 1, icon = br.player.spell.celestialAlignment },
        [2] = { mode = "On", value = 2, overlay = "Cooldowns Enabled", tip = "Cooldowns used regardless of target.", highlight = 1, icon = br.player.spell.celestialAlignment },
        [3] = { mode = "Off", value = 3, overlay = "Cooldowns Disabled", tip = "No Cooldowns will be used.", highlight = 0, icon = br.player.spell.celestialAlignment }
    };
    CreateButton("Cooldown", 2, 0)

    -- Defensive Button
    DefensiveModes = {
        [1] = { mode = "On", value = 1, overlay = "Defensive Enabled", tip = "Includes Defensive Cooldowns.", highlight = 1, icon = br.player.spell.barkskin },
        [2] = { mode = "Off", value = 2, overlay = "Defensive Disabled", tip = "No Defensives will be used.", highlight = 0, icon = br.player.spell.barkskin }
    };
    CreateButton("Defensive", 3, 0)

    -- Interrupt Button
    InterruptModes = {
        [1] = { mode = "On", value = 1, overlay = "Interrupts Enabled", tip = "Includes Basic Interrupts.", highlight = 1, icon = br.player.spell.solarBeam },
        [2] = { mode = "Off", value = 2, overlay = "Interrupts Disabled", tip = "No Interrupts will be used.", highlight = 0, icon = br.player.spell.solarBeam }
    };
    CreateButton("Interrupt", 4, 0)

    -- FoN Button
    ForceofNatureModes = {
        [1] = { mode = "On", value = 1, overlay = "Force of Nature Enabled", tip = "Will Use Force of Nature", highlight = 0, icon = br.player.spell.forceOfNature },
        [2] = { mode = "Key", value = 2, overlay = "Force of Nature hotkey", tip = "Key triggers Force of Nature", highlight = 0, icon = br.player.spell.forceOfNature },
        [3] = { mode = "Off", value = 2, overlay = "Force of Nature Disabled", tip = "Will Not Use Force of Nature", highlight = 0, icon = br.player.spell.forceOfNature }
    };
    CreateButton("ForceofNature", 5, 0)

    FormsModes = {
        [1] = { mode = "On", value = 1, overlay = "Auto Forms Enabled", tip = "Will change forms", highlight = 0, icon = br.player.spell.travelForm },
        [2] = { mode = "Key", value = 2, overlay = "Auto Forms hotkey", tip = "Key triggers Auto Forms", highlight = 0, icon = br.player.spell.travelForm },
        [3] = { mode = "Off", value = 3, overlay = "Auto Forms Disabled", tip = "Will Not change forms", highlight = 0, icon = br.player.spell.travelForm }
    };
    CreateButton("Forms", 6, 0)


    --[[
    --pots
    PotsModes = {
        [1] = { mode = "On", value = 1, overlay = "Auto Pots Enabled", tip = "Auto Pots Enabled", highlight = 0, icon = 197524 },
        [2] = { mode = "Off", value = 2, overlay = "Auto Pots Disabled", tip = "Auto Pots Disabled", highlight = 0, icon = 197524 },
    };
    CreateButton("Pots", 7, 0)
]]
end
---------------
--- OPTIONS ---
---------------
local function createOptions()
    local optionTable

    local function rotationOptions()
        -----------------------
        --- GENERAL OPTIONS --- -- Define General Options
        -----------------------
        section = br.ui:createSection(br.ui.window.profile, "Forms - 202010150806")
        br.ui:createDropdownWithout(section, "Cat Key", br.dropOptions.Toggle, 6, "Set a key for cat")
        br.ui:createDropdownWithout(section, "Bear Key", br.dropOptions.Toggle, 6, "Set a key for bear")
        br.ui:createDropdownWithout(section, "Travel Key", br.dropOptions.Toggle, 6, "Set a key for travel")
        br.ui:createDropdown(section, "Treants Key", br.dropOptions.Toggle, 6, "", "Treant Key")
        br.ui:createCheckbox(section, "Cat Charge", "Use Wild Charge to close distance.", 1)
        br.ui:createCheckbox(section, "auto stealth", 1)
        br.ui:createCheckbox(section, "auto dash", 1)
        br.ui:createSpinner(section, "Bear Frenzies Regen HP", 50, 0, 100, 1, "HP Threshold start regen")
        br.ui:createSpinner(section, "Standing Time", 2.5, 0.5, 10, 0.5, "How long you will stand still before changing to owl - in seconds")
        br.ui:checkSectionState(section)
        section = br.ui:createSection(br.ui.window.profile, "General")
        br.ui:createSpinner(section, "Pre-Pull Timer", 2.5, 0, 10, 0.5, "Set to desired time to start Pre-Pull (DBM Required). Min: 1 / Max: 10 / Interval: 1")

        br.ui:createSpinner(section, "OOC Regrowth", 50, 1, 100, 5, "Set health to heal while out of combat. Min: 1 / Max: 100 / Interval: 5")
        if br.player.talent.restorationAffinity then
            br.ui:createSpinner(section, "OOC Wild Growth", 50, 1, 100, 5, "Set health to heal while out of combat. Min: 1 / Max: 100 / Interval: 5")
        end
        br.ui:createCheckbox(section, "Auto Soothe")
        br.ui:createCheckbox(section, "Auto Engage On Target", "Check this to cast sunfire on target OOC to engage combat")
        br.ui:checkSectionState(section)
        section = br.ui:createSection(br.ui.window.profile, "Healing")
        br.ui:createDropdown(section, "Rebirth", { "Tanks", "Healers", "Tanks and Healers", "Mouseover Target", "Any" }, 3, "", "Target to Cast On")
        br.ui:createDropdown(section, "Revive", { "Target", "mouseover" }, 1, "", "Target to Cast On")
        br.ui:createDropdown(section, "Remove Corruption", { "Player Only", "Selected Target", "Player and Target", "Mouseover Target", "Any" }, 3, "", "Target to Cast On")
        br.ui:createDropdown(section, "Off-healing", { "Nope", "always", "No-Healer" }, 1, "", "offheal")

        br.ui:checkSectionState(section)

        ------------------------
        --- COOLDOWN OPTIONS --- -- Define Cooldown Options
        ------------------------
        section = br.ui:createSection(br.ui.window.profile, "M+")
        br.ui:createCheckbox(section, "Freehold - pig")
        br.ui:createCheckbox(section, "Dont DPS spotter", "wont DPS spotter", 0)
        br.ui:checkSectionState(section)

        section = br.ui:createSection(br.ui.window.profile, "Radar")
        br.ui:createCheckbox(section, "All - root the thing")
        br.ui:createCheckbox(section, "FH - root grenadier")
        br.ui:createCheckbox(section, "AD - root Spirit of Gold")
        br.ui:createCheckbox(section, "KR - root Minions of Zul")
        br.ui:createCheckbox(section, "KR - animated gold")
        br.ui:checkSectionState(section)

        ------------------------
        --- COOLDOWN OPTIONS --- -- Define Cooldown Options
        ------------------------
        section = br.ui:createSection(br.ui.window.profile, "Pots")
        br.ui:createDropdown(section, "Auto use Pots", { "Always", "Groups", "Raids", "solo", "never" }, 5, "", "when to use pots")
        br.ui:createDropdownWithout(section, "Pots - 1 target", { "None", "Battle", "RisingDeath", "Draenic", "Prolonged", "Empowered Proximity", "Focused Resolve", "Superior Battle", "Unbridled Fury" }, 1, "", "Use Pot when Incarnation/Celestial Alignment is up")
        br.ui:createDropdownWithout(section, "Pots - 2-3 targets", { "None", "Battle", "RisingDeath", "Draenic", "Prolonged", "Empowered Proximity", "Focused Resolve", "Superior Battle", "Unbridled Fury" }, 1, "", "Use Pot when Incarnation/Celestial Alignment is up")
        br.ui:createDropdownWithout(section, "Pots - 4+ target", { "None", "Battle", "RisingDeath", "Draenic", "Prolonged", "Empowered Proximity", "Focused Resolve", "Superior Battle", "Unbridled Fury" }, 1, "", "Use Pot when Incarnation/Celestial Alignment is up")
        br.ui:checkSectionState(section)
        section = br.ui:createSection(br.ui.window.profile, "Corruption")
        br.ui:createDropdownWithout(section, "Use Cloak", { "snare", "Eye", "THING", "Everything", "never" }, 5, "", "")
        br.ui:createSpinnerWithout(section, "Eye Stacks", 3, 1, 10, 1, "How many stacks before using cloak")
        br.ui:checkSectionState(section)

        section = br.ui:createSection(br.ui.window.profile, "Cooldowns")
        br.ui:createCheckbox(section, "Auto Innervate", "Use Innervate if you have Lively Spirit traits for DPS buff")
        br.ui:createCheckbox(section, "Racial")
        br.ui:createCheckbox(section, "Use Trinkets")
        br.ui:createCheckbox(section, "Warrior Of Elune")
        br.ui:createCheckbox(section, "Fury Of Elune")
        br.ui:createSpinnerWithout(section, "Fury of Elune Targets", 3, 1, 10, 1, "How many baddies before using Fury?")
        br.ui:createCheckbox(section, "Group Fury with CD")
        br.ui:createCheckbox(section, "Incarnation/Celestial Alignment")
        br.ui:createSpinnerWithout(section, "Treant Targets", 3, 1, 10, 1, "How many baddies before using Treant?")
        br.ui:createCheckbox(section, "Group treants with CD")
        br.ui:createSpinner(section, "ConcentratedFlame - Heal", 50, 0, 100, 5, "", "health to heal at")
        br.ui:createCheckbox(section, "ConcentratedFlame - DPS")
        br.ui:createCheckbox(section, "Guardian Of Azeroth")
        br.ui:createSpinner(section, "Focused Azerite Beam", 3, 1, 10, 1, "Min. units hit to use Focused Azerite Beam")
        ----
        br.ui:createCheckbox(section, "Opener")
        br.ui:checkSectionState(section)
        -------------------------
        ---  TARGET OPTIONS   ---  -- Define Target Options
        -------------------------
        section = br.ui:createSection(br.ui.window.profile, "Targets")
        br.ui:createSpinnerWithout(section, "Max Stellar Flare Targets", 2, 1, 10, 1, "Set to maximum number of targets to dot with Stellar Flare. Min: 1 / Max: 10 / Interval: 1")
        br.ui:createSpinnerWithout(section, "Max Moonfire Targets", 5, 1, 10, 1, "Set to maximum number of targets to dot with Moonfire. Min: 1 / Max: 10 / Interval: 1")
        br.ui:createSpinnerWithout(section, "Max Sunfire Targets", 10, 1, 10, 1, "Set to maximum number of targets to dot with Sunfire. Min: 1 / Max: 10 / Interval: 1")
        br.ui:createCheckbox(section, "Safe Dots")
        br.ui:createSpinnerWithout(section, "Starfall Targets (0 for auto)", 0, 0, 30, 1, "Set to minimum number of targets to use Starfall. 0 to calculate")
        br.ui:createSpinnerWithout(section, "Fury of Elune Targets", 2, 1, 10, 1, "Set to minimum number of targets to use Fury of Elune. Min: 1 / Max: 10 / Interval: 1")
        br.ui:createCheckbox(section, "Ignore dots during pewbuff")
        br.ui:checkSectionState(section)
        -------------------------
        --- DEFENSIVE OPTIONS --- -- Define Defensive Options
        -------------------------
        section = br.ui:createSection(br.ui.window.profile, "Defensive")
        br.ui:createSpinner(section, "Potion/Healthstone", 20, 0, 100, 5, "Health Percent to Cast At")
        br.ui:createSpinner(section, "Renewal", 25, 0, 100, 1, "Health Percent to Cast At")
        br.ui:createSpinner(section, "Barkskin", 60, 0, 100, 1, "Health Percent to Cast At")
        br.ui:createSpinner(section, "Regrowth", 30, 0, 100, 1, "Health Percent to Cast At")
        if br.player.talent.restorationAffinity then
            br.ui:createSpinner(section, "Swiftmend", 15, 0, 100, 1, "Health Percent to Cast At")
            br.ui:createSpinner(section, "Rejuvenation", 50, 0, 100, 1, "Health Percent to Cast At")
        end
        br.ui:checkSectionState(section)

        -------------------------
        --- INTERRUPT OPTIONS --- -- Define Interrupt Options
        -------------------------
        section = br.ui:createSection(br.ui.window.profile, "Interrupts")
        br.ui:createCheckbox(section, "Solar Beam")
        br.ui:createCheckbox(section, "Mighty Bash")
        br.ui:createCheckbox(section, "Typhoon")
        -- Interrupt Percentage
        br.ui:createSpinner(section, "InterruptAt", 0, 0, 95, 5, "Cast Percentage to use at.")
        br.ui:checkSectionState(section)

        --[[
           ----------------------
           --- TOGGLE OPTIONS --- -- Define Toggle Options
           ----------------------
           section = br.ui:createSection(br.ui.window.profile, "Toggle Keys")
           -- Single/Multi Toggle
           br.ui:createDropdown(section, "Rotation Mode", br.dropOptions.Toggle, 4)
           --Cooldown Key Toggle
           br.ui:createDropdown(section, "Cooldown Mode", br.dropOptions.Toggle, 3)
           --Defensive Key Toggle
           br.ui:createDropdown(section, "Defensive Mode", br.dropOptions.Toggle, 6)
           -- Interrupts Key Toggle
           br.ui:createDropdown(section, "Interrupt Mode", br.dropOptions.Toggle, 6)
           -- Pause Toggle
           br.ui:createDropdown(section, "Pause Mode", br.dropOptions.Toggle, 6)
           br.ui:checkSectionState(section)
       ]]
    end

    optionTable = { {
                        [1] = "Rotation Options",
                        [2] = rotationOptions,
                    } }
    return optionTable
end

local function runRotation()

    ---------------
    --- Toggles --- -- List toggles here in order to update when pressed
    ---------------
    UpdateToggle("Rotation", 0.25)
    UpdateToggle("Cooldown", 0.25)
    UpdateToggle("Defensive", 0.25)
    UpdateToggle("Interrupt", 0.25)
    UpdateToggle("ForceofNature", 0.25)
    UpdateToggle("Forms", 0.25)
    --UpdateToggle("Pots", 0.25)

    --    br.ui.player.mode.forceOfNature = br.data.settings[br.selectedSpec].toggles["ForceofNature"]
    --  br.ui.player.mode.DPS = br.data.settings[br.selectedSpec].toggles["Rotation"]
    --br.ui.player.mode.forms = br.data.settings[br.selectedSpec].toggles["Forms"]


    --------------
    --- Locals ---
    --------------

    local power = br.player.power.astralPower.amount()
    local buff = br.player.buff
    local cast = br.player.cast
    local php = br.player.health
    local spell = br.player.spell
    local talent = br.player.talent
    local cd = br.player.cd
    local charges = br.player.charges
    local debuff = br.player.debuff
    local drinking = getBuffRemain("player", 192002) ~= 0 or getBuffRemain("player", 167152) ~= 0 or getBuffRemain("player", 192001) ~= 0
    local inCombat = br.player.inCombat
    local inInstance = br.player.instance == "party" or br.player.instance == "scenario"
    local inRaid = br.player.instance == "raid"
    local solo = #br.friend == 1
    local race = br.player.race
    local traits = br.player.traits
    local moving = isMoving("player")
    local swimming = IsSwimming()
    local ttd = getTTD
    local catspeed = br.player.buff.dash.exists() or br.player.buff.tigerDash.exists()
    local norepeat
    local hasteAmount = GetHaste() / 100
    local masteryAmount = GetMastery() / 100
    local thisUnit
    local aoeTarget = 0
    local essence = br.player.essence
    local travel = br.player.buff.travelForm.exists()
    local cat = br.player.buff.catForm.exists()
    local moonkin = br.player.buff.moonkinForm.exists()
    local bear = br.player.buff.bearForm.exists()
    local eclipse_next = "any"
    local ui


    -------------
    -- Raid
    ------------

    local tanks = getTanksTable()
    local gcd = br.player.gcdMax
    -- Enemies
    -------------
    local enemies = br.player.enemies
    local mode
    local units = br.player.units
    local pewbuff = buff.incarnationChoseOfElune.exists() or buff.celestialAlignment.exists()
    local starfallRadius

    local tank
    if #tanks > 0 and inInstance then
        tank = tanks[1].unit
    else
        tank = "Player"
    end

    --wipe timers table
    if timersTable then
        wipe(timersTable)
    end
    mode = br.player.ui.mode
    enemies.get(5)

    enemies.get(8, "target") -- enemies.yards8t
    enemies.get(10, "target", true)
    enemies.get(11, "target") -- enemies.yards8t
    enemies.get(12)
    enemies.get(12, "target") -- enemies.yards12t
    enemies.get(15)
    enemies.get(15, "target") -- enemies.yards15t
    enemies.get(45)
    enemies.get(40)

    local furyUnits = 0
    if cast.able.furyOfElune() then
        for i = 1, #enemies.yards10tnc do
            thisUnit = enemies.yards10tnc[i]
            if ttd(thisUnit) > 8 then
                furyUnits = furyUnits + 1
            end
        end
    end

    local timers = {}
    timers._timers = {}
    function timers.time(name, fn)
        local time = timers._timers[name]
        if fn then
            if not time then
                time = GetTime()
            end
        else
            time = nil
        end
        timers._timers[name] = time
        return time and (GetTime() - time) or 0
    end


    --Print(tostring(mode.DPS))

    local function hasHot(unit)
        if buff.rejuvenation.exists(unit) or buff.regrowth.exists(unit) or buff.wildGrowth.exists(unit) then
            return true
        else
            return false
        end
    end

    local function count_hots(unit)
        local count = 0
        if buff.rejuvenation.exists(unit) then
            count = count + 1
        end
        if buff.regrowth.exists(unit) then
            count = count + 1
        end
        if buff.wildGrowth.exists(unit) then
            count = count + 1
        end
        return count
    end

    function getDebuffCount(spellID)
        local counter = 0
        for k, _ in pairs(br.enemy) do
            thisUnit = br.enemy[k].unit
            -- check if unit is valid
            if GetObjectExists(thisUnit) then
                -- increase counter for each occurences
                if UnitDebuffID(thisUnit, spellID, "exact") then
                    counter = counter + 1
                end
            end
        end
        return tonumber(counter)
    end
    function getBiggestUnitCluster(maxRange, radius)
        -- Description:
        -- returns the enemy with most enemies in radius in maxRange from player

        -- rerturns:
        -- "0x0000000110E4F09C"

        -- how to use:
        -- castSpell(getBiggestUnitCluster(40,10),SpellID,...,...)
        -- use "getBiggestUnitCluster(maxRange,radius)" instead of "target"

        if type(maxRange) ~= "number" then
            return nil
        end
        if type(radius) ~= "number" then
            return nil
        end

        local enemiesInRange = 0
        local theReturnUnit

        for i = 1, #br.enemy do
            thisUnit = br.enemy[i].unit
            if getLineOfSight(thisUnit) == true then
                if br.enemy[i].distance < maxRange then
                    if getNumEnemies(thisUnit, radius) > enemiesInRange then
                        theReturnUnit = thisUnit
                    end
                end
            end
        end
        return select(1, theReturnUnit)
    end


    -- Opener Reset
    local opener = br.player.opener

    if (not inCombat and not GetObjectExists("target")) or opener.complete == nil then

        opener.count = 0
        opener.WRA1 = false
        opener.WRA2 = false
        opener.DOT1 = false
        opener.DOT2 = false
        opener.DOT3 = false
        opener.PWR = false
        opener.PEW = false
        opener.complete = false







        --Clear last cast table ooc to avoid strange casts
        if #br.lastCast.tracker > 0 then
            wipe(br.lastCast.tracker)
        end
    end

    --[134388] = "A Knot of Snakes",


    -- track dispells in group
    --[[ for i = 1, #br.friend do
       if UnitGroupRolesAssigned(br.friend[i].unit) == "HEALER" and inInstance then
         local healerClass = UnitClassification(br.friend[i].unit)
         if healerClass == druid then
           dispell_healer_list = curse, magic, poison
         elseif healerClass == monk then
           dispell_healer_list = disease, magic, poison
         elseif healerClass == priest then
           dispell_healer_list = disease, magic
         elseif healerClass == shaman then
           dispell_healer_list = curse, magic
         elseif healerClass == paladin then
           dispell_healer_list = disease, magic, poison
         end
       end
   ]]

    ABOpener = ABOpener or false
    SW1 = SW1 or false
    SW2 = SW2 or false
    MF = MF or false
    SF = SF or false
    StF = StF or false
    CA = CA or false

    if (not inCombat and not GetObjectExists("target")) and ABopener
    then
        br.addonDebug("Opener Reset")
        ABOpener = false
        SW1 = false
        SW2 = false
        MF = false
        SF = false
        StF = false
        CA = false
        if #br.lastCast.tracker > 0 then
            wipe(br.lastCast.tracker)
        end

    end

    local astral_max = 0
    local astral_def = 0

    if talent.naturesBalance then
        astral_max = 95
    else
        astral_max = 100
    end
    astral_def = astral_max - power

    --Print(astral_def)

    local function noDamageCheck(unit)
        if isChecked("Dont DPS spotter") and GetObjectID(unit) == 135263 then
            return true
        end
        --[[
        if inInstance and UnitBuffID(unit, 290026) then
            if not queenBuff and IsSpellInRange(GetSpellInfo(spell.moonfire), unit) == 1 then
                queenBuff = true
            end
            return true
        end
        ]]
        if isCasting(302415, unit) then
            -- emmisary teleporting home
            return true
        end
        return false
    end

    local function castBeam(minUnits, safe, minttd)
        if not isKnown(spell.focusedAzeriteBeam) or getSpellCD(spell.focusedAzeriteBeam) ~= 0 then
            return false
        end

        local x, y, z = ObjectPosition("player")
        local length = 30
        local width = 6
        ttd = ttd or 0
        safe = safe or true
        local function getRectUnit(facing)
            local halfWidth = width / 2
            local nlX, nlY, _ = GetPositionFromPosition(x, y, z, halfWidth, facing + math.rad(90), 0)
            local nrX, nrY, nrZ = GetPositionFromPosition(x, y, z, halfWidth, facing + math.rad(270), 0)
            local frX, frY, _ = GetPositionFromPosition(nrX, nrY, nrZ, length, facing, 0)
            return nlX, nlY, nrX, nrY, frX, frY
        end
        local enemiesTable = getEnemies("player", length, true)
        local facing = ObjectFacing("player")
        local unitsInRect = 0
        local nlX, nlY, nrX, nrY, frX, frY = getRectUnit(facing)
        for i = 1, #enemiesTable do
            thisUnit = enemiesTable[i]
            local uX, uY, uZ = ObjectPosition(thisUnit)
            if isInside(uX, uY, nlX, nlY, nrX, nrY, frX, frY) and not TraceLine(x, y, z + 2, uX, uY, uZ + 2, 0x100010) then
                if safe and not UnitAffectingCombat(thisUnit) and not isDummy(thisUnit) then
                    unitsInRect = 0
                    break
                end
                if ttd(thisUnit) >= minttd then
                    unitsInRect = unitsInRect + 1
                end
            end
        end
        if unitsInRect >= minUnits then
            CastSpellByName(GetSpellInfo(spell.focusedAzeriteBeam))
            return true
        else
            return false
        end
    end


    --aoe_count
    local aoe_count = 0
    for i = 1, #enemies.yards10tnc do
        thisUnit = enemies.yards10tnc[i]
        if ttd(thisUnit) > 4 and not noDamageCheck(thisUnit) then
            aoe_count = aoe_count + 1
        end
    end

    local standingTime = 0
    if DontMoveStartTime then
        standingTime = GetTime() - DontMoveStartTime
    end

    local function dps()

        --setting norepeat
        norepeat = false
        if (traits.streakingStars.active and pewbuff) or UnitDebuffID("player", 304409) then
            norepeat = true
        end
        if mode.forms ~= 3 then
            if not br.player.buff.moonkinForm.exists() and not buff.prowl.exists() and not cast.last.moonkinForm(1) then
                if cast.moonkinForm() then
                    return true
                end
            end
        end

        local radar = "off"

        --Building root list
        local root_UnitList = {}
        if isChecked("KR - root Minions of Zul") then
            root_UnitList[133943] = "minion-of-zul"
            radar = "on"
        end
        if isChecked("All - root the thing") then
            root_UnitList[161895] = "the thing from beyond"
            radar = "on"
        end
        if isChecked("FH - root grenadier") then
            root_UnitList[129758] = "grenadier"
            radar = "on"
        end
        if isChecked("KR - root Spirit of Gold") then
            root_UnitList[131009] = "the thing from beyond"
            radar = "on"
        end
        if isChecked("KR - animated gold") then
            root_UnitList[135406] = "animated gold"
            radar = "on"
        end
        --test dude
        if 1 == 2 then
            root_UnitList[143647] = "my little friend"
            radar = "on"
        end

        if radar == "on" then

            local root = "Entangling Roots"
            local root_range = 35
            if talent.massEntanglement and cast.able.massEntanglement then
                root = "Mass Entanglement"
            end

            for i = 1, GetObjectCountBR() do
                local object = GetObjectWithIndex(i)
                local ID = ObjectID(object)
                if root_UnitList[ID] ~= nil and getBuffRemain(object, 226510) == 0 and getHP(object) > 90 and not isLongTimeCCed(object) and (getBuffRemain(object, 102359) < 2 or getBuffRemain(object, 339) < 2) then
                    local x1, y1, z1 = ObjectPosition("player")
                    local x2, y2, z2 = ObjectPosition(object)
                    local distance = math.sqrt(((x2 - x1) ^ 2) + ((y2 - y1) ^ 2) + ((z2 - z1) ^ 2))
                    if distance <= 8 and talent.mightyBash then
                        CastSpellByName("Mighty Bash", object)
                        return true
                    end
                    if distance < root_range and not isLongTimeCCed(object) then
                        CastSpellByName(root, object)
                    end
                end
            end -- end root
        end -- end radar



        --potion support
        --[[
        1, none, frX
        2, battle, 163222
        3, RisingDeath, 152559
        4, Draenic, 109218
        5, Prolonged, 142117
        6, Empowered Proximity, 168529
        7, Focused Resolve, 168506
        8, Superior Battle, 168498
        ]]
        if isChecked("Auto use Pots") then
            local pot_use
            if getValue("Auto use Pots") == 1
                    or getValue("Auto use Pots") == 2 and inInstance
                    or getValue("Auto use Pots") == 3 and inRaid
                    or getValue("Auto use Pots") == 4 and solo
            then
                pot_use = true
            end

            if pot_use then
                local auto_pot
                if #enemies.yards12t == 1 and isBoss("target") then
                    auto_pot = getOptionValue("Pots - 1 target")
                elseif #enemies.yards12t >= 2 and #enemies.yards12t <= 3 then
                    auto_pot = getOptionValue("Pots - 2-3 targets")
                elseif #enemies.yards12t >= 4 then
                    auto_pot = getOptionValue("Pots - 4+ target")
                end

                if not auto_pot == 1 and (buff.incarnationChoseOfElune.exists() and buff.incarnationChoseOfElune.remain() > 16.5) or (buff.celestialAlignment.exists() and buff.celestialAlignment.remain() > 13) then
                    if auto_pot == 2 and canUseItem(163222) then
                        useItem(163222)
                    elseif auto_pot == 3 and canUseItem(152559) then
                        useItem(152559)
                    elseif auto_pot == 4 and canUseItem(109218) then
                        useItem(109218)
                    elseif auto_pot == 5 and canUseItem(142117) then
                        useItem(142117)
                    elseif auto_pot == 6 and #enemies.yards12 > 3 and canUseItem(168529) then
                        useItem(168529)
                    elseif auto_pot == 7 and canUseItem(168506) then
                        useItem(168506)
                    elseif auto_pot == 8 and canUseItem(168498) then
                        useItem(168498)
                    elseif auto_pot == 9 and canUseItem(169299) then
                        useItem(169299)
                    end
                end
            end
        end

        if race == "Troll" and isChecked("Racial") and useCDs() and ttd("target") >= 12 and ((buff.incarnationChoseOfElune.exists() and buff.incarnationChoseOfElune.remain() > 16.5) or (buff.celestialAlignment.exists() and buff.celestialAlignment.remain() > 13)) then
            cast.racial("player")
        end
        -- item support
        --Wraps of wrapsOfElectrostaticPotential
        if br.player.equiped.wrapsOfElectrostaticPotential and canUseItem(br.player.items.wrapsOfElectrostaticPotential) and ttd("target") >= 10 then
            if br.player.use.wrapsOfElectrostaticPotential() then
                br.addonDebug("Using HBracers")
            end
        end
        --staff of neural
        if br.player.equiped.neuralSynapseEnhancer and canUseItem(br.player.items.neuralSynapseEnhancer) and ttd("target") >= 15
                and getDebuffStacks("player", 267034) < 2 -- not if we got stacks on last boss of shrine
        then
            if br.player.use.neuralSynapseEnhancer() then
                br.addonDebug("Using neuralSynapseEnhancer ")
            end
        end
        -- Corruption stuff
        -- 1 = snare  2 = eye  3 = thing 4 = reverything = 5 = never   -- snare = 315176
        if br.player.equiped.shroudOfResolve and canUseItem(br.player.items.shroudOfResolve) then
            if getValue("Use Cloak") == 1 and debuff.graspingTendrils.exists("player")
                    or getValue("Use Cloak") == 2 and debuff.eyeOfCorruption.stack("player") >= getValue("Eye Stacks")
                    or getValue("Use Cloak") == 3 and debuff.grandDelusions.exists("player")
                    or getValue("Use Cloak") == 4 and (debuff.graspingTendrils.exists("player") and debuff.eyeOfCorruption.stack("player") >= getValue("Eye Stacks"))
            then
                if br.player.use.shroudOfResolve() then
                    br.addonDebug("Using shroudOfResolve")
                end
            end
        end



        --Essence Support

        if useCDs() and isChecked("Lucid Dreams") and cast.able.memoryOfLucidDreams() then
            if not pewbuff and (power < 25 or (cd.celestialAlignment.remain() > 30 or cd.incarnationChoseOfElune.remain() > 30)) then
                if debuff.sunfire.remain("target") > 10 and debuff.sunfire.remain("target") > 10 and (debuff.stellarFlare.remain("target") > 10 or not talent.stellarFlare) then
                    if cast.memoryOfLucidDreams() then
                        return true
                    end
                end
            end
        end

        if useCDs() and isChecked("ConcentratedFlame - DPS") then
            if cast.concentratedFlame("target") then
                return true
            end
        end

        --and ((essence.focusedAzeriteBeam.rank < 3 and not moving)
        --                    or essence.focusedAzeriteBeam.rank >= 3)

        if useCDs() and ((essence.focusedAzeriteBeam.rank < 3 and standingTime > 1 or essence.focusedAzeriteBeam.rank >= 3)) and isChecked("Focused Azerite Beam") and (aoe_count >= getValue("Focused Azerite Beam") or isBoss("target"))
                and debuff.sunfire.exists("target") and debuff.moonfire.exists("target") and (debuff.stellarFlare.exists("target") or not talent.stellarFlare) then
            if castBeam(getOptionValue("Focused Azerite Beam"), true, 3) then
                return true
            end
        end

        -- https://www.wowhead.com/spell=295840/guardian-of-azeroth
        if isChecked("Guardian Of Azeroth") and useCDs() and cast.able.guardianOfAzeroth()
                and (debuff.moonfire.exists("target")
                and debuff.sunfire.exists("target")
                and (not talent.stellarFlare or debuff.stellarFlare.exists "target"))
                and (not talent.starlord or buff.starLord.exists("player"))
        then
            if cast.guardianOfAzeroth() then
                br.addonDebug("Essence: Casting Guardian of Azeroth")
                return
            end
        end


        -- new prepatch variables
        --variable,name=is_aoe,value=spell_targets.starfall>1 and (!talent.starlord.enabled or talent.stellar_drift.enabled) or spell_targets.starfall>2
        --variable,name=is_cleave,value=spell_targets.starfire>1
        -- Local var = bool and true_value or false_value

        local is_aoe = (#enemies.yards45 > 1 and (not talent.starlord or talent.stellarDrift) or #enemies.yards45 > 2) or false
        local is_cleave = #enemies.yards45 > 1 or false
        local starfall_wont_fall_off = power > 80 - (buff.starfall.remains() * 3 / hasteAmount) and buff.starfall.exists() or false
        local starfire_in_solar = #enemies.yards45 > 8 + floor(masteryAmount / 20)

        local starfire_fallback = cast.last.starfire(1) and cast.last.starfire(2) and cast.last.starfire(3) or false
        local wrath_fallback = cast.last.wrath(1) and cast.last.wrath(2) and cast.last.wrath(3) or false

        --  Print(GetSpellCount(190984)) --wrath
        -- Print(GetSpellCount(1941530))   --starfire

        local eclipse_in = (buff.eclipse_solar.exists() or buff.eclipse_lunar.exists()) or false

        if not eclipse_in then
            if GetSpellCount(190984) > 0 and GetSpellCount(1941530) == 0 then
                eclipse_next = "lunar"
            elseif GetSpellCount(190984) == 0 and GetSpellCount(1941530) > 0 then
                eclipse_next = "solar"
            elseif GetSpellCount(190984) > 0 and GetSpellCount(1941530) > 0 then
                eclipse_next = "any"
            end
        end

      --  Print("In Eclipse: " .. tostring(eclipse_in) .. " next:  " .. eclipse_next)

        if mode.rotation < 4 then


            --trinkets
            local Trinket13 = GetInventoryItemID("player", 13)
            local Trinket14 = GetInventoryItemID("player", 14)

            if isChecked("Use Trinkets") then
                --VenumousShivers
                if (Trinket13 == 168905 or Trinket14 == 168905)
                        and getDebuffStacks("target", 301624) == 5 then
                    if canUseItem(168905) then
                        useItem(168905)
                    end
                end

                --pocket size computing device
                if (Trinket13 == 167555 or Trinket14 == 167555) and ttd("target") > 10 and not isMoving("player")
                        and debuff.sunfire.exists("target") and debuff.moonfire.exists("target") and (debuff.stellarFlare.exists("target") or not talent.stellarFlare) then
                    if canUseItem(167555) then
                        useItem(167555)
                    end
                end

                -- Generic fallback
                if (pewbuff or (cd.celestialAlignment.remain() > 30 or cd.incarnationChoseOfElune.remain() > 30)) then
                    if Trinket13 ~= 168905 and Trinket13 ~= 167555 then
                        if canUseItem(13) then
                            useItem(13)
                        end
                    end
                    if Trinket14 ~= 168905 and Trinket14 ~= 167555 then
                        if canUseItem(14) then
                            useItem(14)
                        end
                    end
                end
            end


            -- Warrior of Elune
            if useCDs() and isChecked("Warrior Of Elune") and talent.warriorOfElune and not buff.warriorOfElune.exists() then
                if cast.warriorOfElune() then
                    return true
                end
            end


            -- Force Of Nature / treants
            if talent.forceOfNature and cast.able.forceOfNature() and astral_def > 20 then
                if br.player.ui.mode.forceofNature == 1 and getTTD("target") >= 10
                        and (isChecked("Group treants with CD") and (pewbuff or cd.celestialAlignment.remain() > 30 or cd.incarnationChoseOfElune.remain() > 30) or not isChecked("Group treants with CD"))
                        and (#enemies.yards12t >= getValue("Treant Targets") or isBoss()) then
                    if cast.forceOfNature("best", nil, 1, 15, true) then
                        return true
                    end
                elseif br.player.ui.mode.forceofNature == 2 and isChecked("Treants Key") and SpecificToggle("Treants Key") and not GetCurrentKeyBoardFocus() then
                    if cast.forceOfNature("best", nil, 1, 15, true) then
                        return true
                    end
                end
            end
            --	fury_of_elune
            if talent.furyOfElune and isChecked("Fury Of Elune") and
                    (furyUnits >= getValue("Fury of Elune Targets") or isBoss("target"))
                    and astral_def > 8
                    and (isChecked("Group Fury with CD") and (pewbuff or cd.celestialAlignment.remain() > 30 or cd.incarnationChoseOfElune.remain() > 30) or not isChecked("Group Fury with CD")) then
                if cast.furyOfElune(getBiggestUnitCluster(45, 1.25)) then
                    return true
                end
            end

            --debug section
            -- Print(getCastTime(spell.wrath))

            if mode.rotation == 1 and is_aoe or mode.rotation == 2 then
                -- AOE rotation

                --starfall
                if cast.able.starfall()
                        and not buff.starfall.exists() or buff.starfall.refresh() then
                    --  or br.timer:useTimer("starfall_timer", 5.6) then
                    -- and (!runeforge.lycaras_fleeting_glimpse.equipped or time%%45>buff.starfall.remains+2)
                    if cast.starfall("best", false, 1, 40) then
                        return true
                    end
                end
                -- sunfire,target_if=refreshable and target.time_to_die>14-spell_targets+remains,if=ap_check and eclipse.in_any

                --dots
                for i = 1, #enemies.yards45 do
                    thisUnit = enemies.yards45[i]
                    -- Print((14 - #enemies.yards45 + debuff.sunfire.remains(thisUnit)))
                    if cast.able.sunfire() and not cast.last.sunfire(1)
                            and debuff.sunfire.refresh(thisUnit)
                            and ttd(thisUnit) > (14 - #enemies.yards45 + debuff.sunfire.remains(thisUnit)) and eclipse_in
                    then
                        if cast.sunfire(thisUnit) then
                            return true
                        end
                    end
                    -- moonfire
                    if cast.able.moonfire(thisUnit) then
                        if ((cd.incarnationChoseOfElune.ready() or cd.celestialAlignment.ready())
                                or #enemies.yards45 < 3
                                or (buff.eclipse_solar.exists() or (buff.eclipse_solar.exists() and buff.eclipse_lunar.exists())
                                or buff.eclipse_lunar.exists() and not talent.soulOfTheForest)
                                -- and (#enemies.yards45 < 10 * (1 + talent.twinMoons)) and power > 50 - buff.starfall.remains() * 6)
                        )
                        -- and not buff.kindredEmpowerment.exists() and astral_def > 2
                        then
                            --Print(tostring((14 + (#enemies.yards45 * 1.5)) % #enemies.yards45 + debuff.moonfire.remain(thisUnit)))
                            if debuff.moonfire.refresh(thisUnit)
                                    and ttd(thisUnit) > (14 + (#enemies.yards45 * 1.5)) / #enemies.yards45 + debuff.moonfire.remain(thisUnit)
                            then
                                if cast.moonfire(thisUnit) then
                                    return true
                                end
                            end
                        end
                    end
                end

                -- celestialAlignment


                if mode.cooldown == 2 or (isBoss("target") and mode.cooldown == 1) and isChecked("Incarnation/Celestial Alignment") then
                    if (buff.starfall.exists() or power > 50) and not buff.solstice.exists() and not pewbuff then
                        -- and (interpolated_fight_remains < cooldown.convoke_the_spirits.remains + 7 | interpolated_fight_remains % % 180 < 22 | cooldown.convoke_the_spirits.up |!covenant.night_fae)
                        if not talent.incarnationChoseOfElune and cast.able.celestialAlignment() then
                            if cast.celestialAlignment() then
                                return true
                            end
                        elseif talent.incarnationChoseOfElune and cast.able.incarnationChoseOfElune() then
                            if cast.incarnationChoseOfElune() then
                                return true
                            end
                        end
                    end
                end


                --starsurge
                if cast.able.starsurge()
                        and buff.onethsClearVision.exists()
                        or astral_def < 8
                        or ((buff.incarnationChoseOfElune.remains() < 5 or buff.celestialAlignment.remains() < 5) and pewbuff
                        or (buff.ravenousFrenzy.remains() < gcd * ceil(power / 30) and buff.ravenousFrenzy.exists()))
                        and starfall_wont_fall_off and #enemies.yards45 < 3 then
                    if cast.starsurge(units.dyn45) then
                        return true
                    end
                end
                -- wrath
                if cast.able.wrath() --eclipse.in_solar&!variable.starfire_in_solar|buff.ca_inc.remains<action.starfire.execute_time&!variable.is_cleave&buff.ca_inc.remains<execute_time&buff.ca_inc.up|buff.ravenous_frenzy.up&spell_haste>0.6|!variable.is_cleave&buff.ca_inc.remains>execute_time
                        and not eclipse_in and (eclipse_next == "lunar" or eclipse_next == "any" and is_cleave)
                        or eclipse_in and buff.eclipse_solar.exists() and not starfire_in_solar
                        or (buff.celestialAlignment.remain() < buff.eclipse_lunar.remain() or buff.incarnationChoseOfElune.remain() < buff.eclipse_lunar.remain())
                        and pewbuff or buff.ravenousFrenzy.exists() and hasteAmount > 0.6
                        or not is_cleave and (buff.celestialAlignment.remain() > buff.eclipse_lunar.remain() or buff.incarnationChoseOfElune.remain() > buff.eclipse_lunar.remain())
                then
                    if cast.wrath(units.dyn45) then
                        return true
                    end
                end
                if cast.able.starfire() then
                    if cast.starfire(units.dyn45) then
                        return true
                    end
                end
            else
                --ST
                --moonfire

                --   Print(tostring(ttd(enemies.yards45[1])))

                if cast.able.moonfire()
                        and debuff.moonfire.remain(enemies.yards45[1]) < 6.6
                        and ttd(enemies.yards45[1]) > 12 then
                    if ((buff.celestialAlignment.remain() > 5 or buff.incarnationChoseOfElune.remain() > 5)
                            and (buff.ravenousFrenzy.remains() > 5 or not buff.ravenousFrenzy.exists())
                            or not pewbuff or power < 30)
                            and (not buff.kindredEmpowerment.exists() or power < 30) and astral_def > 8
                    then
                        if cast.moonfire(enemies.yards45[1]) then
                            return true
                        end
                    end
                end
                --	sunfire
                --[[
                Print(tostring((buff.ravenousFrenzy.remains() > 5 or not buff.ravenousFrenzy.exists() or not pewbuff or power < 30)))
                Print(tostring((not buff.kindredEmpowerment.exists() or power < 30) and astral_def > 2))
                Print(tostring(debuff.sunfire.remain(enemies.yards45[1]) < 2.4))
                Print(tostring(ttd(enemies.yards45[1])))
        ]]

                --   if=(buff.ca_inc.remains>5&(buff.ravenous_frenzy.remains>5|!buff.ravenous_frenzy.up)|!buff.ca_inc.up|astral_power<30)&(!buff.kindred_empowerment_energize.up|astral_power<30)&ap_check

                if cast.able.sunfire()
                        and debuff.sunfire.remain(enemies.yards45[1]) < 5.4
                        and ttd(enemies.yards45[1]) > 12 then
                    if ((buff.celestialAlignment.remain() > 5 or buff.incarnationChoseOfElune.remain() > 5)
                            and (buff.ravenousFrenzy.remains() > 5 or not buff.ravenousFrenzy.exists())
                            or not pewbuff or power < 30)
                            and (not buff.kindredEmpowerment.exists() or power < 30) and astral_def > 2 then
                        if cast.sunfire(enemies.yards45[1]) then
                            return true
                        end
                    end
                end

                -- pew
                if talent.incarnationChoseOfElune and cast.able.incarnationChoseOfElune() then
                    if (power > 90 or hasBloodLustRemain() < 36) then
                        if cast.incarnationChoseOfElune() then
                            return true
                        end
                    end
                elseif not talent.incarnationChoseOfElune and cast.able.celestialAlignment() then
                    if (power > 90 or hasBloodLustRemain() < 26) then
                        if cast.celestialAlignment() then
                            return true
                        end
                    end
                end


                --starfall
                if cast.able.starfall()
                        and talent.stellarDrift and not talent.starlord and buff.starfall.refresh()
                        and (buff.eclipse_lunar.remains() > 6 and buff.PrimordialArcanicPulsar.stack() < 250
                        or buff.PrimordialArcanicPulsar.stack() >= 250 and power > 90 and (cd.incarnationChoseOfElune.remain() > 0 or cd.celestialAlignment.remain() > 0))
                then
                    if cast.starfall() then
                        return true
                    end
                end
                --starsurge
                --starsurge,if=(!azerite.streaking_stars.rank|buff.ca_inc.remains<execute_time|!variable.prev_starsurge)&(buff.ca_inc.up|astral_power>90&eclipse.in_any)
                if cast.able.starsurge() then

                    if (pewbuff and br.player.traits.streakingStars.rank > 0
                            and not cast.last.starsurge(1)) and (pewbuff or power > 90 and eclipse_in) then
                        if cast.starsurge(units.dyn45) then
                            return true
                        end
                    end
                    if (br.player.traits.streakingStars.rank == 0 or pewbuff or not cast.last.starsurge(1))
                            and talent.starlord and (buff.starlord.exists() or power > 90)
                            and buff.starlord.stacks() < 3 and eclipse_in then
                        if cast.starsurge(units.dyn45) then
                            return true
                        end
                    end
                    if (br.player.traits.streakingStars.rank == 0 or pewbuff or not cast.last.starsurge(1))
                            and buff.eclipse_solar.remains() > 7 or talent.starlord then
                        if cast.starsurge(units.dyn45) then
                            return true
                        end
                    end
                end

                --starfire
                if cast.able.starfire() and
                        eclipse_in and buff.eclipse_lunar.exists() or not eclipse_in and (eclipse_next == "solar" or eclipse_next == "any")
                        or buff.warriorOfElune.exists() and buff.eclipse_lunar.exists()
                        or ((buff.incarnationChoseOfElune.remain() < getCastTime(spell.wrath) or buff.celestialAlignment.remain() < getCastTime(spell.wrath)) and pewbuff)
                then
                    if cast.starfire(getBiggestUnitCluster(45, 8)) then
                        return true
                    end
                end
                --wrath fall back
                if cast.able.wrath() then
                    if cast.wrath(units.dyn45) then
                        return true
                    end
                end
            end
        end
        --   run_action_list, name = dreambinder,
        --   if =runeforge.timeworn_dreambinder.equipped
        --  C    0.00    run_action_list, name= boat, if = runeforge.balance_of_all_things.equipped

        if 1 == 2 then
            if getValue("Starfall Targets (0 for auto)") == 0 then
                aoeTarget = 4
                if traits.arcanicPulsar.active then
                    aoeTarget = aoeTarget + 1
                end
                if talent.starlord then
                    aoeTarget = aoeTarget + 1
                end
                if talent.twinMoons then
                    aoeTarget = aoeTarget + 1
                end
                if traits.arcanicPulsar.active and br.player.traits.streakingStars.rank >= 2 then
                    aoeTarget = aoeTarget + 1
                end

                if talent.stellarDrift then
                    starfallRadius = 15
                else
                    starfallRadius = 12
                end
            elseif getValue("Starfall Targets (0 for auto)") ~= 0 then
                aoeTarget = getValue("Starfall Targets (0 for auto)")
            end


            -- Innverate
            --Print("Innervate Check: "..tostring(isChecked("Auto Innervate")) .." castable: " .. tostring(cast.able.innervate()).." TTD: " ..getTTD("target"))

            if isChecked("Auto Innervate") and inCombat and cast.able.innervate() and (getTTD(UnitTarget(tank)) >= 10 or (traits.livelySpirit.active and (cast.able.incarnationChoseOfElune() or cd.incarnationChoseOfElune.remain() < 2 or cast.able.celestialAlignment() or cd.celestialAlignment.remain() < 12))) then
                for i = 1, #br.friend do
                    if UnitGroupRolesAssigned(br.friend[i].unit) == "HEALER" and getDistance(br.friend[i].unit) < 45 and (inInstance or inRaid)
                            and not UnitIsDeadOrGhost(br.friend[i].unit) and getLineOfSight(br.friend[i].unit) and not hasBuff(29166, br.friend[i].unit) then
                        --buff.innervate.exists(br.friend[i].unit) then
                        --innervate
                        -- Print("Healer is: " .. br.friend[i].unit)
                        --Print(traits.livelySpirit.active)
                        if cast.innervate(br.friend[i].unit) then
                            return true
                        end
                    end
                end
            end

            local groupTTD = 0

            if #enemies.yards45 > 0 then
                for i = 1, #enemies.yards45 do
                    if ttd(enemies.yards45[i]) > groupTTD then
                        groupTTD = ttd(enemies.yards45[i])
                    end
                end
            end

            if useCDs() and isChecked("Incarnation/Celestial Alignment") and not isMoving("player") then
                if not talent.incarnationChoseOfElune and groupTTD >= 20 then
                    if not pewbuff and (not talent.starlord or buff.starlord.exists())
                            and (buff.memoryOfLucidDreams.exists() or ((cd.memoryOfLucidDreams.remains() > 20 or not essence.memoryOfLucidDreams.major) and astral_def > 40))
                            and (not traits.livelySpirit.active or buff.livelySpirit.exists() or solo)
                            and debuff.sunfire.remain("target") > 2 and debuff.moonfire.exists("target") and (debuff.stellarFlare.exists("target") or not talent.stellarFlare)
                            or hasBloodLust()
                    then
                        if cast.celestialAlignment() then
                            br.addonDebug("[PEW]:" .. UnitName("target") .. " / " .. "GroupTTD: " .. tostring(groupTTD) .. "Astral Def: " .. tostring(astral_def))
                            return true
                        end
                    end
                elseif talent.incarnationChoseOfElune and groupTTD >= 30 then
                    if not pewbuff and (buff.memoryOfLucidDreams.exists() or ((cd.memoryOfLucidDreams.remains() > 20 or not essence.memoryOfLucidDreams.major) and astral_def > 40))
                            and debuff.sunfire.remain("target") > 8 and debuff.moonfire.remains("target") > 12 and (debuff.stellarFlare.remains("target") > 6 or not talent.stellarFlare)
                            or hasBloodLust()
                    then
                        if cast.incarnationChoseOfElune() then
                            br.addonDebug("[PEW]:" .. UnitName("target") .. " / " .. "GroupTTD: " .. tostring(groupTTD) .. "Astral Def: " .. tostring(astral_def))
                            return true
                        end
                    end
                end
            end

            if mode.rotation < 4 then
                if mode.rotation == 3 then
                    thisUnit = "target"
                elseif mode.rotation < 3 then
                    for i = 1, #enemies.yards45 do
                        thisUnit = enemies.yards45[i]
                    end
                end

                if buff.starlord.exists() and buff.starlord.remains() < 3 and astral_def < 8 then
                    br.addonDebug("[Cancel SL]: Buff Remains: " .. tostring(buff.starlord.remain()) .. "Astral Def: " .. tostring(astral_def))
                    cancelBuff(279709)
                end

                if astral_def <= 8 and (talent.stellarDrift and #enemies.yards15t >= aoeTarget) or #enemies.yards12t >= aoeTarget then
                    --Starfall
                    if (buff.starlord.remains() >= 8 or buff.starLord.stack() < 3)
                    then
                        if cast.starfall("best", false, aoeTarget, starfallRadius) then
                            br.addonDebug("[STARFALL]: Targets: " .. tostring(aoeTarget) .. "Astral Def: " .. tostring(astral_def))
                            return true
                        end

                    end
                else
                    if cast.able.starsurge() and (not traits.streakingStars.active or not pewbuff or (pewbuff and not cast.last.starsurge())) and
                            #enemies.yards12t < aoeTarget and
                            ((talent.starlord and (buff.starLord.stack() < 3 or buff.starLord.remains() >= 5 and buff.arcanicPulsar.stack() < 8)
                                    or not talent.starlord and (buff.arcanicPulsar.stack() < 8 or pewbuff))
                                    and buff.solarEmpowerment.stack() < 3 and buff.lunarEmpowerment.stack() < 3 and buff.recklessForceCounter.stack() < 19 or buff.recklessForceCounter.exists())
                            and #enemies.yards12t < aoeTarget
                            or ttd(units.dyn45) <= (br.player.gcd * power / 40)
                            or astral_def <= 8 then
                        if cast.starsurge(units.dyn45) then
                            br.addonDebug("[STARSURGE]")
                            return true
                        end
                    end
                end


                --dots

                local sunfire_target = 0
                local sunfire_radius = 8
                if traits.highNoon.active then
                    sunfire_target = #enemies.yards11t
                    sunfire_radius = 11
                else
                    sunfire_target = #enemies.yards8t
                    sunfire_radius = 8
                end

                for i = 1, #enemies.yards45 do
                    thisUnit = enemies.yards45[i]

                    if not noDamageCheck(thisUnit) and (buff.incarnationChoseOfElune.exists() or buff.celestialAlignment.exists()) and not isChecked("Ignore dots during pewbuff")
                            or not (buff.incarnationChoseOfElune.exists() or buff.celestialAlignment.exists()) then

                        if isChecked("Safe Dots") and
                                ((inInstance and #tanks > 0 and getDistance(thisUnit, tanks[1].unit) <= 10)
                                        or (inInstance and #tanks == 0)
                                        or (inRaid and #tanks > 1 and (getDistance(thisUnit, tanks[1].unit) <= 10 or (getDistance(thisUnit, tanks[2].unit) <= 10)))
                                        or solo
                                        or (inInstance and #tanks > 0 and getDistance(tanks[1].unit) >= 90)
                                ) or not isChecked("Safe Dots") or #tanks == 0 then


                            --quickdots
                            if cast.able.sunfire()
                                    and
                                    (
                                            (buff.incarnationChoseOfElune.exists() and buff.incarnationChoseOfElune.remains() < gcd
                                                    or buff.celestialAlignment.exists() and buff.celestialAlignment.remains() < gcd)
                                    )
                                    and traits.streakingStars.active and debuff.moonfire.remain(thisUnit) > debuff.sunfire.remain(thisUnit) then
                                if cast.sunfire(thisUnit) then
                                    --
                                    br.addonDebug("QuickDot: Sunfire: " .. buff.celestialAlignment.remains())
                                    return
                                end

                                --[[
                                sunfire,target_if=refreshable,if=ap_check and floor(target.time_to_die%(2*spell_haste))*spell_targets>=ceil(floor(2%spell_targets)*1.5)+2*spell_targets and (spell_targets>1+talent.twin_moons.enabled or dot.moonfire.ticking) and (!variable.az_ss or !buff.ca_inc.exists() or !prev.sunfire) and (buff.ca_inc.remains>remains or !buff.ca_inc.exists())
                        DoTs]]


                            end
                            if cast.able.moonfire()
                                    and ((buff.incarnationChoseOfElune.exists() and buff.incarnationChoseOfElune.remain() < gcd)
                                    or (buff.celestialAlignment.exists() and buff.celestialAlignment.remain() < gcd))
                                    and traits.streakingStars.active then
                                if cast.moonfire(thisUnit) then
                                    br.addonDebug("QuickDot: Moonfire: " .. buff.celestialAlignment.remains())
                                    return
                                end
                            end

                            local moonfiretalent = 0
                            if talent.twinMoons then
                                moonfiretalent = moonfiretalent + 1
                            end

                            if debuff.sunfire.count() == 0 then
                                if traits.highNoon.active then
                                    if cast.sunfire(getBiggestUnitCluster(45, sunfire_radius)) then
                                        br.addonDebug("Initial Sunfire - Cluster(" .. sunfire_radius .. ")")
                                        return true
                                    end
                                end
                            end


                            -- sunfire,target_if=refreshable,if=ap_check and floor(target.time_to_die%(2*spell_haste))*spell_targets>=ceil(floor(2%spell_targets)*1.5)+2*spell_targets
                            --  and (spell_targets>1+talent.twin_moons.enabled or dot.moonfire.ticking) and (!variable.az_ss or !buff.ca_inc.exists() or !prev.sunfire) and (buff.ca_inc.remains>remains or !buff.ca_inc.exists())


                            if cast.able.sunfire() and astral_def >= 3 and (debuff.sunfire.count() < getOptionValue("Max Sunfire Targets") or debuff.sunfire.exists(thisUnit) or isBoss(thisUnit))
                            then
                                if not debuff.sunfire.exists(thisUnit) then
                                    if (
                                            floor(ttd(thisUnit) / (2 * hasteAmount)) * sunfire_target >= ceil(floor(2 / sunfire_target) * 1.5) + 2 * sunfire_target
                                                    and (sunfire_target > 1 + moonfiretalent or debuff.moonfire.exists(thisUnit))
                                                    and (not traits.streakingStars.active or not pewbuff or cast.last.sunfire(1))
                                                    and ((buff.incarnationChoseOfElune.remain() > debuff.sunfire.remain(thisUnit)
                                                    or buff.celestialAlignment.remain() > debuff.sunfire.remain(thisUnit)) or not pewbuff)

                                    ) then
                                        if cast.sunfire(thisUnit) then
                                            br.addonDebug("Initial Sunfire - non-Cluster")
                                            return true
                                        end
                                    end
                                elseif debuff.sunfire.exists(thisUnit) and debuff.sunfire.remain(thisUnit) < 5 and ttd(thisUnit) > 5 then
                                    if cast.sunfire(thisUnit) then
                                        br.addonDebug("Refreshing sunfire - remain: " .. debuff.sunfire.remain(thisUnit))
                                        return true
                                    end
                                end
                            end


                            --Initial Moonfire only
                            if talent.twinMoons and getDebuffCount(164812) == 0 then
                                if cast.moonfire(getBiggestUnitCluster(45, 15)) then
                                    br.addonDebug("Initial moonfire - Cluster(" .. tostring(getDebuffCount(164812)) .. "/" .. #enemies.yards45)
                                    return true
                                end
                            end
                            -- more dots - moonfire
                            if cast.able.moonfire() and debuff.moonfire.count() < getOptionValue("Max Moonfire Targets") and astral_def >= 3 and #enemies.yards45 > debuff.moonfire.count() then
                                --or debuff.moonfire.exists(thisUnit)) or isBoss(thisUnit) and
                                if not debuff.moonfire.exists(thisUnit) then
                                    if cast.moonfire(thisUnit) then
                                        br.addonDebug("Initial Moonfire -" .. tostring(getDebuffCount(164812)) .. "/" .. #enemies.yards45)
                                        return true
                                    end
                                end
                            end
                            if debuff.moonfire.exists(thisUnit) and debuff.moonfire.remain(thisUnit) < 6 and (ttd(thisUnit) > 5 and ttd(thisUnit) > debuff.moonfire.remain(thisUnit)) then
                                if cast.moonfire(thisUnit) then
                                    br.addonDebug("Refreshing moonfire - remain: " .. debuff.moonfire.remain(thisUnit))
                                    return true
                                end
                            end
                            --[[
                      if

                      (floor(ttd(thisUnit) / (2 * hasteAmount)) * #enemies.yards8t >= 6
                              and (not traits.streakingStars.active or not pewbuff or lastSpellCast ~= spell.moonfire)
                              and
                              (
                                      (buff.incarnationChoseOfElune.exists() and buff.incarnationChoseOfElune.remain() > debuff.moonfire.remain(thisUnit)
                                              or buff.celestialAlignment.exists() and buff.celestialAlignment.remain() > debuff.moonfire.remain(thisUnit)
                                      ) or not pewbuff
                              )
                              or isBoss(thisUnit)
                      )
                      then
                          if cast.moonfire(thisUnit) then
                              br.addonDebug("Initial Moonfire")
                              return true
                          end
                      end
                    elseif debuff.moonfire.exists(thisUnit) and debuff.moonfire.remain(thisUnit) < 6 and ttd(thisUnit) > 5 then
                      if cast.moonfire(thisUnit) then
                          br.addonDebug("Refreshing moonfire - remain: " .. debuff.moonfire.remain(thisUnit))

                          return true
                      end
                    end
                    end
                    ]]
                            --stellarFlare
                            if cast.able.stellarFlare() and not cast.last.stellarFlare() then
                                if (not debuff.stellarFlare.exists(thisUnit) and (debuff.stellarFlare.count() < getOptionValue("Max Stellar Flare Targets"))
                                        or debuff.stellarFlare.remain(thisUnit) < 6 and ttd(thisUnit) > debuff.stellarFlare.remain(thisUnit) + 5)
                                        and (floor(ttd(thisUnit) / (2 * hasteAmount)) >= 5)
                                then
                                    if cast.stellarFlare(thisUnit) then
                                        br.addonDebug("StellarFlare - remains:" .. tostring(debuff.stellarFlare.remain(thisUnit)))
                                        return true
                                    end
                                end

                            end
                        end
                    end
                end -- end dots

                --new/half/full moon ...will we ever use them ;)
                if cast.able.newMoon(units.dyn45) and (power <= 90) then
                    if cast.newMoon(units.dyn45) then
                        return
                    end
                end
                -- half_moon,if=ap_check
                if cast.able.halfMoon(units.dyn45) and (power <= 80) then
                    if cast.halfMoon(units.dyn45) then
                        return
                    end
                end
                -- full_moon,if=ap_check
                if cast.able.fullMoon(units.dyn45) and (power <= 60) then
                    if cast.fullMoon(units.dyn45) then
                        return
                    end
                end
                if not isMoving("player") then
                    if cast.able.lunarStrike and buff.solarEmpowerment.stack() < 3 and (astral_def >= 12 or buff.lunarEmpowerment.stack() == 3)
                            and ((buff.warriorOfElune.exists() or buff.lunarEmpowerment.exists() or #enemies.yards8t >= 2 and not buff.solarEmpowerment.exists())
                            and (not traits.streakingStars.active or not pewbuff) or traits.streakingStars.active and pewbuff and cast.last.solarWrath()) then
                        if mode.rotation < 3 then
                            if cast.lunarStrike(getBiggestUnitCluster(45, 8)) then
                                br.addonDebug("Lunarstrike(cluster) Solar: " .. buff.solarEmpowerment.stack() .. " Lunar: " .. buff.lunarEmpowerment.stack())
                                return true
                            end
                        elseif mode.rotation == 3 then
                            if cast.lunarStrike(units.dyn45) then
                                br.addonDebug("Lunarstrike Solar: " .. buff.solarEmpowerment.stack() .. " Lunar: " .. buff.lunarEmpowerment.stack())
                                return true
                            end
                        end
                    end


                    -- solar_wrath,if=variable.az_ss<3 or !buff.ca_inc.exists() or !prev.solar_wrath

                    if cast.able.solarWrath() and br.player.traits.streakingStars.rank < 3 or not pewbuff or not cast.last.solarWrath() then
                        if cast.solarWrath(units.dyn45) then
                            br.addonDebug("Wrath - Solar: " .. buff.solarEmpowerment.stack() .. " Lunar: " .. buff.lunarEmpowerment.stack())
                            return true
                        end
                    end
                end

                --fallback / moving
                if not cast.last.sunfire(1) then
                    if cast.sunfire(units.dyn45) then
                        if not isMoving("player") then
                            br.addonDebug("FAIL! (Sunfire) Lunarstacks: " .. buff.lunarEmpowerment.stack() .. " Solarstacks: " .. buff.solarEmpowerment.stack() .. " Astral: " .. power .. " TTD: " .. ttd("target"))
                        else
                            br.addonDebug("Fallback: Moving - sunfire")
                            return
                        end
                    end
                end
                if cast.moonfire(units.dyn45) then
                    if isMoving("player") then
                        br.addonDebug("FAIL! (moonfire) Lunarstacks: " .. buff.lunarEmpowerment.stack() .. " Solarstacks: " .. buff.solarEmpowerment.stack() .. " Astral: " .. power .. " TTD: " .. ttd("target"))
                    else
                        br.addonDebug("Fallback: Moving - moonfire")
                        return true
                    end
                end
            end
        end --end mode < 4
    end -- end dps()

    local function defensive()

        --[[
            --Bear Form Key-br.player.buff.bearForm.exists()
            if isChecked("Bear Key") and not buff.bearForm.exists("player") and SpecificToggle("Bear Key") and not GetCurrentKeyBoardFocus() then
                if cast.bearForm("player") then
                    return true
                end
            elseif isChecked("Bear Key") and buff.bearForm.exists("player") and SpecificToggle("Bear Key") and not GetCurrentKeyBoardFocus() then
                return
            elseif isChecked("Bear Key") and buff.bearForm.exists("player") and not SpecificToggle("Bear Key") and not GetCurrentKeyBoardFocus() then
                if cast.moonkinForm() then
                    return true
                end
            end
        ]]
        -- Pot/Stoned
        if isChecked("Potion/Healthstone") and php <= getValue("Potion/Healthstone") then
            if inCombat and (hasHealthPot() or hasItem(5512) or hasItem(166799)) then
                if canUseItem(5512) then
                    br.addonDebug("Using Healthstone")
                    useItem(5512)
                elseif hasItem(156634) and canUseItem(156634) then
                    br.addonDebug("Using Silas' Vial of Continuous Curing")
                    useItem(156634)
                elseif hasItem(166799) and canUseItem(166799) then
                    br.addonDebug("Using Emerald of Vigor")
                    useItem(166799)
                elseif hasItem(169451) and canUseItem(169451) then
                    br.addonDebug("Using Health Pot")
                    useItem(169451)
                end
            end
        end

        -- Renewal
        if isChecked("Renewal") and talent.renewal and php <= getValue("Renewal") then
            if cast.renewal("player") then
                return
            end
        end
        -- Barkskin
        if isChecked("Barkskin") and inCombat and php <= getValue("Barkskin") then
            if cast.barkskin() then
                return
            end
        end
        -- Swiftmend
        if talent.restorationAffinity and isChecked("Swiftmend") and cast.able.swiftmend()
                and php <= getValue("Swiftmend") and charges.swiftmend.count() >= 1
                and hasHot("player") then
            if cast.swiftmend("player") then
                return true
            end
        end
        -- Regrowth
        if isChecked("Regrowth") and not moving and php <= getValue("Regrowth") then
            if cast.regrowth("player") then
                return true
            end
        end

        --rejuvenation
        if isChecked("Rejuvenation") and php <= getValue("Rejuvenation") and not buff.rejuvenation.exists("player") then
            if cast.rejuvenation("player") then
                return true
            end
        end
        -- Rebirth
        if inCombat and isChecked("Rebirth") and cd.rebirth.remain() <= gcd and not isMoving("player") then
            if getOptionValue("Rebirth") == 1 then
                tanks = getTanksTable()
                for i = 1, #tanks do
                    thisUnit = tanks[i].unit
                    if UnitIsDeadOrGhost(thisUnit) and UnitIsPlayer(thisUnit) then
                        if cast.rebirth(thisUnit, "dead") then
                            return true
                        end
                    end
                end
            elseif inCombat and getOptionValue("Rebirth") == 2 then
                for i = 1, #br.friend do
                    thisUnit = br.friend[i].unit
                    if UnitIsDeadOrGhost(thisUnit) and UnitGroupRolesAssigned(thisUnit) == "HEALER" and UnitIsPlayer(thisUnit) then
                        if cast.rebirth(thisUnit, "dead") then
                            return true
                        end
                    end
                end
            elseif inCombat and getOptionValue("Rebirth") == 3 then
                for i = 1, #br.friend do
                    thisUnit = br.friend[i].unit
                    if UnitIsDeadOrGhost(thisUnit) and (UnitGroupRolesAssigned(thisUnit) == "TANK" or UnitGroupRolesAssigned(thisUnit) == "HEALER") and UnitIsPlayer(thisUnit) then
                        if cast.rebirth(thisUnit, "dead") then
                            return true
                        end
                    end
                end
            elseif inCombat and getOptionValue("Rebirth") == 4 then
                if GetUnitExists("mouseover") and UnitIsDeadOrGhost("mouseover") and GetUnitIsFriend("mouseover", "player") then
                    if cast.rebirth("mouseover", "dead") then
                        return true
                    end
                end
            elseif inCombat and getOptionValue("Rebirth") == 5 then
                for i = 1, #br.friend do
                    thisUnit = br.friend[i].unit
                    if UnitIsDeadOrGhost(thisUnit) and UnitIsPlayer(thisUnit) then
                        if cast.rebirth(thisUnit, "dead") then
                            return true
                        end
                    end
                end
            end
        end

        -- offheal

        local offheal = false
        if getOptionValue("offheal") == 2 then
            offheal = true
        elseif getOptionValue("offheal") == 3 then
            for i = 1, #br.friend do
                thisUnit = br.friend[i].unit
                if UnitIsDeadOrGhost(thisUnit) and UnitGroupRolesAssigned(thisUnit) == "HEALER" and UnitIsPlayer(thisUnit) then
                    offheal = true
                end
            end
        end

        -- Remove Corruption
        if isChecked("Remove Corruption") then
            if getOptionValue("Remove Corruption") == 1 then
                if canDispel("player", spell.removeCorruption) then
                    if cast.removeCorruption("player") then
                        return true
                    end
                end
            elseif getOptionValue("Remove Corruption") == 2 then
                if canDispel("target", spell.removeCorruption) then
                    if cast.removeCorruption("target") then
                        return true
                    end
                end
            elseif getOptionValue("Remove Corruption") == 3 then
                if canDispel("player", spell.removeCorruption) then
                    if cast.removeCorruption("player") then
                        return true
                    end
                elseif canDispel("target", spell.removeCorruption) then
                    if cast.removeCorruption("target") then
                        return true
                    end
                end
            elseif getOptionValue("Remove Corruption") == 4 then
                if canDispel("mouseover", spell.removeCorruption) then
                    if cast.removeCorruption("mouseover") then
                        return true
                    end
                end
            elseif (getOptionValue("Remove Corruption") == 5 or offheal == true) then
                for i = 1, #br.friend do
                    if canDispel(br.friend[i].unit, spell.removeCorruption) then
                        if cast.removeCorruption(br.friend[i].unit) then
                            return true
                        end
                    end
                end
            end
        end
    end

    local function interrupts()
        if useInterrupts() then
            for i = 1, #enemies.yards45 do
                thisUnit = enemies.yards45[i]
                if canInterrupt(thisUnit, getValue("InterruptAt")) then
                    -- Solar Beam
                    if isChecked("Solar Beam") then
                        if cast.solarBeam(thisUnit) then
                            return
                        end
                    end
                    -- Typhoon
                    if isChecked("Typhoon") and talent.typhoon and getDistance(thisUnit) <= 15 then
                        if cast.typhoon() then
                            return
                        end
                    end
                    -- Mighty Bash
                    if isChecked("Mighty Bash") and talent.mightyBash and getDistance(thisUnit) <= 10 then
                        if cast.mightyBash(thisUnit) then
                            return true
                        end
                    end
                end
            end
        end


    end

    local function root_cc()

        local root_UnitList = {}
        if isChecked("Freehold - root grenadier") then
            root_UnitList[129758] = "Irontide Grenadier"
        end
        if isChecked("Atal - root Spirit of Gold") then
            root_UnitList[131009] = "Spirit of Gold"
        end

        for i = 1, #enemies.yards45 do
            thisUnit = enemies.yards45[i]

            if isChecked("Auto Soothe") then
                if cast.able.soothe() and canDispel(thisUnit, spell.soothe) then
                    if cast.soothe(thisUnit) then
                        return true
                    end
                end
            end


            --[[
                        --Enchanted emmisary == 155432
                        if isChecked("Punt Enchanted Emissary") then
                            --and inInstance then
                            if GetObjectID(thisUnit) == 155432 and not isCasting(155432, thisUnit) then
                                if #tanks > 0 and getDistance(tank, thisUnit) <= 26 then
                                    br.addonDebug("Punting Emissary - Range from tank: " .. getDistance(tank, thisUnit))
                                    if cast.moonfire(thisUnit) then
                                        return true
                                    end
                                end
                            end
                        end
            ]]
            if isChecked("Freehold - root grenadier") or isChecked("Atal - root Spirit of Gold") or isChecked("All - root Emissary of the Tides") or isChecked("KR - Minions of Zul") then
                --br.addonDebug("Mob: " .. thisUnit .. " Health: " .. getHP(thisUnit))
                if cast.able.massEntanglement() and not isLongTimeCCed(thisUnit) and getHP(thisUnit) > 90 then
                    if (root_UnitList[GetObjectID(thisUnit)] ~= nil and getBuffRemain(thisUnit, 226510) <= 3) then
                        if cast.massEntanglement(thisUnit) then
                            br.addonDebug("Mass Rooting: " .. thisUnit)
                            return true
                        end
                    end
                end
                if cast.able.entanglingRoots() and not isLongTimeCCed(thisUnit) and getHP(thisUnit) > 90 then
                    if (root_UnitList[GetObjectID(thisUnit)] ~= nil and getBuffRemain(thisUnit, 226510) <= 3) then
                        if cast.entanglingRoots(thisUnit) then
                            br.addonDebug("Rooting: " .. thisUnit)
                            return true
                        end
                    end
                end
            end

        end
    end
    local function PreCombat()
        -- Pre-Pull Timer
        if isChecked("Pre-Pull Timer") and GetObjectExists("target") and not UnitIsDeadOrGhost("target") and UnitCanAttack("target", "player") then
            if PullTimerRemain() <= getOptionValue("Pre-Pull Timer") then
                if mode.forms ~= 3 then
                    if not br.player.buff.moonkinForm.exists() and not cast.last.moonkinForm(1) and not isMoving("player") then
                        if cast.moonkinForm() then
                            return true
                        end
                    end
                end
                if cast.solarWrath() then
                    return true
                end
            end
        end
        if isChecked("Auto Engage On Target") then
            if cast.sunfire() then
                return true
            end
        end
        if isChecked("Freehold - pig") and GetMinimapZoneText() == "Ring of Booty" then
            bossHelper()
        end
    end

    local function travel_form()

        if SpecificToggle("Travel Key") and not GetCurrentKeyBoardFocus() then
            if not travel then
                if cast.travelForm("Player") then
                    return true
                end
            end
            if SpecificToggle("Travel Key") and not GetCurrentKeyBoardFocus()
            then
                return
            end
        end

    end

    local function bear_form()

        if SpecificToggle("Bear Key") and not GetCurrentKeyBoardFocus() then
            if not bear then
                if cast.bearForm("Player") then
                    return true
                end
            end
            if isChecked("Bear Frenzies Regen HP") and talent.guardianAffinity and cast.able.frenziedRegeneration() and php <= getValue("Bear Frenzies Regen HP") then
                if cast.frenziedRegeneration() then
                    br.addonDebug("[BEAR]Regen")
                    return true
                end
            end
            if SpecificToggle("Bear Key") and not GetCurrentKeyBoardFocus()
            then
                return
            end
        end

    end

    local function cat_form()
        if SpecificToggle("Cat Key") and not GetCurrentKeyBoardFocus() then
            if not cat then
                if cast.catForm("player") then
                    return true
                end
            end

            if isChecked("auto stealth") and not inCombat and cat then
                if not br.player.buff.prowl.exists() then
                    if cast.prowl("Player") then
                        return true
                    end
                end
            end

            if isChecked("auto dash") and not catspeed then
                if cast.tigerDash() then
                    return true
                end
                if cast.dash() then
                    return true
                end
            end

            if SpecificToggle("Cat Key") and not GetCurrentKeyBoardFocus()
            then
                return
            end
        end
    end

    local function extras()

        --Forms key management, in and out of combat
        if mode.forms == 2 then
            if not moonkin then
                if cast.moonkinForm() then
                    return true
                end

            end
        end

        if not inCombat then
            --Resurrection

            if getOptionValue("Revive") == 1 then
                if isChecked("Revive") and not inCombat and not isMoving("player") then
                    if UnitIsPlayer("target") and UnitIsDeadOrGhost("target") and GetUnitIsFriend("target", "player") then
                        if cast.revive("target", "dead") then
                            return true
                        end
                    end
                end
            elseif getOptionValue("Revive") == 2 then
                if GetUnitExists("mouseover") and UnitIsDeadOrGhost("mouseover") and GetUnitIsFriend("mouseover", "player") then
                    if cast.revive("mouseover", "dead") then
                        return true
                    end
                end

            end
            -- Wild Growth
            if isChecked("OOC Wild Growth") and not isMoving("player") and php <= getValue("OOC Wild Growth") then
                if cast.wildGrowth() then
                    return true
                end
            end
            -- Regrowth
            if isChecked("OOC Regrowth") and not isMoving("player") and php <= getValue("OOC Regrowth") then
                if cast.regrowth("player") then
                    return true
                end
            end
            -- Shapeshift Form Management
            standingTime = 0
            if DontMoveStartTime then
                standingTime = GetTime() - DontMoveStartTime
            end

            if mode.forms == 1 then
                if isChecked("Standing Time") then
                    if (travel or buff.catForm.exists()) and not buff.prowl.exists() and standingTime > getValue("Standing Time") then
                        if cast.moonkinForm("player") then
                            return true
                        end
                    end
                end

                -- Flight Form
                if not inCombat and canFly() and not swimming and br.fallDist > 90 --[[falling > getOptionValue("Fall Timer")]] and br.player.level >= 58 and not buff.prowl.exists() then
                    if GetShapeshiftForm() ~= 0 and not cast.last.travelForm() then
                        -- CancelShapeshiftForm()
                        RunMacroText("/CancelForm")
                        CastSpellByID(783, "player")
                        return true
                    else
                        CastSpellByID(783, "player")
                        return true
                    end
                end
                -- Aquatic Form
                if (not inCombat --[[or getDistance("target") >= 10--]]) and swimming and not travel and not buff.prowl.exists() and isMoving("player") then
                    if GetShapeshiftForm() ~= 0 and not cast.last.travelForm() then
                        -- CancelShapeshiftForm()
                        RunMacroText("/CancelForm")
                        CastSpellByID(783, "player")
                        return true
                    else
                        CastSpellByID(783, "player")
                        return true
                    end
                end
                -- Travel Form
                if not inCombat and not swimming and br.player.level >= 58 and not buff.prowl.exists() and not catspeed and not travel and not IsIndoors() and IsMovingTime(1) then
                    if GetShapeshiftForm() ~= 0 and not cast.last.travelForm() then
                        RunMacroText("/CancelForm")
                        CastSpellByID(783, "player")
                        return true
                    else
                        CastSpellByID(783, "player")
                        return true
                    end
                end
                -- Cat Form
                if not cat and not IsMounted() and not flying and IsIndoors() then
                    -- Cat Form when not swimming or flying or stag and not in combat
                    if moving and IsMovingTime(3) and not swimming and not flying and not travel then
                        if cast.catForm("player") then
                            return true
                        end
                    end
                    -- Cat Form - Less Fall Damage
                    if (not canFly() or inCombat or br.player.level < 58) and (not swimming or (not moving and swimming and #enemies.yards5 > 0)) and br.fallDist > 90 then
                        --falling > getOptionValue("Fall Timer") then
                        if cast.catForm("player") then
                            return true

                        end
                    end
                end
            end -- End Shapeshift Form Management
        end
    end

    local function actionList_Opener()
        if ABOpener == false then
            if not SW1 then
                if cast.solarWrath() then
                    -- or last cast
                    SW1 = true
                    br.addonDebug("Opener: Solar Wrath 1 cast")
                    return
                end
            elseif SW1 and not SW2 then
                if cast.solarWrath() then
                    SW2 = true
                    br.addonDebug("Opener: Solar Wrath 2 cast")
                    return
                end
            elseif MF and not SF then
                if cast.sunfire() then
                    SF = true
                    br.addonDebug("Opener: Sunfire cast")
                    return
                end
            elseif SW2 and not MF then
                if cast.moonfire() then
                    MF = true
                    br.addonDebug("Opener: Moonfire cast")
                    return
                end
            elseif SF and not StF then
                if talent.stellarFlare then
                    if cast.stellarFlare() then
                        StF = true
                        br.addonDebug("Opener: Stellar Flare cast")
                        return
                    end
                else
                    StF = true
                    br.addonDebug("Opener: Stellar Flare not talented, bypassing")
                    return
                end
            elseif StF and not CA and power < 40 then
                if cast.solarWrath() then
                    br.addonDebug("Opener: Building Up AP")
                    return
                end
            elseif StF and not CA and power >= 40 then
                if talent.incarnationChoseOfElune and cd.incarnationChoseOfElune.remain() <= 3 then
                    if cast.incarnationChoseOfElune("player") then
                        br.addonDebug("Opener: Inc cast")
                        CA = true
                    end
                elseif not talent.incarnationChoseOfElune and cd.celestialAlignment.remain() <= 3 then
                    if cast.celestialAlignment("player") then
                        br.addonDebug("Opener: CA cast")
                        CA = true
                    end
                else
                    br.addonDebug("Opener: CA/Inc On CD, Bypassing")
                    CA = true
                end
                return
            elseif CA then
                ABOpener = true
                br.addonDebug("Opener Complete")
            end
        end
    end
    -----------------
    --- Rotations ---
    -----------------
    -- Pause
    if not IsMounted() or mode.rotation == 4 then
        -- br.player.buff.travelForm.exists() or br.player.buff.flightForm.exists())
        if pause() or drinking or mode.rotation == 4 or cast.current.focusedAzeriteBeam() then
            return true
        else

            ---------------------------------
            --- Out Of Combat - Rotations ---
            ---------------------------------````````````````````````````````````````````
            if not inCombat and not UnitBuffID("player", 115834) then
                if mode.forms == 2 then
                    if SpecificToggle("Cat Key") and not GetCurrentKeyBoardFocus() then
                        cat_form()
                        return true
                    elseif SpecificToggle("Bear Key") and not GetCurrentKeyBoardFocus() then
                        bear_form()
                        return true
                    elseif SpecificToggle("Travel Key") and not GetCurrentKeyBoardFocus() then
                        travel_form()
                        return true
                    end
                end

                if extras() then
                    return true
                end
                if useDefensive() then
                    if defensive() then
                        return true
                    end
                end
                if PreCombat() then
                    return true
                end

            end -- End Out of Combat Rotation
            -----------------------------
            --- In Combat - Rotations ---
            -----------------------------
            if inCombat and not UnitBuffID("player", 115834) then

                if mode.forms == 2 then
                    if SpecificToggle("Cat Key") and not GetCurrentKeyBoardFocus() then
                        cat_form()
                        return true
                    elseif SpecificToggle("Bear Key") and not GetCurrentKeyBoardFocus() then
                        bear_form()
                        return true
                    elseif SpecificToggle("Travel Key") and not GetCurrentKeyBoardFocus() then
                        travel_form()
                        return true
                    end
                end
                if extras() then
                    return true
                end
                if useInterrupts() then
                    if interrupts() then
                        return true
                    end
                end
                if useDefensive() then
                    if defensive() then
                        return true
                    end
                end

                if root_cc() then
                    return true
                end

                if ABOpener == false and isChecked("Opener") and (GetObjectExists("target") and isBoss("target")) then
                    actionList_Opener()
                end

                if mode.rotation ~= 4 then
                    if dps() then
                        return true
                    end
                end
            end
        end -- End In Combat Rotation
    end -- Pause
end -- End runRotation

local id = 102
if br.rotations[id] == nil then
    br.rotations[id] = {}
end

tinsert(br.rotations[id], {
    name = rotationName,
    toggles = createToggles,
    options = createOptions,
    run = runRotation,
})