-- Metal Dragon
local s, id = GetID()
function s.initial_effect(c)
--fusion material
	c:EnableReviveLimit()
	Fusion.AddProcMix(c,true,true,420690065,420690037)
  -- effects
  local e6=Effect.CreateEffect(c)
	e6:SetType(EFFECT_TYPE_SINGLE)
	e6:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e6:SetRange(LOCATION_MZONE)
	e6:SetCode(EFFECT_IMMUNE_EFFECT)
	e6:SetValue(s.efilter)
	c:RegisterEffect(e6)
end
function s.efilter(e,te)
	return te:IsActiveType(TYPE_SPELL)
end