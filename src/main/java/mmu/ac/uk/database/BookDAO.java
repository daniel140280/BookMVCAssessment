package mmu.ac.uk.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import mmu.ac.uk.models.*;


public class BookDAO {
	
	Book oneBook = null;
	Connection conn = null;
    Statement stmt = null;
	String user = "hallhald";
    String password = "Vot7WruttA";
    // Note none default port used, 6306 not 3306
    String url = "jdbc:mysql://mudfoot.doc.stu.mmu.ac.uk:6306/" + user;

	public BookDAO() {}

	/**
     * Opens a connection to the MySQL database on Mudfoot server.
     */
	private void openConnection(){
		// loading jdbc driver for mysql
		try{
		    Class.forName("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance();
		    } catch(Exception e) {
		    	System.out.println(e);
		    	}
		// connecting to database
		try{
			// connection string for demos database, username demos, password demos
 			conn = DriverManager.getConnection(url, user, password);
		    stmt = conn.createStatement();
		    } catch(SQLException se) {
		    	System.out.println(se); 
		    	}
		}
	
	/**
     * Closes the active database connection.
     */
	private void closeConnection(){
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
     * Converts a ResultSet row into a Book object.
     *
     * @param rs ResultSet positioned at a valid row.
     * @return Book object.
     */
	private Book getNextBook(ResultSet rs){
    	Book thisBook=null;
		try {
			
			thisBook = new Book(
					rs.getInt("id"),
					rs.getString("title"),
					rs.getString("author"),
					rs.getString("date"),
					rs.getString("genres"),
					rs.getString("characters"),
					rs.getString("synopsis"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return thisBook;		
	}
	
	
	/**
     * Retrieves all books from the database.
     *
     * @return An Array list of all Book objects.
     */	
   public ArrayList<Book> getAllBooks(){
	   
		ArrayList<Book> allBooks = new ArrayList<Book>();
		openConnection();
		
	    // Create select statement and execute it
		try{
		    String selectSQL = "select * from books";
		    ResultSet rs1 = stmt.executeQuery(selectSQL);
	    // Retrieve the results
		    while(rs1.next()){
		    	oneBook = getNextBook(rs1);
		    	allBooks.add(oneBook);
		   }

		    stmt.close();
		    closeConnection();
		} catch(SQLException se) {
			System.out.println(se); 
			}

	   return allBooks;
   }
   
   /**
    * Inserts a new Book into the database.
    *
    * @param b the Book object to insert.
    * @return number of rows affected.
    * @throws SQLException If a database error occurs.
    */
   public int insertBook(Book b) throws SQLException {
	   openConnection();
	   
	   String sql = "INSERT INTO books (title, author, date, genres, characters, synopsis, cover) "
               + "VALUES (?, ?, ?, ?, ?, ?, ?)";

	    PreparedStatement ps = conn.prepareStatement(sql);
	    ps.setString(1, b.getTitle());
	    ps.setString(2, b.getAuthor());
	    ps.setString(3, b.getDate());
	    ps.setString(4, b.getGenres());
	    ps.setString(5, b.getCharacters());
	    ps.setString(6, b.getSynopsis());
	
	    int rows = ps.executeUpdate();
	
	    ps.close();
	    closeConnection();
	
	    return rows;
   }
   
   /**
    * Updates an existing Book in the database.
    *
    * @param b the Book object that contains the FULL book data.....no patches here (using the book ID)
    * @return number of rows affected.
    * @throws SQLException If a database error occurs.
    */
   public int updateBook(Book b) throws SQLException {
	   openConnection();

       String sql = "UPDATE books SET title=?, author=?, date=?, genres=?, characters=?, synopsis=? "
                  + "WHERE id=?";

       PreparedStatement ps = conn.prepareStatement(sql);
       ps.setString(1, b.getTitle());
       ps.setString(2, b.getAuthor());
       ps.setString(3, b.getDate());
       ps.setString(4, b.getGenres());
       ps.setString(5, b.getCharacters());
       ps.setString(6, b.getSynopsis());
       ps.setInt(7, b.getId());

       int rows = ps.executeUpdate();

       ps.close();
       closeConnection();

       return rows;
   }

   /**
    * Deletes a Book from the database.
    *
    * @param b the Book object to delete (uses the book ID).
    * @return number of rows affected.
    * @throws SQLException If a database error occurs.
    */
   public int deleteBook(Book b) throws SQLException {
	   openConnection();

       String sql = "DELETE FROM books WHERE id=?";

       PreparedStatement ps = conn.prepareStatement(sql);
       ps.setInt(1, b.getId());

       int rows = ps.executeUpdate();

       ps.close();
       closeConnection();

       return rows;
   }
   
   /**
    * Searches for books where the title, author, or genres contain the given search string.
    *
    * @param searchStr The text to search for.
    * @return A collection of matching Book objects.
    */
   public Collection<Book> searchBook(String searchStr) {
       ArrayList<Book> results = new ArrayList<>();
       openConnection();

       String sql = "SELECT * FROM books WHERE title LIKE ? OR author LIKE ? OR genres LIKE ? OR date LIKE ? OR characters LIKE ? OR id ? ";

       try {
           PreparedStatement ps = conn.prepareStatement(sql);
           String wildcard = "%" + searchStr + "%";

           ps.setString(1, wildcard);
           ps.setString(2, wildcard);
           ps.setString(3, wildcard);
           ps.setString(4, wildcard);
           ps.setString(5, wildcard);
           ps.setString(6, wildcard);

           ResultSet rs = ps.executeQuery();

           while (rs.next()) {
               results.add(getNextBook(rs));
           }

           ps.close();
           closeConnection();

       } catch (SQLException e) {
           e.printStackTrace();
       }

       return results;
   }

   
}
