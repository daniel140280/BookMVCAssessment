package mmu.ac.uk.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mmu.ac.uk.database.BookDAO;
import mmu.ac.uk.models.Book;

@WebServlet("/deleteBook")
public class DeleteBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {

	        int id = Integer.parseInt(req.getParameter("id"));
	        
			//Return the entire book to make the page nicer and more detailed, rather than with just id.
	        BookDAO dao = new BookDAO();
	        Book b = dao.getBookById(id);

	        req.setAttribute("book", b);
	        
			//Each CRUD activity uses it own page (JSP), so the dispatch location differs
	        RequestDispatcher rd = req.getRequestDispatcher("deleteBook.jsp");
	        rd.include(req, resp);
	    }

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	        int id = Integer.parseInt(req.getParameter("id"));
	        
	        Book b = new Book();
	        b.setId(id);

	        BookDAO dao = new BookDAO();

	        try {
	            dao.deleteBook(b);
	            //Once deleted, re-direct to GET BookController (main listing page) to refresh with new book
	            resp.sendRedirect("books");
	            return;
	        } catch (SQLException e) {
	        	req.setAttribute("error", e.getMessage());
	            req.setAttribute("book", b);
	            RequestDispatcher rd = req.getRequestDispatcher("deleteBook.jsp");
	            rd.include(req, resp);
	        }
	    }
	    
}
