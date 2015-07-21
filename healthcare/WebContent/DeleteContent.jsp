
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Add Contents</title>
    </head>
    <body>
          
             <h3>File Delete:</h3>
           
            <form action="DeleteServlet" method="post" onsubmit="sendurl()">
                Select a file to delete: <br />
                        <input type="file" name="file" size="50" class="f"/>
                    <br />
                <input type="submit" value="Delete File" data-inine="true" class="f"/>
                </form>
    </body>
</html>

