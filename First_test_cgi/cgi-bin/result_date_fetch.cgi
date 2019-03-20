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
                        <title>Result Query Report</title>
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
    get_option=formData.getvalue('result_set')
    query_dict=DF.DBQuery_Extractor().fetch_Query('queries1.sql')
    data_list,header_list=DQ.Database_Connection().query_data(query_dict[get_option.lower()])
    htmcode=HT.CreateHTMLTable().createHTML(data_list,header_list)
    print "<h3>"+get_option.upper()+"</h3>"
    print htmcode


def HTMLTail():
    print("""
        </body>
        </html>""")

if __name__=="__main__":
    try:
        HTMLTop()
        HtmBody()
        HTMLTail()
    except:
        cgi.print_exception()