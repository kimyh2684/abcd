package com.kosmo.career.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.career.dao.GovDAO;
import com.kosmo.career.util.GetFromXml;
import com.kosmo.career.util.GovSocket;
import com.kosmo.career.vo.GovVO;


@Service
public class GovServiceImpl implements GovService{
	
	@Autowired
	private GovDAO dao;
	@Autowired
	private GetFromXml govXml;
	
	private GovSocket s;
	
	public int sendToGov(String ipin_id, String user_id){
		try{
			s = new GovSocket(ipin_id);	
		}catch(Exception e){e.printStackTrace();}
		
		String attr = s.getAttr();
		
	//API에서 사용할 키값(attr) DB에 저장하기(user_id사용해서) 	--> user테이블 변경 필요함
		HashMap<String, String> map = new HashMap<String, String>();
			map.put("attr", attr);
			map.put("user_id", user_id);
		return dao.saveAttr(map);
	}
	
	public ArrayList<GovVO> getFromXml(String user_id) throws Exception{
		String attr = dao.getAttr(user_id);
		ArrayList<GovVO> list = govXml.getFromXml(attr);
		return list;
	}
	
	public int saveGovData(ArrayList<GovVO> list){
		int cnt = 0;
		for(int i=0; i<list.size(); i++){
			int res = dao.saveGovData(list.get(i));
			cnt += res;
		}
		return cnt;
	}	
}
