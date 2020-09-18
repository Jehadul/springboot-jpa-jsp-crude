<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

<body>
<div class="container">
 <form action="<c:url value="/"/>" method="post">
 	<div class="row"  style="margin-top: 10px; background-color: aliceblue;">
	 	<div class="col-md-6">
	 		<h2>Employee List</h2>
	 	</div>
	 	<div class="col-md-6">
 			<ul style="list-style-type:none;">
				<li><a href="${pageContext.request.contextPath}/" data-ajax="true">Create</a>
				</li>
			</ul>
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
	/*  $(document).ready( function () {
	    $('#data_table').DataTable();
	} );  */	
</script>
</body>
