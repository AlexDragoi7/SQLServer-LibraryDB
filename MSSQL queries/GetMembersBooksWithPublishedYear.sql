-- Create a new stored procedure called 'StoredProcedureName' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'GetMembersBooksWithPublishedYear'
)
DROP PROCEDURE dbo.GetMembersBooksWithPublishedYear
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.GetMembersBooksWithPublishedYear
    @published_year INT 
-- add more stored procedure parameters here
AS
BEGIN
    -- body of the stored procedure
    SELECT m.Name, m.Email, b.Title FROM Members m
    JOIN Borrowing br ON m.MemberID = br.MemberID
    JOIN Books b ON br.BookID = b.BookID
    WHERE b.PublishedYear > @published_year
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.GetMembersBooksWithPublishedYear 2012
GO