SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderPickupCode] [int] NOT NULL,
 CONSTRAINT [PK__ExamOrde__C3905BAFC7CC9AED] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 14.06.2024 8:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Amount] [smallint] NOT NULL,
 CONSTRAINT [PK__ExamOrde__817A266255BBC081] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 14.06.2024 8:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[OrderPickupPoint] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ExamPickupPoint] PRIMARY KEY CLUSTERED 
(
	[OrderPickupPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 14.06.2024 8:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](max) NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__ExamProd__2EA7DCD5BF55BCD9] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 14.06.2024 8:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [tinyint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__ExamRole__8AFACE3AA2D40FB8] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 14.06.2024 8:54:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [tinyint] NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__ExamUser__1788CCAC0829F7A9] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (1, 1, N'Новый ', CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), 24, 201)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (2, NULL, N'Новый ', CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 25, 202)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (3, 2, N'Новый ', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 26, 203)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (4, NULL, N'Новый ', CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 27, 204)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (5, 3, N'Новый ', CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 28, 205)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (6, NULL, N'Новый ', CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), 29, 206)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (7, NULL, N'Новый ', CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 30, 207)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (8, NULL, N'Новый ', CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 31, 208)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (9, 4, N'Новый ', CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 32, 209)
INSERT [dbo].[Order] ([OrderID], [UserID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderPickupCode]) VALUES (10, NULL, N'Завершен', CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), 33, 210)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'F893T5', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (1, N'А112Т4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'E530Y6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (2, N'F346G5', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'D344Y7', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (3, N'J432E4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'D378D3', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (4, N'E245R5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'H732R5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (5, N'R464G6', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'E573G6', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (6, N'K535G6', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'F344S4', 6)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (7, N'G532R5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'D526R4', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (8, N'S753T5', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'A436H7', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (9, N'V472S3', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'E479G6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Amount]) VALUES (10, N'O875F6', 4)
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (1, N'344288, г. Ангарск, ул. Чехова, 1')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (2, N'614164, г.Ангарск,  ул. Степная, 30')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (3, N'394242, г. Ангарск, ул. Коммунистическая, 43')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (4, N'660540, г. Ангарск, ул. Солнечная, 25')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (5, N'125837, г. Ангарск, ул. Шоссейная, 40')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (6, N'125703, г. Ангарск, ул. Партизанская, 49')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (7, N'625283, г. Ангарск, ул. Победы, 46')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (8, N'614611, г. Ангарск, ул. Молодежная, 50')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (9, N'454311, г.Ангарск, ул. Новая, 19')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (10, N'660007, г.Ангарск, ул. Октябрьская, 19')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (11, N'603036, г. Ангарск, ул. Садовая, 4')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (12, N'450983, г.Ангарск, ул. Комсомольская, 26')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (13, N'394782, г. Ангарск, ул. Чехова, 3')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (14, N'603002, г. Ангарск, ул. Дзержинского, 28')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (15, N'450558, г. Ангарск, ул. Набережная, 30')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (16, N'394060, г.Ангарск, ул. Фрунзе, 43')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (17, N'410661, г. Ангарск, ул. Школьная, 50')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (18, N'625590, г. Ангарск, ул. Коммунистическая, 20')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (19, N'625683, г. Ангарск, ул. 8 Марта')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (20, N'400562, г. Ангарск, ул. Зеленая, 32')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (21, N'614510, г. Ангарск, ул. Маяковского, 47')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (22, N'410542, г. Ангарск, ул. Светлая, 46')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (23, N'620839, г. Ангарск, ул. Цветочная, 8')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (24, N'443890, г. Ангарск, ул. Коммунистическая, 1')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (25, N'603379, г. Ангарск, ул. Спортивная, 46')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (26, N'603721, г. Ангарск, ул. Гоголя, 41')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (27, N'410172, г. Ангарск, ул. Северная, 13')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (28, N'420151, г. Ангарск, ул. Вишневая, 32')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (29, N'125061, г. Ангарск, ул. Подгорная, 8')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (30, N'630370, г. Ангарск, ул. Шоссейная, 24')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (31, N'614753, г. Ангарск, ул. Полевая, 35')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (32, N'426030, г. Ангарск, ул. Маяковского, 44')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (33, N'450375, г. Ангарск ул. Клубная, 44')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (34, N'625560, г. Ангарск, ул. Некрасова, 12')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (35, N'630201, г. Ангарск, ул. Комсомольская, 17')
INSERT [dbo].[PickupPoint] ([OrderPickupPoint], [Address]) VALUES (36, N'190949, г. Ангарск, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'A436H7', N'Chanel No. 5', N'Легендарный женский парфюм с нежными нотами цветов и ванили.', N'Парфюмерия', N'1', N'Chanel', CAST(2399.0000 AS Decimal(19, 4)), 99, 16, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D344Y7', N'MAC Studio Fix Fluid Foundation', N'Тональный крем с максимальным покрытием и матовым финишем.', N'Косметика', N'1', N'MAC', CAST(31999.0000 AS Decimal(19, 4)), 13, 47, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D378D3', N'Dior Lip Glow', N'Уникальный бальзам для губ, который меняет свой оттенок под воздействием pH кожи.', N'Косметика', N'1', N'Dior', CAST(12799.0000 AS Decimal(19, 4)), 18, 266, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D526R4', N'Yves Saint Laurent Black Opium', N'Соблазнительный женский парфюм с нотами кофе и ванили.
', N'Парфюмерия', N'1', N'YSL', CAST(1499.0000 AS Decimal(19, 4)), 45, 84, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E245R5', N'Anastasia Beverly Hills Modern Renaissance Eyeshadow Palette', N'Палетка теней для век с нюдовыми и яркими оттенками.', N'Косметика', N'1', N'ABH', CAST(16099.0000 AS Decimal(19, 4)), 18, 100, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E479G6', N'Gucci Bloom', N'Женский парфюм с нотами жасмина, туберозы и розы.', N'Парфюмерия', N'1', N'Gucci', CAST(1099.0000 AS Decimal(19, 4)), 0, 0, N'Нет в наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E530Y6', N'Huda Beauty FauxFilter Foundation', N'Плотное покрывающее тональное средство, создающее идеальный макияж.', N'Косметика', N'1', N'Huda Beauty', CAST(4899.0000 AS Decimal(19, 4)), 7, 20, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E573G6', N'Marc Jacobs Daisy', N'Свежий и цветочный женский аромат, вдохновленный летними цветами.', N'Парфюмерия', N'1', N'Marc Jacobs', CAST(41999.0000 AS Decimal(19, 4)), 40, 41, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F344S4', N'Fenty Beauty Gloss Bomb Universal Lip Luminizer', N'Ультра-глянцевый блеск для губ с мягкой текстурой и ярким оттенком.', N'Косметика', N'1', N'Fenty Beauty', CAST(9999.0000 AS Decimal(19, 4)), 25, 18, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F346G5', N'Dolce & Gabbana Light Blue', N'Легкий и свежий аромат с нотами цитрусовых и арбуза.', N'Парфюмерия', N'1', N'Dolce & Gabbana', CAST(1499.0000 AS Decimal(19, 4)), 11, 45, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F893T5', N'NARS Radiant Creamy Concealer', N'Консилер с легкой текстурой и высоким покрытием для идеального макияжа.', N'Косметика', N'1', N'NARS', CAST(6499.0000 AS Decimal(19, 4)), 6, 19, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'G532R5', N'Lancome La Vie Est Belle', N'Женский парфюм с нотами ириса, жасмина и апельсина.', N'Парфюмерия', N'1', N'Lancome', CAST(47199.0000 AS Decimal(19, 4)), 40, 56, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H732R5', N'Urban Decay Naked Heat Eyeshadow Palette', N'Палетка с теплыми оттенками теней для создания пылких образов.', N'Косметика', N'1', N'Urban Decay', CAST(32199.0000 AS Decimal(19, 4)), 18, 410, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'J432E4', N'Tom Ford Black Orchid', N'Интенсивный и загадочный женский аромат с нотами туберозы и пачули.', N'Парфюмерия', N'1', N'Tom Ford', CAST(4899.0000 AS Decimal(19, 4)), 12, 150, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K535G6', N'Too Faced Better Than Sex Mascara', N'Тушь для ресниц с объемным эффектом и длительным держанием.', N'Косметика', N'1', N'Too Faced
', CAST(65099.0000 AS Decimal(19, 4)), 20, 88, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'O875F6', N'Viktor & Rolf Flowerbomb', N'Сладкий и яркий аромат с нотами цветов, сахара и пачули.', N'Парфюмерия', N'1', N'Viktor & Rolf', CAST(2799.0000 AS Decimal(19, 4)), 30, 41, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'R464G6', N'Benefit Hoola Matte Bronzer', N'Матовый бронзер для создания скульптуры и загара на лице.', N'Косметика', N'1', N'Benefit', CAST(12599.0000 AS Decimal(19, 4)), 18, 11, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S753T5', N'Chloe Eau de Parfum', N'Легкий и воздушный женский аромат с нотами розы и фрезии.', N'Парфюмерия', N'1', N'Chloe', CAST(1099.0000 AS Decimal(19, 4)), 45, 83, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V472S3', N'Tarte Shape Tape Concealer', N'Консилер с высоким покрытием и легкой текстурой для совершенного макияжа.', N'Косметика', N'1', N'Tarte', CAST(1999.0000 AS Decimal(19, 4)), 45, 75, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'А112Т4', N'Giorgio Armani Si Passione', N'Страстный и чувственный женский аромат с нотами красной смородины и розы.', N'Парфюмерия', N'1', N'Giorgio Armani', CAST(1299.0000 AS Decimal(19, 4)), 5, 10, N'В наличии')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Менеджер
')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (1, 1, N'Константинова ', N'Вероника', N'Агафоновна', N'loginDEsgg2018', N'qhgYnW')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (2, 2, N'Меркушев ', N'Мартын', N'Федотович', N'loginDEdcd2018', N'LxR6YI')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (3, 1, N'Казаков ', N'Федот', N'Кондратович', N'loginDEisg2018', N'Cp8ddU')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (4, 3, N'Карпов ', N'Улеб', N' Леонидович', N'loginDEcph2018', N'7YpE0p')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (5, 2, N'Королёв ', N'Матвей', N'Вадимович', N'loginDEgco2018', N'nMr|ss')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (6, 2, N'Юдин ', N'Герман', N' Кондратович', N'loginDEwjg2018', N'9UfqWQ')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (7, 3, N'Беляева ', N'Анна', N' Вячеславовна', N'loginDEjbz2018', N'xIAWNI')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (8, 1, N'Беляев ', N'Валентин', N'Артёмович', N'loginDEmgu2018', N'0gC3bk')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (9, 1, N'Семёнов ', N'Герман', N'Дмитрьевич', N'loginDErdg2018', N'ni0ue0')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (10, 2, N'Шестаков ', N'Илья', N'Антонинович', N'loginDEjtv2018', N'f2ZaN6')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (11, 2, N'Власов ', N'Вадим', N' Васильевич', N'loginDEtfj2018', N'{{ksPn')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (12, 3, N'Савельев ', N'Арсений', N' Авксентьевич', N'loginDEpnb2018', N'{ADBdc')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (13, 3, N'Ефимов ', N'Руслан', N'Якунович', N'loginDEzer2018', N'5&R+zs')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (14, 2, N'Бурова ', N'Марфа', N' Федотовна', N'loginDEiin2018', N'y9l*b}')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (15, 2, N'Селезнёв ', N'Александр', N' Никитевич', N'loginDEqda2018', N'|h+r}I')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (16, 2, N'Кулакова ', N'Виктория', N' Георгьевна', N'loginDEbnj2018', N'12345')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (17, 2, N'Дорофеева ', N'Кира', N'Демьяновна', N'loginDEqte2018', N'dC8bDI')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (18, 2, N'Сафонова ', N'Нинель', N'Якововна', N'loginDEfeo2018', N'8cI7vq')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (19, 2, N'Ситникова ', N'София', N'Лукьевна', N'loginDEvni2018', N'e4pVIv')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (20, 1, N'Медведев ', N'Ириней', N' Геннадьевич', N'loginDEjis2018', N'A9K++2')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (21, 1, N'Суханова ', N'Евгения', N' Улебовна', N'loginDExvv2018', N'R1zh}|')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (22, 1, N'Игнатьев ', N'Владлен', N'Дамирович', N'loginDEadl2018', N'F&IWf4')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (23, 2, N'Ефремов ', N'Христофор', N' Владиславович', N'loginDEyzn2018', N'P1v24R')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (24, 2, N'Кошелев ', N'Ростислав', N'Куприянович', N'loginDEphn2018', N'F}jGsJ')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (25, 3, N'Галкина ', N'Тамара', N'Авксентьевна', N'loginDEdvk2018', N'NKNkup')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (26, 1, N'Журавлёва ', N'Вера', N'Арсеньевна', N'loginDEtld2018', N'c+CECK')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (27, 3, N'Савина ', N'Таисия', N'Глебовна', N'loginDEima2018', N'XK3sOA')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (28, 2, N'Иванов ', N'Яков', N'Мэлорович', N'loginDEyfe2018', N'4Bbzpa')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (29, 1, N'Лыткин ', N'Ким', N' Алексеевич', N'loginDEwqc2018', N'vRtAP*')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (30, 1, N'Логинов ', N'Федот', N'Святославович', N'loginDEgtt2018', N'7YD|BR')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (31, 1, N'Русакова ', N'Марина', N'Юлиановна', N'loginDEiwl2018', N'LhlmIl')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (32, 3, N'Константинов ', N'Пётр', N'Кондратович', N'loginDEyvi2018', N'22beR}')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (33, 2, N'Поляков ', N'Анатолий', N' Игоревич', N'loginDEtfz2018', N'uQY0ZQ')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (34, 3, N'Панфилова ', N'Василиса', N'Григорьевна', N'loginDEikb2018', N'*QkUxc')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (35, 2, N'Воробьёв ', N'Герман', N' Романович', N'loginDEdmi2018', N'HOGFbU')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (36, 3, N'Андреев ', N'Ростислав', N'Федосеевич', N'loginDEtlo2018', N'58Jxrg')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (37, 3, N'Бобров ', N'Агафон', N'Владимирович', N'loginDEsnd2018', N'lLHqZf')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (38, 3, N'Лапин ', N'Алексей', N'Витальевич', N'loginDEgno2018', N'4fqLiO')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (39, 2, N'Шестаков ', N'Авдей', N'Иванович', N'loginDEgnl2018', N'wdio{u')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (40, 2, N'Гаврилова ', N'Алина', N'Эдуардовна', N'loginDEzna2018', N'yz1iMB')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (41, 1, N'Жуков ', N'Юлиан', N'Валерьянович', N'loginDEsyh2018', N'&4jYGs')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (42, 2, N'Пономарёв ', N'Максим', N'Альвианович', N'loginDExex2018', N'rnh36{')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (43, 1, N'Зиновьева ', N'Мария', N'Лаврентьевна', N'loginDEdjm2018', N'KjI1JR')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (44, 2, N'Осипов ', N'Артём', N'Мэлорович', N'loginDEgup2018', N'36|KhF')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (45, 3, N'Лапин ', N'Вячеслав', N'Геласьевич', N'loginDEdat2018', N'ussd8Q')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (46, 2, N'Зуев ', N'Ириней', N'Вадимович', N'loginDEffj2018', N'cJP+HC')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (47, 1, N'Коновалова ', N'Агафья', N' Митрофановна', N'loginDEisp2018', N'dfz5Ii')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (48, 1, N'Исаев ', N'Дмитрий', N'Аристархович', N'loginDEfrp2018', N'6dcR|9')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (49, 2, N'Белозёрова ', N'Алевтина', N'Лаврентьевна', N'loginDEaee2018', N'5&qONH')
INSERT [dbo].[User] ([UserID], [RoleID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword]) VALUES (50, 2, N'Самсонов ', N'Агафон', N'Максимович', N'loginDEthu2018', N'|0xWzV')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamPickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([OrderPickupPoint])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ExamOrder_ExamPickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_ExamOrder_ExamUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_ExamOrder_ExamUser]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__ExamOrder__Order__403A8C7D] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__ExamOrder__Order__403A8C7D]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__ExamOrder__Produ__412EB0B6] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__ExamOrder__Produ__412EB0B6]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_ExamUser_ExamRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_ExamUser_ExamRole]
GO
