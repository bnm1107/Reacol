package com.test.board;

import java.util.ArrayList;

public interface BoardDAO {
	public void insert(BoardDTO dto);
	public void hits(BoardDTO dto);
	public void boardModify(BoardDTO dto);
	public void boardDelete(BoardDTO dto);
	public ArrayList<BoardDTO> boardSelect();
	public BoardDTO contextone(int no);
	
}