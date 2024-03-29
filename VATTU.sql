USE [VATTU]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 05/01/2021 21:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Status] [int] NULL,
	[ID_User] [int] NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 05/01/2021 21:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailCart]    Script Date: 05/01/2021 21:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailCart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NOT NULL,
	[SumPrice] [float] NOT NULL,
	[IDPro] [int] NOT NULL,
	[IDCart] [int] NOT NULL,
 CONSTRAINT [PK_DetailCart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 05/01/2021 21:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [int] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ISAD] [int] NOT NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 05/01/2021 21:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Price] [float] NOT NULL,
	[Unit] [nvarchar](50) NOT NULL,
	[Discount] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Image] [nvarchar](500) NOT NULL,
	[IDCategory] [int] NOT NULL,
	[TTX] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (3, CAST(N'2020-11-01' AS Date), 1, 1)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (4, CAST(N'2020-11-01' AS Date), 1, 3)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (8, CAST(N'2020-11-09' AS Date), 1, 1)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (9, CAST(N'2020-11-11' AS Date), 1, 1)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (10, CAST(N'2020-11-13' AS Date), 1, 5)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (11, CAST(N'2020-12-31' AS Date), 1, 1)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (12, CAST(N'2020-12-31' AS Date), 1, 5)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (13, CAST(N'2020-12-31' AS Date), 1, 1)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (14, CAST(N'2020-12-31' AS Date), 1, 1)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (15, CAST(N'2020-12-31' AS Date), 1, 3)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (16, CAST(N'2020-12-31' AS Date), 1, 3)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (17, CAST(N'2020-12-31' AS Date), 1, 5)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (18, CAST(N'2021-01-05' AS Date), 1, 7)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (19, CAST(N'2021-01-05' AS Date), 1, 1)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (20, CAST(N'2021-01-05' AS Date), 1, 7)
INSERT [dbo].[Cart] ([ID], [Date], [Status], [ID_User]) VALUES (21, CAST(N'2021-01-05' AS Date), 1, 7)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[Category] ([ID], [Name]) VALUES (1, N'SƠN')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (2, N'XI MĂNG')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (3, N'ỐNG NƯỚC')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (4, N'GẠCH XÂY DỰNG')
GO
SET IDENTITY_INSERT [dbo].[DetailCart] ON 

INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (4, 3, 2400000, 1, 3)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (5, 2, 1400000, 2, 3)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (6, 4, 100000, 11, 4)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (7, 5, 50000, 12, 4)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (10, 2, 36000, 63, 8)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (11, 1, 19000, 54, 8)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (12, 2, 950000, 31, 9)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (13, 2, 133000, 45, 9)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (14, 2, 1140000, 34, 10)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (15, 1, 23750, 51, 10)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (16, 2, 38000, 54, 11)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (17, 1, 570000, 34, 11)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (18, 2, 36000, 63, 11)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (19, 2, 950000, 31, 12)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (20, 1, 23750, 51, 13)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (21, 1, 57000, 46, 14)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (22, 1, 800000, 20, 14)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (23, 1, 475000, 31, 15)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (24, 5, 90000, 63, 16)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (25, 2, 57000, 53, 17)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (26, 2, 1400000, 2, 18)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (27, 1, 570000, 32, 18)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (28, 2, 114000, 46, 19)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (29, 2, 36000, 63, 20)
INSERT [dbo].[DetailCart] ([ID], [Amount], [SumPrice], [IDPro], [IDCart]) VALUES (30, 2, 1200000, 3, 21)
SET IDENTITY_INSERT [dbo].[DetailCart] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([ID], [Name], [Email], [Phone], [Address], [Username], [Password], [ISAD]) VALUES (1, N'Tai', N'tai@gmail.com', 912345678, N'TPHCM', N'tai', N'123123', 0)
INSERT [dbo].[NguoiDung] ([ID], [Name], [Email], [Phone], [Address], [Username], [Password], [ISAD]) VALUES (2, N'Tinh', N'ad@gmail.com', 913576809, N'TPHCM', N'Tinh', N'111111', 1)
INSERT [dbo].[NguoiDung] ([ID], [Name], [Email], [Phone], [Address], [Username], [Password], [ISAD]) VALUES (3, N'Thao', N'thao@gmail.com', 91352424, N'TPHCM', N'thao', N'123456', 0)
INSERT [dbo].[NguoiDung] ([ID], [Name], [Email], [Phone], [Address], [Username], [Password], [ISAD]) VALUES (5, N'Tinh', N'tinh@gmail.com', 913576809, N'TPHCM', N'Tinh', N'123456', 0)
INSERT [dbo].[NguoiDung] ([ID], [Name], [Email], [Phone], [Address], [Username], [Password], [ISAD]) VALUES (7, N'Hanh', N'hanh@gmail.com', 913567809, N'Quận 7, THHCM', N'Hanh', N'123456', 0)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (1, N'Sơn Dulux', 900000, N'Thùng', 10, N' Sơn dulux giúp ngăn ngừa vết bẩn bám trên tường tốt hơn các loại sơn thông thường. Chùi rửa dễ dàng mà không phá hủy màng sơn. Che lấp tốt. Chống bám bụi.Chống rạn nứt và bong tróc.Không chứa Chì và Thủy ngân, sản phẩm thân thiện với môi trường.Màu sắc sơn bóng đẹp mang đến cho ngôi nhà một vẻ đẹp sang trọng.', N'images/son1.png', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (2, N'Sơn Kova', 700000, N'Thùng', 0, N'Sơn Kova. Sơn đẹp cho mọi nhà', N'images/son2.png', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (3, N'Sơn Kolor', 600000, N'Thùng', 0, N' Các dòng sản phẩm của HÃNG SƠN KOLOR PAINT đều  đạt chất lượng cao đã được kết tinh từ  tinh hoa trí  tuệ của con người, cùng với máy móc công nghệ nhật bản, trang thiết bị hiện đại. Công ty đã đầu tư dây chuyền sản xuất hiện đại được nhập từ Anh Quốc cùng với nguyên liệu nhập ngoại. Trong quá trình sản xuất không tạo chất thải độc hại cho người sản xuất cũng như người sử dụng.Với công nghệ pha màu bằng máy vi tính, đảm bảo độ chỉnh xác cao, sản phẩm sơn màu của công ty luôn có màu sắc bền đẹp, không phai màu.', N'images/son3.png', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (4, N'Sơn Jotun', 700000, N'Thùng', 0, N'JOTON JOTIN EXT là một loại sơn cao cấp gốc nước do JOTON,.JSC sản xuất, có màng sơn siêu bóng, màu sắc bền đẹp dùng để sơn phủ hoàn thiện bề mặt ngoại thất.  JOTON JOTIN EXT có khả năng kháng nước, kháng kiềm, chống rêu mốc, chống trầy xước, chịu chùi rửa tối đa. ', N'images/son4.jpg', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (5, N'Sơn Nippon', 760000, N'Thùng', 0, N'Sơn Nippon sơn đẹp cho mọi nhà', N'images/son5.jpg', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (6, N'Xi Măng Thăng Long', 80000, N'Bao', 0, N'Xi măng chất lượng cao', N'images/ximang1.png', 2, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (7, N'Xi Măng Hà Tiên', 70000, N'Bao', 0, N'Xia măng chất lượng cao', N'images/ximang2.png', 2, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (9, N'Xi Măng Vicen', 75000, N'Bao', 0, N'Xi măng chất lượng cao', N'images/ximang3.jpg', 2, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (10, N'Ống nhựa PVC', 5000, N'M', 0, N'Ống nhựa chất lượng cao', N'images/ongnhua1.jpg', 3, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (11, N'Ống nhựa PPR', 25000, N'M', 0, N'Ống nhựa chịu áp suất chất lượng cao', N'images/ongPPR.jpg', 3, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (12, N'Ống nhựa HDPE', 10000, N'M', 0, N'Ống nhựa chất lượng cao', N'images/onghdpe.jpg', 3, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (13, N'Gạch AAC', 5000, N'Viên', 0, N'Gạch có cấu trúc bọt khí – khả năng cách âm – cách nhiệt – chống cháy: Nhờ vào cấu trúc bọt khí giúp cho nhiệt độ và âm thanh khi đi qua được giữ lại rất nhiều – giúp bạn tiết kiệm rất nhiều chi phi điện năng và chi phí phát sinh sau thi công. Ngoài ra với khả năng chống cháy lên tới 4 giờ giúp bảo vệ ngôi nhà bạn một cách tốt nhất', N'images/gachAAC.jpg', 4, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (14, N'Gạch Tuynel', 4000, N'Viên', 0, N'Gạch Tuynel là loại gạch đất sét nung sử dụng công nghệ sản xuất lò Tuynel, gạch sản xuất theo công nghệ Tuynel giảm được chi phí, giá thành và hiệu quả cao hơn so với cách làm gạch đất nung truyền thồng.', N'images/gachtuynel.jpg', 4, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (20, N'Sơn Expo', 800000, N'Thùng', 0, N'Sơn chất lượng cao', N'images/son6.png', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (21, N'Sơn JYMEC', 700000, N'Thùng', 5, N'Sơn tốt cho mọi nhà', N'images/son7.png', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (22, N'Sơn MAXILITE', 650000, N'Thùng', 5, N'Sơn tốt cho mọi nhà', N'images/son8.png', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (23, N'Sơn TOA', 700000, N'Thùng', 0, N'Sơn tố cho mọi nhà', N'images/son9.jpg', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (24, N'Sơn NISHU', 500000, N'Thùng', 5, N'Sơn tốt cho mọi nhà', N'images/son10.jpg', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (25, N'Sơn JAJYNIC', 600000, N'Thùng', 10, N'Sơn tốt cho mọi nhà', N'images/son11.jpg', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (26, N'Sơn ALETIC', 600000, N'Thùng', 5, N'Sơn tốt cho mọi nhà', N'images/son12.jpg', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (27, N'Sơn GALAXY', 800000, N'Thùng', 10, N'Sơn tốt cho mọi nhà', N'images/son13.jpg', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (28, N'Sơn VIGLACERA', 550000, N'Thùng', 10, N'Sơn tốt cho mọi nhà', N'images/son14.png', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (29, N'Sơn SPEC', 800000, N'Thùng', 5, N'Sơn tốt cho mọi nhà', N'images/son15.png', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (30, N'Sơn ZIKON', 700000, N'Thùng', 5, N'Sơn tốt cho mọi nhà', N'images/son16.jpg', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (31, N'Sơn KAMAX', 500000, N'Thùng', 5, N'Sơn tốt cho mọi nhà', N'images/son17.png', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (32, N'Sơn SONBOSS', 600000, N'Thùng', 5, N'Sơn tốt cho mọi nhà', N'images/son18.png', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (33, N'Sơn CLIMA', 550000, N'Thùng', 2, N'Sơn tố cho mọi nhà', N'images/son19.jpg', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (34, N'Sơn NANOMAX', 600000, N'Thùng', 5, N'Sơn tốt cho mọi nhà', N'images/son20.jpg', 1, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (35, N'Xi Măng CHINFON', 80000, N'Bao', 5, N'Xi măng chất lượng cao', N'images/ximang4.jpg', 2, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (36, N'Xi Măng HOLCIM', 90000, N'Bao', 5, N'Xi măng chất lượng cao', N'images/ximang5.jpg', 2, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (38, N'Xi Măng FICO', 80000, N'Bao', 10, N'Xi măng chất lượng cao', N'images/ximang6.jpg', 2, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (39, N'Xi Măng INSEE', 75000, N'Bao', 5, N'Xi măng chất lượng cao', N'images/ximang7.png', 2, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (40, N'Xi Măng TRUNG SƠN', 80000, N'Bao', 5, N'Xi măng chất lượng cao', N'images/ximang8.png', 2, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (41, N'Xi Măng VIỆT ÚC', 80000, N'Bao ', 5, N'Xi măng chất lượng cao', N'images/ximang9.png', 2, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (43, N'Xi Măng KAITO', 75000, N'Bao', 5, N'Xi măng chất lượng cao', N'images/ximang10.jpg', 2, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (44, N'Xi Măng Nghi Sơn', 70000, N'Bao', 5, N'Xi măng chất lượng cao ', N'images/ximang11.jpg', 2, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (45, N'Xi Măng Sài Gòn', 70000, N'Bao ', 5, N'Xi măng chất lượng cao ', N'images/ximang12.jpg', 2, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (46, N'Xi Măng Hạ Long', 60000, N'Bao ', 5, N'Xi măng chất lượng cao', N'images/ximang13.jpg', 2, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (47, N'Ống Nước PPR PN16', 20000, N'M', 5, N'Ống nước chất lượng cao', N'images/ongPPRPN16.jpg', 3, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (51, N'Ống Nước Giãn Nở', 25000, N'M', 5, N'Ống nước chất lượng cao', N'images/ong2.jpg', 3, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (52, N'Ống Nước LION KING', 30000, N'M', 5, N'Ống nước chất lượng cao', N'images/ong1.jpg', 3, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (53, N'Ống Nước Chịu Áp Lực', 30000, N'M', 5, N'Ống nước chất lượng cao', N'images/ongapluc.jpg', 3, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (54, N'Ống Nước LDPE', 20000, N'M', 5, N'Ống nước chất lượng cao', N'images/ong4.png', 3, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (55, N'Gạch Nung 2 Lỗ', 5000, N'Viên', 5, N'Gạch chất lượng cao', N'images/gach2lo.jpg', 4, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (56, N'Gạch Nung 4 lỗ ', 10000, N'Viên', 5, N'Gạch chất lương cao', N'images/gach4lo.jpg', 4, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (57, N'Gạch Bê Tông', 15000, N'Viên', 5, N'Gạch chất lượng cao', N'images/gachbetong.jpg', 4, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (58, N'Gạch Đặc', 5000, N'Viên', 5, N'Gạch chất lượng cao', N'images/gachdac.jpg', 4, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (59, N'Gạch Tàu Lục Giác', 10000, N'Viên', 10, N'Gạch chất lượng cao', N'images/gachtaulucgiac.jpg', 4, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (60, N'Gạch Tàu Vuông', 10000, N'Viên', 10, N'Gạch chất lượng cao', N'images/gachtauvuongjpg.jpg', 4, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (62, N'Gạch Thẻ Trang Trí', 15000, N'Viên', 10, N'Gạch chất lương cao', N'images/gachthetrangtri.jpg', 4, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (63, N'Gạch Thủy Tinh', 20000, N'Viên', 10, N'Gạch chất lượng cao', N'images/gachthuytinh.jpg', 4, 1)
INSERT [dbo].[Product] ([ID], [Name], [Price], [Unit], [Discount], [Description], [Image], [IDCategory], [TTX]) VALUES (71, N'Nguyen Van A', 500000, N'Bao', 5, N'Sơn tốt cho mọi nhà', N'images/giotnuoc.jpg', 2, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_NguoiDung] FOREIGN KEY([ID_User])
REFERENCES [dbo].[NguoiDung] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_NguoiDung]
GO
ALTER TABLE [dbo].[DetailCart]  WITH CHECK ADD  CONSTRAINT [FK_DetailCart_Cart] FOREIGN KEY([IDCart])
REFERENCES [dbo].[Cart] ([ID])
GO
ALTER TABLE [dbo].[DetailCart] CHECK CONSTRAINT [FK_DetailCart_Cart]
GO
ALTER TABLE [dbo].[DetailCart]  WITH CHECK ADD  CONSTRAINT [FK_DetailCart_Product] FOREIGN KEY([IDPro])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[DetailCart] CHECK CONSTRAINT [FK_DetailCart_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
