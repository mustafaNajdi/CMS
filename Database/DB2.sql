USE [CMSdb]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 9/17/2018 4:09:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[Cartoon] [int] NULL,
	[Degree] [int] NULL,
	[Details] [int] NULL,
	[Enrollment] [int] NULL,
	[date] [date] NULL,
	[RequestId] [int] NULL,
	[StuId] [int] NULL,
	[Total] [int] NULL,
	[Delivery] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 9/17/2018 4:09:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PayId] [int] NOT NULL,
	[RequestId] [int] NULL,
	[Date] [datetime] NULL,
	[Total] [int] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registrar]    Script Date: 9/17/2018 4:09:18 PM ******/
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
/****** Object:  Table [dbo].[requester]    Script Date: 9/17/2018 4:09:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requester](
	[id] [int] NOT NULL,
	[RequesterName] [nvarchar](50) NULL,
	[RequesterAddress] [nvarchar](50) NULL,
	[ActivationCode] [smallint] NULL,
 CONSTRAINT [PK_requester] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reuest]    Script Date: 9/17/2018 4:09:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reuest](
	[RequestId] [int] NOT NULL,
	[StuId] [int] NULL,
	[Satus] [smallint] NULL,
	[Date] [datetime] NULL,
	[TotalPrice] [int] NULL,
	[Payed] [smallint] NULL,
	[Ready] [smallint] NULL,
 CONSTRAINT [PK_Reuest] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 9/17/2018 4:09:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](50) NULL,
	[PhoneNumber] [text] NULL,
	[Email] [text] NULL,
	[Faculty] [text] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Reuest] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Reuest] ([RequestId])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Reuest]
GO
