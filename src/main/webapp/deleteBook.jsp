<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Book</title>
    <link rel="stylesheet" href="css/stylesBooks.css">
</head>

<body>
<div class="container">

<h1>Delete Book</h1>

<div class="card warning">

    <h2>Last chance, are you sure you want to delete this book?</h2>

    <p><strong>${book.title}</strong> by ${book.author}</p>

    <form action="deleteBook" method="post">
        <input type="hidden" name="id" value="${book.id}">

        <div class="form-actions">
            <button class="btn-danger" type="submit">Delete</button>
            <a href="books" class="btn-secondary">Cancel</a>
        </div>
    </form>

</div>

</div>
</body>
</html>