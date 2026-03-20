<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" href="css/stylesBooks.css">
</head>

<body>
<div class="container">

<h1>Add New Book</h1>

<div class="card success">

    <c:if test="${not empty error}">
        <div class="error-box">${error}</div>
    </c:if>

    <form action="addBook" method="post">

        <div class="form-grid">

            <label for="title">Title:</label>
            <input type="text" id="title" name="title"
                   maxlength="255" required
                   placeholder="Enter book title"
                   value="${book.title}">

            <label for="author">Author:</label>
            <input type="text" id="author" name="author"
                   maxlength="255" required
                   placeholder="Enter author name"
                   value="${book.author}">

            <label for="date">Date (DD/MM/YYYY):</label>
            <input type="text" id="date" name="date"
                   pattern="\d{2}/\d{2}/\d{4}"
                   required
                   placeholder="DD/MM/YYYY"
                   title="Date must be in DD/MM/YYYY format"
                   value="${book.date}">
            <span></span>
            <p class="field-hint date-warning">&#9888; Format must be: DD/MM/YYYY &mdash; e.g. 15/06/1997</p>

            <label for="genres">Genres:</label>
            <input type="text" id="genres" name="genres"
                   maxlength="255" required
                   placeholder="e.g. Fiction, Mystery"
                   value="${book.genres}">

            <label for="characters">Characters:</label>
            <input type="text" id="characters" name="characters"
                   required
                   placeholder="Main characters"
                   value="${book.characters}">

            <label for="synopsis">Synopsis:</label>
            <textarea id="synopsis" name="synopsis"
                      rows="5" required
                      placeholder="Brief synopsis of the book...">${book.synopsis}</textarea>

        </div>

        <div class="form-actions">
            <button class="btn-success" type="submit">Add Book</button>
            <a href="books" class="btn-secondary">Cancel</a>
        </div>

    </form>

</div>

</div>
</body>
</html>