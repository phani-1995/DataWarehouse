import mysql.connector as mysql

#Connecting to db
db = mysql.connect(
    host = "localhost",
    user = "hduser",
    passwd = "hduser",
    database = "Sales_DW"
)

#Creating table
cursor = db.cursor()

## creating a table called 'users' in the 'datacamp' database
cursor.execute("CREATE TABLE DimCustomer (CustomerAltID varchar(10) not null PRIMARY KEY, \
CustomerName varchar(50), Gender varchar(20))")

#Inserting data into table
query = "INSERT INTO DimCustomer (CustomerAltID, CustomerName, Gender) VALUES (%s ,%s, %s)"

values = [
('IMI-001','Henry Ford','M'),
('IMI-002','Bill Gates','M'),
('IMI-003','Muskan Shaikh','F'),
('IMI-004','Richard Thrubin','M'),
('IMI-005','Emma Wattson','F')
]

## executing the query with values
cursor.executemany(query, values)

## to make final output we have to run the 'commit()' method of the database object
db.commit()

print(cursor.rowcount, "records inserted")