<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="../includes/head.jspf"%>
<script src="/resources/vendor/ckeditor/ckeditor.js"></script>
</head>

<body>

	<div id="wrapper">

		<%@ include file="../includes/nav.jspf"%>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">/modify</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body">
						<p>#<c:out value="${board.bno}"/>번 글 수정</p>
						<p>최종 수정: <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${board.updateDate}"/></p>
							<form role="form" method="post" id="modifyForm">
							
								<div class="form-group">
									<label>제목</label>
									<input class="form-control" name="title" value="<c:out value='${board.title}'/>">
								</div>
								
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="15" name="content" id="content"><c:out value='${board.content}'/></textarea>
								</div>
								
								<div class="form-group">
									<label>이름</label>
									<input class="form-control" name="writer" readonly="readonly" value="<c:out value='${board.writer}'/>">
								</div>
								
								<input type="hidden" name="bno" value="${board.bno}">
								<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
								<input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>">
								<input type="hidden" name="type" value="<c:out value='${cri.type}'/>">
								<div class="row">
									<button type="submit" class="btn btn-primary" formaction="/board/modify">수정</button>
									<button type="submit" class="btn btn-danger" formaction="/board/remove">삭제</button>
									<a href="/board/list"><button type="button" class="btn btn-success">취소</button></a>
								</div>
								
							</form>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<%@ include file="../includes/footer.jspf"%>
	<script>
		CKEDITOR.replace('content',{
			language: 'ko'
		});
		$('form').on('submit',function(){
			for (instance in CKEDITOR.instances) {
	            CKEDITOR.instances[instance].updateElement();
	    	}
		})
	</script>

</body>

</html>
