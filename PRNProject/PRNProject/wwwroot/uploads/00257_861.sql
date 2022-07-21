USE [SWP391]
GO
DELETE FROM [dbo].[permissions]
      WHERE 1=1
DELETE FROM [dbo].[screens]
      WHERE 1=1
DELETE FROM [dbo].[settings]
      WHERE 1=1
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (1, N'/login', N'Login')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (2, N'/register', N'Register')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (3, N'/logout', N'Logout')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (4, N'/feedback', N'Feedback')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (5, N'/home', N'Home Page')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (6, N'/buy', N'Add To Cart')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (7, N'/checkout', N'Check Out')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (8, N'/process', N'Update Cart Detail')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (9, N'/product', N'Product Details')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (10, N'/productslist', N'Products List')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (11, N'/showcart', N'Cart Details')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (12, N'/activate', N'Activate Account')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (13, N'/cartcompletion', N'Cart Completion')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (14, N'/delete_order', N'Delete Order')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (15, N'/forgot', N'Forgot Password')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (16, N'/resetpass', N'Reset Password')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (17, N'/myorders', N'My Orders')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (18, N'/orderinformation', N'Order Information')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (19, N'/updateorder', N'Update Order')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (20, N'/cancel_order', N'Cancel Order')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (21, N'/updateacc', N'Update Accout')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (22, N'/marketing/productslist', N'Marketing Products List')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (23, N'/marketing/product', N'Marketing Product Details')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (24, N'/marketing', N'Marketing')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (25, N'/marketing/dashboard', N'Marketing Dashboard')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (26, N'/marketing/getsubcategory', N'Marketing Get SubCategory')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (27, N'/marketing/editproduct', N'Marketing Edit Product ')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (28, N'/marketing/addproduct', N'Marketing Add Product')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (29, N'/blogslist', N'Blogs List')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (30, N'/ckfinder/core/connector/java/connector.java', N'N/A')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (31, N'/postlist', N'Marketing Post List')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (32, N'/updatefeaturepost', N'Marketing Update Post')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (33, N'/searchpostlist', N'Marketing Search Post')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (34, N'/upload', N'Marketing Upload ')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (35, N'/addpost', N'Marketing Add Post')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (36, N'/addpostcategory', N'Marketing Add PostCategory')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (37, N'/sale', N'Sale Dashboard')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (38, N'/sale/orderslist', N'Sale Orders List')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (39, N'/sale/orderdetails', N'Sale Order Details')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (40, N'/marketing/postdetails', N'Marketing Postdetails')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (41, N'/marketing/changepostcategory', N'Marketing Change Post Category')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (42, N'/admin', N'Admin')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (43, N'/admin/settingslist', N'Admin Settings List')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (44, N'/admin/adduser', N'Admin Add User')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (45, N'/admin/userslist', N'Admin Users List')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (46, N'/admin/udateacc', N'Admin Udate Acc')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (47, N'/admin/settingdetails', N'Admin Setting Details')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (48, N'/admin/addsetting', N'Admin Add Setting')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (49, N'/marketing/addcustomer', N'Marketing Add Customer')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (50, N'/marketing/customerlist', N'Marketing Customer List')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (51, N'/marketing/editslider', N'Marketing Edit Slider')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (52, N'/marketing/feedbackslist', N'Marketing Feedbacks List')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (53, N'/marketing/getproductslist', N'Marketing Get Products List')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (54, N'/marketing/postslist', N'Marketing Posts List')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (55, N'/marketing/searchcustomerlist', N'Marketing Search Customer List')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (56, N'/marketing/sliderslist', N'Marketing Sliders List')
GO
INSERT [dbo].[screens] ([screen_id], [screen_name], [screen_description]) VALUES (57, N'/marketing/slider', N'Marketing Slider')
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 1, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 2, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 3, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 4, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 5, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 6, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 7, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 8, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 9, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 10, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 11, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 12, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 13, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 14, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 15, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 16, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 17, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 18, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 19, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 20, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 21, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 1, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 2, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 3, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 4, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 5, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 6, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 7, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 8, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 9, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 10, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 11, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 12, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 13, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 14, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 15, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 16, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 19, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 20, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 21, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (3, 21, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (4, 21, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (5, 21, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (3, 1, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (4, 1, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (5, 1, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (3, 3, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (4, 3, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (5, 3, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (3, 15, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (4, 15, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (5, 15, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (3, 16, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (4, 16, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (5, 16, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 22, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 23, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 24, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 25, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 26, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 27, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 28, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (1, 29, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 29, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (3, 29, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (4, 29, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (5, 29, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 1, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 2, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 3, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (3, NULL, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (4, 37, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (4, 38, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (4, 39, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 4, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 5, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 6, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 7, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 8, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 9, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 10, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 11, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 12, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 13, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 14, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 15, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 16, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 19, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 20, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 21, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (6, 29, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (3, 37, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (3, 38, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (3, 39, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 31, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 40, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 49, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 50, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 51, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 52, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 53, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 54, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 55, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 56, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 57, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 41, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (5, 42, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (5, 43, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (5, 44, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (5, 45, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (5, 46, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (5, 47, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (5, 48, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 32, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 33, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 34, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 35, NULL, 1)
GO
INSERT [dbo].[permissions] ([role_id], [screen_id], [activity_id], [status]) VALUES (2, 36, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[settings] ON 
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (1, N'Set Role', N'', N'Role', N'Customer', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (2, N'Set Role', NULL, N'Role', N'Marketing', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (3, N'Set Role', NULL, N'Role', N'Sale', N'3', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (4, N'Set Role', NULL, N'Role', N'Sale Manager', N'4', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (5, N'Set Role', NULL, N'Role', N'Admin', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (14, N'Set Permission', NULL, N'Permission', N'Login', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (15, N'Set Permission', NULL, N'Permission', N'Register', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (16, N'Set Permission', NULL, N'Permission', N'Logout', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (17, N'Set Permission', NULL, N'Permission', N'Feedback', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (18, N'Set Permission', N'', N'Permission', N'Home Page', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (19, N'Set Permission', NULL, N'Permission', N'Add To Cart', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (20, N'Set Permission', NULL, N'Permission', N'Check Out', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (21, N'Set Permission', NULL, N'Permission', N'Update Cart Detail', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (22, N'Set Permission', NULL, N'Permission', N'Product Details', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (23, N'Set Permission', NULL, N'Permission', N'Products List', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (24, N'Set Permission', NULL, N'Permission', N'Cart Details', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (25, N'Set Permission', NULL, N'Permission', N'Activate Account', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (26, N'Set Permission', NULL, N'Permission', N'Cart Completion', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (27, N'Set Permission', NULL, N'Permission', N'Delete Order', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (28, N'Set Permission', NULL, N'Permission', N'Forgot Password', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (29, N'Set Permission', NULL, N'Permission', N'Reset Password', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (30, N'Set Permission', N'', N'Permission', N'My Orders', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (31, N'Set Permission', NULL, N'Permission', N'Order Information', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (32, N'Set Permission', NULL, N'Permission', N'Update Order', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (33, N'Set Permission', NULL, N'Permission', N'Cancel Order', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (34, N'Set Permission', NULL, N'Permission', N'Update Accout', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (35, N'Set Permission', NULL, N'Permission', N'Blogs List', N'1', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (36, N'Set Permission', NULL, N'Permission', N'Login', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (37, N'Set Permission', NULL, N'Permission', N'Register', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (38, N'Set Permission', NULL, N'Permission', N'Logout', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (39, N'Set Permission', NULL, N'Permission', N'Feedback', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (40, N'Set Permission', NULL, N'Permission', N'Home Page', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (41, N'Set Permission', NULL, N'Permission', N'Add To Cart', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (42, N'Set Permission', NULL, N'Permission', N'Check Out', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (43, N'Set Permission', NULL, N'Permission', N'Update Cart Detail', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (44, N'Set Permission', NULL, N'Permission', N'Product Details', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (45, N'Set Permission', NULL, N'Permission', N'Products List', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (46, N'Set Permission', NULL, N'Permission', N'Cart Details', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (47, N'Set Permission', NULL, N'Permission', N'Activate Account', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (48, N'Set Permission', NULL, N'Permission', N'Cart Completion', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (49, N'Set Permission', NULL, N'Permission', N'Delete Order', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (50, N'Set Permission', NULL, N'Permission', N'Forgot Password', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (51, N'Set Permission', NULL, N'Permission', N'Reset Password', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (52, N'Set Permission', NULL, N'Permission', N'Update Order', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (53, N'Set Permission', NULL, N'Permission', N'Cancel Order', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (54, N'Set Permission', NULL, N'Permission', N'Update Accout', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (55, N'Set Permission', NULL, N'Permission', N'Marketing Products List', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (56, N'Set Permission', NULL, N'Permission', N'Marketing Product Details', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (57, N'Set Permission', NULL, N'Permission', N'Marketing', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (58, N'Set Permission', NULL, N'Permission', N'Marketing Dashboard', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (59, N'Set Permission', NULL, N'Permission', N'Marketing Get SubCategory', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (60, N'Set Permission', NULL, N'Permission', N'Marketing Edit Product ', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (61, N'Set Permission', NULL, N'Permission', N'Marketing Add Product', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (62, N'Set Permission', NULL, N'Permission', N'Blogs List', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (63, N'Set Permission', NULL, N'Permission', N'Update Accout', N'3', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (64, N'Set Permission', NULL, N'Permission', N'Login', N'3', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (65, N'Set Permission', NULL, N'Permission', N'Logout', N'3', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (66, N'Set Permission', NULL, N'Permission', N'Forgot Password', N'3', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (67, N'Set Permission', NULL, N'Permission', N'Reset Password', N'3', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (68, N'Set Permission', NULL, N'Permission', N'Blogs List', N'3', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (69, N'Set Permission', NULL, N'Permission', N'Sale Dashboard', N'3', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (70, N'Set Permission', NULL, N'Permission', N'Sale Orders List', N'3', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (71, N'Set Permission', NULL, N'Permission', N'Sale Order Details', N'3', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (72, N'Set Permission', NULL, N'Permission', N'Update Accout', N'4', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (73, N'Set Permission', NULL, N'Permission', N'Login', N'4', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (74, N'Set Permission', NULL, N'Permission', N'Logout', N'4', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (75, N'Set Permission', NULL, N'Permission', N'Forgot Password', N'4', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (76, N'Set Permission', NULL, N'Permission', N'Reset Password', N'4', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (77, N'Set Permission', NULL, N'Permission', N'Blogs List', N'4', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (78, N'Set Permission', NULL, N'Permission', N'Sale Dashboard', N'4', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (79, N'Set Permission', NULL, N'Permission', N'Sale Orders List', N'4', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (80, N'Set Permission', NULL, N'Permission', N'Sale Order Details', N'4', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (81, N'Set Permission', NULL, N'Permission', N'Update Accout', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (82, N'Set Permission', NULL, N'Permission', N'Login', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (83, N'Set Permission', NULL, N'Permission', N'Logout', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (84, N'Set Permission', NULL, N'Permission', N'Forgot Password', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (85, N'Set Permission', NULL, N'Permission', N'Reset Password', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (86, N'Set Permission', NULL, N'Permission', N'Blogs List', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (87, N'Set Permission', NULL, N'Permission', N'Login', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (88, N'Set Permission', NULL, N'Permission', N'Register', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (89, N'Set Permission', NULL, N'Permission', N'Logout', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (90, N'Set Permission', NULL, N'Permission', N'Feedback', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (91, N'Set Permission', NULL, N'Permission', N'Home Page', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (92, N'Set Permission', NULL, N'Permission', N'Add To Cart', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (93, N'Set Permission', NULL, N'Permission', N'Check Out', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (94, N'Set Permission', NULL, N'Permission', N'Update Cart Detail', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (95, N'Set Permission', NULL, N'Permission', N'Product Details', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (96, N'Set Permission', NULL, N'Permission', N'Products List', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (97, N'Set Permission', NULL, N'Permission', N'Cart Details', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (98, N'Set Permission', NULL, N'Permission', N'Activate Account', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (99, N'Set Permission', NULL, N'Permission', N'Cart Completion', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (100, N'Set Permission', NULL, N'Permission', N'Delete Order', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (101, N'Set Permission', NULL, N'Permission', N'Forgot Password', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (102, N'Set Permission', NULL, N'Permission', N'Reset Password', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (103, N'Set Permission', NULL, N'Permission', N'Update Order', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (104, N'Set Permission', NULL, N'Permission', N'Cancel Order', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (105, N'Set Permission', NULL, N'Permission', N'Update Accout', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (106, N'Set Permission', NULL, N'Permission', N'Blogs List', N'6', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (110, N'Set Permission', NULL, N'Permission', N'Admin', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (111, N'Set Permission', NULL, N'Permission', N'Admin Settings List', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (112, N'Set Permission', NULL, N'Permission', N'Admin Add User', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (113, N'Set Permission', NULL, N'Permission', N'Admin Users List', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (114, N'Set Permission', NULL, N'Permission', N'Admin Udate Acc', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (115, N'Set Permission', NULL, N'Permission', N'Admin Setting Details', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (116, N'Set Permission', NULL, N'Permission', N'Admin Add Setting', N'5', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (117, N'Set Permission', NULL, N'Permission', N'Marketing Postdetails', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (118, N'Set Permission', NULL, N'Permission', N'Marketing Change Post Category', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (119, N'Set Permission', NULL, N'Permission', N'Marketing Add Customer', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (120, N'Set Permission', NULL, N'Permission', N'Marketing Customer List', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (121, N'Set Permission', NULL, N'Permission', N'Marketing Edit Slider', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (122, N'Set Permission', NULL, N'Permission', N'Marketing Feedbacks List', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (123, N'Set Permission', NULL, N'Permission', N'Marketing Get Products List', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (124, N'Set Permission', NULL, N'Permission', N'Marketing Posts List', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (125, N'Set Permission', NULL, N'Permission', N'Marketing Search Customer List', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (126, N'Set Permission', NULL, N'Permission', N'Marketing Sliders List', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (127, N'Set Permission', NULL, N'Permission', N'Marketing Slider', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (128, N'Set Permission', NULL, N'Permission', N'Marketing Post List', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (129, N'Set Permission', NULL, N'Permission', N'Marketing Update Post', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (130, N'Set Permission', NULL, N'Permission', N'Marketing Search Post', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (131, N'Set Permission', NULL, N'Permission', N'Marketing Upload ', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (132, N'Set Permission', NULL, N'Permission', N'Marketing Add Post', N'2', 1)
GO
INSERT [dbo].[settings] ([setting_id], [name], [description], [type], [value], [order], [status]) VALUES (133, N'Set Permission', NULL, N'Permission', N'Marketing Add PostCategory', N'2', 1)
GO
SET IDENTITY_INSERT [dbo].[settings] OFF
GO
