package mmu.ac.uk.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mmu.ac.uk.database.BookDAO;
import mmu.ac.uk.models.Book;

@WebServlet("/viewBook")
public class ViewBookController extends HttpServlet{
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idParam = req.getParameter("id");

        if (idParam == null) {
            resp.sendRedirect("books");
            return;
        }

        int id = Integer.parseInt(idParam);

        BookDAO dao = new BookDAO();
        Book book = dao.getBookById(id);

        if (book == null) {
            req.setAttribute("error", "Book not found.");
        }

        req.setAttribute("book", book);

        RequestDispatcher rd = req.getRequestDispatcher("viewBook.jsp");
        rd.include(req, resp);
    }


}
