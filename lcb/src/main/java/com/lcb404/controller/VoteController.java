package com.lcb404.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lcb404.service.VoteService;

@RestController
@RequestMapping("/vote")
public class VoteController {

	@Autowired
	private VoteService voteService;
	
	@GetMapping("/getList/{cnt}/{num}")
	public int setVote(@PathVariable("cnt") int cnt,@PathVariable("num") int num ) {
		
		
		return voteService.setVote(cnt,num);
	}
}
