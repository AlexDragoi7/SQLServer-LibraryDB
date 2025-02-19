SELECT TOP 15 b.Title, COUNT(br.BorrowID) AS MostBorrowed FROM
Books b JOIN Borrowing br ON b.BookID = br.BookID
GROUP BY b.Title
ORDER BY MostBorrowed DESC
GO