import sys, pymysql, registration_classes, UI, functionality_classes
from datetime import date
from PyQt5.QtCore import Qt, QAbstractTableModel, QVariant
from PyQt5.QtWidgets import (
    QApplication,
    QWidget,
    QLabel,
    QPushButton,
    QHBoxLayout,
    QVBoxLayout,
    QRadioButton,
    QListView,
    QLabel,
    QAbstractItemView,
    QMessageBox,
    QLineEdit,
    QAction,
    QSplitter,
    QTableWidget,
    QTableWidgetItem,
    QCalendarWidget,
    QTableView, QDialog, qApp, QGroupBox, QFormLayout, QComboBox, QDialogButtonBox)
from PyQt5.QtGui import (
    QStandardItemModel,
    QStandardItem)


class theater_overview(QDialog):
    def __init__(self, man_screen, selection = '', entered_movie_name = '',
                 entered_movie_duration = [0, 10000000], entered_movie_rel_date = ['1500-01-01', date.today().__str__()],
                 entered_movie_play_date = []):
        super(theater_overview, self).__init__()
        self.setWindowTitle("Theater Overview")
        self.back_screen = man_screen
        self.movie_name = QLineEdit()
        self.movie_duration_start = QLineEdit()
        self.movie_duration_end = QLineEdit()
        self.rel_start = QLineEdit(selection)
        self.rel_end = QLineEdit(selection)
        self.play_start = QLineEdit(selection)
        self.play_end = QLineEdit(selection)

        back_button = QPushButton('Back')
        calender_button1 = QPushButton('Cal')
        calender_button1.clicked.connect(self.open_cal1)
        back_button.clicked.connect(self.back_clicked)
        calender_button2 = QPushButton('Cal')
        calender_button2.clicked.connect(self.open_cal2)
        calender_button3 = QPushButton('Cal')
        calender_button3.clicked.connect(self.open_cal3)
        calender_button4 = QPushButton('Cal')
        calender_button4.clicked.connect(self.open_cal4)


        vbox = QVBoxLayout()
        row1 = QHBoxLayout()
        row2 = QHBoxLayout()
        row3 = QHBoxLayout()
        row4 = QHBoxLayout()
        row1.addWidget(QLabel('Movie Name'))
        row1.addWidget(self.movie_name)
        row1.addWidget(QLabel('Movie Duration'))
        row1.addWidget(self.movie_duration_start)
        row1.addWidget(QLabel('-'))
        row1.addWidget(self.movie_duration_end)

        row2.addWidget(QLabel('Movie Release Date'))
        row2.addWidget(self.rel_start)
        row2.addWidget(calender_button1)
        row2.addWidget(QLabel('-'))
        row2.addWidget(self.rel_end)
        row2.addWidget(calender_button2)

        row3.addWidget(QLabel('Movie Play Date'))
        row3.addWidget(self.play_start)
        row3.addWidget(calender_button3)
        row3.addWidget(QLabel('-'))
        row3.addWidget(self.play_end)
        row3.addWidget(calender_button4)

        row4.addWidget(QRadioButton())
        row4.addWidget(QLabel('Only Include Not Played Movies'))

        filter_button = QPushButton('Filter')
        filter_button.clicked.connect(self.filter_clicked)
        filter_button.setDefault(True)

        connection = UI.connection
        cursor = connection.cursor()
        query = 'SELECT * FROM Movie where movName LIKE %s and duration between %s and %s' \
                ' and movReleaseDate between %s and %s;'
        cursor.execute(query,
                       [f'%{entered_movie_name}%',
                       entered_movie_duration[0],
                       entered_movie_duration[1],
                       entered_movie_rel_date[0],
                        entered_movie_rel_date[1]])
        movies = cursor.fetchall()

        # query = 'SELECT * FROM Manager where username = %s'
        # user = UI.functionality_delegator.manage
        # print(user)
        # cursor.execute(query, user)
        # manager = cursor.fetchone()
        # company = manager['companyName']
        # theater = manager['theaterName']


        release_date = []
        names = []
        duration = []
        for movie in movies:
            release_date.append(movie['movReleaseDate'])
            names.append(movie['movName'])
            duration.append(movie['duration'])
        model = QStandardItemModel()
        model.setHorizontalHeaderLabels(['Movie Name', 'Duration', 'Release Date', 'Play Date'])
        for i in range(len(movies)):
            model.appendRow([QStandardItem(names[i]), QStandardItem(duration[i]), QStandardItem(str(release_date[i]))])

        table = QTableView()
        table.setModel(model)


        vbox.addItem(row1)
        vbox.addItem(row2)
        vbox.addItem(row3)
        vbox.addItem(row4)
        vbox.addWidget(filter_button)
        vbox.addWidget(table)
        vbox.addWidget(back_button)
        self.setLayout(vbox)

    def back_clicked(self):
        self.close()
        self.back_screen.exec_()

    def open_cal1(self):
        cal = myCal1(self.back_screen, self)
        cal.exec_()

    def open_cal2(self):
        cal = myCal2(self.back_screen, self)
        cal.exec_()

    def open_cal3(self):
        cal = myCal3(self.back_screen, self)
        cal.exec_()

    def open_cal4(self):
        cal = myCal4(self.back_screen, self)
        cal.exec_()

    def filter_clicked(self):
        self.close()
        if self.movie_duration_start.text() != '':
            dur_start = int(self.movie_duration_start.text())
        else:
            dur_start = 0
        if self.movie_duration_end.text() != '':
            dur_end = int(self.movie_duration_end.text())
        else:
            dur_end = 1000000
        if self.rel_start.text() == '':
            self.rel_start.setText('1500-01-01')
        if self.rel_end.text() == '':
            self.rel_end.setText(date.today().__str__())

        theater_over = theater_overview(self.back_screen,
                                        entered_movie_name=self.movie_name.text(),
                                        entered_movie_duration=[dur_start, dur_end],
                                        entered_movie_rel_date=[self.rel_start.text(), self.rel_end.text()])
        theater_over.exec_()


