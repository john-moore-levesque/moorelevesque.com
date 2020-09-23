#!/usr/local/bin/python
import MySQLdb as mysql
import os
from sys import exit

DATABASE = {
    "SQL_USER": os.environ.get("SQL_USER"),
    "SQL_DATABASE": os.environ.get("SQL_NAME"),
    "SQL_PASSWORD": os.environ.get("SQL_PASS"),
    "SQL_HOST": os.environ.get("SQL_HOST")
}


def testConn():
    conn = mysql.Connect(
        host=DATABASE["SQL_HOST"],
        user=DATABASE["SQL_USER"],
        passwd=DATABASE["SQL_PASSWORD"],
        db=DATABASE["SQL_DATABASE"]
    )
    cur = conn.cursor()
    try:
        cur.execute("SELECT * FROM django_site")
    except mysql._exceptions.ProgrammingError:
        return False
    if cur.fetchall():
        return True
    return False


if __name__ == "__main__":
    if testConn():
        exit(0)
    else:
        exit(1)
