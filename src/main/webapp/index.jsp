<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Monthly Installment Calculator</title>
    <script>
        function resetForm() {
            document.getElementsByName("loanAmount")[0].value = "0.00";
            document.getElementsByName("interestRate")[0].value = "2.6";
            document.getElementsByName("years")[0].value = "0";
            document.getElementsByName("months")[0].value = "0";
            document.getElementsByName("monthlyInstallment")[0].value = "";
        }
    </script>
</head>
<body>
    <h2>Loan Monthly Installment Calculator</h2>
    <form action="calculate" method="post">
        Loan Amount: 
        <input type="text" name="loanAmount" 
               value="<%= request.getParameter("loanAmount") != null ? request.getParameter("loanAmount") : "0.00" %>" 
               required><br><br>

        Interest Rate (% per annum): 
        <input type="text" name="interestRate" 
               value="<%= request.getParameter("interestRate") != null ? request.getParameter("interestRate") : "2.6" %>" 
               required><br><br>

        Repayment Period: <br>
        Years: <input type="text" name="years" 
               value="<%= request.getParameter("years") != null ? request.getParameter("years") : "0" %>" 
               required>
        Months: <input type="text" name="months" 
               value="<%= request.getParameter("months") != null ? request.getParameter("months") : "0" %>" 
               required><br><br>

        Monthly Installment: 
        <input type="text" name="monthlyInstallment" 
               value="<%= request.getAttribute("emi") != null ? request.getAttribute("emi") : "" %>" 
               readonly><br><br>

        <input type="submit" value="CALCULATE">
        <input type="button" value="RESET" onclick="resetForm()">
    </form>
</body>
</html>
