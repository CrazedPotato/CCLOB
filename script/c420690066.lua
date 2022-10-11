-- Succubus Knight
local s, id = GetID()
function s.initial_effect(c)
  -- Tribute Summon Effect
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_F)
	e1:SetCode(EVENT_SUMMON_SUCCESS)
	e1:SetCondition(s.condition)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.condition(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return c:IsSummonType(SUMMON_TYPE_TRIBUTE) and Group.IsExists(c:GetMaterial(), Card.IsRace,1,nil,RACE_WARRIOR)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local g=c:GetMaterial()
	if not g then return end
	local atk=g:GetFirst():GetBaseAttack()
	if atk<0 then return end
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(atk/2)
	e1:SetReset(RESET_EVENT+(RESET_EVENT|RESETS_STANDARD_DISABLE)&~RESET_TOFIELD)
	c:RegisterEffect(e1)
	g:DeleteGroup()
end