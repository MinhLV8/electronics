<%--
  Created by IntelliJ IDEA.
  User: Minh Le
  Date: 18/01/2021
  Time: 8:26 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>404</title>
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:900" rel="stylesheet">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>
<style type='text/css'>
    * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }

    body {
        padding: 0;
        margin: 0;
    }

    #notfound {
        position: relative;
        height: 100vh;
    }

    #notfound .notfound {
        position: absolute;
        left: 50%;
        top: 50%;
        -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
    }

    .notfound {
        max-width: 520px;
        width: 100%;
        line-height: 1.4;
        text-align: center;
    }

    .notfound .notfound-404 {
        position: relative;
        height: 240px;
    }

    .notfound .notfound-404 h1 {
        font-family: 'Montserrat', sans-serif;
        position: absolute;
        left: 50%;
        top: 50%;
        -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        font-size: 252px;
        font-weight: 900;
        margin: 0px;
        color: #262626;
        text-transform: uppercase;
        letter-spacing: -40px;
        margin-left: -20px;
    }

    .notfound .notfound-404 h1 > span {
        text-shadow: -8px 0px 0px #fff;
    }

    .notfound .notfound-404 h3 {
        font-family: 'Cabin', sans-serif;
        position: relative;
        font-size: 16px;
        font-weight: 700;
        text-transform: uppercase;
        color: #262626;
        margin: 0px;
        letter-spacing: 3px;
        padding-left: 6px;
    }

    .notfound h2 {
        font-family: 'Cabin', sans-serif;
        font-size: 20px;
        font-weight: 400;
        text-transform: uppercase;
        color: #000;
        margin-top: 0px;
        margin-bottom: 25px;
    }

    @media only screen and (max-width: 767px) {
        .notfound .notfound-404 {
            height: 200px;
        }

        .notfound .notfound-404 h1 {
            font-size: 200px;
        }
    }

    @media only screen and (max-width: 480px) {
        .notfound .notfound-404 {
            height: 162px;
        }

        .notfound .notfound-404 h1 {
            font-size: 162px;
            height: 150px;
            line-height: 162px;
        }

        .notfound h2 {
            font-size: 16px;
        }
    }
</style>
<div id="notfound">
    <div class="notfound">
        <div class="notfound-404">
            <h3>Oops! Trang bạn tìm kiếm không tồn tại</h3>
            <h1><span>4</span><span>0</span><span>4</span></h1>
        </div>
        <%--<h2>Bạn sẽ trở về trang chủ<b> MINH STORE</b> sau <span id='time' style='color:red'>5</span> giây nữa</h2>--%>
        <%--<script type='text/javascript'>
            var jgt = 5;
            document.getElementById('time').innerHTML = jgt;

            function stime() {
                document.getElementById('time').innerHTML = jgt;
                jgt = jgt - 1;
                if (jgt == 0) {
                    clearInterval(timing);
                    location = 'http://localhost:8080/';
                }
            }
            var timing = setInterval("stime();", 1000);
        </script>--%>
    </div>
</div>
</body>
</html>
