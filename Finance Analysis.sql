create database finance_database
use finance_database
select * from finance

-- Write an SQL query to find the total amount of
-- transactions and the average transaction amount for
-- each payment method, but only for transactions with a
-- status of 'Completed.' Order the results by the total
-- amount in descending order
select [payment_method], sum(amount) as Total_Amount,
avg(amount) as Avg_Amount
from finance
where status = 'Completed'
group by [payment_method]
order by Total_Amount desc

-- Write an SQL query to find the top 5 customers
-- (based on customer_id) who have spent the highest
-- total amount, but only for transactions that happened
-- in 2023. Show the customer_name, customer_id, and the
-- total amount spent by each customer
select  top 5 [customer_name],[customer_id],
sum([amount]) as Highest_Amount
from finance
where datepart(year,[transaction_date]) = 2024
group by [customer_name],[customer_id]
order by Highest_Amount desc

-- Write an SQL query to find the total amount spent per
-- category where the transactions were made using either
-- 'Credit Card' or 'Debit Card' as the payment method.
-- Only include categories where the total amount spent is
-- greater than $1000. Order the results by total_amount
-- in descending order
select [category], sum(amount) as Total_Amount
from finance
where [payment_method] = 'Credit Card' or
[payment_method] ='Debit Card'
group by [category]
having sum(amount) > 1000
order by Total_Amount desc

-- Write an SQL query to find the average transaction
-- amount for each region where the transaction status
-- is 'Pending' or 'Completed'. Show the region and the
-- average transaction amount, and order the results by
-- region in ascending order.
select Region, avg(amount) as Total_Amount
from finance
where [status] = 'Pending' or [status] = 'Completed'
group by Region
order by Region

-- Write an SQL query to find the total number of
-- transactions and the total amount spent for each merchant
-- in the 'Electronics' category, where the transaction
-- occurred in 2024. Show the merchant's name, the total
-- number of transactions, and the total amount spent.
select [merchant_name],
count([transaction_id]) as Total_Count,
sum(amount) as Total_Amount
from finance
where [category] = 'Expense'
group by [merchant_name]
order by Total_Amount desc

-- Write an SQL query to find the average transaction
-- amount for each region where the payment_method is
-- 'Cash' and the status is 'Completed', but only for
-- transactions that occurred in the first quarter of 2024
-- (January, February, and March). Show the region and the
-- average transaction amount.
select region, avg(amount) as avg_Amount
from finance
where [payment_method] = 'Cash' and
status = 'Completed' and
datepart(quarter,[transaction_date]) = 1
group by region

-- Write an SQL query to find the total amount spent in
-- the 'Income' category for each customer, but only for
-- transactions where the payment method is either 'Bank
-- Transfer' or 'PayPal'. Show the customer_name,
-- customer_id, and the total amount spent in the 'Income'
-- category.
select [customer_name],[customer_id], sum(amount) as Total_Amount
from finance
where [category] = 'Income' and
([payment_method] = 'Bank Transfer' or
[payment_method] = 'Paypal')
group by [customer_name],[customer_id]
order by Total_Amount desc

-- Write an SQL query to find the merchant(s) who have the
-- highest total transaction amount in the 'Expense' category.
-- Show the merchant_name and the total amount spent for
-- that merchant. If multiple merchants tie for the highest
-- total, display all of them
select top 1 [merchant_name], sum(amount) as total_Amount
from finance
where [category] = 'Expense'
group by [merchant_name]
order by total_Amount desc

-- Write an SQL query to find the total number of transactions
-- and the total amount for each payment method in the
-- 'Expense' category. Only include the results for payment
-- methods that have more than 5 transactions. Show the
-- payment_method, the total number of transactions, and the
-- total amount spent for each payment method
select [payment_method], count([transaction_id]) as
Total_Transection, sum(amount) as Total_Amount
from finance
where [category] = 'Expense'
group by [payment_method]
having count([transaction_id]) > 5

