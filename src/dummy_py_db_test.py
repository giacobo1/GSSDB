#!/usr/bin/python

import psycopg2

conn = psycopg2.connect(database="postgres", user="postgres", password="12345", host="127.0.0.1", port="5432")

cur = conn.cursor()


#queries;

conn.commit()

cur.close()

conn.close()
