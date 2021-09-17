function sendSubmit(form1){
	var pwd = document.form1.pwd.value; 
	var mail = document.form1.mail.value;
	var name = document.form1.name.value; 
	var sex = document.form1.sex.value; 
	var feature = document.form1.feature.value; 
	var area = document.form1.area.value; 
	var num = document.form1.num.value; 
	if(pwd == ""){
		alert("pwd error");
		form1.pwd.focus();
		return false;
	}
	if (mail == ""){
		alert("mail error");
		form1.mail.focus();
		return false;
	}
	if (name == ""){
		alert("name error");
		form1.name.focus();
		return false;
	}
	if (sex == ""){
		alert("sex error");
		form1.sex.focus();
		return false;
	}
	if (feature == ""){
		alert("feature error");
		form1.feature.focus();
		return false;
	}
	if (area == ""){
		alert("area error");
		form1.area.focus();
		return false;
	}
	if (num = ""){
		alert("num error");
		form1.num.focus();
		return false;
	}
	if (area != "" && pwd != "" && mail != "" && name != "" && sex != "" && feature != "" && num != ""){
		alert("注册成功");
		form1.submit();
		return true;
	}
}

function chk(form2){
	var pwd = document.form2.pwd.value; 
	var num = document.form2.num.value; 
	if (pwd == ""){
		alert("pwd error");
		form2.pwd.focus();
		return false;
	}
	if (num == ""){
		alert("num error");
		form2.num.focus();
		return false;
	}
	if (pwd != "" && num != ""){
		form2.submit();
		return true;
	}
}

function del(){
	alert("注销后需要重新注册！");
}

function mod(form3){
	alert("修改成功");
	form3.submit();
}
