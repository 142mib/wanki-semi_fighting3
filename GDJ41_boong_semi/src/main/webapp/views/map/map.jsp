<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충전소 위치 찾기</title>

<style>
#container{
	width: 100%;
	margin: 0px auto;
	background-color: lightgray;
	height: 1020px;
}
#input-aside{
	width: 20%;
	background-color: skyblue;
	float: left;
	height: 100%;
}
#map-section{
	width: 80%;
	height: 100%;
	background-color: yellow;
}
#sido{
	margin-left: 10px;
}
body{
	overflow: hidden;
}
</style>
</head>
<body>
	<div id="container">
		<aside id="input-aside">
			<span style="margin-left: 10px">지역 선택</span><br>
			<select id="sido">
				<option>시/도</option>
			</select>
			<select id="gungo">
				<option>시/군/구</option>
			</select>
			<hr>
			<div id="station-list-container"></div>
		</aside>
		<section id="map-section"></section>

	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=93a596b6cc1a715ba9be2452db8f8961"></script>
	<script>
		var map = document.getElementById('map-section'), // 지도 표시할 div 잡고
			options = {
				center: new kakao.maps.LatLng(37.478, 126.879), // 지도의 중심 좌표
				level: 5 // 지도 기본 확대 레벨
			};
		var map = new kakao.maps.Map(map, options); // 지도생성
	</script>
</body>
</html>































