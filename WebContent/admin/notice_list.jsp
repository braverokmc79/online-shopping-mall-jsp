<!-- list.jsp -->
<%@page import="admin.NoticeBean"%>
<%@page import="admin.UtilMgr"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="admin.AdminMgr"/>

<%@ include file="../top.jsp" %>

	<%@ include file="./admin_side.jsp"%> 
	
	<link rel="stylesheet" type="text/css" href="./css/notice_list.css">
	
<%
		request.setCharacterEncoding("EUC-KR");
		
		if(admin_id==null || admin_id.length()==0){
			response.sendRedirect(cpath+"/index.jsp");
		}else{			
		
		}
		
		int totalRecord = 0;//총게시물 개수
		int numPerPage = 10;//페이지당 레코드 개수 (5,10,15,30)
		int pagePerBlock = 15;//블럭당 페이지 개수
		int totalPage = 0;//총 페이지 개수
		int totalBlock = 0;//총 블럭 개수
		int nowPage = 1;//현재 페이지
		int nowBlock = 1;//현재 블럭
		
		//page에 보여질 게시물 개수 값
		if(request.getParameter("numPerPage")!=null&&
				!request.getParameter("numPerPage").equals("null")){
			numPerPage = UtilMgr.parseInt(request, "numPerPage");
		}
		
		int start = 0;//테이블에 시작 번호
		int cnt = numPerPage;
		
		//검색에 필요한 변수
		String keyField = "" , keyWord = "";
		
		//검색일때 
		if(request.getParameter("keyWord")!=null){
			keyField = request.getParameter("keyField");
			keyWord = request.getParameter("keyWord");
		}
		
		//검색 후에 다시 처음화면으로 요청
		if(request.getParameter("reload")!=null&&
				request.getParameter("reload").equals("true")){
			keyField = "";  keyWord = "";
		}
		
		totalRecord = mgr.getTotalCount(keyField, keyWord);
		//out.print(totalRecord);
		
		//nowPage를 요청한 경우
		if(request.getParameter("nowPage")!=null){
			nowPage = UtilMgr.parseInt(request, "nowPage");
		}
		//테이블 시작 번호
		start = (nowPage*numPerPage)-numPerPage;
		
		//전체페이지수 (전체레코드개수/페이지당 레코드 개수) 올림.
		 totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//전체블럭수 (전체페이지수/블럭당 페이지 개수) 올림.
		 totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//현재블럭 (현재페이지수/블럭당 페이지 개수) 올림.
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
 %>


<script type="text/javascript">
	function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
	
	function list() {
		document.listFrm.action = "notice_list.jsp";
		document.listFrm.submit();
	}
	
	function numPerFn(numPerPage) {
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "notice_view.jsp";
		document.readFrm.submit();
	}
	
	function block(block) {
		document.readFrm.nowPage.value = 
			<%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();	
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();	
	}
</script>
	
<div id="manager">
<h1 class="title">공지사항</h1>

	<div class="notice_list_wrapper">
			
			<div id="btn_frm">
				<input class="btn" type="button" value="글쓰기" onclick="location.href='notice_post.jsp?n_id=<%=admin_id%>'">
				<input class="btn" type="button" value="처음으로" onclick="location.href='javascript:list()'">
			</div>
	
			<table class="mgr_table horHead notice_list">
			
				<tr>
					<th>번 호</th>
					<th>카테고리</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>작성일</th>				
				</tr>
				
				
			<%
					Vector<NoticeBean> vlist = mgr.getNoticeList(keyField, keyWord, start, cnt);
					int listSize = vlist.size();//브라우저 화면에 표시될 게시물 번호
					if(vlist.isEmpty()){
			%>
				<tr>
					<td colspan="5">
						등록된 게시물이 없습니다.
					</td>
				</tr>
			<%
			
					}else{
						
					for(int i=0;i<numPerPage;i++){
						if(i==listSize) break; //제일 마지막 페이지가 10가 아닌 경우
						NoticeBean bean = vlist.get(i);
						int n_index = bean.getN_index ();
						String n_id = bean.getN_id();
						String n_category = bean.getN_category ();
						String n_title = bean.getN_title();
						String n_content = bean.getN_content ();
						String n_date = bean.getN_date();
						String n_file_name = bean.getN_file_name ();
						int n_file_size = bean.getN_file_size();
			%>
			
			<tr>
				<td><%=totalRecord-start-i%></td>
				<td><%=n_category%></td>
				<td><a href="notice_view.jsp?n_index=<%=n_index%>"><%=n_title%></a></td>
				<%if(n_id.equals("m1") || n_id.equals("m2") || n_id.equals("m3") ){ %>
				<td>관리자</td><%}else{%>
				<td>관리자아님</td><%} %>
				<td><%=n_date%></td>
			
			</tr>
			<%}//---for%>	
			<%}//----if-else%>		

			</table>
	
	</div>
	
	<table  class="pagination_tb">
		<tr>
			<td>
				<%if(totalPage>0){ %>
					<!-- 이전 블럭 -->
					<%if(nowBlock>1){%>
						<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
					<%}%>
					<!-- 페이징 -->
					<% 
							int pageStart = (nowBlock-1)*pagePerBlock+1;
							int pageEnd = (pageStart+pagePerBlock)<totalPage?
									pageStart+pagePerBlock:totalPage+1;
							for(;pageStart<pageEnd;pageStart++){
					%>
						<a href="javascript:pageing('<%=pageStart%>')">
							<span class="page_btn">
								<%if(pageStart==nowPage){%><span id="nowPage_btn"><%}%>
									<%=pageStart%>
								<%if(pageStart==nowPage){%></span><%}%>
							</span>
						</a>
					<%}//---for%>
					<!-- 다음 블럭 -->
					<%if(totalBlock>nowBlock){%>
						<a href="javascript:block('<%=nowBlock+1%>')">...next</a>
					<%}%>
				<%}%>	
			</td>
		</tr>
	</table>
	
	<form name="searchFrm" id="notice_searchFrm">
				
						
		<table class="mgr_table verHead notice_searchTable">
	 		<tr>
	  			<td>
	   				<select id="notice_search_select" name="keyField" size="1" >
	    				<option value="n_title"> 제 목</option>
	    				<option value="n_content"> 내 용</option>
	   				</select>
	   				<input id="notice_search_input" name="keyWord">
	   				<input id="search_btn" type="button"  value="검색" onClick="javascript:check()">
	   				<input type="hidden" name="nowPage" value="1">
	  			</td>
	 		</tr>
		</table>
	</form>
		
	

	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="nowPage" value="1">
	</form>
	
	<form name="readFrm">
		<input type="hidden" name="num">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	</form>
</div>



	
<!----------------->
<!--  작업 영역 끝 -->
<!----------------->
	
</div> <!--  #btn_manager_wrapper (버튼메뉴 + manager) : admin_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + manager) : admin_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>

</body>
</html>
