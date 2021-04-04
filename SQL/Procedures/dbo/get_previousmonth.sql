SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:     Benjamin Laerbusch
-- Create Date: 24.01.2019
-- Description: Get previus month
-- =============================================
CREATE PROCEDURE [dbo].[getpreviousmonth]

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
   Select [month] = FORMAT (  DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - 1, 0), 'y', 'de-de' )
END
GO
