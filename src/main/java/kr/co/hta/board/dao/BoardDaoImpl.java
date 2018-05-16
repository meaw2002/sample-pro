package kr.co.hta.board.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.hta.board.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	private RowMapper<Board> rowMapper = new RowMapper<Board>() {
		@Override
		public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setNick(rs.getString("board_nick"));
			board.setContents(rs.getString("board_contents"));
			board.setLikes(rs.getInt("board_likes"));
			board.setFilename(rs.getString("board_filename"));
			board.setCreateDate(rs.getDate("create_date"));
			return board;
		}
	};

	@Override
	public List<Board> getBoards() {
		String sql = "select * from board order by board_no desc";
		return jdbc.query(sql, rowMapper);
	}

	@Override
	public void addBoard(Board board) {
		String sql = "insert into board (board_no, board_title, board_nick, board_contents, board_filename)"
					+" values(board_seq.nextval, ?, ?, ?, ?)";
		jdbc.update(sql, board.getTitle(), board.getNick(), board.getContents(), board.getFilename());
	}

	@Override
	public Board getBoardByNo(int boardNo) {
		String sql = "select * from board where board_no = ?";
		return jdbc.queryForObject(sql, rowMapper, boardNo);
	}

	@Override
	public void deleteBoardByNo(int boardNo) {
		String sql = "delete form board where board_no = ?";
		jdbc.update(sql, boardNo);
	}

}
