package com.yours.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.logging.Logger;

/**
 * Servlet for serving uploaded images
 * Handles secure image retrieval and serving
 */
@WebServlet("/images/*")
public class ImageServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(ImageServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get the image path from the URL
            String imagePath = request.getPathInfo();
            if (imagePath == null || imagePath.equals("/")) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Image path not specified");
                return;
            }

            // Remove leading slash
            imagePath = imagePath.substring(1);

            // Security check - prevent directory traversal
            if (imagePath.contains("..") || imagePath.contains("/") || imagePath.contains("\\")) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Invalid image path");
                return;
            }

            // Get upload directory
            String uploadDir;
            try {
                uploadDir = request.getServletContext().getRealPath("/uploads");
                if (uploadDir == null) {
                    uploadDir = System.getProperty("java.io.tmpdir") + File.separator + "yours_uploads";
                }
            } catch (Exception e) {
                uploadDir = System.getProperty("java.io.tmpdir") + File.separator + "yours_uploads";
            }

            String fullPath = uploadDir + File.separator + imagePath;
            File imageFile = new File(fullPath);

            // Check if file exists
            if (!imageFile.exists() || !imageFile.isFile()) {
                logger.warning("Image file not found: " + fullPath);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
                return;
            }

            // Determine content type based on file extension
            String contentType = getContentType(imagePath);
            if (contentType == null) {
                response.sendError(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE, "Unsupported image type");
                return;
            }

            // Set response headers
            response.setContentType(contentType);
            response.setContentLength((int) imageFile.length());
            response.setHeader("Cache-Control", "public, max-age=3600"); // Cache for 1 hour

            // Stream the file
            try (FileInputStream fis = new FileInputStream(imageFile);
                    OutputStream os = response.getOutputStream()) {

                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fis.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
                os.flush();
            }

            logger.info("Served image: " + imagePath);

        } catch (Exception e) {
            logger.severe("Error serving image: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error serving image");
        }
    }

    /**
     * Determine content type based on file extension
     */
    private String getContentType(String fileName) {
        String extension = fileName.toLowerCase();
        if (extension.endsWith(".jpg") || extension.endsWith(".jpeg")) {
            return "image/jpeg";
        } else if (extension.endsWith(".png")) {
            return "image/png";
        } else if (extension.endsWith(".gif")) {
            return "image/gif";
        } else if (extension.endsWith(".webp")) {
            return "image/webp";
        }
        return null;
    }
}
