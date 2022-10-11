-- Skull Red Bird
local s, id = GetID()
function s.initial_effect(c)
  -- effects
  local e1=Effect.CreateEffect(c)
  e1:SetType(EFFECT_TYPE_FIELD)
  e1:SetCode(EFFECT_PIERCE)
  e1:SetRange(LOCATION_MZONE)
  e1:SetTargetRange(LOCATION_MZONE,0)
  e1:SetTarget(aux.TargetBoolFunction(Card.IsRace,RACE_WINGEDBEAST))
  e1:SetValue(1)
  c:RegisterEffect(e1)
  local e2=e1:Clone()
  e2:SetCode(EFFECT_UPDATE_ATTACK)
  e2:SetValue(300)
  c:RegisterEffect(e2)
end
