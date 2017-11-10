package com.kosmo.career.util;

import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Repository;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kosmo.career.vo.GovVO;

@Repository
public class GetFromXml {
	
	//정부서버에서 xml(API)문서 위치
	private final static String APIROOT = "http://gov.kro.kr/careerInfo.xml";

	public ArrayList<GovVO> getFromXml(String attr) throws Exception{
		ArrayList<GovVO> list = new ArrayList<GovVO>();
		
		URL url = new URL(APIROOT);
		URLConnection urlconn = url.openConnection();
	
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
				Document doc = builder.parse(urlconn.getInputStream());
	
		NodeList nList = doc.getElementsByTagName("item");
		for(int i=0; i<nList.getLength(); i++){
			if(((Element)nList.item(i)).getAttribute("ATTR").equals(attr)){
				GovVO vo = new GovVO();
					for(Node node=nList.item(i).getFirstChild(); node!=null; node=node.getNextSibling()){
		        		if(node.getNodeName().equals("gaindate")){vo.setGainDate(node.getTextContent());}
		        		else if(node.getNodeName().equals("lossdate")){vo.setLossDate(node.getTextContent());}
		        		else if(node.getNodeName().equals("classify")){vo.setClassify(node.getTextContent());}
		        		else if(node.getNodeName().equals("workspacename")){vo.setWorkspaceName(node.getTextContent());}
		        		else if(node.getNodeName().equals("workspacelocation")){vo.setWorkspaceLocation(node.getTextContent());}
					}	//for 닫음
				list.add(vo);
			}	//if닫음
			
		}	//for 닫음
	
		return list;
		
	}
}
