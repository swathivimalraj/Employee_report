# import  Queries_FileHandling as QF
# print QF.Query_Extractor().list_Of_SQL_cmds('queries.sql')
# #!C:\Python27\python.exe
# import cgi
# import DatabaseQuerying as DQ
# import HTML_TableGenerator as HT
# import Queries_FileHandling as QF
#
# def HTMLTop():
#     print ("""Content-type:text/html\n\n
#             <?DOCTYPE html>
#             <html lang="en">
#                 <head>
#                         <meta charset="utf-8"/>
#                         <title>Employee Report</title>
#                 </head>
#                 <body>""")
#
# def HtmBody():
#     q="""select e.emp_no,e.first_name,e.email_id,s.salary,pe.from_date,pe.to_date,d.designation,p.proj_name
#     from employees e join proj_emp pe on pe.emp_no=e.emp_no
#     join designation d on e.emp_no=d.emp_no and d.from_date between pe.from_date and pe.to_date and e.emp_no=10088
#     join salaries s on s.from_date between pe.from_date and pe.to_date
#     join projects p on p.proj_no=pe.proj_no
#     where s.emp_no=10088 GROUP BY d.designation;"""
#     lst=DQ.Database_Connection().query(q)
#     htmcode=HT.CreateHTMLTable().createHTML(lst)
#     QF.Query_Extractor().writeToFile('obne.html',htmcode)
#
#
# def HTMLTail():
#     print("""</body>
#             </html>""")
#
# if __name__=="__main__":
#     try:
#         HTMLTop()
#
#
#
#         HTMLTail()
#     except:
#         cgi.print_exception()



import DatabaseQuerying as DQ
import HTML_TableGenerator as HT
import Queries_FileHandling as QF
import Database_Query_Fetch as DF
tdict=DF.DBQuery_Extractor().fetch_Query('queries1.sql')







