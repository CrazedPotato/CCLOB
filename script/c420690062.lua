-- Sparks
local s, id = GetID()
function s.initial_effect(c)
  -- activate
  local e1 = Effect.CreateEffect(c)
  e1:SetType(EFFECT_TYPE_ACTIVATE)
  e1:SetCategory(CATEGORY_DAMAGE)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetTarget(s.tg)
	e1:SetOperation(s.op)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return (c:IsRace(RACE_PYRO) or c:IsRace(RACE_THUNDER)) and c:IsFaceup()
end
function s.tg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.filter,e:GetHandler():GetControler(),LOCATION_MZONE,0,1,nil) end
	Duel.SetTargetPlayer(1-tp)
	local dmg=Duel.GetMatchingGroupCount(s.filter,e:GetHandler():GetControler(),LOCATION_MZONE,0,nil)*300
	Duel.SetTargetParam(dmg)
	Duel.SetOperationInfo(0,CATEGORY_RECOVER,nil,0,tp,dmg)
end
function s.op(e,tp,eg,ep,ev,re,r,rp)
	local p,d=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER,CHAININFO_TARGET_PARAM)
	Duel.Damage(p,d,REASON_EFFECT)
end