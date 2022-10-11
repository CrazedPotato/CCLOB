-- The Furious Sea King
local s, id = GetID()
function s.initial_effect(c)
  -- effects
  local e1=Effect.CreateEffect(c)
  e1:SetCategory(CATEGORY_DESTROY)
  e1:SetType(EFFECT_TYPE_TRIGGER_O+EFFECT_TYPE_FIELD)
  e1:SetRange(LOCATION_MZONE)
  e1:SetProperty(EFFECT_FLAG_DELAY)
  e1:SetCode(EVENT_BATTLE_DESTROYING)
  e1:SetCountLimit(1,id,EFFECT_COUNT_CODE_OATH)
  e1:SetCondition(s.condition)
  e1:SetOperation(s.operation)
  c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsFacedown()
end
function s.condition(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetBattleMonster(tp)
	return not c:IsStatus(STATUS_BATTLE_DESTROYED) and tc:IsAttribute(ATTRIBUTE_WATER) and tc:IsStatus(STATUS_OPPO_BATTLE) and Duel.IsExistingTarget(s.filter,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,nil)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
	local g=Duel.SelectTarget(tp,s.filter,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,nil)
	local tc=g:GetFirst()
	Duel.Destroy(tc,REASON_EFFECT)
end