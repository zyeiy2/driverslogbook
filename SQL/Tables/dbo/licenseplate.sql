SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[licenseplate](
	[license_plate_number] [nvarchar](100) NULL,
	[employee] [nvarchar](100) NULL,
	[insert_time] [datetime2](7) NULL
) ON [PRIMARY]
GO