class myCal1(QDialog):
    def __init__(self, man_screen, closed_screen):
        super(myCal1, self).__init__()
        self.last_screen = man_screen
        self.closed_screen = closed_screen
        self.cal = QCalendarWidget(self)
        self.cal.setGridVisible(True)
        self.cal.clicked.connect(self.showDate)

        self.calendarWindow = QWidget()
        hbox = QHBoxLayout()
        hbox.addWidget(self.cal)
        self.setLayout(hbox)
        self.setWindowTitle("Calender Selection")

    def showDate(self):
        self.date = self.cal.selectedDate()
        self.selection = self.date.toString("yyyy/MM/dd")
        self.closed_screen.rel_start.setText(self.selection)
        self.close()

class myCal2(QDialog):
    def __init__(self, man_screen, closed_screen):
        super(myCal2, self).__init__()
        self.last_screen = man_screen
        self.closed_screen = closed_screen
        self.cal = QCalendarWidget(self)
        self.cal.setGridVisible(True)
        self.cal.clicked.connect(self.showDate)

        self.calendarWindow = QWidget()
        hbox = QHBoxLayout()
        hbox.addWidget(self.cal)
        self.setLayout(hbox)
        self.setWindowTitle("Calender Selection")

    def showDate(self):
        self.date = self.cal.selectedDate()
        self.selection = self.date.toString("yyyy/MM/dd")
        self.closed_screen.rel_end.setText(self.selection)
        self.close()

class myCal3(QDialog):
    def __init__(self, man_screen, closed_screen):
        super(myCal3, self).__init__()
        self.last_screen = man_screen
        self.closed_screen = closed_screen
        self.cal = QCalendarWidget(self)
        self.cal.setGridVisible(True)
        self.cal.clicked.connect(self.showDate)

        self.calendarWindow = QWidget()
        hbox = QHBoxLayout()
        hbox.addWidget(self.cal)
        self.setLayout(hbox)
        self.setWindowTitle("Calender Selection")

    def showDate(self):
        self.date = self.cal.selectedDate()
        self.selection = self.date.toString("yyyy/MM/dd")
        self.closed_screen.play_start.setText(self.selection)
        self.close()

class myCal4(QDialog):
    def __init__(self, man_screen, closed_screen):
        super(myCal4, self).__init__()
        self.last_screen = man_screen
        self.closed_screen = closed_screen
        self.cal = QCalendarWidget(self)
        self.cal.setGridVisible(True)
        self.cal.clicked.connect(self.showDate)

        self.calendarWindow = QWidget()
        hbox = QHBoxLayout()
        hbox.addWidget(self.cal)
        self.setLayout(hbox)
        self.setWindowTitle("Calender Selection")

    def showDate(self):
        self.date = self.cal.selectedDate()
        self.selection = self.date.toString("yyyy/MM/dd")
        self.closed_screen.play_end.setText(self.selection)
        self.close()


class schedule_movie(QDialog):
    def __init__(self, man_screen):
        super(schedule_movie, self).__init__()
        self.setWindowTitle("Schedule Movie")
        self.back_screen = man_screen

        vbox = QVBoxLayout()
        back_button = QPushButton('Back')
        back_button.clicked.connect(self.back_clicked)

        vbox.addWidget(back_button)
        self.setLayout(vbox)


    def back_clicked(self):
        self.close()
        self.back_screen.exec_()