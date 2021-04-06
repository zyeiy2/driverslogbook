SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:     Benjamin Laerbusch
-- Create Date: 24.01.2019
-- Description: Insert Day in Office
-- =============================================
CREATE PROCEDURE [dbo].[getdaysnumber]
(
    -- Add the parameters for the stored procedure here
   @employee as nvarchar (100),
   @diff as int
)
AS
BEGIN
 
  IF @diff = 0 

  SELECT count(1) as 'Numberofdays'
  FROM [dbo].[dayinoffice]
  where [employee] = @employee
  and [office_date] >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - @diff, 0)	-- First day of previous month 

ELSE
SELECT count(1) as 'Numberofdays'
  FROM [dbo].[dayinoffice]
  where [employee] = @employee
  and [office_date] >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - @diff, 0)	-- First day of previous month
  and [office_date] <= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), -@diff)		-- Last Day of previous month
 
END
GO
