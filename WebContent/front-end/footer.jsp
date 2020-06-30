<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
	pageContext.setAttribute("context", request.getContextPath());
	pageContext.setAttribute("role", session.getAttribute("role"));
%>
<html>

<body>
	
	<footer class="footer_area clearfix">
		<div class="container">
			<div class="row ">
				<div class="col-md-12 text-center">
					<p>
						Copyright &copy; 2020 by EA101G5
						<i class="fa fa-heart-o" aria-hidden="true"></i>
						by FitMate
						</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	
		<script src="${context}/js/jquery/jquery-2.2.4.min.js"></script>
		<script src="${context}/js/popper.min.js"></script>
		<script src="${context}/js/bootstrap.min.js"></script>
		<script src="${context}/js/plugins.js"></script>
		<script src="${context}/js/classy-nav.min.js"></script>
		<script src="${context}/js/active.js"></script>
		<script src="${context}/js/index.js"></script>
</body>

</html>