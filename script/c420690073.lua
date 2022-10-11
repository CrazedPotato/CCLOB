-- Turtle Tiger
local s, id = GetID()
function s.initial_effect(c)
  -- effects
  local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_CANNOT_BE_BATTLE_TARGET)
	e1:SetValue(s.value)
	c:RegisterEffect(e1)
end
function s.value(e, c)
	return not c:IsImmuneToEffect(e) and c:IsSummonType(SUMMON_TYPE_SPECIAL)
end