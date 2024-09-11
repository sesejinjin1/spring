<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/layout/menu.jsp"></jsp:include>




<script>

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<div id="app">
	<div>
		<button @click="fnApi">api버튼</button>
	</div>  
	
	<div>
		도/시	<select v-model="si" @change="fnSiList">
				<option value="">:::선택:::</option>
				<option v-for="item in siList" :value=item.si>{{item.si}}</option>
			</select>
		구/군	<select v-model="gu" @change="fnGuList">
				<option value="">:::선택:::</option>
				<option option v-for="item in guList" :value=item.gu>{{item.gu}}</option>
			</select>
		동	<select v-model="dong" @change="fnXyinsert">
				<option value="">:::선택:::</option>
				<option option v-for="item in dongList" :value=item.dong>{{item.dong}}</option>
			</select>
		<button type="button" @click="fnApi">버튼</button>
	</div>
	<div>{{nx}},{{ny}}</div>
</div>
</body>
</html>

<script>
    const app = Vue.createApp({
        data() {
            return {
				siList : {},
				guList : {},
				dongList : {},
				si : "",
				gu : "",
				dong : "",
				nx : "",
				ny : ""
            };
        },
        methods: {
            fnApi(){
				/* Javascript 샘플 코드 */
				var self = this;
				var xhr = new XMLHttpRequest();
				var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
				var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'YliCwHg%2Ba4feB17gkXkGz1MY6UmvGjm3b4aHhphEahtbOSVywsJePJytRvBzDFPC8e7UQWjGVpow%2BMYNmGJ6WA%3D%3D'; /*Service Key*/
				queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
				queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
				queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
				queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20240911'); /**/
				queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('0600'); /**/
				queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent(self.nx); /**/
				queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent(self.ny); /**/
				xhr.open('GET', url + queryParams);
				xhr.onreadystatechange = function () {
				    if (this.readyState == 4) {
				        console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
				    }
				};
				xhr.send('');
            },
			fnSiList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"areaWeather.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.siList = data.siList;
						self.fnGuList();
					}
				});
	        },
			fnGuList(){
				var self = this;
				var nparmap = {si : self.si};
				$.ajax({
					url:"areaWeatherGu.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.guList = data.guList;
						self.fnDongList();
					}
				});
	        },
			fnDongList(){
				var self = this;
				var nparmap = {si : self.si , gu : self.gu};
				$.ajax({
					url:"areaWeatherDong.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.dongList = data.dongList;
					}
				});
	        },
			fnXyinsert(){
				var self = this;
				for(var i=0;i<self.dongList.length;i++){
					if(self.dongList[i].dong==self.dong){
						self.nx = self.dongList[i].nx;
						self.ny = self.dongList[i].ny;
					}
				}
			}
			 
        },
        mounted() {
			var self = this;
			self.fnSiList();
        }
    });
    app.mount('#app');
</script>