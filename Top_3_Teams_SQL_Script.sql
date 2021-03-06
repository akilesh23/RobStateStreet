Select * From
(
Select * From [A].[dbo_DAIRY_SALES_SUMMARY]
UNION
Select * From [F].[dbo_DAIRY_SALES_SUMMARY]
UNION
Select * From [K].[dbo_DAIRY_SALES_SUMMARY]
UNION
Select * From [O].[dbo_DAIRY_SALES_SUMMARY]
UNION
Select * From [S].[dbo_DAIRY_SALES_SUMMARY]
)AS Results
WHERE SUBSTRING([PRODUCT_ID],1,1) IN 
(
Select Top 3 Company From
(
Select SUBSTRING([A].[dbo_DAIRY_SALES_SUMMARY].[PRODUCT_ID],1,1) AS Company, SUM([A].[dbo_DAIRY_SALES_SUMMARY].[TOTAL_REVENUE]-[A].[dbo_DAIRY_SALES_SUMMARY].[TOTAL_COST]) AS Profit
From [A].[dbo_DAIRY_SALES_SUMMARY]
Group By SUBSTRING([A].[dbo_DAIRY_SALES_SUMMARY].[PRODUCT_ID],1,1)
UNION
Select SUBSTRING([F].[dbo_DAIRY_SALES_SUMMARY].[PRODUCT_ID],1,1) AS Company, SUM([F].[dbo_DAIRY_SALES_SUMMARY].[TOTAL_REVENUE]-[F].[dbo_DAIRY_SALES_SUMMARY].[TOTAL_COST]) AS Profit
From [F].[dbo_DAIRY_SALES_SUMMARY]
Group By SUBSTRING([F].[dbo_DAIRY_SALES_SUMMARY].[PRODUCT_ID],1,1)
UNION
Select SUBSTRING([K].[dbo_DAIRY_SALES_SUMMARY].[PRODUCT_ID],1,1) AS Company, SUM([K].[dbo_DAIRY_SALES_SUMMARY].[TOTAL_REVENUE]-[K].[dbo_DAIRY_SALES_SUMMARY].[TOTAL_COST]) AS Profit
From [K].[dbo_DAIRY_SALES_SUMMARY]
Group By SUBSTRING([K].[dbo_DAIRY_SALES_SUMMARY].[PRODUCT_ID],1,1)
UNION
Select SUBSTRING([O].[dbo_DAIRY_SALES_SUMMARY].[PRODUCT_ID],1,1) AS Company, SUM([O].[dbo_DAIRY_SALES_SUMMARY].[TOTAL_REVENUE]-[O].[dbo_DAIRY_SALES_SUMMARY].[TOTAL_COST]) AS Profit
From [O].[dbo_DAIRY_SALES_SUMMARY]
Group By SUBSTRING([O].[dbo_DAIRY_SALES_SUMMARY].[PRODUCT_ID],1,1)
UNION
Select SUBSTRING([S].[dbo_DAIRY_SALES_SUMMARY].[PRODUCT_ID],1,1) AS Company, SUM([S].[dbo_DAIRY_SALES_SUMMARY].[TOTAL_REVENUE]-[S].[dbo_DAIRY_SALES_SUMMARY].[TOTAL_COST]) AS Profit
From [S].[dbo_DAIRY_SALES_SUMMARY]
Group By SUBSTRING([S].[dbo_DAIRY_SALES_SUMMARY].[PRODUCT_ID],1,1)
--Order By Profit Desc
)i
Order By Profit Desc
)