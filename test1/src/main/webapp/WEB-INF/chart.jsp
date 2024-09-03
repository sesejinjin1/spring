<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/layout/menu.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>



<script src="https://cdn.iamport.kr/v1/iamport.js"></script>



<script>
IMP.init("imp29272276");

function requestCert() {
  IMP.certification({
    pg: "inicis_unified.INIpayTest",
    merchant_uid: "test_m0lufsq2",
  });
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<div id="app">
	<div><button onclick="requestCert()">인증하기</button></div>
	<div id="chart">
      <apexchart type="area" height="350" :options="chartOptions" :series="series"></apexchart>
    </div>
</div>
</body>
</html>

<script>
	
var app = new Vue({
	el : '#app',
	components: {
      apexchart: VueApexCharts,
    },
	data : {
		series: [],
        chartOptions: {}
	},// data
	methods : {
		fnGetList(){
			var self = this;
			var nparmap = {};
			$.ajax({
				url:"chart.dox",
				dataType:"json",	
				type : "POST", 
				data : nparmap,
				success : function(data) { 
					var priceList = [];
					var dataList = [];
					for(var i=0; i<data.list.length; i++){
						priceList.push(data.list[i].price);
						dataList.push(data.list[i].pDate);
					}
					self.fnChart(priceList, dataList);
				}
			});
        },
		fnChart(priceList, dataList){
			var self = this;
			self.series=  [{
	            name: "price",
	            data: priceList
	        }]
	        self.chartOptions = {
	          chart: {
	            height: 350,
	            type: 'area',
	            zoom: {
	              enabled: false
	            }
	          },
	          dataLabels: {
	            enabled: false
	          },
	          stroke: {
	            curve: 'straight'
	          },
	          title: {
	            text: 'test',
	            align: 'center'
	          },
	          grid: {
	            row: {
	              colors: ['#f3f3f3', 'transparent'], 
	              opacity: 0.5
	            },
	          },
	          xaxis: {
	            categories: dataList,
	          }
	        }
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>