-- Write an SQL query to find the average transaction amount
-- for each customer in the 'Expense' category where the
-- transaction occurred in 2024. Show the customer_name,
-- customer_id, and the average transaction amount
select [customer_name],[customer_id], avg(amount) as avg_Amount
from finance
where  category = 'Expense'
group by [customer_name],[customer_id]

-- Write a query to find the top 3 merchants in terms of the
-- average transaction amount in the 'Expense' category. Show
-- the merchant_name and the average transaction amount for
-- each of the top 3 merchants.
select top 3 merchant_name, avg(amount) as Avg_Amount
from finance
where category = 'Expense'
group by merchant_name
order by Avg_Amount desc

-- Write a query to find the top 3 regions based on the
-- total amount for the 'Expense' category, ordered by
-- total amount in descending order. Make sure to display
-- the region and the total amount.
select Top 3 Region, sum(amount) as Total_Amount
from finance
where category = 'Expense'
group by Region
order by Total_Amount desc

-- Write a query to find the average amount per payment method
-- for the 'Income' category, but only for transactions that
-- have a status of 'Completed'.
-- Make sure to group the results by payment method and order
-- the results by average amount in descending order.
select [payment_method], avg(amount) as Avg_Amount
from finance
where category = 'Income' and
status  = 'Completed'
group by [payment_method]
order by Avg_Amount desc

-- Write a query to find the total number of transactions
-- and the total amount for each customer where the
-- transaction was made in 2024 and the payment method is
-- either 'Credit Card' or 'Debit Card'.
-- Group the results by customer_name and customer_id, and
-- order them by total amount in descending order.
select [customer_name],[customer_id],
count([transaction_id]) as Total_Count,
sum(amount) as Total_Amount
from finance
where [payment_method] = 'Credit Card' or 
[payment_method] = 'Debit Card'
group by [customer_name],[customer_id]
order by Total_Amount desc

-- Write a query to find the merchant name and the total
-- amount for each merchant in the 'Income' category where
-- the transaction status is 'Completed'. Display the
-- merchants who have a total amount greater than 500.
select [merchant_name], sum(amount) as Total_Amount
from finance
where category = 'Income' and 
status = 'Completed'
group by [merchant_name]
having sum(amount) > 500

-- Write a query to find the top 5 customers who have spent
-- the most in the 'Expense' category in 2024, showing
-- customer name, customer id, and the total amount spent.
-- Order the results by total amount in descending order
select top 5 [customer_name],[customer_id],
sum(amount) as Total_Amount
from finance
where category = 'Expense'
group by [customer_name],[customer_id]
order by Total_Amount desc

-- Write a query to find the average transaction amount for
-- each region in the 'Income' category, but only for
-- transactions where the payment method is 'Bank Transfer'.
-- Group the results by region and payment method, and order
-- them by region
select region,[payment_method], avg(amount) as Avg_Amount
from finance
where category = 'Income' and
payment_method = 'Bank Transfer'
group by region,[payment_method]
order by region

-- Write a query to find the total amount and the number
-- of transactions for each month in 2024 for the 'Expense'
-- category. Display the month, total amount, and transaction
-- count, and order the results by month in ascending order.
select datename(month, [transaction_date]) as month,
sum(amount) as Total_Amount,
count([transaction_id]) as Total_Transection
from finance
where category = 'Expense'
group by datename(month, [transaction_date])
order by month

-- Write a query to find the total number of transactions,
-- total amount, and average amount for each status in the
-- 'Income' category. Group the results by status and order
-- by total amount in descending order.
select status, count([transaction_id]) as Total_Count,
sum(amount) as Total_Amount,
avg(amount) as Avg_Amount
from finance
where category = 'Income'
group by status
order by Total_Amount desc

-- Suppose you want to calculate the cumulative total amount
-- for each region in the 'Income' category. Write a query
-- using a window function to calculate this cumulative total,
-- and display the columns: region, transaction_date, amount,
-- and the cumulative total. Order the results by region and
-- transaction_date.
SELECT 
    region, 
    transaction_date, 
    amount, 
    SUM(amount) OVER (PARTITION BY region ORDER BY
	transaction_date) AS Cumulative_Total
