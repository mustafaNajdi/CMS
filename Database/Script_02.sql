USE [CMSdb]
GO
/****** Object:  Table [dbo].[StudentTemporaryUrl]    Script Date: 9/21/2018 11:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTemporaryUrl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[ShortCode] [int] NULL,
	[Generated] [datetime] NULL,
	[Expires] [datetime] NULL,
	[IsUsed] [bit] NULL,
 CONSTRAINT [PK_StudentTemporaryUrl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentTemporaryUrl]  WITH CHECK ADD  CONSTRAINT [FK_StudentTemporaryUrl_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[StudentTemporaryUrl] CHECK CONSTRAINT [FK_StudentTemporaryUrl_Students]
GO
