SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:     Benjamin Laerbusch
-- Create Date: 24.01.2019
-- Description: Set license plate
-- =============================================
CREATE PROCEDURE [dbo].[setlicenseplate]
(
    -- Add the parameters for the stored procedure here
   @employee as nvarchar (100),
   @license_plate_number as nvarchar(100)
)
AS
BEGIN
  DECLARE @datetime as datetime2(7)= getutcdate();



    Merge [dbo].[licenseplate] as t
	Using (Select @license_plate_number,@employee , @datetime) as s (license_plate_number,employee,insert_time) 
	On (t.[employee] = s.employee )
	WHEN MATCHED THEN 
		UPDATE SET [insert_time] = s.[insert_time] , t.[license_plate_number] = s.license_plate_number
	WHEN NOT MATCHED THEN
		INSERT ([license_plate_number] ,[employee]  ,[insert_time])
		Values (s.license_plate_number, s.employee,s.insert_time);
	
	
END
GO
