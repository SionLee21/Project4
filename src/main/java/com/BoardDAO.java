package com;

import com.util.MariaDBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BoardDAO {

    private static final Logger LOGGER = Logger.getLogger(BoardDAO.class.getName());

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "INSERT INTO BOARD (title, author, publisher, year, ISBN, img) VALUES (?, ?, ?, ?, ?, ?)";
    private final String INSERT_IMAGE = "UPDATE BOARD SET img = ? WHERE seq = ?";
    private final String BOARD_UPDATE = "UPDATE BOARD SET title=?, author=?, publisher=?, year=?, ISBN=?, img=? WHERE seq=?";
    private final String BOARD_DELETE = "DELETE FROM BOARD WHERE seq=?";
    private final String BOARD_GET = "SELECT * FROM BOARD WHERE seq=?";
    private final String BOARD_LIST = "SELECT * FROM BOARD ORDER BY seq DESC";

    public int insertBoard(BoardVO vo) {
        System.out.println("===> JDBC로 insertBoard() 기능 처리");
        try {
            conn = MariaDBConnection.getConnection();
            stmt = conn.prepareStatement(BOARD_INSERT);
            stmt.setString(1, vo.getTitle() != null ? vo.getTitle() : "");
            stmt.setString(2, vo.getAuthor() != null ? vo.getAuthor() : "");
            stmt.setString(3, vo.getPublisher() != null ? vo.getPublisher() : "");
            stmt.setInt(4, vo.getYear());
            stmt.setString(5, vo.getISBN() != null ? vo.getISBN() : "");
            stmt.setString(6, vo.getImg() != null ? vo.getImg() : "");
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }



    public void deleteBoard(BoardVO vo) {
        LOGGER.log(Level.INFO, "Deleting Board...");
        try {
            conn = MariaDBConnection.getConnection();
            stmt = conn.prepareStatement(BOARD_DELETE);
            stmt.setInt(1, vo.getSeq());
            stmt.executeUpdate();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error deleting Board", e);
        }
    }
    public int insertImage(int seq, String filename) {
        try {
            conn = MariaDBConnection.getConnection();
            stmt = conn.prepareStatement(INSERT_IMAGE);
            stmt.setString(1, filename);
            stmt.setInt(2, seq);
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating image", e);
        }
        return 0;
    }

    public int updateBoard(BoardVO vo) {
        LOGGER.log(Level.INFO, "Updating Board...");
        try {
            conn = MariaDBConnection.getConnection();
            stmt = conn.prepareStatement(BOARD_UPDATE);
            stmt.setString(1, vo.getTitle());
            stmt.setString(2, vo.getAuthor());
            stmt.setString(3, vo.getPublisher());
            stmt.setInt(4, vo.getYear());
            stmt.setString(5, vo.getISBN());
            stmt.setString(6, vo.getImg() != null ? vo.getImg() : "");
            stmt.setInt(7, vo.getSeq());


            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating Board", e);
        }
        return 0;
    }

    public BoardVO getBoard(int seq) {
        LOGGER.log(Level.INFO, "Fetching Board...");
        BoardVO one = new BoardVO();
        try {
            conn = MariaDBConnection.getConnection();
            stmt = conn.prepareStatement(BOARD_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if (rs.next()) {
                one.setSeq(rs.getInt("seq"));
                one.setTitle(rs.getString("title"));
                one.setAuthor(rs.getString("author"));
                one.setPublisher(rs.getString("publisher"));
                one.setYear(rs.getInt("year"));
                one.setISBN(rs.getString("ISBN"));
                one.setImg(rs.getString("img"));
                one.setCnt(rs.getInt("cnt"));
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error fetching Board", e);
        }
        return one;
    }

    public List<BoardVO> getBoardList() {
        LOGGER.log(Level.INFO, "Fetching Board List...");
        List<BoardVO> list = new ArrayList<>();
        try {
            conn = MariaDBConnection.getConnection();
            stmt = conn.prepareStatement(BOARD_LIST);
            rs = stmt.executeQuery();
            while (rs.next()) {
                BoardVO one = new BoardVO();
                one.setSeq(rs.getInt("seq"));
                one.setTitle(rs.getString("title"));
                one.setAuthor(rs.getString("author"));
                one.setPublisher(rs.getString("publisher"));
                one.setYear(rs.getInt("year"));
                one.setISBN(rs.getString("ISBN"));
                one.setCnt(rs.getInt("cnt"));
                one.setImg(rs.getString("img"));
                list.add(one);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error fetching Board List", e);
        }
        return list;
    }
}
