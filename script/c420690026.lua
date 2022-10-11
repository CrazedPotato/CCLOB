-- Giant Soldier of Stone
local s, id = GetID()
function s.initial_effect(c)
  -- effects
  local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_HANDES+CATEGORY_DRAW)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_F)
	-- Battle Damage Trigger
	e1:SetCode(EVENT_BATTLE_DAMAGE)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DISCARD)
	local g=Duel.DiscardHand(tp,nil,0,1,REASON_EFFECT+REASON_DISCARD)
	Duel.Draw(tp,g,REASON_EFFECT)
	Duel.Hint(HINT_SELECTMSG,1-tp,HINTMSG_DISCARD)
	local g=Duel.DiscardHand(1-tp,nil,0,1,REASON_EFFECT+REASON_DISCARD)
	Duel.Draw(1-tp,g,REASON_EFFECT)
end
