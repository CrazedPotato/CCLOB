-- Celtic Guardian
local s, id = GetID()
function s.initial_effect(c)
  --special summon
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_SPSUMMON_PROC)
	e1:SetProperty(EFFECT_FLAG_UNCOPYABLE)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(s.condition)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:GetLevel()>=5 and c:IsRace(RACE_WARRIOR)
end
function s.condition(e,c)
	if c==nil then return true end
	return Duel.GetLocationCount(c:GetControler(),LOCATION_MZONE)>0
		and	Duel.IsExistingMatchingCard(aux.FilterFaceupFunction(s.filter),c:GetControler(),LOCATION_MZONE,0,1,nil)
end
