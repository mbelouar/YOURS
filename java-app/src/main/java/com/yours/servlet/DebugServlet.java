package com.yours.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/debug-session")
public class DebugServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);

        out.println("<html><head><title>Session Debug</title></head><body>");
        out.println("<h1>Session Debug Information</h1>");

        if (session == null) {
            out.println("<p><strong>No session found!</strong></p>");
        } else {
            out.println("<p><strong>Session ID:</strong> " + session.getId() + "</p>");
            out.println("<p><strong>Session Creation Time:</strong> " + session.getCreationTime() + "</p>");
            out.println("<p><strong>Session Last Accessed Time:</strong> " + session.getLastAccessedTime() + "</p>");

            out.println("<h2>Session Attributes:</h2>");
            Enumeration<String> attributeNames = session.getAttributeNames();

            if (!attributeNames.hasMoreElements()) {
                out.println("<p>No attributes found in session.</p>");
            } else {
                out.println("<ul>");
                while (attributeNames.hasMoreElements()) {
                    String name = attributeNames.nextElement();
                    Object value = session.getAttribute(name);
                    out.println("<li><strong>" + name + ":</strong> " + value + " (Type: " +
                            (value != null ? value.getClass().getName() : "null") + ")</li>");
                }
                out.println("</ul>");
            }
        }

        out.println("</body></html>");
    }
}
