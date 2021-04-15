<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile List</title>
<base href="${pageContext.servletContext.contextPath}/">
<!-- css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />

<!--js-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/easy-responsive-tabs.css" rel='stylesheet'
	type='text/css' />
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800"
	rel="stylesheet">
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>

</head>
<body>

	<div class="container">

		<div class="row">
			<div class="col-md-12">
				<br />
				<div class="table-responsive">
					
					<div class="row">
						<div class="col col-xs-12">
							<h1 style="margin-top: 30px; color: black;">Chi Tiết Giỏ Hàng</h1>
						</div>
						<a style="margin-left: 45em" class="btn btn-success" href="history/${id}.htm">Trở Về</a>
					</div>
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12">
							<br />
							<div class="table-responsive">
								<table id="mytable" class="table table-bordred table-striped">
									<thead>
										<th>Tên Sản Phẩm</th>
										<th>Hình Ảnh</th>
										<th>Giá</th>
										<th>Số Lượng</th>
										<th>Thành Tiền</th>

									</thead>
									<tbody>
										<c:forEach var="item" items="${listItem}">
											<tr>
												<td>${item.product.name}</td>
												<td><image width="100px" src="${item.product.image}" /></td>
												<td><fmt:formatNumber value="${item.product.price-((item.product.discount/100)*item.product.price)}" type="currency"></fmt:formatNumber></td>
												<td><input
													style="display: inline; width: 50%; height: 51px; margin-top: 0px"
													min="0" class="form-control text-center"
													value="${item.amount}" /></td>
												<td><fmt:formatNumber value="${item.sumprice}" type="currency"></fmt:formatNumber></td>

											</tr>
										</c:forEach>


										<tr class="visible-xs">
											    
											<td class="text-center"><strong>Tổng 200.000 đ</strong>
												    </td>    
										</tr>
										   
										<tr>
											       
											<td colspan="2" class="hidden-xs"> </td>     
											<td class="hidden-xs text-center" style="font-size: 23px"><strong>Tổng
													tiền : <fmt:formatNumber value="${total}" type="currency"></fmt:formatNumber></strong>     </td>    


										</tr>

									</tbody>
								</table>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
