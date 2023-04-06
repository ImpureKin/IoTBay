<%-- 
    Document   : Login Fail Page
    Created on : 28 Mar 2023, 6:38:18 pm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
        .container {
          height: 700px;
          position: relative;
          border: 3px solid black;
        }

        .titlecenter {
          margin: 0;
          position: absolute;
          top: 30%;
          left: 50%;
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
        }
        
        .textcenter {
          height: 80px;
          margin: 0;
          position: absolute;
          top: 30%;
          left: 50%;
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
        }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Failed</title>
    </head>
    <body>
        <div class="container">
            <div class="textcenter">
                <h1>Login Failed! Make sure to use the right credentials</h1><br><br><br>
                <h2>
                    <a href="index.jsp">Return to home</a>
                </h2>
            </div>
        </div>
    </body>
</html>
