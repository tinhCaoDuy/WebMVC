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
        <title>Profile Form</title>
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
<style type="text/css">
	h1 {
	color: blue;;
	font-size: 5em;
	margin-top: 1em;
	margin-left: 4em;
	}
	label {
	color: green;
	}
	*[id$=errors] {
	color: red;
	font-style: italic;
	display: block;
</style>
    </head>
    <body>

        <div class="container">
            <br/>
            <div class="row">
               
                 <h1>XÓA SẢN PHẨM </h1>
            </div>
            <div class="clearfix"></div>
            <fieldset>
                <form:form action="deleteproduct.htm"  modelAttribute="product" 
                            class="form-horizontal">
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label" >${message}</label>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-9">
                            <form:input path="id" class="form-control" readonly="true" style="display:none"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" >Tên</label>
                        <div class="col-sm-9">
                            <form:input path="name" class="form-control" readonly="true"/>
                            <form:errors path="name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="card-number">Hình Ảnh</label>
                        <div class="col-sm-9">
                            <form:input path="image" class="form-control" readonly="true"/>
                            <form:errors path="image"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="cvv">Giá</label>
                        <div class="col-sm-9">
                            <form:input path="price" class="form-control" readonly="true"/>
                            <form:errors path="price"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="card-holder-name">% Khuyến Mãi</label>
                        <div class="col-sm-9">
                            <form:input path="discount" class="form-control" readonly="true" />
                            <form:errors path="discount"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="expiry-month">Loại Sản Phẩm</label>
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-xs-3">
                                    <form:select path="category.id" class="form-control col-sm-2">
                                        <form:option value="1" label="Sơn"/>
                                        <form:option value="2" label="Xi Măng"/>
                                        <form:option value="3" label="Ống Nước"/>
                                        <form:option value="4" label="Gạch Xây Dựng"/>
                                    </form:select>
                                </div>
                            </div>
                        </div>
                    </div>
					
					<div class="form-group">
                        <label class="col-sm-3 control-label" for="card-holder-name">Đơn Vị Tính</label>
                        <div class="col-sm-9">
                            <form:input path="unit" class="form-control" readonly="true"/>
                            <form:errors path="unit"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="card-holder-name">Thông Tin</label>
                        <div class="col-sm-9">
                            <form:input path="description" class="form-control" readonly="true"/>
                            <form:errors path="description"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <input name="btnXacNhan" type="submit" value="Xác Nhận Xóa" class="btn btn-success"/>
                            <input name="btnTroVe" type="submit" value="Trở Về" class="btn btn-success">
                        </div>
                    </div>
                </form:form>
            </fieldset>
        </div>

    </body>
</html>

                      
						
