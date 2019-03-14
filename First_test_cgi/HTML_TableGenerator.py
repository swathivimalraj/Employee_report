import HTML
class CreateHTMLTable:
    def createHTML(self,table_data,headers):
        htmlcode = HTML.table(table_data,header_row =headers)
        return htmlcode