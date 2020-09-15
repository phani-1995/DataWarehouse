import mysql.connector as mysql

# Connecting to db

db = mysql.connect(
    host="localhost",
    user="hduser",
    passwd="hduser",
    database="Sales_DW"
)
print('Database connected successfully')

# Creating table

cursor = db.cursor()

# Creating a table
cursor.execute("CREATE TABLE FactProductSales (TransactionId bigint primary key, "
               "SalesInvoiceNumber int not null, StoreAltID varchar(255) not null, CustomerAltID varchar(10) not null,"
               "ProductID varchar(255) not null, SalesPersonAltID varchar(255) not null,"
               "Quantity float, SalesTotalCost double, ProductActualCost double, Deviation float)")
