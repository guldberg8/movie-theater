import sys, csv, pymysql
import pandas as pd

# To populate database: python import_theater.py <xlsx_file>.xlsx root <sql_password>

def get_sheets():
    #sheets are in this specific order to preserver foreign key integrity
    sheets = ['Company',
                'Users',
                'Movie',
                'Employee',
                'CustomerCreditCard',
                'Theater',
                'UserVisitTheater',
                'MoviePlay',
                'CustomerViewMovie']

    return sheets

def get_queries():

    queries = {'Company':'INSERT INTO Company (companyName) values (%s);',
        'Users':'INSERT INTO User (username, status, password, firstName, lastName) values (%s,%s,%s,%s,%s);',
        'Movie':'INSERT INTO Movie (releaseDate, movieName, duration) values (%s,%s,%s);',
        'Employee':'INSERT INTO Employee (username) values (%s);',
        'CustomerCreditCard':'INSERT INTO CreditCard (creditCardNum, username) values (%s, %s);',
        'Theater':'INSERT INTO Theater (companyName, theaterName, manager, street, city, state, zipcode, capacity) values (%s,%s,%s,%s,%s,%s,%s,%s);',
        'MoviePlay':'INSERT INTO MoviePlay (companyName, theaterName, movieReleaseDate, movieName, playDate) values (%s,%s,%s,%s,%s);',
        'UserVisitTheater':'INSERT INTO Visit (visitID, visitDate, companyName, theaterName, username) values (%s,%s,%s,%s,%s);',
        'CustomerViewMovie':'INSERT INTO Transaction(creditCardNum, companyName, theaterName, movieReleaseDate, movieName, moviePlayDate) values (%s,%s,%s,%s,%s,%s);',
        'Manager':'INSERT INTO Manager (username, companyName, street, city, state, zipcode) values (%s,%s,%s,%s,%s,%s)',
        'Admin':'INSERT INTO Admin (username) values (%s);',
        'Customer':'INSERT INTO Customer (username) values (%s);'}

    insert_values = {'Users':['username','status','password','firstName','lastName'],
        'Employee': ['username'],'Company': ['companyName'],
        'CustomerCreditCard': ['creditCardNum','username'],
        'Movie':['releaseDate','movieName','duration'],
        'Theater':['companyName','theaterName','Manager','street','city','state','zipcode','capacity'],
        'MoviePlay':['companyName','theaterName','movieReleaseDate','movieName','playDate'],
        'UserVisitTheater':['visitID','visitDate','companyName','theaterName','username'],
        'CustomerViewMovie':['creditCardNum','companyName','theaterName','movieReleaseDate','movieName','moviePlayDate'],
        'Manager':['username','companyName','street','city','state','zipcode'],
        'Admin':['username'],
        'Customer':['username']}

    return queries, insert_values

#I was having problems with pandas reading the zip codes as floats
#get_data reads all the data and removes .0 from any strings
def get_data(columns, row):

    insert_data = []
    for column in columns:

        val = row[column]

        if '.0' in val:
            val = val.replace('.0','')

        insert_data.append(val)

    return insert_data

def processData(file_name, cursor, connection):

    xl_data = pd.ExcelFile(file_name)

    #sheets are in this specific order to preserver foreign key integrity
    sheets = get_sheets()

    #get queries for each table and dictionary of required values
    queries, columns = get_queries();

    #Go through every sheet
    for sheet in sheets:

        #get dataframe for sheet
        df = xl_data.parse(sheet)
        #dropping rows of all nan
        df = df.dropna(how='all')
        #setting all datatypes to strings
        df = df.astype(str)

        #get a list of dictionaries 
        #where rows[0][column_name] is the data in row 0 at column_name
        rows = df.to_dict('records')

        #run an insert query for every row
        for row in rows:

            cursor.execute(queries[sheet], get_data(columns[sheet],row))

            if(sheet=='Users'):
                if 'Customer' in row['userType']:
                    cursor.execute(queries['Customer'], get_data(columns['Customer'],row))

            elif(sheet=='Employee'):
                if 'Admin' in row['employeeType']:
                    cursor.execute(queries['Admin'], get_data(columns['Admin'],row))

                else:
                    cursor.execute(queries['Manager'], get_data(columns['Manager'],row))

    connection.commit()
    connection.close()

def main(args):
    pd.options.display.float_format = '{:,.0f}'.format

    connection = pymysql.connect(host='localhost',
                                 user=args[1],
                                 password=args[2],
                                 db='Team94',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    cursor = connection.cursor()
    processData(args[0], cursor, connection)


if __name__ == "__main__":
    main(sys.argv[1:])

