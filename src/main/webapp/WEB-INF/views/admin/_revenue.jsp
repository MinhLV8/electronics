<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Minh Le
  Date: 17/01/2021
  Time: 11:06 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Tuần', 'Doanh thu'],
                <c:forEach var="e" items="${data1}">
                ['Thứ ${e[0]}',  ${e[2]}],
                </c:forEach>
            ]);

            var options = {
                title: 'Doanh thu trong tuần hiện tại',
                hAxis: {title: 'Tuần',  titleTextStyle: {color: '#333'}},
                vAxis: {minValue: 0},
                colors: ['#008B02']
            };

            var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</head>
<body>
<div id="chart_div" style="width: 100%; height: 500px;"></div>
</body>
</html>