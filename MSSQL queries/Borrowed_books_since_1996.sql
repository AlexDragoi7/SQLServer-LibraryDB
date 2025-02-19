SELECT COUNT(br.BorrowID) AS TotalBooksBorrowed, b.PublishedYear FROM Borrowing br 
JOIN Books b ON b.BookID = br.BookID
GROUP BY b.PublishedYear
HAVING b.PublishedYear >= 1996
