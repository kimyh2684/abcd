<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>

	function open_window(url, name, left, top, width, height){
		var widthPoint = screen.width/2 - width/2;
		var heightPoint = screen.height/2 - height/2;

		var popupWindow = window.open(url, name, 'left='+widthPoint+',top='+heightPoint+',width='+width+',height='+height+',scrollbars=yes');
		popupWindow.focus();
	}
	
	function ipinPop(){
		window.name = "openWindow";
		var linkInner = document.getElementById('ipinBannerLink');
											//url, name, left, top, width, height
		var link = "javascript:open_window('http://gov.kro.kr','siren24', '100', '100', '460', '568');";
		var descrip = "[새창] siren24";
		
		//앵커 위치 지정&타이틀 지정
		
		linkInner.href = link;
		linkInner.title = descrip;

	}
</script>
	                      
    
<div class="col-md-12 col-sm-12 col-xs-12" style="display: flex; justify-content: space-around;">
      
     
       <div class="col-md-6 col-sm-6 col-xs-6" id="cont">
      					<a href="#" id="ipinBannerLink" onclick="ipinPop()" title="">
           <div class="btn-primary" style="height: 400px; display: flex; justify-content: center;">
           	<h4 style="align-self: center;">자동으로 가져오기</h4>
           </div>
           				</a> 
       </div>
      
        <div class="col-md-6 col-sm-6 col-xs-6" id="direct">
          <div class="btn-danger" style="height: 400px; display: flex; justify-content: center;">
           <h4 style="align-self: center;">직접 추가하기</h4>
           </div>
       </div>
       </div>
       
       <script type="text/javascript">
       window.onload=function(){
        $('#direct').click(function(){
        	location.href="/served/comDirectUserReg.do";
        });
       }
       </script>