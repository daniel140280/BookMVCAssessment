<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <link rel="stylesheet" href="css/stylesBooks.css">
</head>

<body>
<div class="container">

<h1>Edit Book</h1>

<div class="card">

    <c:if test="${not empty error}">
        <div class="error-box">${error}</div>
    </c:if>
    
    <h2><strong>Editing: ${book.title}</strong></h2>

    <form action="editBook" method="post">

        <input type="hidden" name="id" value="${book.id}">

        <div class="form-grid">
            <label>Title:</label>
            <input type="text" id="title" name="title"
                   value="${book.title}"
                   maxlength="255" required>

            <label for="author">Author:</label>
            <input type="text" id="author" name="author"
                   value="${book.author}"
                   maxlength="255" required>

            <label for="date">Date (DD/MM/YYYY):</label>
            <input type="text" id="date" name="date"
                   value="${book.date}"
                   pattern="\d{2}/\d{2}/\d{4}"
                   required
                   title="Date must be in DD/MM/YYYY format">

            <span></span>
            <p class="field-hint date-warning">&#9888; Format must be: DD/MM/YYYY &mdash; e.g. 15/06/1997</p>

            <label for="genres">Genres:</label>
            <input type="text" id="genres" name="genres"
                   value="${book.genres}"
                   maxlength="255" required>

            <label for="characters">Characters:</label>
            <input type="text" id="characters" name="characters"
                   value="${book.characters}"
                   required>

            <label for="synopsis">Synopsis:</label>
            <textarea id="synopsis" name="synopsis"
                      rows="5" required>${book.synopsis}</textarea>
                      
        </div>

        <div class="form-actions">
            <button class="btn-primary" type="submit">Save Changes</button>
            <a href="books" class="btn-secondary">Cancel</a>
        </div>

    </form>

</div>

</div>
</body>
</html>