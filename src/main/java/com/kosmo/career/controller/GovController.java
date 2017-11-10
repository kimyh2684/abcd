package com.kosmo.career.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosmo.career.service.CarrService;
import com.kosmo.career.service.GovService;
import com.kosmo.career.vo.CarrVO;
import com.kosmo.career.vo.ComVO;
import com.kosmo.career.vo.GovVO;
import com.kosmo.career.vo.UserVO;


@Controller
@RequestMapping("/gov")
public class GovController {
	
	@Autowired
	private CarrService carrService;
	
	@Autowired
	private GovService gs;

//인증페이지로 이동
//	@RequestMapping(value="/govMain.do")
//	public ModelAndView govMain(HttpServletRequest request, HttpServletResponse response, HttpSession session){
//		UserVO uvo = (UserVO)session.getAttribute("UserImpo");
//		
////		List<CarrVO> carrList = carrService.userCarrList(uvo.getSeq());
//		List<CarrVO> carrList = carrService.userCarrList(1);		
//		
//		return new ModelAndView("userMain_govMng/govMain","carrList", carrList);
//	}
	
//정부서버에 인증확인 & 유저의 정보요청 보내기 
	@RequestMapping(value="/sendReqToGov.do")
	public String sendReqToGov(HttpServletRequest request , HttpServletResponse response, HttpSession session){
		String viewName = "userMain_comMng/userComReg1";		//ipin인증 실패할 경우 페이지이동x
		int res = gs.sendToGov((String)request.getParameter("ipin_id"),"kim");
				//나중에 kim은 session.getAttribut() 해서 아이디값으로 바꿔주기
		if(res > 0){
			viewName = "userMain_govMng/govCertiSuccess";		//인증성공화면
		}else{
			//다시 인증하라는 알림창 띄워주기
		}
		return viewName;
	}
	
	@RequestMapping(value="/getFromXml.do")
	public ModelAndView getFromXml(HttpServletRequest request , HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		try{
			 //      String user_id = (String)session.getAttribute("USER_ID");	우선은 kim로 임의 지정해줌 나중에 주석 풀기
	        ArrayList<GovVO> list = gs.getFromXml("kim");	//API에서 유저아이디에 해당하는 정보List 읽어오기(API는 정부서버에 xml파일로 존재)
	        	mv.addObject("GOV_LIST", list);
	        	mv.setViewName("userMain_govMng/govCareerList");	//리스트 보여주는 페이지로 이동. 가져온 리스트는 일회용이므로 유저가 원하는 리스트선택하여 별도의 저장 필요
		}catch(Exception e){
			mv.setViewName("userMain_comMng/userComReg1");
		}
	    return mv;

	}

//사용자가 선택한 재직정보 사이트서버DB에 저장
	@RequestMapping(value="/saveGovData.do")
	public void saveGovData(HttpServletRequest request , HttpServletResponse response){
		ArrayList<GovVO> list = new ArrayList<GovVO>();
		
		String chk[] = request.getParameterValues("carr_seq");
		 for(int j=0; j<chk.length; j++){
			 String i= chk[j];
			 GovVO vo = new GovVO();
			 
			 vo.setUserName("kim");//(String)session.getAttribute("")); 나중에 session에있는 유저정보중 하나로 바꾸기
			 vo.setGainDate(request.getParameter("gainDate"+i));
			 vo.setLossDate(request.getParameter("lossDate"+i));
			 vo.setClassify(request.getParameter("classify"+i));
			 vo.setWorkspaceName(request.getParameter("workspaceName"+i));
			 vo.setWorkspaceLocation(request.getParameter("workspaceLocation"+i));
			 
			 list.add(vo);
		 }
		 
		 int res = gs.saveGovData(list);
		 if(res == chk.length){
			 
		 }else{
			
		 }
	}
	
//DB에 저장되있는 회사정보와 비교해서 사업자번호등 정보 비교/정리해서 리스트로 보여주기.	
//	@RequestMapping(value="/getCompanyInfo")
//	public ModelAndView getCompanyInfo(){
//		ModelAndView mv = new ModelAndView();
//		
//		ArrayList<ComVO> list = new ArrayList<ComVO>();
//		gs.getCompanyList();
//		mv.addObject("COMPANY_LIST",list);
//		mv.setViewName("userMain_comMng/userComList");
//		return mv;
//		
//	} 
}
