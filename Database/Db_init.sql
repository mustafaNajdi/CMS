USE [CMSdb]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 9/3/2018 7:48:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PayId] [int] NOT NULL,
	[ReqNo] [int] NULL,
	[Date] [datetime] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registrar]    Script Date: 9/3/2018 7:48:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrar](
	[RegName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[RegID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Registrar] PRIMARY KEY CLUSTERED 
(
	[RegID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[requester]    Script Date: 9/3/2018 7:48:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requester](
	[RequesterId] [int] NOT NULL,
	[RequesterName] [nvarchar](50) NULL,
	[RequesterAddress] [nvarchar](50) NULL,
	[RequesterPhone] [nvarchar](50) NULL,
	[ActivationCode] [smallint] NULL,
 CONSTRAINT [PK_requester] PRIMARY KEY CLUSTERED 
(
	[RequesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reuest]    Script Date: 9/3/2018 7:48:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reuest](
	[ReqId] [int] NOT NULL,
	[StuNo] [nvarchar](50) NULL,
	[Satus] [smallint] NULL,
	[Date] [datetime] NULL,
	[PayType] [int] NULL,
	[TotalPrice] [int] NULL,
	[Payed] [smallint] NULL,
	[Ready] [smallint] NULL,
 CONSTRAINT [PK_Reuest] PRIMARY KEY CLUSTERED 
(
	[ReqId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 9/3/2018 7:48:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Registrar] ([RegName], [Password], [RegID]) VALUES (N'mustafa', N'12345', N'25')
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email]) VALUES (4, N'Ali', N'Osman', N'Osman@gmail.com')
SET IDENTITY_INSERT [dbo].[Student] OFF
