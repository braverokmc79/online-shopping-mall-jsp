<!-- ����� �ֹ��� page -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="memberMgr" class="Member.MemberMgr"/>
<jsp:useBean id="pMgr" class="Product.ProductMgr"/>
<jsp:useBean id="oMgr" class="Order.OrderMgr"/>
<style>
hr{width:600px;}
body { width: 550px;  margin: 0 auto;}
</style>
<html>
<title>�ֹ���</title>
<head>
<script type="text/javascript">
	function paymentMethod(value){//������� ���� �� �Է�â ���� 
		if(value=='1'){tr1.style.display = '';
			tr2.style.display = 'none';
		}
		else if(value=='2'){
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
	
</script>
</head>
<body>
<h2>�ֹ���</h2>
<table>
	<tr>
		<td>��ǰ����</td>
	</tr>
	<tr>
		<td>��ǰ����</td>
		<td>��ǰ�ݾ�</td>
	</tr>
	<tr>
		<%
			/* ��ǰ���� ��������  */
		%>
	</tr>
</table>
<hr/>
<table>
	<tr>
		<td>�ֹ��� ����</td>
	</tr>
	<tr>
		<td>������ ��</td>
		<td>�ֹ���</td>
	</tr>
	<tr>
		<td>�޴��� </td>
		<td>010-3841-0424</td>
	</tr>
	<tr>
		<td>�̸��� </td>
		<td>mwchoi0428@gmail.com</td>
	</tr>
</table>
<hr/>
<table>
	<tr>
		<td>�������</td>
	</tr>
	<tr>
		<td>����ּ�</td>
		<td><input name="address1" size="50" value=""></td>
	</tr>
	<tr>
		<td></td>
		<td><input name="address2" size="50" value=""></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="button" value="�ּҰ˻�"></td>
	</tr>
	<tr>
		<td>������ �̸� </td>
		<td><%	%></td>
	</tr>
	<tr>
		<td>�޴��� </td>
		<td><input name="cellphone1" size="5" value="">
		<input name="cellphone2" size="5" value="">
		<input name="cellphone3" size="5" value=""><td>
	</tr>
	<tr>
		<td>��ۿ�û���� </td>
		<td><textarea name="content" rows="5" cols="50"><%%></textarea></td>
	</tr>
</table>
<hr/>
<table>
	<tr>
		<td>������</td>
	</tr>
	<tr>
		<td>������ ����</td>
		<td>��밡���� �������� �����ϴ�.</td>
	</tr>
</table>
<hr/>
<table>
	<tr>
		<td>����ݾ�</td>
	</tr>
	<tr>
		<td>��ǰ�ݾ�&nbsp;&nbsp;&nbsp;</td>
		<td>10,000��</td>
	</tr>
	<tr>
		<td>��ۺ�&nbsp;&nbsp;&nbsp;</td>
		<td>2,500��</td>
	</tr>
	<tr>
		<td>��������ݾ�&nbsp;&nbsp;&nbsp;</td>
		<td>12,500��</td>
	</tr>
	<tr>
		<td>���Ž� 600��(5%)��������</td>
	</tr>
</table>
<hr/>
<table id="">
	<tr>
		<td>�������</td>
	</tr>
	<tr>
		<td>�Ϲݰ��� &nbsp;&nbsp;&nbsp;</td>
		<td> �ſ�ī��<input type=radio name=radio1 value=1 onclick='paymentMethod(this.value);' checked>&nbsp;&nbsp;&nbsp;
  			 	�޴���<input type=radio name=radio1 value=2 onclick='paymentMethod(this.value);'>
  			 	</td>
  	</tr>
 </table>
  <form name="card">
  <table>
  	<tr id='tr1'>
  		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  		<td>
  			<select id="card">
  				<option value="0">ī�带 �������ּ���.</option>
  				<option value="1">����(������)</option>
  				<option value="2">����</option>
  				<option value="3">��</option>
  				<option value="4">NH</option>
  				<option value="5">�Ｚ</option>
  			</select>
  			<select id="installment">
  				<option value="0">�Ͻú�</option>
  				<option value="1">2���� �Һ�</option>
  				<option value="2">3���� �Һ�</option>
  				<option value="3">4���� �Һ�</option>
  				<option value="4">5���� �Һ�</option>
  				<option value="5">6���� �Һ�</option>
  			</select>
  		</td>
	</tr>
	</table>
	</form>
	<form name="cellphone">
		<table>
			<tr id='tr2' style="display:none">
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
				<td><input name="cellphone1" size="5" value="">
				<input name="cellphone2" size="5" value="">
				<input name="cellphone3" size="5" value=""><td>
			</tr>
		</table>
	</form>
<table>
	<tr>
		<td>������� &nbsp;&nbsp;&nbsp;</td>
		<td>���̹� ����<input type=radio name=radio1 value=3 onclick='paymentMethod(this.value);'></td>
  	</tr>
</table>
<hr>
<table>
	<tr>
		<td>�������� ����/����*</td>
	</tr>
	<tr>
		<td><input id="agreement" type=checkbox value=1>�������� �ʼ�����</td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;�������� ����/�̿뵿��(�ʼ�)</td>
		<td>&nbsp;&nbsp;&nbsp;<a href="">���Ȯ��></a></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;������� ���� ��� ����(�ʼ�)</td>
		<td>&nbsp;&nbsp;&nbsp;<a href="">���Ȯ��></a></td>
	</tr>
</table>
<hr>
	<input type="submit" value="����Ϸ�" onclick="agreement()">
</body>
</html>













