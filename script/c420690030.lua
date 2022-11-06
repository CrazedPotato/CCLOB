-- Hard Armour
local s, id = GetID()
function s.initial_effect(c)
	--equip
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(1068)
	e1:SetCategory(CATEGORY_EQUIP)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_MZONE)
	e1:SetTarget(Auxiliary.UnionTarget(s.filter,false))
	e1:SetOperation(Auxiliary.UnionOperation(s.filter))
	c:RegisterEffect(e1)
	--unequip
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(2)
	e2:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetRange(LOCATION_SZONE)
	e2:SetTarget(Auxiliary.UnionSumTarget())
	e2:SetOperation(Auxiliary.UnionSumOperation())
	c:RegisterEffect(e2)
	--eqlimit
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetCode(EFFECT_UNION_LIMIT)
	e3:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e3:SetValue(Auxiliary.UnionLimit(s.filter))
	c:RegisterEffect(e3)
	--Atk up
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_EQUIP)
	e4:SetCode(EFFECT_UPDATE_ATTACK)
	e4:SetValue(500)
	c:RegisterEffect(e4)
	--Def up
	local e5=e4:Clone()
	e5:SetCode(EFFECT_UPDATE_DEFENSE)
	c:RegisterEffect(e5)
end
s.listed_names={id}
function s.filter(c)
	return c:IsRace(RACE_WARRIOR) and not c:IsCode(420690030)
end
