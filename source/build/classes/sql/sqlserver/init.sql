USE [OTS]
GO
/****** Object:  Table [dbo].[address]    Script Date: 2015-11-29 12:49:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[address](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[city] [varchar](20) NOT NULL,
	[state] [varchar](10) NOT NULL,
	[zipcode] [varchar](10) NOT NULL,
	[client_id] [smallint] NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[client]    Script Date: 2015-11-29 12:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[client](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[cell_phone] [varchar](11) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[address_id] [smallint] NOT NULL,
	[status] [tinyint] NOT NULL CONSTRAINT [DF_client_status]  DEFAULT ((0)),
	[create_date] [varchar](19) NULL,
	[login_name] [varchar](64) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[trader_id] [smallint] NOT NULL,
	[client_level] [tinyint] NOT NULL CONSTRAINT [DF_client_level]  DEFAULT ((0)),
	[stock] [numeric](10, 2) NOT NULL CONSTRAINT [DF_client_stock]  DEFAULT ((0)),
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[client_role]    Script Date: 2015-11-29 12:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_role](
	[client_id] [smallint] NOT NULL,
	[role_id] [smallint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[oil_transaction]    Script Date: 2015-11-29 12:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[oil_transaction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [smallint] NOT NULL,
	[volume] [smallint] NOT NULL,
	[type] [tinyint] NOT NULL,
	[create_date] [varchar](19) NULL,
	[pay_method] [tinyint] NOT NULL,
	[commission] [numeric](10, 2) NOT NULL,
	[commission_oil] [numeric](10, 2) NOT NULL,
	[price] [numeric](10, 2) NOT NULL,
	[cause_upgrade] [tinyint] NOT NULL,
	[pay_date] [varchar](19) NULL,
	[cancel_date] [varchar](19) NULL,
	[status] [tinyint] NOT NULL,
 CONSTRAINT [PK_oil_transaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_resource]    Script Date: 2015-11-29 12:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_resource](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[url] [varchar](100) NULL,
	[description] [varchar](255) NULL,
	[icon] [varchar](32) NULL,
	[pid] [smallint] NULL,
	[seq] [tinyint] NOT NULL CONSTRAINT [DF_sys_resource_seq]  DEFAULT ((0)),
	[state] [tinyint] NOT NULL CONSTRAINT [DF_sys_resource_state]  DEFAULT ((0)),
	[resourcetype] [tinyint] NOT NULL CONSTRAINT [DF_sys_resource_resourcetype]  DEFAULT ((0)),
	[createdatetime] [varchar](19) NULL,
 CONSTRAINT [PK_sys_resource] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_role]    Script Date: 2015-11-29 12:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_role](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[seq] [tinyint] NOT NULL CONSTRAINT [DF_sys_role_seq]  DEFAULT ((0)),
	[description] [varchar](255) NULL,
	[isdefault] [tinyint] NOT NULL CONSTRAINT [DF_sys_role_isdefault]  DEFAULT ((0)),
 CONSTRAINT [PK_sys_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_role_resource]    Script Date: 2015-11-29 12:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role_resource](
	[role_id] [smallint] NOT NULL,
	[resource_id] [smallint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sys_user]    Script Date: 2015-11-29 12:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_user](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[loginname] [varchar](64) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[sex] [tinyint] NOT NULL CONSTRAINT [DF_sys_user_sex]  DEFAULT ((0)),
	[state] [tinyint] NOT NULL CONSTRAINT [DF_sys_user_state]  DEFAULT ((0)),
	[createdatetime] [varchar](19) NULL,
 CONSTRAINT [PK_sys_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_user_role]    Script Date: 2015-11-29 12:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_user_role](
	[user_id] [smallint] NOT NULL,
	[role_id] [smallint] NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[address] ON 

INSERT [dbo].[address] ([id], [city], [state], [zipcode], [client_id]) VALUES (5, N'Dallas', N'TX', N'75080', 4)
SET IDENTITY_INSERT [dbo].[address] OFF
SET IDENTITY_INSERT [dbo].[client] ON 

INSERT [dbo].[client] ([id], [name], [phone], [cell_phone], [email], [address_id], [status], [create_date], [login_name], [password], [trader_id], [client_level], [stock]) VALUES (4, N'client1', N'9861452435', N'2458765543', N'test@hotmail.com', 5, 0, N'2015-11-29 00:58:39', N'client1', N'96e79218965eb72c92a549dd5a330112', 2, 0, CAST(0.00 AS Numeric(10, 2)))
SET IDENTITY_INSERT [dbo].[client] OFF
INSERT [dbo].[client_role] ([client_id], [role_id]) VALUES (4, 3)
SET IDENTITY_INSERT [dbo].[sys_resource] ON 

INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (1, N'system manage', N'', N'system manage', N'icon_sys', NULL, 1, 0, 0, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (2, N'resource manage', N'/resource/manager', N'resource manage', N'icon_resource', 1, 1, 0, 0, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (3, N'resource list', N'/resource/treeGrid', N'resource list', N'icon_resource', 2, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (4, N'add', N'/resource/add', N'resource add', N'icon_resource', 2, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (5, N'edit', N'/resource/edit', N'resource edit', N'icon_resource', 2, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (6, N'delete', N'/resource/delete', N'resource delete', N'icon_resource', 2, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (7, N'role manage', N'/role/manager', N'role manage', N'icon_role', 1, 0, 0, 0, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (8, N'role list', N'/role/dataGrid', N'role list', N'icon_role', 7, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (9, N'add', N'/role/add', N'role add', N'icon_role', 7, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (10, N'edit', N'/role/edit', N'role edit', N'icon_role', 7, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (11, N'delete', N'/role/delete', N'role delete', N'icon_role', 7, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (12, N'grant', N'/role/grant', N'role grant', N'icon_role', 7, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (13, N'trader manage', N'/user/manager', N'user manage', N'icon_user', 1, 0, 0, 0, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (14, N'user list', N'/user/dataGrid', N'user list', N'icon_user', 13, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (15, N'add', N'/user/add', N'user add', N'icon_user', 13, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (16, N'edit', N'/user/edit', N'user edit', N'icon_user', 13, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (17, N'delete', N'/user/delete', N'user delete', N'icon_user', 13, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (18, N'view', N'/user/view', N'user view', N'icon_user', 13, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (19, N'client manage', N'/client/manager', N'user manage', N'icon_user', 1, 0, 0, 0, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (20, N'client list', N'/client/dataGrid', N'client list', N'icon_user', 19, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (21, N'add', N'/client/add', N'user add', N'icon_user', 19, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (22, N'edit', N'/client/edit', N'user edit', N'icon_user', 19, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (23, N'delete', N'/client/delete', N'user delete', N'icon_user', 19, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (24, N'transaction manage', N'', N'', N'icon_sys', NULL, 0, 0, 0, N'15-11-28 04:22:10')
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (25, N'oil buy', N'/buy/manager', N'', N'', 24, 0, 0, 0, N'15-11-28 04:24:06')
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (26, N'oil sell', N'/sell/manager', N'', N'', 24, 0, 0, 0, N'15-11-28 04:24:45')
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (27, N'view', N'/client/view', N'client view', N'icon_user', 19, 0, 0, 1, NULL)
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (28, N'buy list', N'/buy/dataGrid', N'', N'', 25, 0, 0, 1, N'15-11-28 04:29:38')
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (29, N'add', N'/buy/add', N'', N'', 25, 0, 0, 1, N'15-11-28 04:29:57')
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (30, N'edit', N'/buy/edit', N'', N'', 25, 0, 0, 1, N'15-11-28 04:30:29')
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (31, N'delete', N'/buy/delete', N'', N'', 25, 0, 0, 1, N'15-11-28 04:31:13')
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (32, N'sell list', N'/sell/dataGrid', N'', N'', 26, 0, 0, 1, N'15-11-28 04:31:50')
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (33, N'add', N'/sell/add', N'', N'', 26, 0, 0, 1, N'15-11-28 04:32:24')
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (34, N'edit', N'/sell/edit', N'', N'', 26, 0, 0, 1, N'15-11-28 04:32:46')
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (35, N'delete', N'/sell/delete', N'', N'', 26, 0, 0, 1, N'15-11-28 04:33:19')
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (36, N'statistics', N'/sum/statistics', N'', N'', 24, 0, 0, 0, N'2015-11-28 11:57:53')
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (37, N'cancel', N'/buy/cancel', N'', N'', 25, 0, 0, 1, N'2015-11-29 01:42:43')
INSERT [dbo].[sys_resource] ([id], [name], [url], [description], [icon], [pid], [seq], [state], [resourcetype], [createdatetime]) VALUES (38, N'cancel', N'/sell/cancel', N'', N'', 26, 0, 0, 1, N'2015-11-29 01:43:09')
SET IDENTITY_INSERT [dbo].[sys_resource] OFF
SET IDENTITY_INSERT [dbo].[sys_role] ON 

INSERT [dbo].[sys_role] ([id], [name], [seq], [description], [isdefault]) VALUES (1, N'manager', 0, N'manager', 0)
INSERT [dbo].[sys_role] ([id], [name], [seq], [description], [isdefault]) VALUES (2, N'trader', 1, N'', 1)
INSERT [dbo].[sys_role] ([id], [name], [seq], [description], [isdefault]) VALUES (3, N'client', 2, N'', 1)
SET IDENTITY_INSERT [dbo].[sys_role] OFF
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 15)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 25)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 32)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 22)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 26)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 28)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 2)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 13)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 14)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 16)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 20)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 27)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 34)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 8)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 19)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 18)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 10)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 1)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 36)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 6)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 33)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 23)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 7)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 17)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 11)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 24)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 21)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 4)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 31)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 9)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 30)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 12)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 5)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 3)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 29)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 25)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 30)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 35)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 34)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 32)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 26)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 27)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 20)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 24)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 1)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 29)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 19)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 28)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 36)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 22)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 31)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (3, 33)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 27)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 23)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 28)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 30)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 14)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 21)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 31)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 20)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 19)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 18)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 13)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 29)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 24)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 25)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 38)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 35)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 26)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 16)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 36)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (1, 35)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 1)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 34)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 32)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 33)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 22)
INSERT [dbo].[sys_role_resource] ([role_id], [resource_id]) VALUES (2, 37)
SET IDENTITY_INSERT [dbo].[sys_user] ON 

INSERT [dbo].[sys_user] ([id], [loginname], [name], [password], [sex], [state], [createdatetime]) VALUES (1, N'admin', N'admin', N'21232f297a57a5a743894a0e4a801fc3', 0, 0, N'2015-11-28 05:21:59')
INSERT [dbo].[sys_user] ([id], [loginname], [name], [password], [sex], [state], [createdatetime]) VALUES (2, N'trader1', N'trader1', N'96e79218965eb72c92a549dd5a330112', 0, 0, N'2015-11-28 05:21:59')
SET IDENTITY_INSERT [dbo].[sys_user] OFF
INSERT [dbo].[sys_user_role] ([user_id], [role_id]) VALUES (1, 1)
INSERT [dbo].[sys_user_role] ([user_id], [role_id]) VALUES (2, 2)
ALTER TABLE [dbo].[oil_transaction] ADD  CONSTRAINT [DF_transaction_commission]  DEFAULT ((0)) FOR [commission]
GO
ALTER TABLE [dbo].[oil_transaction] ADD  CONSTRAINT [DF_transaction_commission_oil]  DEFAULT ((0)) FOR [commission_oil]
GO
ALTER TABLE [dbo].[oil_transaction] ADD  CONSTRAINT [DF_transaction_price]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[oil_transaction] ADD  CONSTRAINT [DF_transaction_cause_upgrade]  DEFAULT ((0)) FOR [cause_upgrade]
GO
ALTER TABLE [dbo].[oil_transaction] ADD  CONSTRAINT [DF_transaction_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[client]  WITH CHECK ADD  CONSTRAINT [FK_client_sys_user] FOREIGN KEY([trader_id])
REFERENCES [dbo].[sys_user] ([id])
GO
ALTER TABLE [dbo].[client] CHECK CONSTRAINT [FK_client_sys_user]
GO
ALTER TABLE [dbo].[oil_transaction]  WITH CHECK ADD  CONSTRAINT [FK_oil_transaction_client] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([id])
GO
ALTER TABLE [dbo].[oil_transaction] CHECK CONSTRAINT [FK_oil_transaction_client]
GO
