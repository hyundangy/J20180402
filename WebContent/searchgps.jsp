<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
 <head>
      <meta charset="UTF-8">
      <title>네이버 지도 API - 주소로 지도 표시하기</title>
      <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=e0FW3_z6emuYmYUng2py&submodules=geocoder"></script>
 </head>
 <body>
 	${cslist[0].caddress}
    <div id="map" style="width:512px;height:800px;"></div>
    <script>
    var map = new naver.maps.Map('map');
    </script>
    
    <c:forEach var = "cafe" items="${cslist }">
    <script>
      var myaddress = '${cafe.caddress}';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
          }
          var result = response.result;
          // 검색 결과 갯수: result.total
          // 첫번째 결과 결과 주소: result.items[0].address
          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
          map.setZoom(10);
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          // 마크 클릭시 인포윈도우 오픈
          var infowindow = new naver.maps.InfoWindow({
              content: '<h4> ${cafe.cname} </h4><a href=${cafe.curl} target="_blank"><img src="images/hot.gif"></a>'
          });
      });
      </script>
     </c:forEach>
 </body>
</html>

