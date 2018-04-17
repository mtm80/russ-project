import pandas as pd

df = pd.read_csv('../analysis/topic-docs.csv', sep='\t')
df_width = df.shape[1]

def convert_row(row):
	body = """<id>%s</id>
		  <path>%s</path>""" % (row[0], row[1])
	for i in range(2, df_width):
		body += "<topic num='%d'>%s</topic>" % (i - 2, row[i])
	return """<doc>
			%s
	          </doc>
		""" % (body)

print("<docs>%s</docx>" % ('\n'.join(df.apply(convert_row, axis=1))))
