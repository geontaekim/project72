package kr.co.seoulit.logistics.logiinfosvc.help.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import kr.co.seoulit.logistics.logiinfosvc.help.service.BoardInfoService;
import kr.co.seoulit.logistics.logiinfosvc.help.to.boardTO2;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/help/*")
@Api(tags="게시판 API")
@Slf4j
public class BoardSaveCreController {

	ModelMap map = null;
	// SLF4J logger
	
	private static Gson gson = new GsonBuilder().serializeNulls().create(); // �냽�꽦媛믪씠 null �씤 �냽�꽦�룄 json 蹂��솚

	 @Autowired 
	private BoardInfoService bi;
	
	 
	 @PostMapping("/boardSaveCreation.do")
	public ModelMap addContent( boardTO2 bean,
				HttpServletRequest request, HttpServletResponse response) {
		
		/*
		 * Map<String,String[]> map=request.getParameterMap(); for (Entry<String,
		 * String[]> entry : map.entrySet()) { String key = entry.getKey(); String val =
		 * Arrays.toString(entry.getValue()); System.out.println("key:"+key);
		 * System.out.println("value:"+val); }
		 */
		 System.out.println("bean?:"+bean.toString().trim());
		 
		bi.addContent(bean); 
		
		 try {
			 String contextPath = request.getContextPath();
			response.sendRedirect(contextPath+"/help/board.html");
		} catch (IOException e) {
			
			e.printStackTrace();
		}

		return null;
	}
	 
	@PostMapping(value = "/boardSaveCre.do")
	@ApiOperation(value="寃뚯떆湲� 議고쉶" , notes="寃뚯떆湲��쓣 議고쉶�빀�땲�떎.")
	public ModelMap contentList(HttpServletRequest request, HttpServletResponse response) {

		map = new ModelMap();

		ArrayList<boardTO2> boardList = bi.getBoardList();

		map.put("contentList", boardList);
		map.put("errorCode", 1);
		map.put("errorMsg", "�꽦怨�");

		return map;
	}
	@PostMapping(value ="/getboardcontent.do")
	public ModelMap getcontent(boardTO2 bean) {

		map = new ModelMap();
		System.out.println("bean?"+bean.getSeq_num());
		boardTO2 coninfo = bi.getcontents(bean.getSeq_num()); 

		map.put("coninfo", coninfo); 
		map.put("errorCode", 1);
		map.put("errorMsg", "�꽦怨�");

		return map;
	}
	@DeleteMapping(value="/boardDelete.do")
	public ModelMap deletecontent(boardTO2 bean) {

		
		map = new ModelMap();


		bi.deleteContents(bean.getSeq_num());

		map.put("coninfo", null);
		map.put("errorCode", 1);
		map.put("errorMsg", "�꽦怨�");

		
		return map;
	}
	
	@PostMapping(value ="/myboardSaveCre.do")
	public ModelMap mycontentList(boardTO2 bean) {

		map = new ModelMap();

		ArrayList<boardTO2> boardList = bi.getBoardList(bean.getUsername());

		map.put("contentList", boardList);
		map.put("errorCode", 1);
		map.put("errorMsg", "�꽦怨�");

		
		return map;

	}
}
