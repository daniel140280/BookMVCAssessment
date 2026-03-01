<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Book</title>
    <link rel="stylesheet" href="stylesBooks.css">
</head>
<body>

<div class="container">

<h1>Confirm Delete</h1>

<div class="card warning">

<p>Are you sure you want to remove:</p>

<h3>${book.title}</h3>
<p><strong>Author:</strong> ${book.author}</p>

<form action="deleteBook" method="post">
    <input type="hidden" name="id" value="${book.id}">
    <button class="btn-danger">Delete</button>
    <a href="books" class="btn-secondary">Cancel</a>
</form>

</div>

</div>

</body>
</html>