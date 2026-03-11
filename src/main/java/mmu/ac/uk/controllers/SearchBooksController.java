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

@WebServlet("/searchBooks")
public class SearchBooksController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String query = req.getParameter("q");

        if (query == null || query.trim().isEmpty()) {
            resp.sendRedirect("books");
            return;
        }

        int page = 1;
        int recordsPerPage = 50;

        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }

        BookDAO dao = new BookDAO();

        List<Book> results = dao.searchBooksPaginated(query, (page - 1) * recordsPerPage, recordsPerPage);
        int totalRecords = dao.getSearchCount(query);
        int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

        req.setAttribute("results", results);
        req.setAttribute("query", query);
        req.setAttribute("page", page);
        req.setAttribute("totalPages", totalPages);

        RequestDispatcher rd = req.getRequestDispatcher("searchBooks.jsp");
        rd.include(req, resp);
    }
}