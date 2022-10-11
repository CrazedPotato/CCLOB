-- Hard Armour
local s, id = GetID()
function s.initial_effect(c)
	aux.AddUnionProcedure(c,s.filter,false)
  -- effects
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_EQUIP)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(500)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetCode(EFFECT_UPDATE_DEFENSE)
	c:RegisterEffect(e2)
end
function s.filter(c)
	return c:IsRace(RACE_WARRIOR) and not c:IsCode(420690030)
end

