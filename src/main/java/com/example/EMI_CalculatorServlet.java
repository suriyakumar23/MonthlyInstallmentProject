package com.example;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class EMI_CalculatorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            double loanAmount = Double.parseDouble(request.getParameter("loanAmount"));
            double interestRate = Double.parseDouble(request.getParameter("interestRate"));
            int years = Integer.parseInt(request.getParameter("years"));
            int months = Integer.parseInt(request.getParameter("months"));

            int totalMonths = (years * 12) + months;
            double monthlyInterest = interestRate / (12 * 100);

            double emi;
            if (monthlyInterest == 0) {
                emi = loanAmount / totalMonths;
            } else {
                emi = loanAmount * (monthlyInterest / 
                        (1 - Math.pow(1 + monthlyInterest, -totalMonths)));
            }

            request.setAttribute("emi", String.format("%.2f", emi));
        } catch (Exception e) {
            request.setAttribute("emi", "Invalid input!");
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
