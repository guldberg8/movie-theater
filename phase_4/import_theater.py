import sys, csv, pymysql
from pprint import pprint
# To populate databse: python import_theater.py theater.csv root <sql_password>


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
    with open(csvFile) as fin:
        dictreader = csv.DictReader(fin)
        dictList = [dict(row) for row in dictreader]

    monsterTable = [(int(i['ID_number']), i['name'], i['monster_type'], i['scare_type'], \
                    float(i['avg_score']), int(i['num_of_screams']), i['color'], \
                    int(i['eye_count']), i['monster_fear']) for i in dictList]
    return monsterTable

def ranking(monsterTable):
    return sorted(monsterTable,key = lambda x: x[4]*x[5], reverse = True)[:15]

def insert(theater_into, rankedInfo):
    roster = [(i[0], i[1], i[2], i[6]) for i in theater_into]
    query = "insert into roster (ID_number, name, monster_type, color) values (%s, %s, %s, %s);"
    cursor.executemany(query, roster)

    query2 = "insert into leaderboard (ranks, name, monster_type, combo_score) values (%s,%s,%s,%s);"
    ranked = [(i+1,j[1],j[2],round(j[4]*j[5],2)) for i,j in enumerate(rankedInfo)]
    cursor.executemany(query2, ranked)

    query2 = "insert into personality (name, fear, monster_type, scare_type) values (%s, %s, %s, %s);"
    personality = [(i[1], i[8], i[2], i[3]) for i in theater_into]
    cursor.executemany(query2, personality)

    query3 = "insert into scariness (ID_number, scare_type, scary_score) values(%s,%s,%s);"
    scariness = [(i[0], i[3], round(i[4]*i[5]*i[7],2)) for i in theater_into]
    cursor.executemany(query3, scariness)

    connection.commit()
    connection.close()


def main(args):
    theater_info = csvExtractor(args[0])
    rankedInfo = ranking(theater_into)
    insert(theater_into, rankedInfo)


if __name__ == "__main__":
    main(sys.argv[1:])
