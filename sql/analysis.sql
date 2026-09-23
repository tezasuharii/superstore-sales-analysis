-- 1. PEMBERSIHAN DAN TRANSFORMASI DATA --

CREATE TABLE superstore_clean AS
SELECT
    row_id,
    order_id,
    TO_DATE(order_date, 'DD/MM/YYYY') AS order_date,
    TO_DATE(ship_date, 'DD/MM/YYYY') AS ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    CAST(REPLACE(sales, ',', '.') AS NUMERIC) AS sales,
    CAST(quantity AS INTEGER) AS quantity,
    CAST(REPLACE(discount, ',', '.') AS NUMERIC) AS discount,
    CAST(REPLACE(profit, ',', '.') AS NUMERIC) AS profit
FROM superstore;


-- 2. ANALISIS KINERJA PENJUALAN KESELURUHAN --

-- 2.1 Total Penjualan
SELECT
    SUM(sales) AS total_sales
FROM superstore_clean;

-- 2.2 Total Laba
SELECT
    SUM(profit) AS total_profit
FROM superstore_clean;

-- 2.3 Total Kuantitas Produk Terjual
SELECT
    SUM(quantity) AS total_quantity
FROM superstore_clean;


-- 3. ANALISIS PENJUALAN BERDASARKAN KATEGORI --

-- 3.1 Total Penjualan per Kategori
SELECT
    category,
    SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY category
ORDER BY total_sales DESC;

-- 3.2 Total Laba per Kategori
SELECT
    category,
    SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY category
ORDER BY total_profit DESC;


-- 4. ANALISIS PENJUALAN BERDASARKAN WILAYAH --

SELECT
    region,
    SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY region
ORDER BY total_sales DESC;


-- 5. PRODUK DENGAN PENJUALAN TERTINGGI -- 

SELECT
    product_name,
    SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;


-- 6. KATEGORI DENGAN LABA TERTINGGI -- 

SELECT
    category,
    SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY category
ORDER BY total_profit DESC;


-- 7. ANALISIS PENJUALAN PER TAHUN -- 

SELECT
    EXTRACT(YEAR FROM order_date) AS tahun,
    SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY tahun
ORDER BY tahun;


-- 8. ANALISIS PENJUALAN PER TAHUN DAN KATEGORI -- 

SELECT
    EXTRACT(YEAR FROM order_date) AS tahun,
    category,
    SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY tahun, category
ORDER BY tahun, category;


-- 9. ANALISIS PENJUALAN DAN LABA BERDASARKAN SUB-KATEGORI --

SELECT
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY sub_category
ORDER BY total_profit DESC;


-- 10. ANALISIS PENJUALAN DAN LABA BERDASARKAN SEGMEN -- 

SELECT
    segment,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY segment
ORDER BY total_sales DESC;


-- 11. PELANGGAN DENGAN PENJUALAN TERTINGGI -- 

SELECT
    customer_name,
    SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- 12. KOTA DENGAN PENJUALAN TERTINGGI -- 

SELECT
    city,
    SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;


-- 13. KOTA DENGAN LABA TERTINGGI -- 

SELECT
    city,
    SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY city
ORDER BY total_profit DESC
LIMIT 10;


-- 14. SUB-KATEGORI YANG MENGALAMI KERUGIAN --

SELECT
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit;


-- 15. ANALISIS MARGIN LABA BERDASARKAN KATEGORI --

SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin
FROM superstore_clean
GROUP BY category
ORDER BY profit_margin DESC;


-- 16. TEMUAN HASIL ANALISIS -- 

-- 16.1 Penjualan dan Profitabilitas Berdasarkan Kategori
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / NULLIF(SUM(sales), 0) * 100,
        2
    ) AS profit_margin
FROM superstore_clean
GROUP BY category
ORDER BY total_sales DESC;


-- 16.2 Penjualan dan Laba Berdasarkan Wilayah
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY region
ORDER BY total_sales DESC;


-- 16.3 Penjualan dan Laba Berdasarkan Tahun
SELECT
    EXTRACT(YEAR FROM order_date) AS tahun,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY tahun
ORDER BY tahun;


-- 17. VALIDASI DATA -- 

SELECT *
FROM superstore_clean;