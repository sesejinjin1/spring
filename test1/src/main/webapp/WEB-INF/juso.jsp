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
			
			<button @click="fnJuso"> 주소 찾기 </button>
			<table>
				<tr><td>도로명주소 전체(포멧)</td><td><input type="text"  style="width:500px;" id="roadFullAddr"  v-model="roadFullAddr" /></td></tr>
				<tr><td>도로명주소           </td><td><input type="text"  style="width:500px;" id="roadAddrPart1"  v-model="roadAddrPart1" /></td></tr>
				<tr><td>고객입력 상세주소    </td><td><input type="text"  style="width:500px;" id="addrDetail"  name="addrDetail" /></td></tr>
			</table>
		</div>
	</div>
</body>
</html>
<script>
	function jusoCallBack(roadFullAddr, roadAddrPart1) {
		if (window.vueAppInstance) {
			window.vueAppInstance.fnResult(roadFullAddr, roadAddrPart1);
		} else {
			console.error("Vue app instance is not available.");
		}
	}
    const app = Vue.createApp({
        data() {
            return {
				roadFullAddr : "",
				roadAddrPart1 : ""
            };
        },
        methods: {
			fnResult(roadFullAddr,roadAddrPart1){
				var self = this;
				self.roadFullAddr = roadFullAddr;
				self.roadAddrPart1 = roadAddrPart1;
				// 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
				console.log("풀"+roadFullAddr);
				console.log("파트>>>"+roadAddrPart1);
			},
			fnJuso(){
				window.open('/jusoPopup.do',"jusoPopup", "width=500,height=300");
			}
        },
        mounted() {
			window.vueAppInstance = this;
        },
		
    });

    app.mount('#app');
</script>
​