<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<div class="container">
 <form action="<c:url value="/update/${entity.id}"/>" method="post">
 	<div class="row"  style="margin-top: 10px; background-color: aliceblue;">
 	<div class="col-md-6">
 		<h2>Edit Employee</h2>
 	</div>
 	<div class="col-md-6">
 		<ul style="list-style-type:none;">
			<li><a href="${pageContext.request.contextPath}/list" data-ajax="true">List</a> |
			<a href="${pageContext.request.contextPath}/" data-ajax="true">Create</a>
			</li>
		</ul>
 	</div>
 	</div>
 	<div class="col-md-6">
	 	<div class="form-group">
	      <label for="name">Email:</label>
	      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" value="${entity.name}">
	    </div>
	    <div class="form-group">
	      <label for="mobile">Mobile:</label>
	      <input type="text" class="form-control" id="mobile" placeholder="Enter mobile" name="mobile" value="${entity.mobile}">
	    </div>
	    <button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </form>
</div>
