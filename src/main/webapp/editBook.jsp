<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <link rel="stylesheet" href="stylesBooks.css">
</head>
<body>

<div class="container">

<h1>Edit Book</h1>

<div class="card">

<c:if test="${not empty error}">
    <div class="error-box">${error}</div>
</c:if>

<form action="editBook" method="post" class="form-grid">

    <input type="hidden" name="id" value="${book.id}" />

    <label>Title:</label>
    <input type="text"
           name="title"
           value="${book.title}"
           maxlength="255"
           required>

    <label>Author:</label>
    <input type="text"
           name="author"
           value="${book.author}"
           maxlength="255"
           required>

    <label>Date:</label>
    <input type="text"
           name="date"
           value="${book.date}"
           placeholder="YYYY-MM-DD"
           pattern="\d{4}-\d{2}-\d{2}"
           required>

    <label>Genres:</label>
    <input type="text"
           name="genres"
           value="${book.genres}"
           maxlength="255">

    <label>Characters:</label>
    <input type="text" name="characters" value="${book.characters}">

    <label>Synopsis:</label>
    <textarea name="synopsis">${book.synopsis}</textarea>

    <button class="btn-primary">Save Changes</button>
    <a href="books" class="btn-secondary">Cancel</a>

</form>

</div>

</div>

</body>
</html>