<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body color="powder blue">

<form action="createemp" method="post">
    <table align="center" border="1" cellpadding="10">

        <tr>
            <td colspan="2" align="center">
                <h2>Register Employee</h2>
            </td>
        </tr>

        <tr>
            <td>Emp Id</td>
            <td>
                <input type="text" name="empId" />
            </td>
        </tr>

        <tr>
            <td>Name</td>
            <td>
                <input type="text" name="empName" />
            </td>
        </tr>

        <tr>
            <td>Email Id</td>
            <td>
                <input type="text" name="empEmail" />
            </td>
        </tr>

        <tr>
            <td>Contact No</td>
            <td>
                 <input type="long" name="contactNo" />
            </td>
        </tr>

        <tr>
             <td>City</td>
             <td>
                  <input type="text" name="empCity" />
             </td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Register" />
            </td>
        </tr>

    </table>
</form>

</body>
</html>