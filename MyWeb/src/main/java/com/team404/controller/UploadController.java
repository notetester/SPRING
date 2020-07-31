package com.team404.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/fileupload")
public class UploadController {
	
	//업로드 예제 화면
	@RequestMapping("/upload")
	public String upload() {
		
		return "fileupload/upload";
	}
	
	//단일파일업로드
	@RequestMapping("/upload_ok")
	public String upload_ok(@RequestParam("file") MultipartFile file ) {
		
		
		String uloadFolder = "D:\\course\\spring\\upload";
		
		try {
			String fileRealName = file.getOriginalFilename(); //실제파일명
			long size = file.getSize(); //파일크기
			String fileExtension = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length() ); //확장자
			
			System.out.println("실제파일명:" + fileRealName);
			System.out.println("파일크기:" + size);
			System.out.println("확장자:" + fileExtension);
			
			File saveFile = new File(uloadFolder + "\\" + fileRealName );
			file.transferTo(saveFile); //실제 파일을 저장해주는 메서드 filewriter작업을 손쉽게 해주는 스프링 메서드
			
			
		} catch (Exception e) {
			System.out.println("fileupload error" + e.getMessage());
		}
		
		
		return "fileupload/upload_ok";
	}
	
	//다중파일 업로드
	@RequestMapping("/upload_ok2")
	public String upload_ok2(MultipartHttpServletRequest files) {
		
		String uploadFolder = "D:\\course\\spring\\upload";
		
		
		try {
			List<MultipartFile> list = files.getFiles("file"); //매개변수는 화면에 name값
			
			System.out.println(list.toString());
			
			for(int i = 0; i < list.size(); i++) {
				
				String fileRealName = list.get(i).getOriginalFilename(); //파일실제이름
				long size = list.get(i).getSize();
				String fileExtension = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length() );
				
				
				System.out.println("실제파일명:" + fileRealName);
				System.out.println("파일크기:" + size);
				System.out.println("확장자:" + fileExtension);
				
				File saveFile = new File(uploadFolder + "\\" + fileRealName);
				list.get(i).transferTo(saveFile); //실제 파일을 저장
				
			}
			
		} catch (Exception e) {
			System.out.println("fileupload error" + e.getMessage());
		}
		
		
		return "fileupload/upload_ok";
	}
	
	//복수태그를 사용한 여러파일
	@RequestMapping("/upload_ok3")
	public String upload_ok3(@RequestParam("file") List<MultipartFile> list ) {
		
		String uploadFolder = "D:\\course\\spring\\upload"; //업로드경로

		try {
			
			for(int i = 0; i < list.size(); i++) {
				
				String fileRealName = list.get(i).getOriginalFilename(); //파일실제이름
				long size = list.get(i).getSize();
				String fileExtension = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length() );
				
				
				System.out.println("실제파일명:" + fileRealName);
				System.out.println("파일크기:" + size);
				System.out.println("확장자:" + fileExtension);
				
				File saveFile = new File(uploadFolder + "\\" + fileRealName);
				list.get(i).transferTo(saveFile); //실제 파일을 저장
				
			}
			
		} catch (Exception e) {
			System.out.println("fileupload error" + e.getMessage());
		}
		
		return "fileupload/upload_ok";
	}
	
	
	
	
	
	
}
