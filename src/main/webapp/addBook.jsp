<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" href="stylesBooks.css">
</head>
<body>

<div class="container">

<h1>Add New Book</h1>

<div class="card">

<c:if test="${not empty error}">
    <div class="error-box">${error}</div>
</c:if>

<form action="addBook" method="post" class="form-grid">

    <label>Title:</label>
    <input type="text" name="title" maxlength="255" required>

    <label>Author:</label>
    <input type="text" name="author" maxlength="255" required>

    <label>Publication Date:</label>
    <input type="text" name="date" 
           placeholder="YYYY-MM-DD"
           pattern="\d{4}-\d{2}-\d{2}" required>

    <label>Genres (comma separated):</label>
    <input type="text" name="genres" maxlength="255">

    <label>Main Characters:</label>
    <input type="text" name="characters">

    <label>Synopsis:</label>
    <textarea name="synopsis"></textarea>

    <button class="btn-primary">Add Book</button>
    <a href="books" class="btn-secondary">Cancel</a>

</form>

</div>

</div>

</body>
</html>