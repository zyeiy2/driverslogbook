SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:     Benjamin Laerbusch
-- Create Date: 24.01.2019
-- Description: Insert Day in Office
-- =============================================
CREATE PROCEDURE [dbo].[setdayinoffice]
(
    -- Add the parameters for the stored procedure here
   @employee as nvarchar (100), 
   @office_date as date
)
AS
BEGIN
  DECLARE @datetime as datetime2(7)= getutcdate();

    Merge [dbo].[dayinoffice] as t
	Using (Select @office_date,@employee , @datetime) as s (office_date,employee,insert_time) 
	On (t.[employee] = s.employee and t.[office_date] = s.[office_date])
	WHEN MATCHED THEN 
		UPDATE SET t.[insert_time] = s.[insert_time]
	WHEN NOT MATCHED THEN
		INSERT ([office_date] ,[employee]  ,[insert_time])
		Values (s.office_date, s.employee,s.insert_time);
	
	
END
GO
