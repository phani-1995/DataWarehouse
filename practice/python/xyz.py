import mysql.connector as mysql

#Connecting to db
db = mysql.connect(
    host = "localhost",
    user = "hduser",
    passwd = "hduser",
    database = "sales1"
)

cursor = db.cursor()

#Inserting data into table
query = "INSERT INTO Customer_Dim (Cust_key, Cust_id, Begin_date, End_Date) VALUES (%d ,%d, '%s', '%s')"

values = [
(1,2,3,4,5),
(10,20,10,20,30),
('2020-01-01', '2020-02-01', '2020-03-01', '2020-04-01', '2020-05-01'),
('2020-05-31', '2020-06-30', '2020-07-31', '2020-08-31', '2020-09-30')
]

## executing the query with values
cursor.executemany(query, values)
db.commit()

print(cursor.rowcount, "records inserted")