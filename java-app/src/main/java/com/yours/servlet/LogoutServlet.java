package com.yours.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.logging.Logger;

/**
 * Servlet for handling user logout
 * Invalidates user session and redirects to login page
 */
public class LogoutServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LogoutServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleLogout(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleLogout(request, response);
    }

    /**
     * Handle logout process
     * 
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     */
    private void handleLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null) {
            String clientEmail = (String) session.getAttribute("clientEmail");

            // Invalidate session
            session.invalidate();

            if (clientEmail != null) {
                logger.info("Client logged out successfully: " + clientEmail);
            } else {
                logger.info("Anonymous user session invalidated");
            }
        }

        // Redirect to login page with logout message
        response.sendRedirect(request.getContextPath() + "/pages/auth/login.jsp?logout=success");
    }
}
