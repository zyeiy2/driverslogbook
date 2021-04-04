SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dayinoffice](
	[office_date] [date] MASKED WITH (FUNCTION = 'default()') NULL,
	[employee] [nvarchar](100) MASKED WITH (FUNCTION = 'partial(3, "x", 3)') NULL,
	[insert_time] [datetime2](7) NULL
) ON [PRIMARY]
GO
