<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- 인증 성공 창 -->

	                      
<div class="col-md-12 col-sm-12 col-xs-12" style="display: flex; justify-content: space-around;">
      
      
        <div class="col-md-6 col-sm-6 col-xs-6" id="direct">
          <div class="btn-danger" style="height: 400px; display: flex; justify-content: center;">
           <h4 style="align-self: center;">인증 완료</h4>
           </div>
       </div>
       </div>
       
       <script type="text/javascript">
       window.onload=function(){
        $('#direct').click(function(){
        	location.href="/gov/getFromXml.do";
        });
       }
       </script>