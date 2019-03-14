#!C:\Python27\python.exe
import cgi


def HTMLTop():
    print ("""Content-type:text/html\n\n
            <?DOCTYPE html>
            <html lang="en">
                <head>
                        <meta charset="utf-8"/>
                        <title>FIrst CGI TEST</tile>
                </head>
                <body>""")

def HTMLTail():
    print("""</body>
            </html>""")

if __name__=="__main__":
    try:
        HTMlTop()
        print "GOPI TEST"
        HTMLTail()
    except:
        cgi.print_exception()



#!C:\Python27\python.exe
print "Content-type:text/html\r\n\r\n"
print '<html>'
print '<head>'
print '<title>Hello Word - First CGI Program</title>'
print '</head>'
print '<body>'
print '<h2>Hello Word! This is my first CGI program</h2>'
print '</body>'
print '</html>'