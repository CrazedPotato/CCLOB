-- Larvas
local s, id = GetID()
function s.initial_effect(c)
  -- effects
  local e1=Effect.CreateEffect(c)
  e1:SetType(EFFECT_TYPE_TRIGGER_O+EFFECT_TYPE_SINGLE)
  e1:SetCode(EVENT_SUMMON_SUCCESS)
  e1:SetCost(s.cost)
  e1:SetOperation(s.operation)
  c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsRace(RACE_BEAST) and c:IsFaceup() and c:IsReleasable()
end
function s.cost(e,tp,eg,ep,ev,re,r,rp,chk)
if chk==0 then return Duel.CheckReleaseGroupCost(tp,s.filter,1,false,nil,e:GetHandler()) end
	local g=Duel.SelectReleaseGroupCost(tp,s.filter,1,1,false,nil,e:GetHandler())
	Duel.Release(g,REASON_COST)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.ChangePosition(c,POS_FACEUP_DEFENSE)
	local e1=Effect.CreateEffect(c)
	e1.SetType(e1, EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_SET_DEFENSE)
	e1:SetValue(c:GetDefense()*2)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD)
	c:RegisterEffect(e1)
end
