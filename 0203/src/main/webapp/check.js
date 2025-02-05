/**
 * 
 */
function insertCheck(){
	if(document.form1.pcode.vlaue == ""){
		alert("상품코드가 입력되지 않았습니다.");
		form1.pcode.focus();
		return false;
	};
	if(document.form1.saledate.vlaue == ""){
		alert("판매날짜가 입력되지 않았습니다.");
		form1.saledate.focus();
		return false;
	};
	if(document.form1.scode.vlaue == ""){
		alert("매장코드가 입력되지 않았습니다.");
		form1.scode.focus();
		return false;
	};
	if(document.form1.amount.vlaue == ""){
		alert("판매수량이 입력되지 않았습니다.");
		form1.amount.focus();
		return false;
	};
	alert("판매등록이 입력되지 않았습니다.");
	return true;
}

function resetClick(){
	alert("정보를 지우고 처음부터 다시 입력합니다.");
	pcode.value="";
	saledate.value="";
	scode.value="";
	amount.value="";
	
}
















