SELECT TOP 20 m.Name, b.Title, br.BorrowDate FROM Members m
JOIN Borrowing br ON m.MemberID = br.MemberID
JOIN Books b ON b.BookID = br.BookID
WHERE br.BorrowDate BETWEEN '2024-01-01' AND '2024-05-01' 
GO