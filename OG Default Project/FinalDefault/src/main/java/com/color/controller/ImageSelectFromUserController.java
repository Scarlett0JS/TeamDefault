package com.color.controller;

import java.io.BufferedReader;
import java.io.File;
//import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.controller.Controller;
import com.main.dao.MainMyBatisDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.theme.entity.Theme;


public class ImageSelectFromUserController implements Controller {

	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String savePath = "C:\\eGovFrame-4.0.0\\First_Project\\projectImg\\userImg";
		int maxSize = 1024*1024*10;
		
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String lang = multi.getParameter("Language");
		
		// FileName Encoding
		String filename_origin = multi.getFilesystemName("userinputImg");
		String filename_rename = URLEncoder.encode(filename_origin, "UTF-8");
		
//		String originalFileName = multi.getOriginalFileName("userinputImg");
		
		if (filename_rename != null) {
			String domain = "http://127.0.0.1:5000/ImgRecommend?lang=" + lang + "&userImg=" + filename_rename;

			try {
				URL u = new URL(domain);
				HttpURLConnection http = (HttpURLConnection) u.openConnection();
				http.setRequestMethod("GET");
				http.setDoInput(true);
				http.setDoOutput(true);
				
				int resCode = http.getResponseCode();
				System.out.println("응답코드 : " + resCode);
				System.out.println("응답메세지 : " + http.getResponseMessage());
				
				if (resCode == HttpURLConnection.HTTP_OK) {
					InputStream input = http.getInputStream();
					
					BufferedReader reader = new BufferedReader(new InputStreamReader(input));
					String rs = reader.readLine();
					
					String arr [] = rs.split(":");
					
					MainMyBatisDAO dao = new MainMyBatisDAO();
					
					List<Theme> resultLi = new ArrayList<Theme>();
					
					for (String seq : arr) {
						resultLi.add(dao.Themeselect(Integer.parseInt(seq)));
					}
					request.setAttribute("Recommand", resultLi);
				}
				
				return "ThemeRecommand";
			} catch (MalformedURLException e) {
				System.out.println(domain + "is not a URL I understand");
				return "redirect:/Error.do";
			} catch (IOException e) {
				e.printStackTrace();
				return "redirect:/Error.do";			
			}
		}else {
			HashMap<String, String> errMap = new HashMap<String, String>();
			errMap.put("ImgError", "NullImg");
			request.setAttribute("ImgError", errMap);
			return "main";
		}		
	}

}
