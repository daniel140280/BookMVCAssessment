<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <link rel="stylesheet" href="css/stylesBooks.css">
</head>

<body>
<div class="container">

    <h1>Search Results</h1>

    <div class="card">
    
        <div class="header-row">
        <h2>Results for "${query}"</h2>

        <form action="searchBooks" method="get" class="search-bar">
            <input type="text" name="q" value="${query}" placeholder="🔍 Search again...">
            <button class="btn-primary">Search</button>
        </form>
    	</div>
 
        <c:choose>
            <c:when test="${empty results}">
                <p>No books matched your search.</p>
            </c:when>

            <c:otherwise>
            
                <table class="styled-table">
                    <thead>
                        <tr>
                            <th class="col-id">ID</th>
                            <th class="col-title">Title</th>
                            <th class="col-author">Author</th>
                            <th class="col-date">Date</th>
                            <th class="col-genres">Genres</th>
                            <th class="col-actions">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="b" items="${results}">
                            <tr>
                                <td class="col-id">
                                    <a href="viewBook?id=${b.id}" title="View details">${b.id}</a>
                                </td>
                                <td class="col-title">
                                    <a href="viewBook?id=${b.id}" class="cell-text" title="${b.title}">${b.title}</a>
                                </td>
                                <td class="col-author">
                                    <span class="cell-text" title="${b.author}">
                                        ${fn:length(b.author) > 64 ? fn:substring(b.author, 0, 64).concat('...') : b.author}
                                    </span>
                                </td>
                                <td class="col-date">${b.date == null ? "No Date Available" : b.date}</td>
                                <td class="col-genres">
                                    <span class="cell-text" title="${b.genres}">
                                        ${fn:length(b.genres) > 64 ? fn:substring(b.genres, 0, 64).concat('...') : b.genres}
                                    </span>
                                </td>
                                <td class="col-actions">
                                    <div class="actions">
                                        <a class="icon edit"   href="editBook?id=${b.id}"   title="Edit">&#x270F;&#xFE0F;</a>
                                        <a class="icon delete" href="deleteBook?id=${b.id}" title="Delete">&#x1F5D1;&#xFE0F;</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>

    </div>

    <a href="books" class="btn-secondary">&#8592; Back to Catalogue</a>
    
    <!-- ============================
     PAGINATION CONTROLS
	============================= -->
	<div class="pagination">
        <div class="pagination-bar">
            <span class="page-status">Page ${page} of ${totalPages}</span>

            <c:if test="${page > 1}">
                <a href="searchBooks?q=${query}&amp;page=1"          class="page-btn">&#171; First</a>
                <a href="searchBooks?q=${query}&amp;page=${page - 1}" class="page-btn">&#8249; Prev</a>
            </c:if>

            <c:forEach begin="1" end="${totalPages}" var="p">
                <a href="searchBooks?q=${query}&amp;page=${p}"
                   class="page-number ${p == page ? 'active' : ''}">${p}</a>
            </c:forEach>

            <c:if test="${page < totalPages}">
                <a href="searchBooks?q=${query}&amp;page=${page + 1}"    class="page-btn">Next &#8250;</a>
                <a href="searchBooks?q=${query}&amp;page=${totalPages}"   class="page-btn">Last &#187;</a>
            </c:if>
        </div>
    </div>

</div>
</body>
</html>