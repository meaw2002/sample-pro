<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../include/nav.jsp" %>
<div class="container">
	<h1>
		도서 검색
		<button class="btn btn-default" id="advanced-search-btn">확장검색</button>
	</h1>
	<form action="search.do" id="search-form" method="post" class="well">
		<div class="form-group">
			<label>제목</label>
			<input type="text" class="form-control" name="name"/>
		</div>
		<div class="form-group advance">
			<label>출판사</label>
			<input type="text" class="form-control " name="publisher"/>
		</div>
		<div class="form-group advance">
			<label>최저가격</label>
			<input type="number" class="form-control" name="minPrice"/>
		</div>
		<div class="form-group advance">
			<label>최고가격</label>
			<input type="number" class="form-control" name="maxPrice"/>
		</div>
		<div class="text-right">
			<button class="btn btn-primary">검색</button>
		</div>
	</form>
	
	<h3>조회 결과</h3>
	<table class="table" id="book-table">
		<colgroup>
			<col width="10%"/>
			<col width="*%"/>
			<col width="15%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>출판사</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</div>
</body>
<script type="text/javascript">
$(function(){
	$(".advance").hide();
	var isShow = false;
	$("#advanced-search-btn").click(function(){
		if(isShow){
			$(".advance").hide();
			$(this).text("확장검색");
			isShow = false;
		} else {
			$(".advance").show();
			$(this).text("간단검색");
			isShow = true;
		}
	});
	
	$("#search-form").submit(function(){
		//event.preventDefault();
		var $tbody = $("#book-table tbody").empty();
			
		$.ajax({
			type:"POST",
			url:"/book/ajax.do",
			dataType:"json",
			data:$("#search-form").serialize(),
			success:function(result){
				var books = result.items;
				console.log(books);
				
				$.each(books, function(index, item){
					var row = "<tr>";
					row += "<td>"+item.id+"</td>";
					row += "<td>"+item.name+"</td>";
					row += "<td>"+item.publisher+"</td>";
					row += "<td>"+item.price+"</td>";
					row += "</tr>";
					
					$tbody.append(row);
				});
				
			},
			error: function(){
				console.log('에러');
			}
		});
		return false;
	});
	
	/* if(!isShow){
		$("#search-form").submit(function(event){
			event.preventDefault();
			
			$.ajax({
				type:"POST",
				url:"/book/ajax.do",
				dataType:"json",
				date:$("#search-form").serialize(),
				success:function(result){
					console.log(result);
				}
			});
		});
	} */
});
</script>
</html>
























