-- Frenzied Panda
local s, id = GetID()
function s.initial_effect(c)
  -- effects
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_ATKCHANGE)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e1:SetCode(EVENT_BATTLE_DAMAGE)
	e1:SetRange(LOCATION_ONFIELD)
	e1:SetCondition(s.condition)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end

function s.condition(e,tp,eg,ep,ev,re,r,rp)
	local tc=eg:GetFirst():GetBattleTarget()
	return ep==tp and tc:IsControler(tp) and tc:IsRace(RACE_BEAST)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsFaceup() then
		local e1=Effect.CreateEffect(c)
		e1.SetType(e1, EFFECT_TYPE_SINGLE)
		e1.SetCode(e1, EFFECT_SET_ATTACK)
		e1:SetValue(2400)
		e1:SetReset(RESET_PHASE+PHASE_END)
		c:RegisterEffect(e1)		
	end
end