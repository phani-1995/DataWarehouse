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
cursor.execute("CREATE TABLE DimDate (date_id  BIGINT PRIMARY KEY, date DATE NOT NULL, timestamp BIGINT NOT NULL, weekend CHAR(10) NOT NULL DEFAULT Weekday, day_of_week CHAR(10) NOT NULL, month CHAR(10) NOT NULL, month_day INT NOT NULL, year INT NOT NULL, week_starting_monday CHAR(2) NOT NULL, UNIQUE KEY 'date' ('date'), KEY 'year_week' ('year','week_starting_monday'))")