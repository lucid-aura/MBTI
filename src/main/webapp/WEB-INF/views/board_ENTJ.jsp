<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align; border; 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">글쓴이</th>
					<th style="background-color: #eeeeee; text-align: center;">작성날짜</th>
					<th style="background-color: #eeeeee; text-align: center;">조회횟수</th>
					<th style="background-color: #eeeeee; text-align: center;">댓글개수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>안녕하세요.</td>
					<td>홍길동</td>
					<td>22/01/13</td>
					<td>1</td>
					<td>0</td>
				</tr>
			</tbody>
		</table>
		<a href="board_write.jsp" class="btn btn-primary pull-right">글쓰기</a>	
	</div>

</div>
</body>
</html>