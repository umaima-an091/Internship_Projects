USE project3;
SELECT * FROM orders;
SELECT OrderID, CustomerID, Product, Quantity, TotalPrice FROM orders;
SELECT * FROM orders WHERE OrderStatus='Delivered';
SELECT * FROM orders WHERE TotalPrice>2000;
SELECT * FROM orders WHERE TotalPrice BETWEEN 1000 AND 3000;
SELECT OrderID, CustomerID, Product, TotalPrice FROM orders ORDER BY TotalPrice DESC;
SELECT COUNT(*) AS TotalOrders FROM orders;
SELECT SUM(TotalPrice) AS TotalRevenue FROM orders;
SELECT AVG(TotalPrice) AS AverageOrderValue FROM orders;
SELECT MAX(TotalPrice) AS HighestOrder FROM orders;
SELECT MIN(TotalPrice) AS LowestOrder FROM orders;
SELECT Product,
       SUM(Quantity) AS QuantitySold
FROM orders GROUP BY Product ORDER BY QuantitySold DESC;
SELECT Product,
       SUM(TotalPrice) AS Revenue
FROM orders GROUP BY Product ORDER BY Revenue DESC;
SELECT OrderStatus,
       COUNT(*) AS TotalOrders
FROM orders GROUP BY OrderStatus ORDER BY TotalOrders DESC;
SELECT PaymentMethod,
       COUNT(*) AS TotalOrders
FROM orders GROUP BY PaymentMethod ORDER BY TotalOrders DESC;
SELECT ReferralSource,
       COUNT(*) AS TotalOrders
FROM orders GROUP BY ReferralSource ORDER BY TotalOrders DESC;
SELECT CustomerID,
       SUM(TotalPrice) AS TotalSpent
FROM orders GROUP BY CustomerID ORDER BY TotalSpent DESC LIMIT 5;
SELECT OrderID, CustomerID, Product, TotalPrice
FROM orders ORDER BY TotalPrice DESC LIMIT 10;
SELECT Product,
       SUM(Quantity) AS TotalSold
FROM orders GROUP BY Product HAVING SUM(Quantity)>450;
SELECT PaymentMethod,
       AVG(TotalPrice) AS AverageOrderValue
FROM orders GROUP BY PaymentMethod ORDER BY AverageOrderValue DESC;