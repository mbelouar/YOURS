package com.yours.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

@WebServlet("/error")
public class ErrorHandlerServlet extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Récupérer les informations d'erreur
        Integer statusCode = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
        String errorMessage = (String) request.getAttribute("jakarta.servlet.error.message");
        Throwable throwable = (Throwable) request.getAttribute("jakarta.servlet.error.exception");
        String requestUri = (String) request.getAttribute("jakarta.servlet.error.request_uri");
        
        // Si pas d'erreur spécifique, vérifier les attributs personnalisés
        if (statusCode == null) {
            statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
            errorMessage = (String) request.getAttribute("javax.servlet.error.message");
            throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
            requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
        }
        
        // Définir les attributs pour la JSP
        if (statusCode != null) {
            request.setAttribute("statusCode", statusCode);
        } else {
            request.setAttribute("statusCode", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        
        if (errorMessage == null && throwable != null) {
            errorMessage = throwable.getMessage();
        }
        
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
        }
        
        if (throwable != null) {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            throwable.printStackTrace(pw);
            request.setAttribute("stackTrace", sw.toString());
        }
        
        if (requestUri != null) {
            request.setAttribute("requestUri", requestUri);
        }
        
        // Transférer à la page d'erreur
        request.getRequestDispatcher("/pages/error.jsp").forward(request, response);
    }
}
