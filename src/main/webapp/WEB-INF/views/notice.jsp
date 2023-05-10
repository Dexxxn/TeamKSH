<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<!-- CSS -->
<link rel="stylesheet" href="resources/css/notice.css">
</head>
<body>

<div id="notice_container">
	<div id="side_left">
		<header><div id="company_logo"><img src="resources/img/hospital_logo_ex.png" id="hospital_logo" ></div>
		</header>
		<aside>
			<div id="notice_form_wrap"></div>
		</aside>
	</div>

	
	<div id="side_right">	
<div id="right_top">
			<!-- 네비게이션 바 -->
		<div id="nav_btn_set">
				<div class="nav_btn" id="schedule_nav_btn"><a href="index" class="notice_nav_anchor">schedule</a></div>
				<div class="nav_btn" id="notice_nav_btn"><a href="notice"  class="notice_nav_anchor">notice</a></div>
		</div>
		<div id="navBar"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Notification</div>
			
		<section class="notice">
		  <div class="page-title">
		        <div class="container">
		            <h3 id="notice__table_h3">공지사항</h3>
		        </div>
		    </div>
		
		    <!-- board seach area -->
		    <div id="board-search">
		        <div class="container">
		            <div class="search-window">
		                <form action="">
		                    <div class="search-wrap">
		                        <label for="search" class="blind">공지사항 내용 검색</label>
		                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
		                        <button type="submit" class="btn btn-dark">검색</button>
		                 
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div>
		   
		  <!-- board list area -->
		    <div id="board-list">
		        <div class="container">
		            <table class="board-table">
		                <thead>
		                <tr>
		                    <th scope="col" class="th-num">번호</th>
		                    <th scope="col" class="th-title">제목</th>
		                    <th scope="col" class="th-date">작성자</th>
		                    <th scope="col" class="th-date">등록일</th>
		                    <th scope="col" class="th-date">조회수</th>
		                </tr>
		                </thead>
		                <tbody>
		                <tr>
		                    <td>5</td>
		                    <th>
		                      <a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
		                      <p>테스트</p>
		                    </th>
		                    <td>김자바 원장</td>
		                    <td>2017.07.13</td>
		                    <td>210</td>
		                </tr>
		
		                <tr>
		                    <td>4</td>
		                    <th><a href="#!">공지사항 안내입니다.</a></th>
		                    <td>김영희 간호부장</td>
		                    <td>2017.06.15</td>
		                    <td>55</td>
		                </tr>
		
		                <tr>
		                    <td>3</td>
		                    <th><a href="#!">공지사항 안내입니다.</a></th>
		                    <td>박철수 과장</td>
		                    <td>2017.06.15</td>
		                    <td>63</td>
		                </tr>
		                
		                
		                </tbody>
		            </table>
		        </div>
		    </div>
		<input type="button" value="글쓰기" onclick="location.href='/notice_write'" >
		</section>
</div><!-- right_top -->
</div><!-- side_right -->
</div><!-- container -->

</body>
</html>