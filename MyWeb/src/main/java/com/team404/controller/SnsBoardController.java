package com.team404.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/snsBoard")
public class SnsBoardController {

	@RequestMapping("/snsList")
	public void snsList() {
	}
	
	//화면에서 비동기형식으로 파일데이터와 content데이터를 받음.
	//업로드 방식 데이터베이스 파일 업로드 경로 저장, 실제 파일은 하드디스크에 저장
	@ResponseBody
	@RequestMapping("/regist")
	public String regist(@RequestParam("file") MultipartFile file,
						 @RequestParam("content") String content
						 ) {
		try {
			//2. 날짜별로 폴더생성
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String fileLoca = sdf.format(date);
			
			//1. 파일을 저장할 경로
			String uploadPath = "D:\\course\\spring\\upload\\" + fileLoca;
					
			File folder = new File(uploadPath);
			if( !folder.exists() ) { //폴더가 없다면
				folder.mkdir(); //폴더생성
			}
			
			//3. 업로드된 실제 파일명
			String fileRealName = file.getOriginalFilename(); //파일이름
			Long size = file.getSize(); //파일크기

			UUID uuid = UUID.randomUUID();
			String uuids = uuid.toString().replaceAll("-", "");
			//System.out.println(uuids);
			
			//4. 확장자
			String fileExtension = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length()  );
			
			//5. 서버에 저장할 파일명
			String fileName = uuids + fileExtension;
			
			System.out.println("저장할위치:" + uploadPath);
			System.out.println("저장할폴더명:" + fileLoca);
			System.out.println("실제파일명:" + fileRealName);
			System.out.println("서버에저장할파일명:" + fileName);
			System.out.println("사이즈:" + size);
						
			//6. 업로드진행
			File saveFile = new File(uploadPath + "\\" + fileName );
			file.transferTo(saveFile);
			
			//7. 디비에 insert
			
		} catch (Exception e) {
			e.printStackTrace();
		} 

		
		System.out.println(file);
		System.out.println(content);

		return "1";
	}
	
}





