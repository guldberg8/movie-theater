import sys, csv, pymysql

# To populate database: python import_theater.py <csv_file>.csv root <sql_password>


def csvExtractor(csvFile, cursor, connection):
    with open(csvFile) as fin:
        dictreader = csv.DictReader(fin)
        dictList = [dict(row) for row in dictreader]
    print(dictList)
    table = [list(dict.values()) for dict in dictList]
    table = table[0:30]
    data = [(i[0], i[1], i[3], i[4], i[5], i[6], i[2]) for i in table]
    print(data)
    #query = 'INSERT INTO User (username, status, password, firstName, lastName) values (%s, %s, %s, %s, %s);'
    # query = 'INSERT INTO Employee (username) values (%s);'
    #query = 'INSERT INTO Manager (username, street, city, state, zipcode, companyName) values (%s, %s, %s, %s, %s, %s);'
    #query = 'INSERT INTO Company (name) values (%s);'

    # query = 'INSERT INTO creditCard (creditCardNum, username) values (%s, %s);'
    # query = 'INSERT INTO Movie (movReleaseDate, movName, duration) values (%s, %s, %s);'
    query = 'INSERT INTO Theater (companyName, theaterName, street, city, state, zipcode, capacity) values (%s, %s, %s, %s, %s, %s, %s);'
    cursor.executemany(query, data)
    connection.commit()
    connection.close()

def main(args):
    print(args[2])
    connection = pymysql.connect(host='localhost',
                                 user=args[1],
                                 password=args[2],
                                 db='Team94',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    cursor = connection.cursor()
    csvExtractor(f'csv_files/{args[0]}', cursor, connection)


if __name__ == "__main__":
    main(sys.argv[1:])

