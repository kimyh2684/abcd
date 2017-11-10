package com.kosmo.career.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.career.vo.GovVO;

@Repository
public class GovDAO {

	@Autowired
	SqlSession session;
	
	public int saveAttr(HashMap<String, String> map){
		return session.update("govXmlNameSpace.saveAttr", map);
	}
	
	public String getAttr(String user_id){
		return session.selectOne("govXmlNameSpace.getAttr",user_id);
	}
	
	public int saveGovData(GovVO vo){
		return session.insert("govXmlNameSpace.saveGovData",vo);
	}
	
}
