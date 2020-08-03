package com.team404.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team404.command.SnsBoardVO;
import com.team404.snsboard.service.SnsBoardService;

@Controller
@RequestMapping("/snsBoard")
public class SnsBoardController {
	
	@Autowired
	@Qualifier("snsBoardService")
	private SnsBoardService snsBoardService;
	
	
	@RequestMapping("/snsList")
	public void snsList() {
	}
	
	
	
	//화면에서 비동기형식으로 파일데이터와 content데이터를 받음.
	//업로드 방식 데이터베이스 파일 업로드 경로 저장, 실제 파일은 하드디스크에 저장
	@ResponseBody
	@RequestMapping("/regist")
	public String regist(@RequestParam("file") MultipartFile file,
						 @RequestParam("content") String content,
						 HttpSession session 
						) {
		try {
			//0. 세션정보 
			String writer = (String)session.getAttribute("userId");
			if(writer == null) {
				throw new Exception(); //강제에러 발생 catch구문으로
			}
			
			
			
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
			SnsBoardVO vo = new SnsBoardVO(0, writer, content, fileLoca, fileName, fileRealName, null);
			
			boolean result = snsBoardService.regist(vo);
			
			//요청한 화면으로
			if(result) {
				return "success";
			} else {
				return "fail";
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			return "fail"; //에러시에도 fail반환
		} 

	}
	
	//목록처리
	@ResponseBody
	@RequestMapping("/getList")
	public ArrayList<SnsBoardVO> getList() {

		return snsBoardService.getList();
	}
	
	//1ST
	//이미지에 대한 화면처리(파일데이터 반환)
//	@ResponseBody
//	@RequestMapping("/display")
//	public byte[] display(@RequestParam("fileLoca") String fileLoca,
//						  @RequestParam("fileName") String fileName) {
//		
//		//파일을 읽을 경로
//		String uploadPath = "D:\\course\\spring\\upload\\" + fileLoca + "\\" + fileName;
//		File file = new File(uploadPath);
//		
//		//파일데이터를 읽어서 파일값을 바이트배열로 리턴하는 메서드
//		byte[] result = null;
//		try {
//			 result = FileCopyUtils.copyToByteArray(file);
//		
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		
//		return result;
//	}
	
	//2nd
	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> display(@RequestParam("fileLoca") String fileLoca,
										  @RequestParam("fileName") String fileName) {
	
		//파일을 읽을 경로
		String uploadPath = "D:\\course\\spring\\upload\\" + fileLoca + "\\" + fileName;
		File file = new File(uploadPath);

		//ResponseEntity는 서버에서 응답에대한 내용, 메세지, 정보를 보내줄때 사용합니다.
		//생성자(보낼데이터, 헤더에 응답정보, 응답상태)
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType( file.toPath() )); //컨텐트 타입-파일MIME타입
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK );
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	
}





