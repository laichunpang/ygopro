--オーバーレイ・リジェネレート
function c27068117.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetTarget(c27068117.target)
	e1:SetOperation(c27068117.activate)
	c:RegisterEffect(e1)
end
function c27068117.filter(c)
	return c:IsFaceup() and c:IsType(TYPE_XYZ)
end
function c27068117.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and c27068117.filter(chkc) end
	if chk==0 then return not e:GetHandler():IsLocation(LOCATION_GRAVE)
		and Duel.IsExistingTarget(c27068117.filter,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TARGET)
	Duel.SelectTarget(tp,c27068117.filter,tp,LOCATION_MZONE,LOCATION_MZONE,1,1,nil)
end
function c27068117.activate(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) and tc:IsFaceup() and c:IsRelateToEffect(e) then
		c:CancelToGrave()
		Duel.Overlay(tc,Group.FromCards(c))
	end
end
