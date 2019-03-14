#!C:\Python27\python.exe
import cgi
import cgitb
cgitb.enable()
import DatabaseQuerying as DQ
import HTML_TableGenerator as HT
import Queries_FileHandling as QF
import Database_Query_Fetch as DF

def HTMLTop():
    print ("""Content-type:text/html\n\n
            <?DOCTYPE html>
            <html lang="en">
                <head>
                        <meta charset="utf-8"/>
                        <title>Employee Report</title>
                        <style>
                            h3
                            {
                            text-align: center;
                            }
                            button
                            {
                                margin:auto;
                                display:block;
                            }


                        </style>
                </head>
                <body>""")

def HtmBody():
    formData=cgi.FieldStorage()
    emp_no=formData.getvalue('emp_no')
    field_select=formData.getvalue('salary_details')+" History"
    query_dict=DF.DBQuery_Extractor().fetch_Query('queries1.sql')
    sql_query=DF.DBQuery_Extractor().named_query(query_dict[field_select.lower()],emp_no)
    data_list,header_list=DQ.Database_Connection().query_data(sql_query)
    htmcode=HT.CreateHTMLTable().createHTML(data_list,header_list)
    print "<h3>"+field_select+" for employee_num "+emp_no+"</h3>"
    print htmcode



def HTMLTail():
    print("""
        <br><br><a href="Emp_index.html" style="text-decoration: none"><button>Back</button></a>
        </body>
        </html>""")

if __name__=="__main__":
    try:
        HTMLTop()
        HtmBody()
        HTMLTail()
    except:
        cgi.print_exception()
