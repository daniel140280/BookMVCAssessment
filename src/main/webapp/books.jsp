<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Books</title>
    <link rel="stylesheet" href="stylesBooks.css">
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

<h2>All Books</h2>

<!-- Future search form (non-functional now) -->
<div class="search-bar">
    <input type="text" placeholder="🔍 Search books... (coming soon)">
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
            <td>${b.id}</td>
            <td>${b.title}</td>
            <td>${b.author}</td>
            <td>${b.date}</td>
            <td>${b.genres}</td>

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

    <!-- Previous -->
    <c:if test="${page > 1}">
        <a href="books?page=${page - 1}" class="page-btn">← Prev</a>
    </c:if>

    <!-- Numbered pages -->
    <c:forEach begin="1" end="${totalPages}" var="i">
        <a href="books?page=${i}" 
           class="page-number ${page == i ? 'active' : ''}">
            ${i}
        </a>
    </c:forEach>

    <!-- Next -->
    <c:if test="${page < totalPages}">
        <a href="books?page=${page + 1}" class="page-btn">Next →</a>
    </c:if>

</div>

</div>
</body>
</html>