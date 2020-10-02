Select [dbo].[Primary_Source].[Company], SUM([A].[dbo_DAIRY_SALES_SUMMARY].[TOTAL_REVENUE]-[A].[dbo_DAIRY_SALES_SUMMARY].[TOTAL_COST]) AS Profit
From [A].[dbo_DAIRY_SALES_SUMMARY]
JOIN [dbo].[Primary_Source]
ON [A].[dbo_DAIRY_SALES_SUMMARY].[SIM_ROUND] = [dbo].[Primary_Source].[Sim Round]
AND [A].[dbo_DAIRY_SALES_SUMMARY].[VDAY] = [dbo].[Primary_Source].[Vday]
AND [A].[dbo_DAIRY_SALES_SUMMARY].[PRODUCT_ID] = [dbo].[Primary_Source].[Product Id]
Group By [dbo].[Primary_Source].[Company]
---------
Select * From [dbo].[Primary_Source]
Order By [Sim Round], Vday

Select * From [A].[dbo_DAIRY_SALES_SUMMARY]