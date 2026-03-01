package mmu.ac.uk.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mmu.ac.uk.database.BookDAO;
import mmu.ac.uk.models.Book;


@WebServlet("/books")
public class BooksController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	 int page = 1;
         int recordsPerPage = 50;

         if (req.getParameter("page") != null) {
             page = Integer.parseInt(req.getParameter("page"));
         }

         BookDAO dao = new BookDAO();

         List<Book> books = dao.getBooks((page - 1) * recordsPerPage, recordsPerPage);
         int totalRecords = dao.getBookCount();
         int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

         req.setAttribute("books", books);
         req.setAttribute("page", page);
         req.setAttribute("totalPages", totalPages);

         RequestDispatcher rd = req.getRequestDispatcher("books.jsp");
         rd.forward(req, resp);
     }
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}


//@Override
//protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	
//	BookDAO dao = new BookDAO();
//	
//	//Retrieve all books in an array list
//    List<Book> books = dao.getAllBooks();
//    
//	//Add the list to request scope - give key identifier for the value pairs
//    req.setAttribute("books", books);
//
//	//As using multiple JSP, always use the correct dispatch location
//    RequestDispatcher rd = req.getRequestDispatcher("books.jsp");
//    rd.include(req, resp);
//}
//
//@Override
//protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//}