<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Khách hàng', 'Đơn hàng', 'Sản phẩm'],
        <c:forEach var="e" items="${data}">
        ['${e[0]}', ${e[1]}, ${e[3]}],
        </c:forEach>
      ]);

      var options = {
        chart: {
          title: 'Doang thu theo khách hàng',
          subtitle: 'Tổng số tiền và sản phẩm khách hàng đã mua.',
        },
        bars: 'horizontal' // Required for Material Bar Charts.
      };

      var chart = new google.charts.Bar(document.getElementById('barchart_material'));

      chart.draw(data, google.charts.Bar.convertOptions(options));
    }
  </script>
</head>
<body>
<div id="barchart_material" style="width: 900px; height: 500px;"></div>
</body>
</html>



<%--
<html>
<head>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {'packages': ['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Khách hàng', 'Doanh thu'],

      ]);
      var options = {
        title: 'Doanh số bán hàng theo tháng',
        curveType: 'function',
        legend: {position: 'bottom'}
      };

      var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

      chart.draw(data, options);
    }
  </script>
</head>
<body>
<div id="curve_chart" style="width: 900px; height: 500px"></div>
</body>
</html>
--%>
