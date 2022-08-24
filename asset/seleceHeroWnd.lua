print("startup ui")
local master = self:child("master")
local warrior = self:child("warrior")
local warlock = self:child("warlock")
local determind = self:child("determind")
local actorWindow = self:child("actorWindow") 
local introduceText = self:child("introduceText")
local index

actorWindow:setActorName(Me:getActorName())

local heroActor = {
  [1] = 'custom_hand_1',
  [2] = 'custom_hand_11',
  [3] = 'custom_hand_12' 
}

local function initText()
  introduceText:setText(Lang:toText('UI_introduce'))
  master:setText(Lang:toText('UI_master'))
  warrior:setText(Lang:toText('UI_warrior'))
  warlock:setText(Lang:toText('UI_warlock'))
  determind.Text:setText(Lang:toText('UI_determind'))
end

warrior.onSelectStateChanged = function()
  if warrior:isSelected() then
    index =  1
    actorWindow:setSkillName("idle")
    actorWindow:setSkillName("hi")
    actorWindow:useBodyPart("custom_hand",heroActor[index])
    actorWindow:useBodyPart("def",'warrior')
  end
end

master.onSelectStateChanged = function()
  if master:isSelected() then
    index =  2
    actorWindow:setSkillName("idle")
    actorWindow:setSkillName("hi")
    actorWindow:useBodyPart("custom_hand",heroActor[index])
    actorWindow:useBodyPart("def",'master')
  end
end

warlock.onSelectStateChanged = function()
  if warlock:isSelected() then
    index =  3
    actorWindow:setSkillName("idle")
    actorWindow:setSkillName("hi")
    actorWindow:useBodyPart("custom_hand",heroActor[index])
    actorWindow:useBodyPart("def",'warlock')
  end
end

determind.onMouseClick = function()
  PackageHandlers.sendClientHandler("seleWeapon", {index =index}, function(...)
      UI:closeWindow('seleceHeroWnd')
    end)
end

function M:onOpen()
  initText()
  warrior:setSelected(true)
end