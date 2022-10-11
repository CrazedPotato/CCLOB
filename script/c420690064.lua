-- Spirt of the Harp
local s, id = GetID()
function s.initial_effect(c)
  -- effects
  local e1=Effect.CreateEffect(c)
  e1:SetType(EFFECT_TYPE_FIELD)
  e1:SetCode(EFFECT_UPDATE_DEFENSE)
  e1:SetRange(LOCATION_MZONE)
  e1:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
  e1:SetTarget(aux.TargetBoolFunction(Card.IsAttribute,ATTRIBUTE_LIGHT))
  e1:SetValue(400)
  c:RegisterEffect(e1)
  local e2=Effect.CreateEffect(c)
  e2:SetCategory(CATEGORY_DESTROY)
  e2:SetType(EFFECT_TYPE_TRIGGER_F+EFFECT_TYPE_FIELD)
  e2:SetCode(EVENT_BATTLE_DESTROYED)
  e2:SetRange(LOCATION_MZONE)
  e2:SetCondition(s.condition)
  e2:SetOperation(s.operation)
  c:RegisterEffect(e2)
end
function s.condition(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetBattleMonster(tp)
	return tc:GetLocation() ~= LOCATION_MZONE
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Destroy(c,REASON_EFFECT)
end