FROM finance
WHERE category = 'Income'
ORDER BY region, transaction_date;

-- Write a query to find the top 3 customers who have spent
-- the most in the 'Expense' category in 2024. For each
-- customer, display their customer name, customer ID,
-- and total amount spent. The results should be ordered
-- by total amount spent in descending order.
select top 3 [customer_name],[customer_id],
sum(amount) as Total_Amount
from finance
where category = 'Expense'
group by [customer_name],[customer_id]
order by Total_Amount desc

-- Write a query to find the first and last transaction
-- amount for each merchant in the 'Income' category in 2024.
-- Display the merchant name, first transaction amount, and
-- last transaction amount, and order the results by
-- merchant name
WITH RankedTransactions AS (
    SELECT 
        merchant_name,
        amount,
        ROW_NUMBER() OVER (PARTITION BY merchant_name ORDER BY transaction_date ASC) AS RowNum_Asc,
        ROW_NUMBER() OVER (PARTITION BY merchant_name ORDER BY transaction_date DESC) AS RowNum_Desc
    FROM finance
    WHERE category = 'Income' AND YEAR(transaction_date) = 2024
)
SELECT 
    merchant_name,
    MAX(CASE WHEN RowNum_Asc = 1 THEN amount END) AS First_Transaction_Amount,
    MAX(CASE WHEN RowNum_Desc = 1 THEN amount END) AS Last_Transaction_Amount
FROM RankedTransactions
GROUP BY merchant_name
ORDER BY merchant_name;

-- Write a query to find the average transaction amount for
-- each payment method in the 'Expense' category, but only
-- for transactions that occurred in the second quarter
-- (April, May, June) of 2024. Display the payment method
-- and the average transaction amount.
select [payment_method], avg(amount) as Avg_Amount
from finance
where category = 'Expense' and 
datepart(quarter,[transaction_date]) = 2
group by [payment_method]

-- Write a query to determine the total number of transactions
-- and the total amount for each region in the 'Income' 
-- category, but only for transactions where the status is
-- either 'Completed' or 'Pending'. Display the region,
-- total number of transactions, and total amount, sorted
-- by the total amount in descending order.
select Region, count([transaction_id]) as Total_Count,
sum(Amount) as Total_Amount
from finance
where category = 'Income' and 
(status = 'completed' or status = 'pending' )
group by Region
order by Total_Amount desc

-- Write a query to find the month with the highest total
-- transaction amount for the 'Expense' category in 2024.
-- Display the month name and the total amount. Let’s see
-- your solution
select top 1 datename(Month,[transaction_date]) as Month, sum(amount) as Highest_Amount
from finance
where category = 'Expense'
group by datename(Month,[transaction_date])
order by Highest_Amount desc

-- Write a query to calculate the cumulative transaction
-- amount for the 'Income' category, sorted by transaction
-- date. Display the transaction date, customer name,
-- transaction amount, and the cumulative total amount.
select 
    transaction_date,
    customer_name,
    amount as Transaction_Amount,
    sum(amount) over (order by transaction_date) as Cumulative_Amount
from finance
where category = 'Income'
order by transaction_date;

-- Write a query to find the percentage contribution of each
-- payment method to the total transaction amount in the
-- 'Expense' category. Display the payment method, total
-- amount, and percentage contribution.
select [payment_method],sum(amount) as Total_Amount,
sum(amount)*100 / (select sum(amount) from finance)
as Percentage_Contribution
from finance
where category = 'Expense'
group by [payment_method]

-- Write a query to find the top 3 regions with the highest
-- average income per transaction. Display the region and
-- the average income amount, sorted in descending order
select top 3 Region, avg(amount) as avg_Amount
from finance
where [category] = 'Income'
group by Region
order by avg_Amount desc

