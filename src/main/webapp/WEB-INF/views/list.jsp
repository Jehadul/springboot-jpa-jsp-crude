<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<body>
<div class="container">
 <form action="<c:url value="/"/>" method="post">
 	<div class="row"  style="margin-top: 10px; background-color: aliceblue;">
	 	<div class="col-md-6">
	 		<h2>Employee List</h2>
	 	</div>
	 	<div class="col-md-3">
 			<ul style="list-style-type:none; margin-top: 10px;">
				<li><a href="${pageContext.request.contextPath}/" data-ajax="true">Create</a>
				</li>
			</ul>
 		</div>
 		<div class="col-md-3" style="margin-top: 10px;">
 			<p class="fa fa-bell-o" aria-hidden="true" style="font-size: 30px;">
 				<span id = "notification" style="font-size: 20px;">0</span>
 			</p>
 		</div>
 	</div>
 	<div class="row">
 		<table class="table table-striped table-bordered table-hover table-full-width" id="data_table">
			<thead>
				<tr>
					<th class="center">#</th>
					<th>Name</th>
					<th>Mobile</th>
					<th data-orderable="false" class="text-center">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${entityList}" var="entity" varStatus="tr">
					<tr class="row_no_${tr.count}">
						<td class="center">${tr.count}</td>
						<td class="">${entity.name}</td>
						<td class="">${entity.mobile}</td>
						<td class="text-center">
							<a href="${pageContext.request.contextPath}/edit/${entity.id}">Edit</a> |
							<a href="${pageContext.request.contextPath}/delete/${entity.id}">Delete</a>
						</td> 
					</tr>
				</c:forEach>
			</tbody>
		</table>
 	</div>
  </form>
</div>
<script>
	var dt = new Date();
	
	 $(document).ready( function () {
		 setInterval(function(){
			 getNewEmp();
			}, 5000);
	});
	 
	 
	 function getNewEmp() {
		 $.ajax({
				url : "${pageContext.request.contextPath}/getEmployee",
				method : 'GET',
				data : {
					date :dateFormater(dt)
				},
				dataType : 'json',
				success : function(data) {
					 var val =  parseInt($("#notification").text());
					 dt = new Date();
					 if(data.length > 0) {
						 var rowCount = $('#data_table tr').length;
						 $("#notification").text(val + data.length);
						 
						 for (var i = 0; i < data.length; i++) {
							 $("#data_table tbody").append(
							'<tr class="cat-tr">'+
								 '<td>'+(rowCount)+'</td>'+
								 '<td>'+data[i].name+'</td>'+
								 '<td>'+data[i].mobile+'</td>'+
								 '<td align="center"><a href="${pageContext.request.contextPath}/edit/'+data[i].id+'">Edit</a> | ' +
								 '<a href="${pageContext.request.contextPath}/delete/'+data[i].id+'">Delete</a></td>'+
							 '</tr>');
						 }
					 }
				}
			})
	 }
	 
	 
	 function dateFormater(vDate){
		// adjust 0 before single digit date
		let date = ("0" + vDate.getDate()).slice(-2);
		// current month
		let month = ("0" + (vDate.getMonth() + 1)).slice(-2);
		// current year
		let year = vDate.getFullYear();
		// current hours
		let hours = vDate.getHours();
		// current minutes
		let minutes = vDate.getMinutes();
		// current seconds
		let seconds = vDate.getSeconds();
		// prints date & time in YYYY-MM-DD HH:MM:SS format
		
		let formate = year + "-" + month + "-" + date + " " + hours + ":" + minutes + ":" + seconds;
		return formate;
	 }
</script>
</body>
