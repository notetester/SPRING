package com.lcb404.mapper;

import com.lcb404.command.MovieVO;

public interface MovieMapper {
	public MovieVO getList(int MOVIE_CODE);
	public int updateLike(MovieVO vo);
}
