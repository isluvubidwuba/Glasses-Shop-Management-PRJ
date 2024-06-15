USE [master]
GO

CREATE DATABASE [GlassesShopDB]

USE [GlassesShopDB]
GO
/****** Object:  Table [dbo].[tblCart]    Script Date: 6/15/2024 10:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCart](
	[cartId] [nvarchar](50) NOT NULL,
	[idGlasses] [nvarchar](50) NULL,
	[userID] [nvarchar](50) NULL,
	[invId] [nvarchar](50) NULL,
	[price] [float] NULL,
	[totalPrice] [float] NULL,
	[quantity] [int] NULL,
	[image] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblCart] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGlasses]    Script Date: 6/15/2024 10:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGlasses](
	[idGlasses] [nvarchar](max) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NULL,
	[type] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [float] NOT NULL,
	[status] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInvoice]    Script Date: 6/15/2024 10:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInvoice](
	[invId] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[total] [float] NULL,
	[dateBuy] [datetime] NULL,
	[gmail] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblInvoice] PRIMARY KEY CLUSTERED 
(
	[invId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 6/15/2024 10:33:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[gmail] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCart] ([cartId], [idGlasses], [userID], [invId], [price], [totalPrice], [quantity], [image]) VALUES (N'C1718424453807', N'G001', N'U001', N'INV-1718424452778', 150, 150, 1, N'images/image1.jpg')
GO
INSERT [dbo].[tblCart] ([cartId], [idGlasses], [userID], [invId], [price], [totalPrice], [quantity], [image]) VALUES (N'C1718424453822', N'G014', N'U001', N'INV-1718424452778', 430, 430, 1, N'images/image14.jpg')
GO
INSERT [dbo].[tblCart] ([cartId], [idGlasses], [userID], [invId], [price], [totalPrice], [quantity], [image]) VALUES (N'C1718424453827', N'G003', N'U001', N'INV-1718424452778', 350, 350, 1, N'images/image3.jpg')
GO
INSERT [dbo].[tblCart] ([cartId], [idGlasses], [userID], [invId], [price], [totalPrice], [quantity], [image]) VALUES (N'C1718436289126', N'G006', N'Hanh', N'INV-1718436287979', 160, 320, 2, N'images/image6.jpg')
GO
INSERT [dbo].[tblCart] ([cartId], [idGlasses], [userID], [invId], [price], [totalPrice], [quantity], [image]) VALUES (N'C1718443271836', N'G002', N'Hanh', N'INV-1718443270007', 200, 400, 2, N'images/image2.jpg')
GO
INSERT [dbo].[tblCart] ([cartId], [idGlasses], [userID], [invId], [price], [totalPrice], [quantity], [image]) VALUES (N'C1718443271848', N'G006', N'Hanh', N'INV-1718443270007', 160, 320, 2, N'images/image6.jpg')
GO
INSERT [dbo].[tblCart] ([cartId], [idGlasses], [userID], [invId], [price], [totalPrice], [quantity], [image]) VALUES (N'C1718461515404', N'G002', N'Hanh', N'INV-1718461478522', 200, 200, 1, N'images/image2.jpg')
GO
INSERT [dbo].[tblCart] ([cartId], [idGlasses], [userID], [invId], [price], [totalPrice], [quantity], [image]) VALUES (N'C1718461515415', N'G001', N'Hanh', N'INV-1718461478522', 150, 150, 1, N'images/image1.jpg')
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G001', N'Ray-Ban Aviator', N'Classic aviator sunglasses', N'Women', N'images/image1.jpg', 150, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G002', N'Oakley Holbrook', N'Stylish sunglasses for men', N'Men', N'images/image2.jpg', 200, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G003', N'Prada PR 17WS', N'Luxury men sunglasses', N'Men', N'images/image3.jpg', 350, 0)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G004', N'Gucci GG0061S', N'High-end sunglasses for men', N'Men', N'images/image4.jpg', 400, 0)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G005', N'Dolce & Gabbana DG2233', N'Modern men sunglasses', N'Men', N'images/image21.jpg', 300, 0)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G006', N'Ray-Ban Wayfarer', N'Classic wayfarer sunglasses', N'Women', N'images/image6.jpg', 160, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G007', N'Oakley Frogskins', N'Trendy sunglasses for women', N'Women', N'images/image7.jpg', 210, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G008', N'Prada PR 01VS', N'Elegant women sunglasses', N'Women', N'images/image8.jpg', 370, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G009', N'Gucci GG0023S', N'Luxury sunglasses for women', N'Women', N'images/image9.jpg', 420, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G010', N'Dolce & Gabbana DG4319', N'Stylish women sunglasses', N'Women', N'images/image10.jpg', 310, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G011', N'Ray-Ban Clubmaster', N'Vintage sunglasses', N'Sun Glasses', N'images/image11.jpg', 180, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G012', N'Oakley Radar', N'Sport sunglasses', N'Sun Glasses', N'images/image12.jpg', 220, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G013', N'Prada Linea Rossa', N'High-performance sunglasses', N'Sun Glasses', N'images/image13.jpg', 360, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G014', N'Gucci GG0062S', N'Fashionable sun glasses', N'Sun Glasses', N'images/image14.jpg', 430, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G015', N'Dolce & Gabbana DG6123', N'Designer sun glasses', N'Sun Glasses', N'images/image15.jpg', 320, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G016', N'Persol PO3019S', N'Stylish sunglasses for men', N'Men', N'images/image16.jpg', 170, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G017', N'Tom Ford FT0237', N'Luxury men sunglasses', N'Men', N'images/image17.jpg', 380, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G018', N'Maui Jim Peahi', N'Polarized sunglasses for men', N'Men', N'images/image18.jpg', 220, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G019', N'Carrera 1001/S', N'Sporty men sunglasses', N'Men', N'images/image19.jpg', 210, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G020', N'Boss 1035/S', N'Elegant sunglasses for men', N'Men', N'images/image20.jpg', 260, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G021', N'Chanel CH5340', N'Fashion sunglasses for women', N'Women', N'images/image21.jpg', 370, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G022', N'Versace VE2150Q', N'Trendy women sunglasses', N'Women', N'images/image22.jpg', 330, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G023', N'Fendi FF0290/S', N'Designer women sunglasses', N'Women', N'images/image23.jpg', 350, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G024', N'Kate Spade New York', N'Modern sunglasses for women', N'Women', N'images/image24.jpg', 190, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G025', N'Michael Kors Adrianna', N'Luxury women sunglasses', N'Women', N'images/image25.jpg', 250, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G026', N'Nike Tailwind', N'Sporty sun glasses', N'Sun Glasses', N'images/image26.jpg', 200, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G027', N'Smith Optics Guide', N'Performance sun glasses', N'Sun Glasses', N'images/image23.jpg', 230, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G028', N'Costa Del Mar Fantail', N'High-quality sun glasses', N'Sun Glasses', N'images/image23.jpg', 280, 1)
GO
INSERT [dbo].[tblGlasses] ([idGlasses], [name], [description], [type], [image], [price], [status]) VALUES (N'G029', N'Arnette AN4202', N'Affordable sun glasses', N'Sun Glasses', N'images/image23.jpg', 140, 1)
GO
INSERT [dbo].[tblInvoice] ([invId], [userID], [total], [dateBuy], [gmail], [address]) VALUES (N'INV-1718424452778', N'U001', 930, CAST(N'2024-06-15T00:00:00.000' AS DateTime), N'nguyenvana@gmail.com', N'Hanoi')
GO
INSERT [dbo].[tblInvoice] ([invId], [userID], [total], [dateBuy], [gmail], [address]) VALUES (N'INV-1718436287979', N'Hanh', 320, CAST(N'2024-06-15T00:00:00.000' AS DateTime), N'huyhanh@gmail.com', N'Bau Don')
GO
INSERT [dbo].[tblInvoice] ([invId], [userID], [total], [dateBuy], [gmail], [address]) VALUES (N'INV-1718443270007', N'Hanh', 720, CAST(N'2024-06-15T00:00:00.000' AS DateTime), N'huyhanh@gmail.com', N'Bau Don')
GO
INSERT [dbo].[tblInvoice] ([invId], [userID], [total], [dateBuy], [gmail], [address]) VALUES (N'INV-1718461478522', N'Hanh', 350, CAST(N'2024-06-15T00:00:00.000' AS DateTime), N'huyhanh@gmail.com', N'Bau Don')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [gmail], [address], [status]) VALUES (N'Hanh', N'TranUpdate', N'123', N'US', N'huyhanh@gmail.com', N'Bau Don', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [gmail], [address], [status]) VALUES (N'Hanh2', N'Trần Huy Hanh', N'12', N'R1', N'test2@gmail.com', N'Ngã Ba Bàu Đồn', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [gmail], [address], [status]) VALUES (N'U001', N'Nguyen Van A', N'12', N'AD', N'nguyenvana@gmail.com', N'Hanoi', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [gmail], [address], [status]) VALUES (N'U002', N'Tran Thi B', N'password2', N'AD', N'tranthib@gmail.com', N'Ho Chi Minh', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [gmail], [address], [status]) VALUES (N'U003', N'Le Van C', N'123', N'US', N'levanc@gmail.com', N'Da Nang', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [gmail], [address], [status]) VALUES (N'U004', N'Pham Thi D', N'newpassword4', N'US', N'phamthid@gmail.com', N'Hai Phong', 1)
GO
ALTER TABLE [dbo].[tblCart]  WITH CHECK ADD  CONSTRAINT [FK_tblCart_tblInvoice] FOREIGN KEY([invId])
REFERENCES [dbo].[tblInvoice] ([invId])
GO
ALTER TABLE [dbo].[tblCart] CHECK CONSTRAINT [FK_tblCart_tblInvoice]
GO
ALTER TABLE [dbo].[tblCart]  WITH CHECK ADD  CONSTRAINT [FK_tblCart_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblCart] CHECK CONSTRAINT [FK_tblCart_tblUsers]
GO
ALTER TABLE [dbo].[tblInvoice]  WITH CHECK ADD  CONSTRAINT [FK_tblInvoice_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblInvoice] CHECK CONSTRAINT [FK_tblInvoice_tblUsers]
GO
USE [master]
GO
ALTER DATABASE [GlassesShopDB] SET  READ_WRITE 
GO
