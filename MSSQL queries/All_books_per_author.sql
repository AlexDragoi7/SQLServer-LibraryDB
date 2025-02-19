SELECT b.Title, a.Name, b.Genre, b.PublishedYear FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID;
GO