-- Write a query to determine the month with the lowest
-- total expense. Display the month name and the total
-- expense amount, sorted in ascending order by total expense
select datename(month, transaction_date) as Month,
sum(amount) as total_amount
from finance
where [category] = 'expense'
group by datename(month, transaction_date)
order by total_amount asc

-- Write a query to calculate the total number of
-- transactions, the total amount, and the average
-- transaction amount for each payment method and category.
-- Sort the results by category and then by payment method.
select [payment_method],[category],
count([transaction_id]) as Total_Trasections,
sum(amount) as Total_Amount,
avg(amount) as Avg_Amount
from finance
group by [payment_method],[category]
order by [category],[payment_method]

-- Write a query to calculate the total income and total
-- expense for each region. Display the region, total income,
-- total expense, and the net balance
-- (total income - total expense). Sort the results by the 
-- net balance in descending order
select region,
sum(case when [category] = 'income' then amount else 0 end) as Total_Income,
sum(case when [category] = 'expense' then amount else 0 end) as Total_Expense,
sum(case when [category] = 'income' then amount else 0 end) - 
sum(case when [category] = 'expense' then amount else 0 end) as Net_balance
from finance
group by region
order by Net_balance desc

-- Write a query to display the top 3 merchants in terms of
-- total income, along with the corresponding total
-- transaction count and total income amount. Sort the
-- results by total income in descending order.
select top 3 [merchant_name],count([transaction_id]) as Total_acount,
sum(amount) as Total_Income
from finance
where [category] = 'Income'
group by [merchant_name]
order by Total_Income desc

-- Write a query to find the percentage contribution of each
-- region to the total income. Sort the results in descending
-- order of their percentage contribution
select Region, sum(amount)*100 / (select sum(amount)
from finance) as percentage_Contribution
from finance
where [category] = 'Income'
group by Region
order by percentage_Contribution desc

-- Write a query to display the monthly trend of the total
-- amount (both income and expense). Include the month name,
-- category, and the total amount. Sort the results first by
-- category and then by month in ascending order
select datename(month, [transaction_date]) as Month,
[category],
sum(amount) as Total_Amount
from finance
group by datename(month, [transaction_date]),[category]
order by [category], Month

-- Write a query to find the average amount for each payment
-- method in each region, but only for transactions in the
-- 'Expense' category. The result should be ordered by payment
-- method in ascending order
select region, [payment_method],
avg(amount) as Avg_Amount
from finance
where category = 'Expense'
group by region, [payment_method]
order by [payment_method]

-- Write a query to find the total amount of 'Income'
-- transactions for each merchant name. Include only
-- merchants with a total amount greater than 1,000, and
-- order the result by the total amount in descending order
select [merchant_name], sum(amount) as Total_Amount
from finance
where [category] = 'Income'
group by [merchant_name]
having sum(amount) > 1000
order by Total_Amount desc

-- Write a query to count the number of transactions and
-- sum the amounts for each status ('Completed' and 'Pending')
-- within the 'Expense' category, and order the result by
-- status in ascending order.
select status, count([transaction_id]) as Total_Count,
sum(amount) as Total_Amount
from finance
where category = 'Expense'
group by status
order by status

-- Write a query to find the total amount and average amount
-- for each payment method in the 'Income' category. Only
-- include rows where the average amount is greater than 500,
-- and order the result by payment method in ascending order
select [payment_method], sum(amount) as Total_Amount,
avg(amount) as avg_Amount
from finance
where category = 'Income'
group by [payment_method]
having avg(amount) > 500
order by [payment_method]

-- Write a query to find the top 3 regions with the highest
-- total amount of 'Income' transactions in 2024, but only
-- include those regions where the average transaction amount
-- for that region is greater than 300. Order the results by
-- total amount in descending order
select top 3 Region, sum(amount) as Total_Amount
from finance
where [category] = 'Income'
group by Region
having avg(amount) > 300
order by Total_Amount desc

