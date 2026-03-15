<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>Books MVC</title>
    <link rel="stylesheet" href="./stylesBooks.css">
</head>
<body>

<div class="container">

<h1>Book Library – Management Page</h1>

<!-- ============================
     ADD BOOK LINK
============================= -->
<div class="add-book-link">
    <a href="addBook" class="btn-primary">+ Add New Book</a>
</div>

<!-- ============================
     MAIN BOOKS TABLE
============================= -->
<div class="card">

<!-- Header row and Search form -->
<div class="header-row">
    <h2>All Books</h2>

    <form action="searchBooks" method="get" class="search-bar">
        <input type="text" name="q" placeholder="🔍 Search by title, genre, or year...">
        <button class="btn-primary">Search</button>
    </form>
</div>

<table class="styled-table book-table">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Author</th>
        <th>Date</th>
        <th>Genres</th>
        <th>Actions</th>
    </tr>

    <c:forEach var="b" items="${books}">
        <tr>
           <td>
               <a href="viewBook?id=${b.id}" class="truncate" title="View details">${b.id}</a>
           </td>
           <td>
               <a href="viewBook?id=${b.id}" class="truncate" title="${b.title}">${b.title}</a>
           </td>
			<td class="truncate" title="${b.author}">
			    ${fn:length(b.author) > 64 ? fn:substring(b.author, 0, 64).concat('...') : b.author}
			</td>           <td>${b.date == null ? "No Date Available" : b.date}</td>
			<td class="truncate" title="${b.genres}">
			    ${fn:length(b.genres) > 64 ? fn:substring(b.genres, 0, 64).concat('...') : b.genres}
			</td>
           <td class="actions">
               <a class="icon edit" href="editBook?id=${b.id}" title="Edit">&#9998;</a>
               <a class="icon delete" href="deleteBook?id=${b.id}" title="Delete">&#128465;</a>
           </td>
        </tr>
    </c:forEach>
</table>

</div>

<!-- ============================
     PAGINATION CONTROLS
============================= -->
<div class="pagination">
    <div class="page-status">Page ${page} of ${totalPages}</div>

    <c:if test="${page > 1}">
        <div class="pagination-nav">
            <a href="books?page=1" class="page-btn">First</a>
            <a href="books?page=${page - 1}" class="page-btn">Previous</a>
        </div>
    </c:if>

    <c:forEach begin="1" end="${totalPages}" var="p">
        <a href="books?page=${p}" class="page-number ${p == page ? 'active' : ''}">${p}</a>
    </c:forEach>

    <c:if test="${page < totalPages}">
        <div class="pagination-nav">
            <a href="books?page=${page + 1}" class="page-btn">Next</a>
            <a href="books?page=${totalPages}" class="page-btn">Last</a>
        </div>
    </c:if>
</div>

</div>
</body>
</html>