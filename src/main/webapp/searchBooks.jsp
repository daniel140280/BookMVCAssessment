<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <link rel="stylesheet" href="./stylesBooks.css">
</head>

<body>
<div class="container">

    <h1>Search Results</h1>

    <div class="card">
    
        <div class="header-row">
        <h2>Results for "${query}"</h2>

        <form action="searchBooks" method="get" class="search-bar">
            <input type="text" name="q" value="${query}" placeholder="Search again...">
            <button class="btn-primary">Search</button>
        </form>
    	</div>
 
        <c:choose>
            <c:when test="${empty results}">
                <p>No books matched your search.</p>
            </c:when>

            <c:otherwise>
                <table class="styled-table book-table">
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Date</th>
                        <th>Genres</th>
                        <th>Characters</th>
                        <th>Actions</th>
                    </tr>

                    <c:forEach var="b" items="${results}">
                        <tr>
                            <td>
                            <a href="viewBook?id=${b.id}" class="truncate">${b.id}</a>
                        </td>
                        <td>
                            <a href="viewBook?id=${b.id}" class="truncate" title="${b.title}">${b.title}</a>
                        </td>
                        <td class="truncate" title="${b.author}">${b.author}</td>
                        <td>${b.date == null ? "No Date Available" : b.date}</td>
                        <td class="truncate" title="${b.genres}">${b.genres}</td>
                        <td class="actions">
                            <a class="icon edit" href="editBook?id=${b.id}">&#9998;</a>
                            <a class="icon delete" href="deleteBook?id=${b.id}">&#128465;</a>
                        </td>

                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>

    </div>

    <a href="books" class="btn-secondary">Back to Catalogue</a>
    
    <!-- ============================
     PAGINATION CONTROLS
============================= -->
<div class="pagination">

    <span>Page ${page} of ${totalPages}</span>

    <!-- Previous -->
    <c:if test="${page > 1}">
        <a href="searchBooks?q=${query}&page=1" class="page-btn">First</a>
        <a href="searchBooks?q=${query}&page=${page - 1}" class="page-btn">Previous</a>
    </c:if>

    <!-- Numbered pages -->
    <c:forEach begin="1" end="${totalPages}" var="p">
        <a href="searchBooks?q=${query}&page=${p}" class="page-number ${p == page ? 'active' : ''}">
            ${p}
        </a>
    </c:forEach>

    <!-- Next -->
    <c:if test="${page < totalPages}">
        <a href="searchBooks?q=${query}&page=${page + 1}" class="page-btn">Next</a>
        <a href="searchBooks?q=${query}&page=${totalPages}" class="page-btn">Last</a>
    </c:if>

</div>

<a href="books" class="btn-secondary">Back to Catalogue</a>

</div>
</body>
</html>