SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:     Benjamin Laerbusch
-- Create Date: 24.01.2019
-- Description: Get License Plate
-- =============================================
CREATE PROCEDURE [dbo].[getlicenseplate]
(
    -- Add the parameters for the stored procedure here
    @employee as nvarchar(100)
    
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
   Select [license_plate_number] from [dbo].[licenseplate] where employee =@employee
END
GO
