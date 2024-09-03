<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>view 기본 세팅 파일</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>
		도/시	<select v-model="dosi" @change="fnGetList">
				<option value="">:::선택:::</option>
				<option v-for="item in list" :value=item.si>{{item.si}}</option>
			</select>
		구/군	<select v-model="gu" @change="fnGetList">
				<option value="">:::선택:::</option>
				<option option v-for="item in listGu" :value=item.gu>{{item.gu}}</option>
			</select>
		동	<select>
				<option>:::선택:::</option>
				<option option v-for="item in listDong" :value=item.dong>{{item.dong}}</option>
			</select>
			{{dosi}}
			{{gu}}
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : {},
				listGu : {},
				listDong : {},
				dosi : "",
				gu : ""
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {dosi : self.dosi , gu : self.gu};
				$.ajax({
					url:"area.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
						self.listGu = data.listGu;
						self.listDong = data.listDong;
					}
				});
            } 
        },
        mounted() {
			
            var self = this;
			self.fnGetList();
			
        }
    });

    app.mount('#app');
</script>
​