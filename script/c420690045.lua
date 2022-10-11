-- Monster Egg
local s, id = GetID()
function s.initial_effect(c)
  -- effects
  --double tribute
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_DOUBLE_TRIBUTE)
	e1:SetValue(1)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetCategory(CATEGORY_DRAW)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_F)
	e2:SetCode(EVENT_RELEASE)
	e2:SetOperation(s.operation)
	c:RegisterEffect(e2)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
		
		Duel.Draw(tp,1,REASON_EFFECT)
end

