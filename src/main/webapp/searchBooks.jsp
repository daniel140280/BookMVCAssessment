<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
<div class="container">

    <h1>Search Results</h1>

    <div class="card highlight">

        <c:choose>
            <c:when test="${empty results}">
                <p>No books matched your search.</p>
            </c:when>

            <c:otherwise>
                <table class="styled-table">
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
                            <td>${b.id}</td>
                            <td>${b.title}</td>
                            <td>${b.author}</td>
                            <td>${b.date}</td>
                            <td>${b.genres}</td>
                            <td>${b.characters}</td>
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

</div>
</body>
</html>