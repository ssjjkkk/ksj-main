<%@page import="kr.or.dw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세 보기</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.js"></script>
<%
	MemberVO memVO = (MemberVO)request.getAttribute("memDtl");
%>
<script>
	$(function() {
		let changeFlag = false;
		let mem_name = "<%= memVO.getMem_name()%>";
		let mem_tel = "<%= memVO.getMem_tel()%>";
		let mem_addr = "<%= memVO.getMem_addr()%>";
		let oldValArr = [mem_name, mem_tel, mem_addr];
		
		$('#memberViewForm').on('propertychange keyup paste', function() {
			let inputArr = $(this).find('input[type=text]');
			for(let i = 0; i < inputArr.length; i++){
// 				console.log('inputArr의 ' + (i+1) + '번째 값 : ' + $(inputArr[i]).val());
// 				console.log('oldValArr의 ' + (i+1) + '번째 값 : ' + oldValArr[i]);
				if(oldValArr[i] == $(inputArr[i]).val()) {
					changeFlag = false;
				}else {
					changeFlag = true;
					break;
				}
			};
			console.log(changeFlag);
		});
		
		$('#listBtn').on('click', function() {
			location.href = "<%= request.getContextPath()%>/member/memberList.do";
		});
		
		$('#updateBtn').on('click', function() {
			if(changeFlag){
				$('#memberViewForm').submit();	
			}else {
				alert("변경된 정보가 없습니다.");
			}
			
		});
		
		$('#memberViewForm').on('propertychange', function() {
			console.log('바뀌었다!');
		})
		
		$('#deleteBtn').on('click', function() {
			location.href = "<%= request.getContextPath()%>/member/memberDelete.do?mem_id=<%= memVO.getMem_id()%>";
		});
		
	})
</script>
</head>
<body>
	<h2>회원 정보 상세 보기</h2>
	<form id="memberViewForm" method="post" action="<%= request.getContextPath()%>/member/memberUpdate.do">
		<table border="1">
			<tr>
				<td>회원ID</td>
				<td><%= memVO.getMem_id()%></td>
				<input type="hidden" name="id" value="<%= memVO.getMem_id()%>">
			</tr>
			<tr>
				<td>회원이름</td>
				<td><input type="text" name="name" value="<%= memVO.getMem_name()%>"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tel" value="<%= memVO.getMem_tel()%>"></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" name="addr" value="<%= memVO.getMem_addr()%>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="저장" id="updateBtn">
					<input type="button" value="삭제" id="deleteBtn">
					<input type="button" value="회원목록" id="listBtn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>