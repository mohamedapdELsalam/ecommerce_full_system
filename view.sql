/*
للحصول علي معلومات المنتجات كاملة بالإضافة الي معلومات القسم المرتبط بالمنتج قمنا بعمل جدول افتراضي لتسهيل العملية عبارة عن 
دمج لجدول المنتجات مع جدول الاقسام بنائا علي الفورن كي اي العلاقة بين الاي دي الخاص بالقسم وكولمن الربط في جدول المنتجات
بدلا من جدول المنتجات API ثم سنستخدم هذا الجدول في ال 
*/

CREATE OR REPLACE VIEW itemsview AS 
SELECT items.*, categories.* FROM  items
INNER JOIN categories on items.items_cat = categories.categories_id

//  ==============================================================
// favorite handling database
// ===============================================================

/*
الهدف 
1- اضافة منتجات إلي المفضلة
2- معرفة المنتجات المضافة الي المفضلة
3- جلب المنتجات كاملة مضافة وغير مضافة للمفضلة
*/

// اولاً العلاقة بين المفضلة واليوزرس هي علاقة ميني تو ميني 
// لان كل يوزر يستطيع اضافة كل المنتجات والمنتج يمكن ان يكون في المفضلة لدي كل اليوزرس
// بما ان العلافة ميني تو ميني سنقوم بعمل جدول منفصل يربط بين اليوزر الذي ضاف منتج الي المفضلة وبين المنتج الذي تمت اضافته
لماذا تم عمل جدول منفصل ؟
لانه لو تم اضافة كولمن خاص بالمفضلة في جدول المنتجات واذا تم اضافة منتج في المفضلة من قبل يوزر واحد 
سيصبح هذا المنتج في المفضلة عند كل اليوزرس
لذك يجب ربط تلك العملية باليوزر بالاضافة الي المنتج طبعا

-------------------------------------------------------------------------------------------------------
استعلامة عمل الفورن كي علي جدول المفضلة بين المنتج في المفضلة وجدول المنتجات
ALTER TABLE `favorite` ADD FOREIGN KEY (`favorite_itemid`) REFERENCES `items`(`items_id`)  ON DELETE CASCADE ON UPDATE CASCADE;
استعلامة عمل الفورن كي علي جدول المفضلة بين المستخدم في المفضلة وجدول المستخدمين
ALTER TABLE `favorite` ADD FOREIGN KEY (`favorite_userid`) REFERENCES `users`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
طبعا الفورن كي بيخلي الكولمن لازم يبقي عبارة عن كولمن من جدول تاني
يعني كده ضمني ان في جدول المفضلات هيكون في كولمنيين كولمن منتج وكولمن يوزر 
والمنتج بيتم اضافته من جدول المنتجات
واليوزر بيتم اضافته من جدول اليوزرس
----------------------------------------------------------------------------------------------------------------------



1 - قمنا بعمل جدول مفضلة يربط بين اليوزرس والمنتجات من خلال علاقتين فورين كي

2- يمكن ان نكتفي بذلك ونكمل مشوارنا في الفرونت اند فمثلا نقوم بعمل اثنين ريكويست واحد الي
جدول المنتجات وواحد الي جدول المفضلة ونقوم بعمل دمج ونضع شروطنا بان يكون اليوزر اي دي هو ا الاي دي الخاص باليوزر

ولكن هذا ليس احترافيا

يمكن ان ننشئ جدول افتراضي اخر ويتم وضع اليوزر في الاعتبار ويكون فيه جميع المنتجات وفيها كولمن خاص بالمفضلة 
يكون هذا الكولمن صفر اذا لم يكن المنتج في المفضلة ويكون واحد اذا كان في المفضلة
ولكن كيف ننشاأ ذلك الجدول ؟؟

