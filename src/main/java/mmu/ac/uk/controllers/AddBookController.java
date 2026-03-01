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


@WebServlet("/addBook")
public class AddBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Each CRUD activity uses it own page (JSP), so the dispatch location differs
        RequestDispatcher rd = req.getRequestDispatcher("addBook.jsp");
        rd.include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String date = req.getParameter("date");
        String genres = req.getParameter("genres");
        String characters = req.getParameter("characters");
        String synopsis = req.getParameter("synopsis");
        
        Book b = new Book(title, author, date, genres, characters, synopsis);

        BookDAO dao = new BookDAO();

        try {
            dao.insertBook(b);
            //Once inserted, re-direct to GET BookController (main listing page) to refresh with new book
            resp.sendRedirect("books");
            return;
        } catch (SQLException e) {
            req.setAttribute("error", e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("addBook.jsp");
            rd.include(req, resp);
        }
    }

}
