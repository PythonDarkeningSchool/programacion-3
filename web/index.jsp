<%-- 
    Document   : index
    Created on : Nov 19, 2019, 1:15:57 PM
    Author     : hiperezr
--%>

<%@page import="java.sql.*"%>
<%@ page import = "java.io.*, java.util.*" %>
<%@ page import = "java.sql.Connection, java.sql.DriverManager, java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
    <title>Database</title>

    <!-- w3 include (for imports) -->
    <script src="https://www.w3schools.com/lib/w3data.js"></script>

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
  <body background="img/w2.jpg">
    <div class="container">
        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link " id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="false">Home</a>
                <a class="nav-item nav-link" id="nav-insert-tab" data-toggle="tab" href="#nav-insert" role="tab" aria-controls="nav-insert" aria-selected="false">Insert</a>
                <a class="nav-item nav-link" id="nav-delete-tab" data-toggle="tab" href="#nav-delete" role="tab" aria-controls="nav-delete" aria-selected="false">Delete</a>
                <a class="nav-item nav-link" id="nav-update-tab" data-toggle="tab" href="#nav-update" role="tab" aria-controls="nav-update" aria-selected="false">Update</a>
                <a class="nav-item nav-link" id="nav-show-data-tab" data-toggle="tab" href="#nav-show-data" role="tab" aria-controls="nav-show-data" aria-selected="false">Show data</a>
                <a class="nav-item nav-link" id="nav-admin-tab" data-toggle="tab" href="#nav-admin" role="tab" aria-controls="nav-admin" aria-selected="false">Admin</a>
            </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">
            <!-- Home tab -->
            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                <div class="container">
                    <!-- Show total registers in the database in a badge-->
                    <%
                        try {
                            // Reference page: https://docs.microsoft.com/en-us/sql/connect/jdbc/step-3-proof-of-concept-connecting-to-sql-using-java?view=sql-server-ver15
                            // Declare the driver
                            //Class.forName("com.mysql.jdbc.Driver"); // for mySQL (driver=mysql-connector-java-5.1.23-bin.jar)
                            /*String connectionUrl =
                                    "jdbc:sqlserver://localhost:1433;"
                                            + "DatabaseName=students;"
                                            + "user=sa;"
                                            + "password=reallyStrongPwd123;"
                                            + "encrypt=true;"
                                            + "trustServerCertificate=false;"
                                            + "loginTimeout=30;"; */ // for mySQL

                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // for SQL Server (driver=mssql-jdbc-7.4.1.jre8.jar)
                            // Make a connection with the database
                            connection = DriverManager.getConnection(connectionUrl);

                            statement = connection.createStatement();
                            resultSet = statement.executeQuery(String.format("SELECT COUNT(*) FROM %s;", tableToConsult));
                            resultSet.next(); // moving forward the pointer
                            int numberOfRegisters = resultSet.getInt(1);
                             %>
                        <!-- Show how many registers are in the database from students table -->
                        <br>
                        <div class="col-md-3 mb-3">
                            <button type="button" class="btn btn-info">
                              Registers in the database <span class="badge badge-light"> <%=numberOfRegisters%></span>
                            </button>
                        </div>
                    <%} catch(Exception e) { %>
                        <!-- Show an alert -->
                        <div class="alert alert-danger alert-dismissible">
                          <button type="button" class="close" data-dismiss="alert">&times;</button>
                          <strong>Error!</strong>  Could  not perform a query in the database due to:  <%=e%>
                        </div>
                   <% } %>

                  <h2>University database</h2>
                  <p>Handled the database from here</p>
                  <img src="img/database_icon.png" class="rounded" width="304" height="236">
                </div>
            </div>
            <!-- Insert tab -->
            <div class="tab-pane fade" id="nav-insert" role="tabpanel" aria-labelledby="nav-profile-tab">
                <br>
                <div w3-include-html="tabs/insert/insert_modal.jsp"></div>
                  <!-- Submit button validation for insert tab  form -->
                    <%
                        if ( request.getParameter("buttonInsertStudent") != null  ) {
                            // Get values from the form
                            String student_firstname = request.getParameter("student_firstname");
                            String student_lastname = request.getParameter("student_lastname");
                            String student_email = request.getParameter("student_email");
                            String student_career = request.getParameter("student_career");
                            String student_class = request.getParameter("student_class");
                            String student_id = request.getParameter("student_id");

                            // Determine values to insert in the database according the form
                            String targetTable = "student";
                            String rows = "StudentID, StudentName, StudentLastName, StudentEmail, StudentCareer, StudentClass";
                            //String values = ( // for mySQL
                                    //String.format("\"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\" ",
                                            //student_id, student_firstname, student_lastname, student_email, student_career, student_class));
                            String values = ( // for SQLServer
                                    String.format("'%s', '%s', '%s', '%s', '%s', '%s' ",
                                            student_id, student_firstname, student_lastname, student_email, student_career, student_class));

                            // Define SQL variables
                            connection=null;
                            statement=null;
                            resultSet=null;

                            try {
                                // Declare the driver
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // for SQL Server (driver=mssql-jdbc-7.4.1.jre8.jar)
                                // Make a connection with the database
                                connection=DriverManager.getConnection(connectionUrl);
                                statement = connection.createStatement();
                                // Execute the command in SQL
                                statement.executeUpdate(
                                        String.format("INSERT INTO %s(%s) VALUES (%s)", targetTable, rows, values));
                             %>
                                <!-- Show an alert -->
                                <div class="alert alert-success alert-dismissible">
                                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                                  <strong>Success!</strong> The <%=targetTable%> "<%=String.format("%s %s", student_firstname, student_lastname)%>" was inserted correctly in the database
                                </div>
                            <%} catch(Exception e) { %>
                                <!-- Show an alert -->
                                <div class="alert alert-danger alert-dismissible">
                                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                                  <strong>Error!</strong> The <%=targetTable%> "<%=String.format("%s %s", student_firstname, student_lastname)%>" could not be inserted correctly in the database due to: <%=e%>
                                </div>
                           <% }
                        }
                    %>
            </div>
            <!-- Delete tab -->
            <div class="tab-pane fade" id="nav-delete" role="tabpanel" aria-labelledby="nav-profile-tab">
                <br>
                <div w3-include-html="tabs/delete/delete_modal.jsp"></div>
                  <!-- Submit button validation for delete tab  form -->
                    <%
                        if ( request.getParameter("buttonDeletetStudent") != null  ) {
                            // Define SQL variables
                            connection=null;
                            statement=null;
                            resultSet=null;

                            try {
                                // Declare the driver
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // for SQL Server (driver=mssql-jdbc-7.4.1.jre8.jar)
                                // Make a connection with the database
                                connection=DriverManager.getConnection(connectionUrl);
                                statement = connection.createStatement();
                            }
                            catch(Exception e) { %>
                                <!-- Show an alert -->
                                <div class="alert alert-danger alert-dismissible">
                                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                                  <strong>Error!</strong> no connection can be established with the database due to: <%=e%>
                                </div>
                           <% }

                            // Get values from the form
                            String deleteStudentID = request.getParameter("deleteStudentID");

                            // Checking if the StudentID from the input user exists on the database
                               ResultSet checkStudentIDOnTable = null;

                               try {
                                   checkStudentIDOnTable = statement != null ? statement.executeQuery(
                                           String.format("SELECT StudentID FROM student WHERE StudentID='%s'", deleteStudentID)) : null;
                               } catch (SQLException e) {
                                   e.printStackTrace();
                               }


                               System.out.println("checkStudentIDOnTable: " + checkStudentIDOnTable);
                               boolean isStudentIDOnTable = false;
                               try {
                                   isStudentIDOnTable = checkStudentIDOnTable != null && checkStudentIDOnTable.next();
                               } catch (SQLException e) {
                                   e.printStackTrace();
                               }
                               System.out.println("isStudentIDOnTable: " + isStudentIDOnTable);

                               if(isStudentIDOnTable){

                                String deleteStatement = String.format("DELETE from student WHERE StudentID='%s'", deleteStudentID);

                                try {
                                    statement.executeUpdate(deleteStatement);%>
                                        <!-- Show an alert -->
                                         <div class="alert alert-success alert-dismissible">
                                           <button type="button" class="close" data-dismiss="alert">&times;</button>
                                           <strong>Success!</strong> The StudentID <strong><%=deleteStudentID%></strong> was deleted correctly
                                         </div>
                                    <%}
                                    catch(SQLException  sql_e) { %>
                                        <!-- Show an alert -->
                                        <div class="alert alert-danger alert-dismissible">
                                          <button type="button" class="close" data-dismiss="alert">&times;</button>
                                          <strong>Error!</strong> The StudentID <strong><%=deleteStudentID%></strong> could not be deleted due to: <%=sql_e%>
                                        </div>
                                    <%
                                    }
                                }
                            else{%>
                                    <!-- Show an alert -->
                                    <div class="alert alert-danger alert-dismissible">
                                      <button type="button" class="close" data-dismiss="alert">&times;</button>
                                      <strong>Error!</strong> The StudentID: <strong><%=deleteStudentID%></strong> does not exists in database
                                    </div>
                            <%
                                }
                            }%>
            </div>
            <!-- Update tab -->
            <div class="tab-pane fade" id="nav-update" role="tabpanel" aria-labelledby="nav-profile-tab">
                <br>
                <div w3-include-html="tabs/update/update_modal.jsp"></div>
                  <!-- Submit button validation for update tab  form -->
                    <%
                        if ( request.getParameter("buttonUpdatetStudent") != null  ) {
                            // Define SQL variables
                            connection=null;
                            statement=null;
                            resultSet=null;

                            try {
                                // Declare the driver
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // for SQL Server (driver=mssql-jdbc-7.4.1.jre8.jar)
                                // Make a connection with the database
                                connection = DriverManager.getConnection(connectionUrl);
                                statement = connection.createStatement();
                            }
                            catch(Exception e) { %>
                                <!-- Show an alert -->
                                <div class="alert alert-danger alert-dismissible">
                                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                                  <strong>Error!</strong> no connection can be established with the database due to: <%=e%>
                                </div>
                           <% }

                            // Get values from the form
                            String StudentID = request.getParameter("StudentID");
                            String StudentNameInput = null;
                            String StudentNameCheckBox = request.getParameter("StudentNameCheckBox"); // null | on => values
                            String StudentLastNameInput = null;
                            String StudentLastNameCheckBox = request.getParameter("StudentLastNameCheckBox"); // null | on => values
                            String StudentEmailInput = null;
                            String StudentEmailCheckBox = request.getParameter("StudentEmailCheckBox"); // null | on => values
                            String StudentCareerInput = null;
                            String StudentCareerCheckBox = request.getParameter("StudentCareerCheckBox"); // null | on => values
                            String StudentClassInput = null;
                            String StudentClassCheckBox = request.getParameter("StudentClassCheckBox"); // null | on => values

                                // Checking if the StudentID from the input user exists on the database
                               boolean isStudentIDOnTable = false;
                               ResultSet checkStudentIDOnTable = null;
                               try {
                                    checkStudentIDOnTable = statement != null ? statement.executeQuery(
                                        "SELECT StudentID FROM student WHERE StudentID='" + StudentID + "'") : null;
                                   try {
                                       assert checkStudentIDOnTable != null;
                                       isStudentIDOnTable = checkStudentIDOnTable.next();
                                   } catch (SQLException e) {
                                       e.printStackTrace();
                                   }
                               }
                               catch(java.sql.SQLException e){
                                   e.printStackTrace();
                               }

                               if(isStudentIDOnTable){
                                    boolean updateDatabase = false;
                                    String updateStatement = "UPDATE student"; // Define the table
                                    String setStatement = " SET"; // Define the columns
                                    String whereStatement =  String.format(" WHERE StudentID=%s", StudentID); // Define the condition

                                    String valuesToUpdate = "";
                                    valuesToUpdate += updateStatement;


                                    if(StudentNameCheckBox != null){
                                        StudentNameInput = request.getParameter("StudentNameInput");
                                        setStatement += String.format(" StudentName='%s',",StudentNameInput );
                                        updateDatabase = true;
                                    }

                                    if(StudentLastNameCheckBox != null){
                                        StudentLastNameInput = request.getParameter("StudentLastNameInput");
                                        setStatement += String.format(" StudentLastName='%s',",StudentLastNameInput );
                                        updateDatabase = true;
                                    }

                                    if(StudentEmailCheckBox != null){
                                        StudentEmailInput = request.getParameter("StudentEmailInput");
                                        setStatement += String.format(" StudentEmail='%s',",StudentEmailInput );
                                        updateDatabase = true;
                                    }

                                    if(StudentCareerCheckBox != null){
                                        StudentCareerInput = request.getParameter("StudentCareerInput");
                                        setStatement += String.format(" StudentCareer='%s',",StudentCareerInput );
                                        updateDatabase = true;
                                    }

                                    if(StudentClassCheckBox != null){
                                        StudentClassInput = request.getParameter("StudentClassInput");
                                        setStatement += String.format(" StudentClass='%s',",StudentClassInput );
                                        updateDatabase = true;
                                    }

                                    if(updateDatabase) {
                                        // Remove the latest comma
                                        setStatement = setStatement.substring(0, setStatement.lastIndexOf(","));
                                        valuesToUpdate += setStatement;
                                        valuesToUpdate += whereStatement;
                                        try {
                                            statement.executeUpdate(valuesToUpdate);%>
                                                <!-- Show an alert -->
                                                 <div class="alert alert-success alert-dismissible">
                                                   <button type="button" class="close" data-dismiss="alert">&times;</button>
                                                   <strong>Success!</strong> The database was updated correctly
                                                 </div>
                                        <%}
                                        catch(SQLException  sql_e) { %>
                                            <!-- Show an alert -->
                                            <div class="alert alert-danger alert-dismissible">
                                              <button type="button" class="close" data-dismiss="alert">&times;</button>
                                              <strong>Error!</strong> Could not perform the update operation due to database access error:  <%=sql_e%>
                                            </div>
                                        <%
                                        }
                                    }
                                    else{%>
                                        <!-- Show an alert -->
                                        <div class="alert alert-warning alert-dismissible">
                                          <button type="button" class="close" data-dismiss="alert">&times;</button>
                                          <strong>Warning!</strong> There is not values to update, please fill out some of them in the form
                                        </div>
                                    <%
                                    }
                            }
                            else {%>
                                    <!-- Show an alert -->
                                    <div class="alert alert-danger alert-dismissible">
                                      <button type="button" class="close" data-dismiss="alert">&times;</button>
                                      <strong>Error!</strong> The StudentID: <strong><%=StudentID%></strong> does not exists in database
                                    </div>
                            <%}
                        } %>
            </div>
              <!-- Show data  tab -->
            <div class="tab-pane fade" id="nav-show-data" role="tabpanel" aria-labelledby="nav-show-data-tab">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <div class="container">
                        <!-- Show total registers in the database in a badge-->
                        <%
                                try {
                                    // Declare the driver
                                    //Class.forName("com.mysql.jdbc.Driver");
                                    // Make a connection with the database
                                    //connection=DriverManager.getConnection(
                                    //        String.format("jdbc:mysql://localhost:3307/%s?user=root&password=usbw", database));
                                    //statement=connection.createStatement();
                                    //resultSet = statement.executeQuery(String.format("SELECT * FROM %s;", tableToConsult));


                                    // Declare the driver
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // for SQL Server (driver=mssql-jdbc-7.4.1.jre8.jar)
                                    // Make a connection with the database
                                    connection=DriverManager.getConnection(connectionUrl);
                                    statement = connection.createStatement();
                                    resultSet = statement.executeQuery(String.format("SELECT * FROM %s;", tableToConsult));

                                    %>
                                    <!-- Define filtered table -->
                                    <div class="container mt-3">
                                      <p>Type something in the input field to search the table:</p>
                                      <input class="form-control" id="studentTableInput" type="text" placeholder="Search..">
                                      <br>
                                      <table class="table table-bordered">
                                          <!-- Table headers -->
                                        <thead>
                                          <tr>
                                            <th>StudentID</th>
                                            <th>StudentName</th>
                                            <th>StudentLastName</th>
                                            <th>StudentEmail</th>
                                            <th>StudentCareer</th>
                                            <th>StudentClass</th>
                                          </tr>
                                        </thead>
                                        <tbody id="studentTableContent">
                                    <%
                                    while(resultSet.next()){
                                        int studentID = resultSet.getInt("StudentID");
                                        String StudentName = resultSet.getString("StudentName");
                                        String StudentLastName = resultSet.getString("StudentLastName");
                                        String StudentEmail = resultSet.getString("StudentEmail");
                                        String StudentCareer = resultSet.getString("StudentCareer");
                                        String StudentClass = resultSet.getString("StudentClass");
                                    %>
                                          <tr>
                                            <td><%=studentID%></td>
                                            <td><%=StudentName%></td>
                                            <td><%=StudentLastName%></td>
                                            <td><%=StudentEmail%></td>
                                            <td><%=StudentCareer%></td>
                                            <td><%=StudentClass%></td>
                                          </tr>
                                    <% } %>
                                        </tbody>
                                      </table>
                                      </div>
                                <%
                                }
                                    catch(Exception e) { %>
                                        <!-- Show an alert -->
                                        <div class="alert alert-danger alert-dismissible">
                                          <button type="button" class="close" data-dismiss="alert">&times;</button>
                                          <strong>Error!</strong>  Could  not perform a query in the database due to:  <%=e%>
                                        </div>
                               <% } %>
                    </div>
                </div>
            </div>
            <!--Admin tab -->
            <div class="tab-pane fade" id="nav-admin" role="tabpanel" aria-labelledby="nav-admin-tab">
                <br>
                <div w3-include-html="tabs/admin/admin_cards.jsp"></div>
                    <!-- Submit button validation for insertClass/insertCareers forms -->
                    <%
                        if ( request.getParameter("buttonInsertClass") != null ||  request.getParameter("buttonInsertCareers") != null ) {
                            // Determine values to insert in the database according the form
                            String target = (request.getParameter("buttonInsertClass") != null) ? "class" : "career";
                            String targetTable = (request.getParameter("buttonInsertClass") != null) ? "class" : "careers";
                            String targeRows = (request.getParameter("buttonInsertClass") != null) ? "ClassID, ClassName" : "CareerID, CareerName";
                            String ID = (
                                    request.getParameter("buttonInsertClass") != null) ?  request.getParameter("class_id") : request.getParameter("career_id");
                            String value = (
                                    request.getParameter("buttonInsertClass") != null) ?  request.getParameter("class_name") : request.getParameter("career_name");

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

                                // st.executeUpdate("INSERT INTO usuarios(id,password,nombre) VALUES (3,'12345','Federico')");
                                statement.executeUpdate(
                                        String.format("INSERT INTO %s(%s) VALUES ('%s','%s')", targetTable, targeRows, ID,  value));
                                //request.getRequestDispatcher("inicio").forward(request, response);
                             %>
                                <!-- Show an alert -->
                                <div class="alert alert-success alert-dismissible">
                                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                                  <strong>Success!</strong> The <%=target%> "<%=value%>" was inserted correctly in the database
                                </div>
                            <%} catch(Exception e) { %>
                                <!-- Show an alert -->
                                <div class="alert alert-danger alert-dismissible">
                                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                                  <strong>Error!</strong> The <%=target%> "<%=value%>" could not be inserted correctly in the database due to: <%=e%>
                                </div>
                           <% }
                        }
                    %>
            </div>
        </div>
    </div>


    <!-- Scripts for remain in the same nav tab after an event like POST, GET, REFRESH ...etc
    Tip: delete the element "active" and set aria-selected to false
    -->
    <script>
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            var hash = $(e.target).attr('href');
            if (history.pushState) {
                history.pushState(null, null, hash);
            } else {
                location.hash = hash;
            }
        });

            var hash = window.location.hash;
            if (hash) {
                $('.nav-link[href="' + hash + '"]').tab('show');
            }
    </script>
    <!-- Script to filter the table-->
    <script>
    $(document).ready(function(){
      $("#studentTableInput").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $("#studentTableContent tr").filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
      });
    });
    </script>

    <!-- Scripts for imports HTMLs -->
    <script>
        w3IncludeHTML();
    </script>
  </body>
</html>