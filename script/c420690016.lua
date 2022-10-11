-- Dissolverock
local s, id = GetID()
function s.initial_effect(c)
  -- protection
  local e1=Effect.CreateEffect(c)
  e1:SetType(EFFECT_TYPE_FIELD)
  e1:SetCode(EFFECT_CANNOT_BE_EFFECT_TARGET)
  e1:SetRange(LOCATION_MZONE)
  e1:SetTargetRange(LOCATION_MZONE,0)
  e1:SetTarget(aux.TargetBoolFunction(Card.IsRace,RACE_ROCK))
  e1:SetValue(1)
  c:RegisterEffect(e1)
  local e2=e1:Clone()
  e2:SetCode(EFFECT_INDESTRUCTABLE_EFFECT)
  c:RegisterEffect(e2)
end
