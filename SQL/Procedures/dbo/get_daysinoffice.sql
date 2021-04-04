SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:     Benjamin Laerbusch
-- Create Date: 24.01.2019
-- Description: Get list of says in Office
-- =============================================
CREATE PROCEDURE [dbo].[getdaysinofficeall]
(
    -- Add the parameters for the stored procedure here
   @employee as nvarchar (100),
   @diff as int,
   @format as nvarchar(10)
)
AS
BEGIN

  SELECT  [office_date]
      ,[employee]
      ,[insert_time]
	  ,FORMAT ( [office_date], 'D', @format ) AS 'atOffice'  
  FROM [dbo].[dayinoffice]
  where employee = @employee
  and [office_date] >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - @diff, 0)	-- First day of previous month
  and [office_date] <= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()),- @diff)		-- Last Day of previous month
  
  order by office_date asc
Return 
END
GO
