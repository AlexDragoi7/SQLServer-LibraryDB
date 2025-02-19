SELECT TOP 20 a.Name, COUNT(b.BookID) AS MostBooks FROM Authors a
JOIN Books b ON a.AuthorID = b.AuthorID
GROUP BY a.Name
ORDER BY MostBooks DESC
GO