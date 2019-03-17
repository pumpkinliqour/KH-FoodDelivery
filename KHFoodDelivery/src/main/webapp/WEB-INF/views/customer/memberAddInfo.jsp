<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
 <style>
      div#enroll-container{width:400px; margin:0 auto;}
      div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
      div#enroll-container .btn-ser{position:absolute;display:inline;margin-left: 78%; }
	  div#enroll-container{position:relative; padding:0px;}	
</style>
<script>
function address() {
    new daum.Postcode({ 
       oncomplete: function(data) {
           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullAddr = data.address; // 최종 주소 변수
           var extraAddr = ''; // 조합형 주소 변수

           // 기본 주소가 도로명 타입일때 조합한다.
           if(data.addressType === 'R'){
               //법정동명이 있을 경우 추가한다.
               if(data.bname !== ''){
                   extraAddr += data.bname;
               }
               // 건물명이 있을 경우 추가한다.
               if(data.buildingName !== ''){
                   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               
               // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); 
           }

           // 주소 정보를 해당 필드에 넣는다.
           $('#memberAddress').val(fullAddr); 
            /* document.getElementById("location").value = fullAddr;  */
           // 주소로 상세 정보를 검색
           geocoder.addressSearch(data.address, function(results, status) {
               // 정상적으로 검색이 완료됐으면
               if (status === daum.maps.services.Status.OK) {

                   var result = results[0]; //첫번째 결과의 값을 활용

                   // 해당 주소에 대한 좌표를 받아서
                   var coords = new daum.maps.LatLng(result.y, result.x);
                  
                
               }
           });
       }
    }).open(); 
}
</script>


	<div id="enroll-container" class="col-sm-12">
        <form name="enroll" action="${path}/member/kakaoEnrollEnd.do" method="post">  
        	<input type="hidden" value="${result.MEMBERID}" name="memberId">
            <input type="text" class="form-control" placeholder="이름" name="memberName" id="memberName"/>
            <input type="date" class="form-control" placeholder="생년월일(예:910729)" name="memberBirth" id="memberBirth" max="2019-03-29" min="1900-01-01"/>
            <input type="email" class="form-control" placeholder="이메일" name="memberEmail" id="memberEmail" >
            <input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="memberPhone" id="memberPhone" maxlength="11"/>            
             <input type="button" class="btn-ser btn btn-default" onclick="address();" value="주소검색"/>             
            <input type="text" class="add form-control"  placeholder="주소" name="memberAddress" id="memberAddress"/>
            <input type="text" class="form-control" placeholder="상세주소" name="memberAddress1" id="memberAddress1"/>
              <select class="form-control" name="memberGender" required>
               <option value="" disabled selected>성별</option>
               <option value="M">남</option>
               <option value="F">여</option>
            </select>
             <input type="hidden" name="profileImage" value="user.jpg"/>
  
     																					
            <br />
            
            <input  type="submit" class="btn btn-outline-secondary" value="가입"/>&nbsp;
            <input type="reset" class="btn btn-outline-secondary" value="취소"/>
         </form>
      </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>