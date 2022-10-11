-- Kurama
local s, id = GetID()
function s.initial_effect(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetRange(LOCATION_MZONE)
	e1:SetTargetRange(LOCATION_MZONE,0)
	e1:SetTarget(s.target)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetCondition(s.condtion)
	e1:SetTarget(s.target)
	e1:SetValue(400)
	c:RegisterEffect(e1)
end
function s.condtion(e, tp)
	local ph=Duel.GetCurrentPhase()
	local d=Duel.GetAttacker()
	local tp=e:GetHandlerPlayer()
	return ph==PHASE_DAMAGE_CAL and d and d:IsControler(tp) and d:IsRace(RACE_WINGEDBEAST)
end
function s.target(e,c)
	return c==Duel.GetAttacker()
end


