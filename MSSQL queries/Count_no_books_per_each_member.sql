SELECT TOP 10 m.Name, COUNT(br.BorrowID) AS TotalBorrowings FROM Members m
JOIN Borrowing br ON m.MemberID = br.MemberID
GROUP BY m.Name
ORDER BY TotalBorrowings DESC
GO