<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  
<title>Insert title here</title>

<script>
$(function(){
	//아이디 중복 검사
	$('#idCheck').on('click', function(){
		
		//입력한 값을 가져온다.
		idValue = $('#uid').val().trim();
		
		console.log(idValue);
		
		if(idValue.length < 1){
			alert("아이디를 입력하세요");
			return false;
		}
		
		$.ajax({
			url : '<%= request.getContextPath() %>/IdCheck.do',  
			type : 'get',
			data : {"id" : idValue},
			success : function(res){
				/* alert(res.flag); */
				$('#idspan').html(res.flag).css('color', 'red');
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
	})
	
	//우편번호 검색
	$('#zipsearch').on('click', function(){
		window.open("zipsearch.jsp", "우편번호찾기", "width=500 height=500")
	})
	
	//우편변호검색모달 창 실행 - 검색버튼 클릭
	$('#zip').on('click', function(){
		dongValue = $('#dong').val().trim();
		
		$.ajax({
			url : '<%= request.getContextPath() %>/ZipSearch.do',
			data : {"dong" : dongValue},
			type : 'post',
			dataType : 'json',
			success : function(res){
				/* alert("성공"); */
				
				code = "<table>";
				code += "<tr><th>우편번호</th><th>주소</th><th>번지</th></tr>"
				$.each(res, function(i, v){
					bunji = v.bunji;
					//undefined 비교
					 if(typeof bunji == "undefined") bunji = "";
					
					code += `<tr class="add"><td>${v.zipcode}</td>`;
					code += `<td>${v.sido} ${v.gugun} ${v.dong}</td>`;
					code += `<td>${bunji}</td></tr>`;
				})
				code += `</table>`;
				
				$('#result1').html(code);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status)
			}
		})
		
		//실행결과에서 한줄을 클릭하면
		$(document).on('click', '#result1 .add', function(){
			zip = $('td:eq(0)', this).text();
			addr = $('td:eq(1)', this).text();
			
			// open으로 열은 zipsearch 창은 자식창으로 opener를 통해 부모창에 있는 모든 요소를 부를 수 있음
			$('#uzip').val(zip);
			$('#uadd1').val(addr); 
			
			$('#zipModal').modal('hide');
			
			$('#dong').val("");
			/* $('#result1').empty(); */
			 $('#result1').html("");  //이것도 가능
		})
	
	})
		
	$('#send').on('click', function(){
		
		// 입력한 모든값을 가져온다 - val()
		idval = $('#uid').val().trim();
		nameval = $('#uname').val().trim();
		
		fdata = {"id" : idval, "name": nameval ,}
		
	})
	
})
</script>
<style>
#result1 .add:hover{
	background: skyblue;
}
</style>
</head>
<body>

<div class="container">
  <h2>회원가입</h2>
  
  <form class="needs-validation" novalidate>
    <div class="form-group">
      <label for="uid">아이디</label>
      <button type="button" id="idCheck" class="btn btn-success btn-sm">중복검사</button>
      <span id="idspan"></span>
      <input type="text" class="form-control" id="uid" placeholder="Enter username" name="mem_id" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uname">이름</label>
      <input type="text" class="form-control" id="uname" placeholder="Enter password" name="mem_name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="mem_pass" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="ubir">생년월일</label>
      <input type="date" class="form-control" id="ubir" placeholder="Enter password" name="mem_bir" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uhp">전화번호</label>
      <input type="text" class="form-control" id="uhp" placeholder="Enter password" name="mem_hp" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="umail">이메일</label>
      <input type="text" class="form-control" id="umail" placeholder="Enter password" name="mem_mail" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uzip">우편번호</label>
      <button type="button" id="zipsearch" class="btn btn-success btn-sm">번호검색</button>
      <button type="button" data-toggle="modal" data-target="#zipModal" class="btn btn-success btn-sm">번호검색modal</button>
      
      <input type="text" class="form-control" id="uzip" placeholder="Enter password" name="mem_zip" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uadd1">주소</label>
      <input type="text" class="form-control" id="uadd1" placeholder="Enter password" name="mem_add1" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uadd2">상세주소</label>
      <input type="text" class="form-control" id="uadd2" placeholder="Enter password" name="mem_add2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <button type="button" id="send" class="btn btn-outline-dark">Submit</button>
    <span id="joinspan"></span>
  </form>
</div>

<!-- The Modal -->
<div class="modal" id="zipModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        우편번호찾기
        <div class="box">
			<p>찾는 동을 입력하세요.</p>
			<input type="text" id="dong">
			<input type="button" value="검색" id="zip">
			<br><br>
			<div class="result" id="result1"></div>
		</div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>