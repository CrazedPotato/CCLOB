-- King Fog
local s, id = GetID()
function s.initial_effect(c)
  -- buff
  local e1=Effect.CreateEffect(c)
  e1:SetType(EFFECT_TYPE_FIELD)
  e1:SetCode(EFFECT_UPDATE_ATTACK)
  e1:SetRange(LOCATION_MZONE)
  e1:SetTargetRange(LOCATION_MZONE,0)
  e1:SetTarget(aux.TargetBoolFunction(Card.IsRace,RACE_FIEND))
  e1:SetValue(500)
  c:RegisterEffect(e1)
  local e2=e1:Clone()
  e2:SetCode(EFFECT_UPDATE_DEFENSE)
  c:RegisterEffect(e2)
  --Debuff
  local e3=e1:Clone()
  e3:SetTarget(aux.TargetBoolFunction(Card.IsRace,RACE_ALL-RACE_FIEND))
  e3:SetValue(-500)
  c:RegisterEffect(e3)
  local e4=e3:Clone()
  e4:SetCode(EFFECT_UPDATE_DEFENSE)
  c:RegisterEffect(e4)
  --SS Condition
  local e5=Effect.CreateEffect(c)
	e5:SetType(EFFECT_TYPE_FIELD)
	e5:SetCode(EFFECT_SPSUMMON_PROC)
	e5:SetProperty(EFFECT_FLAG_UNCOPYABLE)
	e5:SetRange(LOCATION_HAND)
	e5:SetCondition(s.condition)
	c:RegisterEffect(e5)
end
function s.condition(e,c)
	if c==nil then return true end
	return Duel.GetLocationCount(c:GetControler(),LOCATION_MZONE)>0
		and	Duel.IsExistingMatchingCard(aux.FilterFaceupFunction(Card.IsRace,RACE_FIEND),c:GetControler(),LOCATION_MZONE,0,1,nil)
end
