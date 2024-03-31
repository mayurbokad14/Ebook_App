<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DAO.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<h4 class="text-center">Edit Books</h4>
					<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty failedMsg }">
						<p class="text-center text-Danger">${failedMsg }</p>
						<c:remove var="failedMsg" scope="session" />
					</c:if>

					<%
					int id = Integer.parseInt(request.getParameter("id"));
					BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
					BookDtls b = dao.getBookById(id);
					%>

					<form action="../editbooks" method="post">
						<input type="hidden" name="id" value="<%=b.getBookid()%>">

						<div class="form-group">
							<label for="exampleInputEmail1">Book Name*</label> <input
								name="bname" type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								value="<%=b.getBookname()%>">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Author Name*</label> <input
								name="author" type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								value="<%=b.getAuthor()%>">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Price*</label> <input
								name="price" type="number" class="form-control"
								id="exampleInputPassword1" value="<%=b.getPrice()%>">
						</div>

						<div class="form-group">
							<label for="inputState">Book Status</label> <select
								id="inputState" name="status" class="form-control">
								<%
								if ("Active".equals(b.getStatus())) {
								%>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
								<%
								} else {
								%>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>

								<%
								}
								%>

							</select>
						</div>

						<button type="submit" class="btn btn-primary">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 40px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>