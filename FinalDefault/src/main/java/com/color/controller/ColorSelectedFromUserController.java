package com.color.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;

public class ColorSelectedFromUserController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String one = request.getParameter("1");
		String two = request.getParameter("2");
		String three = request.getParameter("3");
		String four = request.getParameter("4");
		String five = request.getParameter("5");
		
		String ColorData = "?ColorData="+one+":"+two+":"+three+":"+four+":"+five;
		String domain = "http://127.0.0.1:5000/ColorRecommend"+ColorData.replace(" ", "");	
		
		try {			
			URL u = new URL(domain);			
			HttpURLConnection http = (HttpURLConnection) u.openConnection();			
			http.setRequestMethod("GET");	
			http.setDoInput(true);
			http.setDoOutput(true);
			
			int resCode = http.getResponseCode();
			System.out.println("응답코드 : " + resCode);
			System.out.println("응답메세지 : " + http.getResponseMessage());
			
			if(resCode == HttpURLConnection.HTTP_OK) {
				//  성공
				InputStream input = http.getInputStream();
				
				BufferedReader reader = new BufferedReader(new InputStreamReader(input));
				String rs = reader.readLine();
				
				request.setAttribute("data", rs);
			}
		} catch (MalformedURLException e) {			
			System.out.println(domain+" is not a URL I understand");		
		} catch (IOException e){		
			e.printStackTrace();
		}
		
		return null;
	}

}