<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp" %>

<div class="content">

	<h3>공지사항 상세보기</h3>
	<p>
		<a href="noticeForm.jsp">[글쓰기]</a>
		<a href="noticeList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>">[글목록]</a>
	</p>
	
	<%
		int noticeno = Integer.parseInt(request.getParameter("noticeno"));
	
		dto = dao.read(noticeno);
		
		if (dto == null) {
			out.println("존재하지 않는 글입니다.");
		} else {
		%>
			<div>
				
				<br>
				<table>
					<tr>
						<th>카테고리</th>
						<td colspan="5">
							<%
								String categoty = dto.getCategory();
								
								if(categoty.equals("N")) {
									out.print("공지사항");
								} else if(categoty.equals("E")) {
									out.print("이벤트");
								} else if(categoty.equals("P")) {
									out.print("프로그램");
								} else if(categoty.equals("A")) {
									out.print("기사");
								}
							%>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="5"><%=dto.getSubject()%></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><%=dto.getRegdate()%></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="2" style="text-align: left; height: 100px;">
							<%
							// 특수문자 및 엔터를 <br>태그로 치환하기
							String content = Utility.convertChar(dto.getContent());
							out.print(content);
							%>
						</td>
					</tr>
				</table>
			</div>
			<form method="post" action="noticeDel.jsp?noticeno=<%=noticeno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" onsubmit="return removeCheck()">
				<button type="button" onClick="location.href='noticeUpdate.jsp?noticeno=<%=noticeno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>'">수정</button>
				<input type="submit" value="삭제">
			</form>
	<%
		} // if end
	%>
</div>

<%@ include file="../footer.jsp" %>