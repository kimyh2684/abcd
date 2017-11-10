package com.kosmo.career.service;

import java.util.ArrayList;

import com.kosmo.career.vo.GovVO;

public interface GovService {
	public int sendToGov(String ipin_id, String user_id);
	public ArrayList<GovVO> getFromXml(String user_id) throws Exception;
	public int saveGovData(ArrayList<GovVO> list);
}