-- Write a query to find the difference between the highest
-- and lowest transaction amount for each merchant in the
-- 'Income' category. Return the merchant_name, the
-- difference (as Amount_Difference), and order by the
-- largest difference first.
select [merchant_name], max(amount) as highest_amount,
min(amount) as Lowest_Amount,
max(amount) - min(amount) as Difference_Amount
from finance
where category = 'Income'
group by [merchant_name]
order by Difference_Amount desc

-- Write a query to find the top 5 customers who spent the
-- most in total in the 'Income' category, but only consider
-- transactions where the payment method is 'Credit Card' or
-- 'Debit Card'. You need to return the customer name,
-- customer ID, and total amount spent.
select top 5 [customer_name],[customer_id],
sum(amount) as Total_Amount
from finance
where category = 'Income' and
([payment_method] = 'Credit Card' or [payment_method] = 'Debit Card')
group by [customer_name],[customer_id]
order by Total_Amount desc

-- How can you calculate the cumulative sum of amount for
-- each transaction, ordered by transaction_date? For this,
-- assume the dataset has columns: transaction_id,
-- transaction_date, and amount.
select [transaction_id], [transaction_date],
sum(amount) over (order by transaction_date) as Comulative_Total
from finance
order by [transaction_date]

-- How can you calculate the running total
-- of the amount for each region, considering each region
-- should have its own cumulative total starting from the
-- first transaction?
select Region, 
sum(amount) over (partition by Region order by [transaction_date]) as Comulative_Total
from finance
order by [transaction_date]

-- How would you write a query to find the top 3 merchants
-- based on the highest total amount in a specific category
-- (e.g., 'Income') within each region?
with top_Merchants as (
select 
		[merchant_name],Region, sum(amount) as Total_Amount,
		ROW_NUMBER() Over (partition by Region
		order by sum(amount)) as Rank
from finance
where category = 'Income'
group by [merchant_name],Region
)
select top 3 [merchant_name],Region, Total_Amount
from top_Merchants
where rank between 1 and 3
order by Total_Amount desc

-- Write a query to find the total number of transactions,
-- total income, and average transaction amount for each
-- month in 2024, sorted by month.
select datename(month, [transaction_date]) as Month,
count([transaction_id]) as Total_Transections,
sum(amount) as Total_amount,
avg(amount) as avg_Amount
from finance
where [category] = 'Income'
group by datename(month, [transaction_date]),month([transaction_date])
order by month([transaction_date])

-- Write a query to find the total income and total expense
-- for each region. Display the region, the total amount
-- for the Income category, the total amount for the Expense
-- category, and the difference between income and expense.
-- Sort the results by the difference in descending order
select Region, 
sum(case when [category] = 'income' then amount else 0 end) as Total_Income,
sum(case when [category] = 'Expense' then amount else 0 end) as Total_Expenses,
sum(case when [category] = 'income' then amount else 0 end)- 
sum(case when [category] = 'Expense' then amount else 0 end) as Total_Diff
from finance
group by region
order by Total_Diff desc

-- Write a query to find the top 3 months
-- (based on the total transaction amount) along with the
-- percentage contribution of each month’s total to the
-- overall total transaction amount. Display the month name,
-- total transaction amount, and percentage contribution
select top 3 datename(month,[transaction_date]) as Month,
sum(amount) as Total_Amount,
sum(amount) *100 / (select sum(amount) from finance)
as Percentage_Contribution
from finance
group by datename(month,[transaction_date])
order by Total_Amount desc


select 
    Region,
    category,
    count(distinct [customer_id]) as Unique_Customers,
    sum(amount) as Total_Amount,
    avg(amount) as Avg_Amount
from finance
group by Region, category
having sum(amount) > 10000
order by Region, category;

-- Write a query to calculate the percentage contribution of
-- each region to the overall income and expense totals,
-- along with the total amount for each category in each
-- region. Sort the results by the percentage contribution
-- in descending order.

