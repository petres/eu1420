#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import os.path
import csv
from converters import *

def convert_xsl(filepath):
	workbook = xlrd.open_workbook(filepath)
	all_worksheets = workbook.sheet_names()
	worksheet_index = 0
	for worksheet_name in all_worksheets:
		worksheet_index +=1
		all_data = []
		worksheet = workbook.sheet_by_name(worksheet_name)

		prev_row = [None for i in range(worksheet.ncols)]
		for row_index in range(worksheet.nrows):
			row= []
			for col_index in range(worksheet.ncols):
				value = worksheet.cell(rowx=row_index,colx=col_index).value
				if len(str(value)) == 0:
					value = prev_row[col_index]
				row.append(value)
			prev_row = row
			all_data.append(row)

		with open(''.join([filepath,'_',str(worksheet_name),'_',str(worksheet_index),'.csv']),'w+') as f:
			for row in all_data:
				dw = csv.writer(f)
				dw.writerow(row)
alls = 0
successfulls = 0
for dirpath, dirnames, filenames in os.walk("./data/source/"):
	for filename in [f for f in filenames]:
			extension = filename.split('.')[-1]
			if extension in ['xls', 'xlsx']:
				alls += 1
				print(os.path.join(dirpath, filename))
				try:
					convert_xsl(dirpath, filename)
					successfulls +=1
				except Exception as e:
					print(e)
			elif extension in ['zip']:
				print('Bypassing .zip file')
			elif extension in ['csv']:
				print('CSV file needs to be moved')
			elif extension in ['xml']:
				print('XML needs to be parsed')
			elif extension in ['ods']:
				print('ods needs to be parsed')
			elif extension in ['DS_Store']:
				pass
			else:
				print('WHAT THE FUCK IS THIS? '+str(extension))


print(alls)
print(successfulls)