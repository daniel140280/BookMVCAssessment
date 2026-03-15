<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" href="./stylesBooks.css">
</head>

<body>
<div class="container">

<h1>Add New Book</h1>

<div class="card">

    <c:if test="${not empty error}">
        <div class="error-box">${error}</div>
    </c:if>

    <form action="addBook" method="post">

        <div class="form-grid">

            <label>Title:</label>
            <input type="text" name="title" required>

            <label>Author:</label>
            <input type="text" name="author" required>

            <label>Date (DD/MM/YYYY):</label>
            <input type="text" name="date" required>

            <label>Genres:</label>
            <input type="text" name="genres" required>

            <label>Characters:</label>
            <input type="text" name="characters" required>

            <label>Synopsis:</label>
            <textarea name="synopsis" rows="5" required></textarea>

        </div>

        <div style="margin-top: 20px;">
            <button class="btn-primary" type="submit">Add Book</button>
            <a href="books" class="btn-secondary">Cancel</a>
        </div>

    </form>

</div>

</div>
</body>
</html>