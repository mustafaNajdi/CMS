USE [CMSdb]
GO
/****** Object:  Table [dbo].[Batches]    Script Date: 9/19/2018 1:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_Batches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CertificateTypes]    Script Date: 9/19/2018 1:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CertificateTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Price] [int] NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[IsDeleted] [bit] NULL CONSTRAINT [DF_CertificateTypes_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_CertificateTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeliveryTypes]    Script Date: 9/19/2018 1:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[IsDeleted] [bit] NULL CONSTRAINT [DF_Delivery-Types_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Delivery-Types] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 9/19/2018 1:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[IsDeleted] [bit] NULL CONSTRAINT [DF_Facullties_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Facullties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculty_Batch]    Script Date: 9/19/2018 1:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty_Batch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BatchId] [int] NULL,
	[FacultyId] [int] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Faculty_Batch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 9/19/2018 1:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReqId] [int] NULL,
	[Amount] [int] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request_Certificate]    Script Date: 9/19/2018 1:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_Certificate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReqId] [int] NULL,
	[CertificateId] [int] NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Request_Certificate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Requests]    Script Date: 9/19/2018 1:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[DeliveryId] [int] NULL,
	[DeliveryAddress] [nvarchar](200) NULL,
	[TotalPrice] [int] NULL,
	[IsPaid] [bit] NULL,
	[IsChecked] [bit] NULL,
	[IsApproved] [bit] NULL,
	[IsDeliverd] [bit] NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 9/19/2018 1:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[IsDeleted] [bit] NULL CONSTRAINT [DF_Roles_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 9/19/2018 1:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentIndex] [bigint] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[FacultyId] [int] NULL,
	[PhotoPath] [nvarchar](max) NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/19/2018 1:18:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Batches] ON 

INSERT [dbo].[Batches] ([Id], [Name], [CreatedDate], [UpdatedDate]) VALUES (1, N'Batch (1)', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Batches] ([Id], [Name], [CreatedDate], [UpdatedDate]) VALUES (2, N'Batch (2)', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Batches] ([Id], [Name], [CreatedDate], [UpdatedDate]) VALUES (3, N'Batch (3)', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Batches] ([Id], [Name], [CreatedDate], [UpdatedDate]) VALUES (4, N'Batch (4)', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Batches] ([Id], [Name], [CreatedDate], [UpdatedDate]) VALUES (5, N'Batch (5)', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date))
SET IDENTITY_INSERT [dbo].[Batches] OFF
SET IDENTITY_INSERT [dbo].[CertificateTypes] ON 

INSERT [dbo].[CertificateTypes] ([Id], [Type], [Price], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (1, N'Degree', 500, CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date), 0)
INSERT [dbo].[CertificateTypes] ([Id], [Type], [Price], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (2, N'Details', 300, CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date), 0)
INSERT [dbo].[CertificateTypes] ([Id], [Type], [Price], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (3, N'Cartoon', 700, CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date), 0)
INSERT [dbo].[CertificateTypes] ([Id], [Type], [Price], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (4, N'Enrollment', 200, CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date), 0)
SET IDENTITY_INSERT [dbo].[CertificateTypes] OFF
SET IDENTITY_INSERT [dbo].[DeliveryTypes] ON 

INSERT [dbo].[DeliveryTypes] ([Id], [Type], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (1, N'In University', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date), 0)
INSERT [dbo].[DeliveryTypes] ([Id], [Type], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (2, N'DHL', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date), 0)
SET IDENTITY_INSERT [dbo].[DeliveryTypes] OFF
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([Id], [Name], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (1, N'Computer Science', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date), 0)
INSERT [dbo].[Faculties] ([Id], [Name], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (2, N'Business', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date), 0)
INSERT [dbo].[Faculties] ([Id], [Name], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (3, N'Multimedia', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Faculties] OFF
SET IDENTITY_INSERT [dbo].[Faculty_Batch] ON 

INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (1, 1, 1, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (2, 2, 1, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (3, 3, 1, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (8, 4, 1, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (9, 5, 1, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (10, 1, 2, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (11, 2, 2, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (12, 3, 2, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (13, 4, 2, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (14, 5, 2, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (15, 1, 3, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (16, 2, 3, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (17, 3, 3, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (18, 4, 3, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Faculty_Batch] ([Id], [BatchId], [FacultyId], [CreatedDate]) VALUES (19, 5, 3, CAST(N'2018-09-19' AS Date))
SET IDENTITY_INSERT [dbo].[Faculty_Batch] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleName], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (1, N'Admin', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (2, N'Statistic', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (3, N'Dean', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [CreatedDate], [UpdatedDate], [IsDeleted]) VALUES (4, N'StudentAffair', CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [StudentIndex], [FirstName], [LastName], [Email], [PhoneNumber], [FacultyId], [PhotoPath], [CreatedDate]) VALUES (1, 2492017, N'abbas', N'altoum', N'abasaltoum@gmail.com', N'0912305051', 1, NULL, CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Students] ([Id], [StudentIndex], [FirstName], [LastName], [Email], [PhoneNumber], [FacultyId], [PhotoPath], [CreatedDate]) VALUES (2, 3382018, N'tariq', N'awad', N'tariq@gmail.com', N'0123778690', 2, NULL, CAST(N'2018-09-19' AS Date))
SET IDENTITY_INSERT [dbo].[Students] OFF
ALTER TABLE [dbo].[Requests] ADD  CONSTRAINT [DF_Requests_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO
ALTER TABLE [dbo].[Requests] ADD  CONSTRAINT [DF_Requests_IsChecked]  DEFAULT ((0)) FOR [IsChecked]
GO
ALTER TABLE [dbo].[Requests] ADD  CONSTRAINT [DF_Requests_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[Requests] ADD  CONSTRAINT [DF_Requests_IsDeliverd]  DEFAULT ((0)) FOR [IsDeliverd]
GO
ALTER TABLE [dbo].[Requests] ADD  CONSTRAINT [DF_Requests_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Faculty_Batch]  WITH CHECK ADD  CONSTRAINT [FK_Faculty_Batch_Batches] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([Id])
GO
ALTER TABLE [dbo].[Faculty_Batch] CHECK CONSTRAINT [FK_Faculty_Batch_Batches]
GO
ALTER TABLE [dbo].[Faculty_Batch]  WITH CHECK ADD  CONSTRAINT [FK_Faculty_Batch_Faculties] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([Id])
GO
ALTER TABLE [dbo].[Faculty_Batch] CHECK CONSTRAINT [FK_Faculty_Batch_Faculties]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Requests] FOREIGN KEY([ReqId])
REFERENCES [dbo].[Requests] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Requests]
GO
ALTER TABLE [dbo].[Request_Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Request_Certificate_CertificateTypes] FOREIGN KEY([CertificateId])
REFERENCES [dbo].[CertificateTypes] ([Id])
GO
ALTER TABLE [dbo].[Request_Certificate] CHECK CONSTRAINT [FK_Request_Certificate_CertificateTypes]
GO
ALTER TABLE [dbo].[Request_Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Request_Certificate_Requests] FOREIGN KEY([ReqId])
REFERENCES [dbo].[Requests] ([Id])
GO
ALTER TABLE [dbo].[Request_Certificate] CHECK CONSTRAINT [FK_Request_Certificate_Requests]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_DeliveryTypes] FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[DeliveryTypes] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_DeliveryTypes]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Students]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Faculties] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Faculties]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