CREATE OR REPLACE VIEW itemsview1 AS
SELECT itemsview.* , 1 AS favorite  FROM itemsview
INNER JOIN favorite ON itemsview.item_id = favorite.favorite_item_id AND favorite.user_id =  (userId)
الي هنا نحن قد حصلنا علي جدول به جميع المنتجات المنضافة الي مفضلة ليوزر ما مع عمل كولمن اسمه مفضله واعاطائه قيمة واحد

 union all يتبقي ان نقوم باضافة المنتجات الغير مضافة الي المفضلة واعطائها قيمة صفر سنستعمل ال     

UNION ALL
SELECT itemsview.* , 0 AS favorite FROM itemsview
WHERE itemsview.item_id != (SELECT itemsview.* , 1 AS favorite  FROM itemsview
INNER JOIN favorite ON itemsview.item_id = favorite.favorite_item_id AND favorite.user_id =  (userId))



---------------------------------------------------------------------------------------------------------
الاستعلامة الكاملة الصحيحة لعمل الجدول 
<<<<<<< HEAD
CREATE OR REPLACE VIEW items_view AS
SELECT itemsview.* , 1 as favorite FROM itemsview 
INNER JOIN favorite ON favorite.favorite_itemid = itemsview.items_id AND favorite.favorite_userid = 1 
UNION ALL 
SELECT itemsview.* , 0 AS favorite FROM itemsview 
WHERE items_id NOT IN 
(SELECT itemsview.items_id FROM itemsview 
INNER JOIN favorite ON favorite.favorite_itemid = itemsview.items_id AND favorite.favorite_userid = 1);
=======
SELECT items_view.* , 1 as favorite FROM items_view 
INNER JOIN favorite ON favorite.favorite_itemid = items_view.items_id AND favorite.favorite_userid = 1 
UNION ALL 
SELECT items_view.* , 0 AS favorite FROM items_view 
WHERE items_id NOT IN 
(SELECT items_view.items_id FROM items_view 
INNER JOIN favorite ON favorite.favorite_itemid = items_view.items_id AND favorite.favorite_userid = 1);
>>>>>>> 89aa7d24cb52dc80b0180d71eb63034ac8d5f839
---------------------------------------------------------------------------------------------------------

لجلب عدد المنتجات في السلة لمنتج معين
SELECT COUNT(cart_id) FROM cart WHERE cart_itemid = 3 AND cart_userid = 2;
-----------------------------------------------------------------------------------------
لعمل جدول خاص بالمنتجات التي في السلة فيكون فيها معلومات المنتجات بالاضافة الي عددها في السلة والسعر الاجمالي

CREATE OR REPLACE VIEW cartView AS
<<<<<<< HEAD
SELECT SUM(itemsview.finalPrice) AS totalPrice ,
COUNT(itemsview.items_count) AS count , cart.* , itemsview.* FROM cart
INNER JOIN itemsview ON itemsview.items_id = cart.cart_itemid
WHERE cart_orders = 0 
GROUP BY cart.cart_itemid , cart.cart_userid
-----------------------------------------------------------
CREATE OR REPLACE VIEW ordersview AS
SELECT orders.* , addressview.* FROM orders
LEFT JOIN addressview ON orders.orders_addressId = addressview.address_id
-------------------------------------------------------------------------
CREATE OR REPLACE VIEW orderdetails AS
SELECT 
SUM(itemsview.finalPrice) AS totalPrice ,
COUNT(itemsview.items_id) AS count, cart.* , itemsview.*  , ordersview.* FROM cart
INNER JOIN itemsview ON cart_itemid = itemsview.items_id
INNER JOIN ordersview ON ordersview.orders_id = cart.cart_orders
WHERE cart.cart_orders != 0
GROUP BY cart.cart_itemid , cart.cart_userid , cart.cart_orders
--------------------------------------------------------------------------

=======
SELECT SUM(itemsview.items_price) AS totalPrice ,COUNT(cart.cart_id) AS count , cart.* , itemsview.* FROM cart
INNER JOIN itemsview ON itemsview.items_id = cart.cart_itemid
WHERE cart_orders = 0 
GROUP BY cart.cart_itemid , cart.cart_userid
-----------------------------------------------------------
>>>>>>> 89aa7d24cb52dc80b0180d71eb63034ac8d5f839
