SELECT productId,productName,UnitPrice ,
CONCAT( '$',  cast(UnitPrice as char(5))) as shortprice from products as p;

SELECT OrderID FROM orders as O JOIN employees as E
ON O.EmployeeID =E.EmployeeID 
where O.ShipCity = E.City;

select PP.CategoryID , Count( PP.CategoryID) FROM products as PP join (select CategoryID ,count(CategoryID) FROM products  as P  
JOIN (select ProductID, ContactName from `order details` as OD join (Select ContactName,OrderID From customers as C join orders as O
ON C.CustomerID=O.CustomerID
WHERE ContactName LIKE '%sommer%') as N on OD.OrderID=N.OrderID) as PC ON P.ProductID=PC.ProductID group by CategoryID) as DD ON PP.CategoryID=DD.CategoryID group by PP.CategoryID   ;