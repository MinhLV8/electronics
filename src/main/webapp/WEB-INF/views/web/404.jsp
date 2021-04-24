<%--
  Created by IntelliJ IDEA.
  User: Minh Le
  Date: 15/12/2020
  Time: 8:20 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>404 Error</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
</head>
<body>
<div id="layoutError">
    <div id="layoutError_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="text-center mt-4">
                            <img class="mb-4 img-error" src="${pageContext.request.contextPath}/web/assets/images/404-Error.svg" />
                            <p class="lead font-weight-bold">URL được yêu cầu không được tìm thấy trên máy chủ.</p>
                            <a href="${pageContext.request.contextPath}/trangchu"><i class="fas fa-arrow-left mr-1"></i>Trở về trang chủ</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>

