-- Karbonala Warrior
local SET_M_WARRIOR = 0x691
local s, id = GetID()
function s.initial_effect(c)
--fusion material
	c:EnableReviveLimit()
	Fusion.AddProcMix(c,true,true,420690038,420690039)
  -- effects
  local e1=Effect.CreateEffect(c)
  e1:SetType(EFFECT_TYPE_FIELD)
  e1:SetCode(EFFECT_UPDATE_ATTACK)
  e1:SetRange(LOCATION_MZONE)
  e1:SetTargetRange(LOCATION_MZONE,0)
  e1:SetTarget(aux.TargetBoolFunction(Card.IsSetCard,SET_M_WARRIOR))
  e1:SetValue(1000)
  c:RegisterEffect(e1)
end
