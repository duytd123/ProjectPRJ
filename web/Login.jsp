<%-- 
    Document   : Login
    Created on : Mar 05, 2024, 11:17:30 PM
    Author     : badao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Login Form</title>
    </head>
    <body>
        <div id="logreg-forms">
            <form class="form-signin" action="login" method="post">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign in</h1>
                <%
                if(request.getAttribute("error")!=null){
                String er = (String)request.getAttribute("error");
                %>
                <div class="error-message">
                    <h3><%= er %></h3>
                </div>
                <%
                    }
                %>
                <%
                if(request.getAttribute("annouce")!=null){
                String ann = (String) request.getAttribute("annouce");
                %>
                <div>
                    <h3 style="color: greenyellow"><%= ann %></h3>
                </div>
                <%
                    }
                %>

                <%
                    String uname= "", pass="", reme="";
                    Cookie[] cookies = request.getCookies();
                    if(cookies != null){
                       for(Cookie cook: cookies){
                            if(cook.getName().equals("cookname")){
                                uname = cook.getValue();
                            }
                            else if(cook.getName().equals("cookpass")){
                                pass = cook.getValue();
                            }
                            else if(cook.getName().equals("cookremember")){
                                reme = cook.getValue();
                            }
                      }
                    }
                %>

                <input name="user"  type="text" id="inputEmail" class="form-control" placeholder="Username" required="" autofocus="">
                <input name="pass"  type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
                <div class="form-group form-check">
                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Remember me</label>
                </div>
                <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Sign in</button>
            </form>
            <form action="signup" method="get">
                <input class="btn btn-success btn-block" type="submit" value="Register">
            </form>
            <br>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function toggleResetPswd(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle() 
                $('#logreg-forms .form-reset').toggle() 
            }

            function toggleSignUp(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle(); 
                $('#logreg-forms .form-signup').toggle(); 
            }

            $(() => {
                $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                $('#logreg-forms #btn-signup').click(toggleSignUp);
                $('#logreg-forms #cancel_signup').click(toggleSignUp);
            })
        </script>
        <style>
            .error-message {
                background-color: #ffcccc; 
                border: 1px solid #ff0000; 
                padding: 10px; 
                margin-bottom: 10px; 
                font-size: 15px;
            }
        </style>
    </body>
</html>