<%-- 
    Document   : delete_form
    Created on : Mar 13, 2019, 1:37:08 AM
    Author     : hiperezr
--%>
<%@page import="java.sql.*"%>
<%@ page import = "java.io.*, java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <%
        // Define global variables
    %>
  </head>
  <body>
     <!-- Form -->
    <form method="POST">
        <!-- Form row -->
      <div class="form-row">
        <!--StudentID collapsible help -->
        <div class="col-md-8 mb-3">
        <a href="#StudentIDCollapsible" class="btn btn-info" data-toggle="collapse">Help</a>
         <div id="StudentIDCollapsible" class="collapse">
             You can delete a register by the <strong>StudentID</strong>, to get it go to "Show data" tab
         </div>
        </div>
      </div>
       <!-- Form row -->
       <div class="form-row">
           <!--StudentID input-->
           <div class="col-md-8 mb-3">
             <div class="input-group">
               <div class="input-group-prepend">
                 <span class="input-group-text" id="deleteStudentID">StudentID</span>
               </div>
               <input type="text" class="form-control" id="deleteStudentID" placeholder="ID" name="deleteStudentID" aria-describedby="deleteStudentID" required>
             </div>
           </div>
        </div>
        <!-- Submit button -->
      <button class="btn btn-danger" type="submit" name="buttonDeletetStudent" value="deletetStudent">Delete user</button>
    </form>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>