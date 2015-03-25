<%-- 
    Document   : creatAccount
    Created on : Mar 17, 2015, 9:13:58 AM
    Author     : Apollo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>

        <h1>Create new account</h1>

        <form name="mform" method="POST" action="checkNewAccount.jsp" onsubmit="return isValid();">
            <table>
                <tr>
                    <td>User name: </td>
                    <td><input type="text" name="txtUsername" value="" /></td>
                    <td><font color="red"><label id ="lblName"></label></font></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="password" name="txtPassword" value="" /></td>
                    <td><font color="red"><label id ="lblPassword"></label></font></td>
                </tr>
                <tr>
                    <td>Re-Password: </td>
                    <td><input type="password" name="txtRePassword" value="" /></td>
                    <td><font color="red"><label id ="lblRePassword"></label></font></td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td><input type="text" name="txtEmail" value="" /></td>
                    <td><font color="red"><label id ="lblEmail"></label></font></td>
                </tr>
                <tr>
                    <td><input type="button" value="Back" name="btnBack" onclick="window.location='./home.jsp'"/></td>
                    <td><input type="submit" value="Create Account" name="btnCreate" /></td>
                    <td><input type="reset" value="Clear" name="btnClear"/></td>
                </tr>
            </table>            
        </form>
    </center>


</body>
</html>

<script type="text/javascript">
            function isValid() {
                reset();
                if (isEmptyName() === false && isEmptyPassword() === false && confirmPassword() === true
                        && isEmptyEmail() === false && validateEmail() === true)
                    return true;
                else
                    return false;
            }

            function isEmptyName() {
                n = mform.txtUsername.value;
                if (n === "" || n === " ") {
                    document.getElementById("lblName").innerHTML = "Username can not be empty";
                    mform.txtUsername.focus();
                    return true;
                }
                return false;
            }

            function isEmptyPassword() {
                n = mform.txtPassword.value;
                if (n === "" || n === " ") {
                    document.getElementById("lblPassword").innerHTML = "Password can not be empty";
                    mform.txtPassword.focus();
                    return true;
                }
                return false;
            }

            function confirmPassword() {
                p = mform.txtPassword.value;
                rp = mform.txtRePassword.value;
                if (p !== rp) {
                    //alert
                    document.getElementById("lblRePassword").innerHTML = "Password is not matched";
                    mform.txtRePassword.focus();
                    return false;
                }
                return true;
            }

            function isEmptyEmail() {
                n = mform.txtEmail.value;
                if (n === "" || n === " ") {
                    document.getElementById("lblEmail").innerHTML = "Email can not be empty";
                    mform.txtEmail.focus();
                    return true;
                }
                return false;
            }

            function validateEmail() {
                email = mform.txtEmail.value;
                //String re is Regular expression of an email
                re = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (re.test(email)===false) {
                    document.getElementById("lblEmail").innerHTML = "This is not an email";
                    mform.txtEmail.focus();
                    return false;
                }
                return true;
            }

            function reset() {
                document.getElementById("lblName").innerHTML = "";
                document.getElementById("lblPassword").innerHTML = "";
                document.getElementById("lblRePassword").innerHTML = "";
                document.getElementById("lblEmail").innerHTML = "";
            }
</script>
