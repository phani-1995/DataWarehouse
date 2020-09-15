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

## creating a table called 'users' in the 'datacamp' database
cursor.execute("CREATE TABLE DimProduct (ProductAltKey varchar(255) not null PRIMARY KEY,\
ProductName varchar(50), ProductActualCost double, ProductSalesCost double)")

# Inserting data into table
query = "INSERT INTO DimProduct (ProductAltKey, ProductName, ProductActualCost," \
        " ProductSalesCost) VALUES (%s, %s, %f, %f)"

values = [
    ('ITM-001', 'Wheat Floor 1kg', 5.50, 6.50),
    ('ITM-002', 'Rice Grains 1kg', 22.50, 24.0),
    ('ITM-003', 'SunFlower Oil 1 ltr', 42.0, 43.5),
    ('ITM-004', 'Nirma Soap', 18.0, 20.0),
    ('ITM-005', 'Arial Washing Powder 1kg', 135.0, 139.0)
]

## executing the query with values
cursor.executemany(query, values)

## to make final output we have to run the 'commit()' method of the database object
db.commit()

print(cursor.rowcount, "records inserted")
