with cte as
(
select lastlogon, MAX(cat_version_group) AS latest_cat_version_group from New_BDNA
where lastlogon != 'NULL'
group by lastlogon
UNION ALL
select lastlogon, cat_version_group from New_BDNA
where lastlogon = 'NULL'
)
Select 'Snagit - '+CONVERT(varchar,latest_cat_version_group), COUNT(latest_cat_version_group) AS count_of_users
from cte
group by latest_cat_version_group
Order By latest_cat_version_group






Select * From New_BDNA t1
INNER JOIN (select lastlogon, MAX(cat_version_group) AS cat_version_group from New_BDNA
where lastlogon != 'NULL'
group by lastlogon
UNION ALL
select lastlogon, cat_version_group from New_BDNA
where lastlogon = 'NULL'
) t2
ON t2.lastlogon = t1.lastlogon AND t2.cat_version_group = t1.cat_version_group
--where t2.lastlogon = 'lekelly'
Order By t1.lastlogon