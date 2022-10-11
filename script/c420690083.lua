-- Flower Wolf
local s, id = GetID()
function s.initial_effect(c)
--fusion material
	c:EnableReviveLimit()
	Fusion.AddProcMix(c,true,true,420690014,420690059)
  -- effects
  local e1=Effect.CreateEffect(c)
  e1:SetType(EFFECT_TYPE_FIELD)
  e1:SetCode(EFFECT_UPDATE_ATTACK)
  e1:SetRange(LOCATION_MZONE)
  e1:SetTargetRange(LOCATION_MZONE,0)
  e1:SetTarget(aux.TargetBoolFunction(s.filter))
  e1:SetValue(s.atkup)
  c:RegisterEffect(e1)
end
function s.filter(c)
	return (c:IsRace(RACE_BEAST) or c:IsRace(RACE_PLANT)) and c:IsFaceup()
end
function s.atkup(e,c)
	return Duel.GetMatchingGroupCount(s.filter,e:GetHandler():GetControler(),LOCATION_MZONE,0,nil)*200
end
