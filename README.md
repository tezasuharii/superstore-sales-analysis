**Superstore Sales & Profit Analysis**

## Deskripsi Proyek

Project ini merupakan analisis data penjualan menggunakan dataset Superstore untuk mengetahui performa penjualan, laba, kategori produk, wilayah, serta tren penjualan dari tahun ke tahun.

Analisis dilakukan menggunakan PostgreSQL dan SQL untuk proses data cleaning dan analisis data, kemudian Power BI digunakan untuk membuat dashboard interaktif.

## Tujuan Analisis

- Menganalisis total penjualan, laba, dan jumlah produk terjual
- Membandingkan penjualan dan laba berdasarkan kategori produk
- Menganalisis performa penjualan berdasarkan wilayah
- Menganalisis tren penjualan dan laba berdasarkan tahun
- Mengidentifikasi produk dan pelanggan dengan penjualan tertinggi
- Mengidentifikasi sub-kategori yang mengalami kerugian
- Menghitung profit margin berdasarkan kategori
- Membuat dashboard interaktif menggunakan Power BI

## Dataset

Dataset yang digunakan adalah dataset Superstore yang berisi informasi mengenai:

- Order
- Customer
- Product
- Category
- Region
- Sales
- Quantity
- Discount
- Profit

Dataset terdiri dari sekitar 9.994 baris dan 21 kolom.

## Tools yang Digunakan

- PostgreSQL
- SQL
- Power BI
- Microsoft Excel
- CSV

## Data Cleaning

Data awal diimpor ke PostgreSQL sebagai data mentah.

Beberapa proses data cleaning yang dilakukan:

- Mengubah format `order_date` menjadi tipe data tanggal
- Mengubah format `ship_date` menjadi tipe data tanggal
- Mengubah `sales` menjadi tipe data numerik
- Mengubah `profit` menjadi tipe data numerik
- Mengubah `quantity` menjadi tipe data integer
- Mengubah pemisah desimal dari koma menjadi titik
- Membuat tabel hasil pembersihan bernama `superstore_clean`

## Analisis SQL

Analisis menggunakan SQL mencakup:

- Total penjualan
- Total laba
- Total kuantitas produk terjual
- Penjualan berdasarkan kategori
- Laba berdasarkan kategori
- Penjualan berdasarkan wilayah
- Top 10 produk berdasarkan penjualan
- Penjualan berdasarkan tahun
- Penjualan berdasarkan tahun dan kategori
- Penjualan dan laba berdasarkan sub-kategori
- Penjualan dan laba berdasarkan segmen
- Top 10 pelanggan berdasarkan penjualan
- Top 10 kota berdasarkan penjualan
- Top 10 kota berdasarkan laba
- Sub-kategori yang mengalami kerugian
- Profit margin berdasarkan kategori

## Dashboard Power BI

Dashboard dibuat menggunakan Power BI untuk memberikan gambaran interaktif mengenai performa penjualan dan laba.

Dashboard mencakup:

- Total Sales
- Total Profit
- Total Quantity
- Profit Margin
- Sales by Category
- Profit by Category
- Sales Trend by Year
- Sales by Region
- Top Products by Sales

### Dashboard Preview

![Superstore Dashboard](dashboard/superstore_dashboard.png)

**Temuan Hasil Analisis**

### 1. Kinerja Berdasarkan Kategori

Kategori Technology memiliki total penjualan dan laba tertinggi, dengan penjualan sekitar 836,15K dan laba sekitar 145,45K.

Kategori Furniture memiliki penjualan sekitar 742,00K, tetapi laba hanya sekitar 18,45K dengan profit margin sebesar 2,49%.

### 2. Profitabilitas

Kategori Office Supplies menghasilkan penjualan sekitar 719,05K dan laba sekitar 122,49K dengan profit margin sebesar 17,04%.

Hasil ini menunjukkan bahwa jumlah penjualan yang tinggi tidak selalu menghasilkan profitabilitas yang tinggi.

### 3. Kinerja Berdasarkan Wilayah

Wilayah West memiliki total penjualan dan laba tertinggi, yaitu sekitar 725,46K penjualan dan 108,42K laba.

Wilayah South memiliki total penjualan terendah, yaitu sekitar 391,72K, tetapi menghasilkan laba sekitar 46,75K.

### 4. Tren Tahunan

Penjualan mengalami penurunan pada tahun 2015 dibandingkan tahun 2014, kemudian meningkat pada tahun 2016 dan 2017.

Tahun 2017 mencatat total penjualan dan laba tertinggi selama periode yang dianalisis.

## Rekomendasi

- Mengevaluasi faktor yang menyebabkan rendahnya profit margin pada kategori Furniture.
- Mempertahankan performa kategori Technology dan Office Supplies.
- Menganalisis faktor yang mendukung performa penjualan dan laba pada wilayah West.
- Mengevaluasi performa wilayah South meskipun memiliki total penjualan lebih rendah.
- Menganalisis faktor yang berkontribusi terhadap peningkatan penjualan pada periode 2016–2017.

## Struktur Repository

superstore-sales-analysis/
│
├── README.md
│
├── dataset/
│   └── superstore.csv
│
├── sql/
│   └── analysis.sql
│
└── dashboard/
    ├── dashboard.png
    └── superstore_dashboard.pbix
