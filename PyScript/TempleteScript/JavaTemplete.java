package kr.board;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO extends TempleteDAO{
	private Connection connection;
	private PreparedStatement preparedstatement;
	private ResultSet resultset;

	// Connection Method
	public Connection getConnect() {
		// url , username, password
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String username = "scott", password = "123456";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection(url, username, password);
		} catch (Exception exeption) {
			exeption.printStackTrace();
		}
		return connection;
	} // getConnect

	@Override
	public List<Board> boardAllList() {
		List<Board> boardList = new ArrayList<Board>();
		String query = "select num, title, content, indate, writer, count from board";
		connection = getConnect();
		try {
			preparedstatement = connection.prepareStatement(query);
			resultset = preparedstatement.executeQuery();
			while (resultset.next()) {
				int num = resultset.getInt("num");
				String title = resultset.getString("title");
				String content = resultset.getString("content");
				String indate = resultset.getString("indate");
				String writer = resultset.getString("writer");
				int count = resultset.getInt("count");
				Board board = new Board(num, title, content, writer, indate, count);
				boardList.add(board);
			}
		} catch (Exception exeption) {
			exeption.printStackTrace();
		} finally {
			dbclose();
		}
		return boardList;
	} // boardAlllist
}
