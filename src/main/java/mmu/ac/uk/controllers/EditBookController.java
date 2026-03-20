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

@WebServlet("/editBook")
public class EditBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	        int id = Integer.parseInt(req.getParameter("id"));

	        BookDAO dao = new BookDAO();
	        Book b = dao.getBookById(id);

	        req.setAttribute("book", b);

			//Each CRUD activity uses it own page (JSP), so the dispatch location differs
	        RequestDispatcher rd = req.getRequestDispatcher("editBook.jsp");
	        rd.include(req, resp);
	    }

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	        int id = Integer.parseInt(req.getParameter("id"));
	        String title = req.getParameter("title");
	        String author = req.getParameter("author");
	        String date = req.getParameter("date");
	        String genres = req.getParameter("genres");
	        String characters = req.getParameter("characters");
	        String synopsis = req.getParameter("synopsis");

	        Book b = new Book(id, title, author, date, genres, characters, synopsis);

	        BookDAO dao = new BookDAO();
	        
	        try {
	            dao.validateBook(b, true);         
	        } catch (IllegalArgumentException e) {
	            req.setAttribute("error", e.getMessage());  
	            req.setAttribute("book", b);       
	            RequestDispatcher rd = req.getRequestDispatcher("editBook.jsp");
	            rd.include(req, resp);
	            return;
	        }

	        try {
	            dao.updateBook(b);
	            //Once updated, re-direct to GET BookController (main listing page) to refresh with new book
	            resp.sendRedirect("books");
	            return;
	        } catch (SQLException e) {
	            req.setAttribute("error", e.getMessage());
	            req.setAttribute("book", b);
	            RequestDispatcher rd = req.getRequestDispatcher("editBook.jsp");
	            rd.include(req, resp);
	        }
	    }
}
