import mysql.connector

#checking connection

mydb = mysql.connector.connect(
  host="localhost",
  user="hduser",
  password="hduser"
)

#Creating database
try:
    mycursor = mydb.cursor()
    
    mycursor.execute("CREATE DATABASE Sales_DW")
    print('Connection sucessfull')
except ConnectionError():
    pass

#Checking database is created or not 
mycursor = mydb.cursor()

mycursor.execute("SHOW DATABASES")

for x in mycursor:
  print(x)
  
