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

## creating a table
cursor.execute("CREATE TABLE DimStores (StoreAltID varchar(255) not null PRIMARY KEY,\
StoreName varchar(50), StoreLocation varchar(255), City varchar(255), State varchar(255),Country varchar(255))")