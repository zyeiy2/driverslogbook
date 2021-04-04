SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:     Benjamin Laerbusch
-- Create Date: 24.01.2019
-- Description: Month with diff
-- =============================================
CREATE PROCEDURE [dbo].[getmonth]
(
    -- Add the parameters for the stored procedure here
   @diff as int,
   @format as nvarchar(10)
)

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
   Select [month] = FORMAT (  DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - @diff, 0), 'y', @format )
END
GO
