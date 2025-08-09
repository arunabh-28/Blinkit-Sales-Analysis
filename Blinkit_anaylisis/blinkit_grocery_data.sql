CREATE TABLE blinkit_grocery_data (
    Item_Fat_Content         VARCHAR(50),
    Item_Identifier          VARCHAR(50),
    Item_Type                VARCHAR(50),
    Outlet_Establishment_Year INT,
    Outlet_Identifier        VARCHAR(50),
    Outlet_Location_Type     VARCHAR(50),
    Outlet_Size              VARCHAR(50),
    Outlet_Type              VARCHAR(50),
    Item_Visibility          FLOAT,
    Item_Weight              FLOAT,
    Total_Sales              FLOAT,
    Rating                   FLOAT
);


Update blinkit_grocery_data
set item_fat_content=
case 
when item_fat_content in ('LF', 'low fat') then 'Low Fat'
when item_fat_content ='reg' then 'Regular'
else item_fat_content
end


select distinct (item_fat_content) from blinkit_grocery_data;


select sum(total_sales) as total_sales from blinkit_grocery_data;


select cast(avg(total_sales) as decimal(10,2))as avg_sales from blinkit_grocery_data;


select count(*) as no_of_items from blinkit_grocery_data;


select sum(total_sales) as total_sales from blinkit_grocery_data
where item_fat_content='Low Fat';


select avg(rating) as avg_rating from blinkit_grocery_data;


select item_fat_content,cast(sum(total_sales) as decimal(10,2))as total_sales,
cast(avg(total_sales) as decimal(10,2))as avg_sales,
count(*) as no_of_items ,
avg(rating) as avg_rating 
from blinkit_grocery_data
group by  item_fat_content
order by total_sales desc;



select  item_type,cast(sum(total_sales) as decimal(10,2))as total_sales,
cast(avg(total_sales) as decimal(10,2))as avg_sales,
count(*) as no_of_items ,
avg(rating) as avg_rating 
from blinkit_grocery_data
group by item_type
order by total_sales desc
limit 5;



select  outlet_location_type,item_fat_content,cast(sum(total_sales) as decimal(10,2))as total_sales,
cast(avg(total_sales) as decimal(10,2))as avg_sales,
count(*) as no_of_items ,
avg(rating) as avg_rating 
from blinkit_grocery_data
group by outlet_location_type,item_fat_content
order by total_sales asc;



SELECT 
outlet_location_type,
SUM(total_sales) FILTER (WHERE item_fat_content = 'Low Fat') AS low_fat,
SUM(total_sales) FILTER (WHERE item_fat_content = 'Regular') AS regular
FROM 
blinkit_grocery_data
GROUP BY 
outlet_location_type
ORDER BY 
outlet_location_type;




select  outlet_establishment_year,cast(sum(total_sales) as decimal(10,2))as total_sales
from blinkit_grocery_data
group by outlet_establishment_year
order by outlet_establishment_year asc;




SELECT
    outlet_size,
    CAST(SUM(total_sales) AS DECIMAL(10,2)) AS total_sales,
    CAST(
        SUM(total_sales) * 100.0 / SUM(SUM(total_sales)) OVER()
        AS DECIMAL(10,2)
    ) AS sales_percentage
FROM blinkit_grocery_data
GROUP BY outlet_size
ORDER BY total_sales DESC;



select  outlet_location_type,cast(sum(total_sales) as decimal(10,2))as total_sales
from blinkit_grocery_data
group by outlet_location_type
order by total_sales asc;






select  outlet_type,cast(sum(total_sales) as decimal(10,2))as total_sales,
cast(avg(total_sales) as decimal(10,2))as avg_sales,
count(*) as no_of_items ,
avg(rating) as avg_rating,
  CAST(
        SUM(total_sales) * 100.0 / SUM(SUM(total_sales)) OVER()
        AS DECIMAL(10,2)
    ) AS sales_percentage
from blinkit_grocery_data
group by outlet_type
order by total_sales desc;











Select * from blinkit_grocery_data;
