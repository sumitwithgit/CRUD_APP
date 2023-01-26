<%@page import="com.crud.entities.Message"%>
<%@page import="com.crud.db.connectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.crud.dao.studentDao"%>
<%@page import="com.crud.entities.student"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="Error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.primary-background {
	background-color: #418589;
}
</style>
</head>
<body>
	<h1 class="text-white primary-background text-center m-0">CRUD
		Application</h1>
		
	<div class="container-fluid">
		<div class="container">
			<br>
			<!-- modal start -->

			<!-- Button trigger modal -->
			<div class="text-right">
				<i class="fa fa-plus text-primary"
					style="font-size: 30px; cursor: pointer;" class="btn btn-primary"
					data-toggle="modal" data-target="#exampleModal">&nbsp;Add New
					Record</i>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header primary-background text-white">
							<h5 class="modal-title" id="exampleModalLabel">Enter Details</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
			<form action="addRecord" method="post" id="addRecordForm">
						<div class="modal-body">
								<div class="form-group">
									<label for="name">Enter Name</label> 
									<input required="required" name="name" type="text" class="form-control" id="name"
										aria-describedby="emailHelp" placeholder="Enter Name">
								</div>
								<div class="form-group">
									<label for="email">Enter Email</label> 
									<input required="required" name="email" type="email" class="form-control" id="email"
										aria-describedby="emailHelp" placeholder="Enter Email">
								</div>
								<div class="form-group">
									<label for="mobile">Enter Mobile</label> 
									<input required="required" name="mobile" type="number" class="form-control" id="mobile"
										aria-describedby="emailHelp" placeholder="Enter Mobile">
								</div>
							<input type="reset" class="btn btn-outline-secondary"
								 value="Reset">
							<button type="submit" class="btn btn-outline-primary">Save</button>
						</div>
				</form>
					</div>
				</div>
			</div>

			<!-- modal end -->


			<br>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Mobile No.</th>
						<th scope="col">Operation</th>
					</tr>
				</thead>
				<tbody>
					
						<%
							studentDao sdao=new studentDao(connectionProvider.getConnection());
							ArrayList<student> list=sdao.getAllRecord();
							for(student s:list)
							{
								%>
								<tr class="showData">
									<th scope="row"><%=s.getId() %></th>
									<td><%=s.getName() %></td>
									<td><%=s.getEmail() %></td>
									<td><%=s.getMobile() %></td>
									<td>
										<button id="<%=s.getId() %>" onclick="deleteStudent(this)" style="color: red;background-color: white;border: 0;" class="btn btn-danger deleteForm"><i class="fa fa-trash"></i></button>
										<button id="<%=s.getId() %>" style="color: blue;background-color: white;border: 0;" class="btn btn-primary editForm" data-toggle="modal" data-target="#editButton">
											<i class="fa fa-eyedropper"></i>
										</button>
										  
									</td>
								</tr>
								<%
							}
						%>
				</tbody>
			</table>
		</div>
	</div>


	<!-- modal for edit -->
	
			
			<!-- Modal -->
			<div class="modal fade" id="editButton" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header primary-background text-white">
			        <h5 class="modal-title" id="exampleModalLabel">Edit Your Details</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			       	<form action="editRecord" method="post" id="editForm">
			       	<div class="container text-right">
			       		<mark >You cann't change your ID and Email.</mark>
			       	</div>
						  <div class="form-group">
						    <label for="name">Enter Name</label>
						    <input name="name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
						  </div>
						  <div class="form-group">
						    <label for="mobile">Mobile</label>
						    <input name="mobile" type="number" class="form-control" id="mobile" placeholder="Enter Mobile">
						  </div><br>
					       <div class="form-group text-right">
					       	 <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
					        <button class="btn btn-outline-primary">Save</button>
					       </div>
						</form>
			      </div>
			    </div>
			  </div>
			</div>
	
	<!-- end of edit modal -->



	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	
	<!-- javascript for addRecord form -->
	
	<script type="text/javascript">
		$(document).ready(function(){
			$('#addRecordForm').on('submit',function(event){
				event.preventDefault();
				let form=new FormData(this);
				$.ajax({
					url:'addRecord',
					method:'post',
					data:form,
					success:function(res,textStatus,jqXHR){
						console.log(res);
						if(res.trim()==='done')
						{
						swal({
							  title: "Registration Successfully Done!!!",
							  text: "Thank You.",
							  icon: "success",
							  button: "Done...!",
							}).then((value)=>{
								window.location="index.jsp";
							})
						}
						else
							{
							swal({
								  title: "Something Went Wrong...!!!",
								  text: "Try Again.",
								  icon: "warning",
								  buttons: true,
								  dangerMode: true,
								})
							}
					$('#addRecordForm').trigger("reset");
					},
					error:function(jqXHR,textStatus,errorThrown){
						swal({
							  title: "Something Went Wrong...!!!",
							  text: "Try Again.",
							  icon: "warning",
							  buttons: true,
							  dangerMode: true,
							})
					},
					processData:false,
					contentType:false
				})
			})
		});
	</script>
	
	
	<!--javascript for delete function start-->
	
	<script type="text/javascript">
		function deleteStudent(data){
			let id=$(data).attr("id");
			console.log(id);
			$.ajax({
				method:'delete',
				url:"deleteRecord?user_id="+id,
				success:function(res){
					console.log(res);
					if(res.trim()==='done')
					{
					swal({
						  title: "Record Delete Successfully!!!",
						  text: "Thank You.",
						  icon: "success",
						  button: "Done...!",
						}).then((value)=>{
							window.location="index.jsp";
						})
					}
					else
						{
						swal({
							  title: "Something Went Wrong...!!!",
							  text: "Try Again.",
							  icon: "warning",
							  buttons: true,
							  dangerMode: true,
							})
						}
				}
			});
		}
		
		
	</script>
	
	<!-- delete function end -->
	
	
	
</body>
</html>