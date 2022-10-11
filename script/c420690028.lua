-- Green Phantom King
local s, id = GetID()
function s.initial_effect(c)
  -- draw
  local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_DRAW)
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_MZONE)
	e1:SetHintTiming(0,TIMING_END_PHASE)
	e1:SetCondition(s.condition)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.condition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetTurnPlayer()~=tp and e:GetHandler():IsPosition(POS_FACEUP_DEFENSE) and Duel.IsPlayerCanDraw(tp,1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.ChangePosition(e:GetHandler(),POS_FACEUP_ATTACK) > 0 then
		Duel.BreakEffect()
		Duel.Draw(tp,1,REASON_EFFECT)
	end
end
