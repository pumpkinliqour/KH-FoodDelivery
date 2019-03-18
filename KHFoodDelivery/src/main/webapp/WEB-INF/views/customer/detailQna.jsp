<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>
	div#context-area{ min-height: 200px; }
	div.row div.bt-group{float:right;}
	button {
		background-color: black;
		border-color: white;
		color:white;
	}
	div.de{margin-top:-10%;}
</style>

<script>	

	//문의글 수정
	function updateQna(){
		$('#qnaUpdateModal').modal();
	}
	/* 문의 글 삭제 */
	function deleteQna(){
		location.href="${path}/customer/deletememberQna.do?no=${mq.qnaCode}&memberId=${mq.memberId}";
	}
</script>

<section>
	<div class="container de">
		<div class="row">
			<div class="col-sm-12">
			</div>
			<div class="col-sm-2">
				<p>카테고리: <b>${mq.qnaCategory }</b></p>
			</div>
			<div class="col-sm-2">
				<p>작성자: <b>${mq.memberId }</b></p>
			</div>
			<div class="col-sm-3">
				<p>작성일:  <b>${mq.formatWriteDate }</b></p>
			</div>
			<div class="bt-group col-sm-5">			
				<button type="button" class="btn btn-default" onclick="deleteQna()">삭제</button>
				<button type="button" class="btn btn-default" onclick="updateQna();">수정</button>	
				<button type="button" class="btn btn-default" onclick="location.href='${path }/member/qnaList.do?memberId=${sessionScope.logined}'">목록으로</button>			
			</div>	
		</div>
		<hr/>
		<br/>	
		<div class="row">			
			<div class="col-sm-12" id="context-area">
				<h4>${mq.qnaContent }</h4>
			</div>
			<div class="col-sm-2 back"></div>
		</div>
		</div>
		</section>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


<!-- 모달 구현 -->
<div class="modal" id="qnaUpdateModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">문의글 수정</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<form action="${path}/customer/memberQnaUpdate.do" method="post">
				<div class="modal-body" style="height: 500px;">
					<table class="table">
						<tr>
							<th style="vertical-align: middle">카테고리</th>
							<td><input type="text" name="qnaCategory" class="form-control" value="${mq.qnaCategory }"/></td>						
						</tr>					
						<tr>
							<th style="vertical-align: middle">아이디</th>
							<td><input type="text" name="memberId" class="form-control" value="${mq.memberId }" readonly/></td>						
						</tr>						
						<tr>
							<th style="vertical-align: middle">등록일</th>
					<td><input type="text" name="formatWriteDate" class="form-control" value="${mq.formatWriteDate}" readonly/></td>						
						</tr>	
						<tr>
							<th style="vertical-align: middle">제목</th>
							<td><input type="text" name="qnaTitle" class="form-control" value="${mq.qnaTitle}"/></td>						
						</tr>						 
					
						<tr>
							<th style="vertical-align: middle">문의글</th>
							<td><textarea name="qnaContent" class="form-control" style="resize: none" rows="6">${mq.qnaContent }</textarea></td>						
						</tr>															
					</table>
						<input type="hidden" name="qnaCode" value="${mq.qnaCode }"/>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-outline-success" value="수정"/>
				</div>
			</form>
		</div>  
	</div>
</div>

