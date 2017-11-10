package com.kosmo.career.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;

public class GovSocket {

	private Socket s;
	private String attr;
	
	public GovSocket(String ipin_id) throws Exception{
		InetAddress ia = InetAddress.getByName("192.168.0.75");
		s = new Socket(ia, 9222);
						System.out.println("서버에 접속하였습니다.");
		
	//정부 서버에 ipin인증받음 증명하기 위해 ipin 서버로부터 받은 증명사인(ipin_id)보내기
		OutputStream os = s.getOutputStream();		
		OutputStreamWriter osw = new OutputStreamWriter(os);
		PrintWriter pw = new PrintWriter(osw);
		pw.println(ipin_id);
		pw.flush();	
		
	//정부서버에서 유저의 정보 찾을 수 있는 키(attr)값 받아오기.
		while(true){
			if(s.getInputStream() != null){
				InputStream is = s.getInputStream();		
				InputStreamReader isr = new InputStreamReader(is);
				BufferedReader br = new BufferedReader(isr);
				String attr = br.readLine();
						System.out.println(attr);
				this.attr = attr;
				break;
			}
		}
	}
		
	public String getAttr(){
			return this.attr;
	}

}
