function paymentMethod(value){//������� ���� �� �Է�â ���� 
		if(value=='�ſ�ī��'){tr1.style.display = '';
			tr2.style.display = 'none';
		}
		else if(value=='�޴���'){
			tr1.style.display = 'none';
			tr2.style.display = '';
		}
		else{
			tr1.style.display = 'none';
			tr2.style.display = 'none';
		}
	}
	function agreement(){//��� �� ���ǽ� ����ȵ�. 
		var chk = document.getElementById("agreement");
		if(chk.checked){
			document.write("<h3>���簡 �Ϸ�Ǿ����ϴ�.</h3>");
		}else{ 
			alert("����� �������ּ���.");
			return;
		}
	}
function init(){

	const order_id = null;
	let array_list = new Array;
	let c_data = null;
	const ctx2 = getContextPath();
	
	window.onload = function(){
		const order_id = document.getElementById('order_id').value;
		let code_name = document.getElementsByName('p_code_array');
		for(let i=0; i<code_name.length;i++){         
			let array_obj = new Object() ;
			array_obj.id = order_id;
			array_obj.code = code_name[i].value;
			array_list.push(array_obj);
		}
		console.log(array_list);
		c_data = JSON.stringify(array_list);
		console.log(c_data);
		console.log(order_id);
		
	
	}
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

}

init();