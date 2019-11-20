<%-- 
    Document   : update_form
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
        String database = "university";

        // Define SQL global variables
        Connection connection=null;
        Statement statement=null;
        ResultSet resultSet=null;
        String tableToConsult = "student";
        String SQLUser = "sa";
        String SQLPassword = "reallyStrongPwd123";
        String SQLDatabase = "students";
        int loginTimeout = 30;
        String connectionUrl = String.format("jdbc:sqlserver://localhost:1433; DatabaseName=%s; user=%s; password=%s; loginTimeout=%s",
                SQLDatabase, SQLUser, SQLPassword, loginTimeout); // for SQL Server
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
                 You can update a register by the <strong>StudentID</strong>, to get it go to "Show data" tab
             </div>
        </div>
      </div>
       <!-- Form row -->
       <div class="form-row">
           <!--StudentID input-->
           <div class="col-md-8 mb-3">
             <div class="input-group">
               <div class="input-group-prepend">
                 <span class="input-group-text" id="StudentID">StudentID</span>
               </div>
               <input type="text" class="form-control" id="StudentID" placeholder="ID" name="StudentID" aria-describedby="StudentID" required>
             </div>
           </div>
        </div>
        <!-- Form row -->
      <div class="form-row">
          <!--StudentName checkbox -->
        <div class="col-md-8 mb-3">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <div class="input-group-text">
                  <input type="checkbox" name="StudentNameCheckBox"> 
                </div>
              </div>
              <input type="text" class="form-control" placeholder="Name" name="StudentNameInput">
            </div>
          </div>       
      </div>
        <!-- Form row -->
      <div class="form-row">
          <!--StudentLastName checkbox -->
        <div class="col-md-8 mb-3">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <div class="input-group-text">
                  <input type="checkbox" name="StudentLastNameCheckBox"> 
                </div>
              </div>
              <input type="text" class="form-control" placeholder="Last name" name="StudentLastNameInput">
            </div>
          </div>       
      </div>
        <!-- Form row -->
      <div class="form-row">
          <!--StudentEmail checkbox -->
        <div class="col-md-8 mb-3">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <div class="input-group-text">
                  <input type="checkbox" name="StudentEmailCheckBox"> 
                </div>
              </div>
              <input type="text" class="form-control" placeholder="Email" name="StudentEmailInput">
            </div>
          </div>       
      </div>
        <!-- Form row -->
      <div class="form-row">
          <!--StudentCareer checkbox -->
        <div class="col-md-8 mb-3">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <div class="input-group-text">
                    <!-- Set to value=1 to catch when POST this form -->
                  <input type="checkbox" name="StudentCareerCheckBox" value="1"> 
                </div>
              </div>
                <select class="custom-select" id="career" name="StudentCareerInput">
                  <option selected value="">Career...</option>
                    <!-- Insert careers into list-box from the database-->
                    <%
                            try {
                                // Declare the driver
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // for SQL Server (driver=mssql-jdbc-7.4.1.jre8.jar)
                                // Make a connection with the database
                                connection=DriverManager.getConnection(connectionUrl);
                                statement = connection.createStatement();
                                resultSet = statement.executeQuery("SELECT * FROM careers;");

                                while(resultSet.next()){
                                    String StudentCareer = resultSet.getString("CareerName");
                                %>
                                    <option value="<%=StudentCareer%>"><%=StudentCareer%></option>
                                <% }
                            } 
                                catch(Exception e) { %>
                                    <!-- Show an alert -->
                                    <div class="alert alert-danger alert-dismissible">
                                      <button type="button" class="close" data-dismiss="alert">&times;</button>
                                      <strong>Error!</strong>  Could not insert careers into listbox from the database due to:  <%=e%>
                                    </div>
                           <% } %>
                </select>
            </div>
          </div>       
      </div>
        <!-- Form row -->
      <div class="form-row">
          <!--StudentClass checkbox -->
        <div class="col-md-8 mb-3">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <div class="input-group-text">
                  <input type="checkbox" name="StudentClassCheckBox" value="1"> 
                </div>
              </div>
                <select class="custom-select" id="class" name="StudentClassInput">
                  <option selected value="">Class...</option>
                    <!-- Insert class into listbox from the database-->
                    <%
                        // Define variables
                        connection=null;
                        statement=null;
                        resultSet=null;

                            try {
                                // Declare the driver
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // for SQL Server (driver=mssql-jdbc-7.4.1.jre8.jar)
                                // Make a connection with the database
                                connection=DriverManager.getConnection(connectionUrl);
                                statement = connection.createStatement();
                                resultSet = statement.executeQuery("SELECT ClassName FROM class;");

                                while(resultSet.next()){
                                    String StudentClass = resultSet.getString("ClassName");
                                %>
                                    <option value="<%=StudentClass%>"><%=StudentClass%></option>
                                <% }
                            } 
                                catch(Exception e) { %>
                                    <!-- Show an alert -->
                                    <div class="alert alert-danger alert-dismissible">
                                      <button type="button" class="close" data-dismiss="alert">&times;</button>
                                      <strong>Error!</strong>  Could not insert class into list-box from the database due to:  <%=e%>
                                    </div>
                           <% } %>
                </select>
            </div>
          </div>       
      </div>
        <!-- Submit button -->
      <button class="btn btn-primary" type="submit" name="buttonUpdatetStudent" value="InsertStudent">Submit form</button>
    </form>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>