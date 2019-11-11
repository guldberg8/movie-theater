import sys, csv, pymysql
from pprint import pprint
# To populate database: python import_theater.py InitialDataV2.csv root <sql_password>


def connect(args):
    global connection, cursor
    try:
        connection = pymysql.connect(host='localhost',
                                     user=args[1],
                                     password=args[2],
                                     db='movie_theater',
                                     charset='utf8mb4', 
                                     cursorclass=pymysql.cursors.DictCursor)
        cursor = connection.cursor()
        return connection, cursor
    except Exception as e:
        return print(f'The following Exception occured, {e}\n\n{args[1]} could not log into MySQL database')

def csvExtractor(csvFile):
    csvFile = csvFile.replace('xlsx', 'csv')
    print(csvFile)
    with open(csvFile) as fin:
        dictreader = csv.DictReader(fin)
        dictList = [dict(row) for row in dictreader]
    print(dictList)
    monsterTable = [(int(i['ID_number']), i['name'], i['monster_type'], i['scare_type'], \
                    float(i['avg_score']), int(i['num_of_screams']), i['color'], \
                    int(i['eye_count']), i['monster_fear']) for i in dictList]
    return monsterTable


def insert(theater_info):
    roster = [(i[0], i[1], i[2], i[6]) for i in theater_info]
    query = "insert into roster (ID_number, name, monster_type, color) values (%s, %s, %s, %s);"
    cursor.executemany(query, roster)

    connection.commit()
    connection.close()


def main(args):
    theater_info = csvExtractor(args[0])
    insert(theater_info)


if __name__ == "__main__":
    main(sys.argv[1:])
