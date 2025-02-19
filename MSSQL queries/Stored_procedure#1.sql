-- Create a new stored procedure called 'StoredProcedureName' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'GetBooksByAuthor'
)
DROP PROCEDURE dbo.GetBooksByAuthor
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.GetBooksByAuthor
    @author_name VARCHAR(100)
-- add more stored procedure parameters here
AS
BEGIN
    -- body of the stored procedure
    SELECT b.Title, b.PublishedYear
    FROM Books b
    JOIN Authors a ON a.AuthorID = b.BookID
    WHERE a.Name = @author_name;    
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.GetBooksByAuthor "Barb Crooke"
GO