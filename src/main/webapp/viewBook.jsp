<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>View Book</title>
    <link rel="stylesheet" href="./stylesBooks.css">
</head>

<body>
<div class="container">

<h1>Book Details</h1>

<div class="card">

    <h2>${book.title}</h2>

    <div class="view-book-grid">
        <div class="view-book-label">Author:</div>
        <div class="view-book-value">${book.author}</div>

        <div class="view-book-label">Date:</div>
        <div class="view-book-value">
            ${book.date == null ? "No Date Available" : book.date}
        </div>

        <div class="view-book-label">Genres:</div>
        <div class="view-book-value">${book.genres}</div>

        <div class="view-book-label">Characters:</div>
        <div class="view-book-value">${book.characters}</div>
    </div>

    <div class="view-book-synopsis">
        <h3>Synopsis</h3>
        <p>${book.synopsis}</p>
    </div>

    <div style="margin-top: 25px;">
        <a href="editBook?id=${book.id}" class="btn-primary">Edit</a>
        <a href="deleteBook?id=${book.id}" class="btn-danger">Delete</a>
        <a href="books" class="btn-secondary">Back to Books</a>
    </div>

</div>

</div>
</body>
</html>