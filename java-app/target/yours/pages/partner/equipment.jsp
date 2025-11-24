<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Mon Matériel - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<style>
/* Equipment Cards Styling */
.card-equipment {
    border: none !important;
    border-radius: 1rem !important;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06) !important;
    transition: all 0.3s ease !important;
    overflow: hidden !important;
}

.card-equipment:hover {
    transform: translateY(-4px) !important;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15) !important;
}

.card-equipment .equipment-image-container {
    height: 250px !important;
    border-radius: 1rem 1rem 0 0 !important;
    transition: transform 0.3s ease !important;
}

.card-equipment:hover .equipment-image-container {
    transform: scale(1.02) !important;
}

.availability-badge {
    position: absolute !important;
    top: 1rem !important;
    right: 1rem !important;
    background: rgba(16, 185, 129, 0.9) !important;
    color: white !important;
    padding: 0.25rem 0.75rem !important;
    border-radius: 0.5rem !important;
    font-size: 0.75rem !important;
    font-weight: 600 !important;
    backdrop-filter: blur(10px) !important;
}

.price-badge {
    position: absolute !important;
    bottom: 1rem !important;
    left: 1rem !important;
    background: rgba(0, 0, 0, 0.8) !important;
    color: white !important;
    padding: 0.375rem 0.75rem !important;
    border-radius: 0.5rem !important;
    font-size: 0.875rem !important;
    font-weight: 700 !important;
    backdrop-filter: blur(10px) !important;
}

.card-equipment .card-body {
    padding: 1.5rem !important;
    display: flex !important;
    flex-direction: column !important;
    justify-content: space-between !important;
}

.card-equipment .card-title {
    font-size: 1.125rem !important;
    font-weight: 700 !important;
    color: var(--gray-900) !important;
    margin-bottom: 0.5rem !important;
    line-height: 1.3 !important;
}

.card-equipment .card-text {
    font-size: 0.9375rem !important;
    line-height: 1.6 !important;
    color: var(--gray-600) !important;
    margin-bottom: 1rem !important;
}

.rating {
    display: flex !important;
    align-items: center !important;
    gap: 0.125rem !important;
}


/* Search and Filter Enhancements */
.form-control:focus,
.form-select:focus {
    border-color: var(--primary-500) !important;
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1) !important;
}

/* Equipment Image Placeholder */
.equipment-image-container {
    height: 250px !important;
    border-radius: 1rem 1rem 0 0 !important;
    overflow: hidden !important;
}

.equipment-placeholder {
    width: 100% !important;
    height: 100% !important;
    background: linear-gradient(135deg, #fbbf24, #f59e0b) !important;
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    border-radius: 1rem 1rem 0 0 !important;
    transition: all 0.3s ease !important;
}

.equipment-placeholder i {
    font-size: 4rem !important;
    color: white !important;
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2) !important;
    transition: transform 0.3s ease !important;
}

.card-equipment:hover .equipment-placeholder {
    background: linear-gradient(135deg, #f59e0b, #d97706) !important;
}

.card-equipment:hover .equipment-placeholder i {
    transform: scale(1.1) !important;
}

/* Equipment Modal Styling */
.equipment-modal-content {
    border: none !important;
    border-radius: 1.5rem !important;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25), 0 0 0 1px rgba(255, 255, 255, 0.05) !important;
    backdrop-filter: blur(20px) !important;
    background: rgba(255, 255, 255, 0.95) !important;
    overflow: hidden !important;
}

.equipment-modal-header {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700)) !important;
    border: none !important;
    padding: 1.5rem !important;
    position: relative !important;
    overflow: hidden !important;
}

.equipment-modal-header::before {
    content: '' !important;
    position: absolute !important;
    top: -50% !important;
    left: -50% !important;
    width: 200% !important;
    height: 200% !important;
    background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 70%) !important;
    animation: shimmer 3s ease-in-out infinite !important;
    pointer-events: none !important;
}

@keyframes shimmer {
    0%, 100% { transform: translateX(-100%) translateY(-100%) rotate(30deg); }
    50% { transform: translateX(100%) translateY(100%) rotate(30deg); }
}

.modal-icon-container {
    width: 50px !important;
    height: 50px !important;
    background: rgba(255, 255, 255, 0.15) !important;
    border-radius: 50% !important;
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    backdrop-filter: blur(10px) !important;
    border: 1px solid rgba(255, 255, 255, 0.2) !important;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1) !important;
    transition: all 0.3s ease !important;
}

.modal-icon-container:hover {
    transform: scale(1.05) !important;
    background: rgba(255, 255, 255, 0.25) !important;
}

.modal-icon-container i {
    font-size: 1.5rem !important;
    color: white !important;
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2) !important;
}

.modal-title {
    color: white !important;
    font-size: 1.5rem !important;
    font-weight: 800 !important;
    margin: 0 !important;
    text-shadow: 0 2px 8px rgba(0, 0, 0, 0.2) !important;
    letter-spacing: -0.025em !important;
}

.modal-subtitle {
    color: rgba(255, 255, 255, 0.9) !important;
    font-size: 0.95rem !important;
    font-weight: 500 !important;
    margin-top: 0.25rem !important;
    text-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) !important;
}

.equipment-modal-body {
    padding: 1.5rem !important;
    background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%) !important;
    max-height: 70vh !important;
    overflow-y: auto !important;
    position: relative !important;
}

.equipment-modal-body::before {
    content: '' !important;
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    background: radial-gradient(circle at 80% 20%, rgba(37, 99, 235, 0.05) 0%, transparent 50%) !important;
    pointer-events: none !important;
}

.equipment-preview-section {
    background: white !important;
    border-radius: 1rem !important;
    padding: 1rem !important;
    box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05) !important;
    border: 1px solid rgba(255, 255, 255, 0.8) !important;
    margin-bottom: 1rem !important;
    position: relative !important;
    overflow: hidden !important;
}

.equipment-preview-section::before {
    content: '' !important;
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    right: 0 !important;
    height: 3px !important;
    background: linear-gradient(90deg, var(--primary-600), var(--primary-700)) !important;
}

.preview-card {
    display: flex !important;
    align-items: center !important;
    gap: 0.75rem !important;
}

.preview-image-container {
    width: 60px !important;
    height: 60px !important;
    border-radius: 0.5rem !important;
    overflow: hidden !important;
    flex-shrink: 0 !important;
}

.preview-placeholder {
    width: 100% !important;
    height: 100% !important;
    background: linear-gradient(135deg, #fbbf24, #f59e0b) !important;
    display: flex !important;
    flex-direction: column !important;
    align-items: center !important;
    justify-content: center !important;
    color: white !important;
}

.preview-placeholder i {
    font-size: 1.25rem !important;
    margin-bottom: 0.125rem !important;
}

.preview-placeholder span {
    font-size: 0.5rem !important;
    font-weight: 600 !important;
}

.preview-info {
    flex: 1 !important;
}

.preview-title {
    font-size: 0.875rem !important;
    font-weight: 700 !important;
    color: var(--gray-900) !important;
    margin-bottom: 0.125rem !important;
}

.preview-category {
    font-size: 0.625rem !important;
    color: var(--gray-600) !important;
    margin-bottom: 0.25rem !important;
}

.preview-price {
    font-size: 0.75rem !important;
    font-weight: 700 !important;
    color: var(--primary-600) !important;
}

.form-section {
    background: white !important;
    border-radius: 1rem !important;
    padding: 1.5rem !important;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1) !important;
    border: 1px solid rgba(226, 232, 240, 0.8) !important;
    height: 100% !important;
}

.section-header {
    display: flex !important;
    align-items: center !important;
    margin-bottom: 1.5rem !important;
    padding-bottom: 0.75rem !important;
    border-bottom: 2px solid var(--primary-100) !important;
}

.section-header i {
    font-size: 1.125rem !important;
    color: var(--primary-600) !important;
    margin-right: 0.75rem !important;
}

.section-header h6 {
    font-size: 1rem !important;
    font-weight: 700 !important;
    color: var(--gray-900) !important;
    margin: 0 !important;
}

.form-group {
    margin-bottom: 1.25rem !important;
    position: relative !important;
}

.form-group::before {
    content: '' !important;
    position: absolute !important;
    left: -0.5rem !important;
    top: 0 !important;
    bottom: 0 !important;
    width: 3px !important;
    background: linear-gradient(180deg, var(--primary-600), var(--primary-700)) !important;
    border-radius: 0 2px 2px 0 !important;
    opacity: 0 !important;
    transition: opacity 0.3s ease !important;
}

.form-group:focus-within::before {
    opacity: 1 !important;
}

.form-label {
    font-size: 0.875rem !important;
    font-weight: 600 !important;
    color: var(--gray-700) !important;
    margin-bottom: 0.5rem !important;
    display: flex !important;
    align-items: center !important;
    gap: 0.5rem !important;
    text-transform: uppercase !important;
    letter-spacing: 0.05em !important;
}

.form-label i {
    color: var(--primary-600) !important;
    font-size: 0.875rem !important;
    width: 16px !important;
    text-align: center !important;
}

.form-control-modern,
.form-select-modern {
    border: 2px solid var(--gray-200) !important;
    border-radius: 0.75rem !important;
    padding: 0.75rem 1rem !important;
    font-size: 0.875rem !important;
    transition: all 0.3s ease !important;
    background: white !important;
    color: var(--gray-900) !important;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1) !important;
}

.form-control-modern:focus,
.form-select-modern:focus {
    border-color: var(--primary-500) !important;
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1), 0 4px 12px rgba(37, 99, 235, 0.15) !important;
    outline: none !important;
    color: var(--gray-900) !important;
    transform: translateY(-1px) !important;
}

.form-control-modern::placeholder {
    color: var(--gray-500) !important;
    opacity: 1 !important;
}

.form-hint {
    font-size: 0.75rem !important;
    color: var(--gray-500) !important;
    margin-top: 0.5rem !important;
    font-style: italic !important;
    display: flex !important;
    align-items: center !important;
    gap: 0.25rem !important;
}

.form-hint::before {
    content: '💡' !important;
    font-size: 0.75rem !important;
}

.file-upload-area {
    border: 2px dashed var(--primary-400) !important;
    border-radius: 1rem !important;
    padding: 2rem 1rem !important;
    text-align: center !important;
    cursor: pointer !important;
    transition: all 0.3s ease !important;
    background: linear-gradient(135deg, rgba(37, 99, 235, 0.05) 0%, rgba(29, 78, 216, 0.05) 100%) !important;
    position: relative !important;
    overflow: hidden !important;
}

.file-upload-area::before {
    content: '' !important;
    position: absolute !important;
    top: 0 !important;
    left: -100% !important;
    width: 100% !important;
    height: 100% !important;
    background: linear-gradient(90deg, transparent, rgba(37, 99, 235, 0.1), transparent) !important;
    transition: left 0.5s ease !important;
}

.file-upload-area:hover::before {
    left: 100% !important;
}

.file-upload-area:hover {
    border-color: var(--primary-600) !important;
    background: linear-gradient(135deg, rgba(37, 99, 235, 0.1) 0%, rgba(29, 78, 216, 0.1) 100%) !important;
    transform: translateY(-2px) !important;
    box-shadow: 0 8px 25px rgba(37, 99, 235, 0.15) !important;
}

.file-upload-area i {
    font-size: 2rem !important;
    color: var(--primary-600) !important;
    margin-bottom: 0.75rem !important;
    transition: all 0.3s ease !important;
}

.file-upload-area:hover i {
    transform: scale(1.1) !important;
    color: var(--primary-700) !important;
}

.file-upload-area p {
    font-weight: 600 !important;
    color: var(--gray-700) !important;
    margin-bottom: 0.25rem !important;
    font-size: 0.875rem !important;
}

.file-upload-area small {
    color: var(--gray-500) !important;
    font-size: 0.75rem !important;
}

/* Image Preview Styles */
.image-preview-container {
    border: 1px solid var(--gray-200) !important;
    border-radius: 0.5rem !important;
    padding: 0.75rem !important;
    background: var(--gray-50) !important;
    margin-top: 0.75rem !important;
}

.image-preview-grid {
    display: grid !important;
    grid-template-columns: repeat(auto-fill, minmax(70px, 1fr)) !important;
    gap: 0.5rem !important;
    max-height: 120px !important;
    overflow-y: auto !important;
    padding: 0.25rem !important;
    background: white !important;
    border-radius: 0.375rem !important;
    border: 1px solid var(--gray-100) !important;
}

.image-preview-item {
    position: relative !important;
    border-radius: 0.25rem !important;
    overflow: hidden !important;
    background: white !important;
    border: 1px solid var(--gray-200) !important;
    aspect-ratio: 1 !important;
    transition: all 0.2s ease !important;
}

.image-preview-item:hover {
    border-color: var(--primary-400) !important;
    box-shadow: 0 2px 8px rgba(37, 99, 235, 0.15) !important;
    transform: scale(1.02) !important;
}

.image-preview-item img {
    width: 100% !important;
    height: 100% !important;
    object-fit: cover !important;
    display: block !important;
}

.image-preview-overlay {
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    background: rgba(0, 0, 0, 0.6) !important;
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    opacity: 0 !important;
    transition: opacity 0.2s ease !important;
}

.image-preview-item:hover .image-preview-overlay {
    opacity: 1 !important;
}

.image-preview-overlay .btn {
    padding: 0.125rem 0.375rem !important;
    font-size: 0.625rem !important;
    border-radius: 0.25rem !important;
    background: rgba(220, 38, 38, 0.9) !important;
    border: none !important;
    color: white !important;
}

.image-preview-overlay .btn:hover {
    background: rgba(220, 38, 38, 1) !important;
    transform: scale(1.1) !important;
}

.image-preview-info {
    display: flex !important;
    justify-content: space-between !important;
    align-items: center !important;
    padding-top: 0.5rem !important;
    border-top: 1px solid var(--gray-200) !important;
    margin-top: 0.5rem !important;
}

.image-preview-info .text-success {
    font-weight: 600 !important;
    font-size: 0.75rem !important;
}

.image-preview-info i {
    margin-right: 0.25rem !important;
}

.image-preview-info .text-info {
    font-size: 0.75rem !important;
}

/* Scrollbar styling for image grid */
.image-preview-grid::-webkit-scrollbar {
    width: 4px !important;
    height: 4px !important;
}

.image-preview-grid::-webkit-scrollbar-track {
    background: var(--gray-100) !important;
    border-radius: 2px !important;
}

.image-preview-grid::-webkit-scrollbar-thumb {
    background: var(--gray-300) !important;
    border-radius: 2px !important;
}

.image-preview-grid::-webkit-scrollbar-thumb:hover {
    background: var(--gray-400) !important;
}

.equipment-modal-footer {
    background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%) !important;
    border: none !important;
    padding: 1.5rem !important;
    border-top: 1px solid rgba(37, 99, 235, 0.1) !important;
    position: relative !important;
}

.equipment-modal-footer::before {
    content: '' !important;
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    right: 0 !important;
    height: 1px !important;
    background: linear-gradient(90deg, transparent, var(--primary-600), transparent) !important;
}

.equipment-modal-footer .btn {
    border-radius: 0.75rem !important;
    padding: 0.75rem 1.5rem !important;
    font-weight: 600 !important;
    font-size: 0.875rem !important;
    transition: all 0.3s ease !important;
    text-transform: uppercase !important;
    letter-spacing: 0.05em !important;
    position: relative !important;
    overflow: hidden !important;
}

.equipment-modal-footer .btn::before {
    content: '' !important;
    position: absolute !important;
    top: 0 !important;
    left: -100% !important;
    width: 100% !important;
    height: 100% !important;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent) !important;
    transition: left 0.5s ease !important;
}

.equipment-modal-footer .btn:hover::before {
    left: 100% !important;
}

.equipment-modal-footer .btn-primary {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700)) !important;
    border: none !important;
    box-shadow: 0 8px 25px rgba(37, 99, 235, 0.3) !important;
    color: white !important;
}

.equipment-modal-footer .btn-primary:hover {
    background: linear-gradient(135deg, var(--primary-700), var(--primary-800)) !important;
    transform: translateY(-2px) !important;
    box-shadow: 0 12px 35px rgba(37, 99, 235, 0.4) !important;
}

.equipment-modal-footer .btn-outline-secondary {
    border: 2px solid var(--gray-300) !important;
    color: var(--gray-600) !important;
    background: white !important;
}

.equipment-modal-footer .btn-outline-secondary:hover {
    background: var(--gray-50) !important;
    border-color: var(--gray-400) !important;
    color: var(--gray-700) !important;
    transform: translateY(-1px) !important;
}

/* Animation for slide down */
@keyframes slideDown {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Add Equipment Floating Button Styling */
.add-equipment-floating-btn {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700)) !important;
    border: none !important;
    border-radius: 1rem !important;
    padding: 1.25rem 2.5rem !important;
    font-weight: 700 !important;
    font-size: 1.1rem !important;
    letter-spacing: 0.5px !important;
    text-transform: uppercase !important;
    box-shadow: 0 10px 30px rgba(37, 99, 235, 0.25), 0 4px 15px rgba(37, 99, 235, 0.15) !important;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1) !important;
    position: relative !important;
    overflow: hidden !important;
    z-index: 2 !important;
    color: white !important;
    min-width: 220px !important;
}

.add-equipment-floating-btn::before {
    content: '' !important;
    position: absolute !important;
    top: 0 !important;
    left: -100% !important;
    width: 100% !important;
    height: 100% !important;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent) !important;
    transition: left 0.8s ease !important;
}

.add-equipment-floating-btn::after {
    content: '' !important;
    position: absolute !important;
    top: 50% !important;
    left: 50% !important;
    width: 0 !important;
    height: 0 !important;
    background: rgba(255, 255, 255, 0.2) !important;
    border-radius: 50% !important;
    transform: translate(-50%, -50%) !important;
    transition: all 0.6s ease !important;
}

.add-equipment-floating-btn:hover::before {
    left: 100% !important;
}

.add-equipment-floating-btn:hover::after {
    width: 300px !important;
    height: 300px !important;
}

.add-equipment-floating-btn:hover {
    background: linear-gradient(135deg, var(--primary-700), var(--primary-800)) !important;
    transform: translateY(-4px) scale(1.02) !important;
    box-shadow: 0 20px 40px rgba(37, 99, 235, 0.3), 0 8px 25px rgba(37, 99, 235, 0.2) !important;
}

.add-equipment-floating-btn:active {
    transform: translateY(-2px) scale(1.01) !important;
    box-shadow: 0 15px 35px rgba(37, 99, 235, 0.25), 0 6px 20px rgba(37, 99, 235, 0.15) !important;
}

.add-equipment-floating-btn i {
    transition: all 0.3s ease !important;
    font-size: 1.2rem !important;
    margin-right: 0.75rem !important;
}

.add-equipment-floating-btn:hover i {
    transform: rotate(90deg) scale(1.1) !important;
}

/* Enhanced Glow Effect */
.add-btn-glow {
    position: absolute !important;
    top: 50% !important;
    left: 50% !important;
    width: 140% !important;
    height: 140% !important;
    background: radial-gradient(circle, rgba(37, 99, 235, 0.15) 0%, rgba(37, 99, 235, 0.05) 50%, transparent 70%) !important;
    border-radius: 50% !important;
    transform: translate(-50%, -50%) !important;
    z-index: 1 !important;
    animation: pulse-glow-enhanced 3s ease-in-out infinite !important;
}

@keyframes pulse-glow-enhanced {
    0%, 100% {
        opacity: 0.4;
        transform: translate(-50%, -50%) scale(1);
    }
    50% {
        opacity: 0.7;
        transform: translate(-50%, -50%) scale(1.15);
    }
}

/* Button Container Enhancement */
.add-material-container {
    position: relative !important;
    display: inline-block !important;
    margin: 1rem 0 !important;
}

.add-material-container::before {
    content: '' !important;
    position: absolute !important;
    top: -20px !important;
    left: 50% !important;
    transform: translateX(-50%) !important;
    width: 80px !important;
    height: 2px !important;
    background: linear-gradient(90deg, transparent, var(--primary-500), transparent) !important;
    border-radius: 1px !important;
    opacity: 0.6 !important;
}

.add-material-container::after {
    content: '' !important;
    position: absolute !important;
    bottom: -20px !important;
    left: 50% !important;
    transform: translateX(-50%) !important;
    width: 60px !important;
    height: 1px !important;
    background: linear-gradient(90deg, transparent, var(--primary-400), transparent) !important;
    border-radius: 1px !important;
    opacity: 0.4 !important;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .add-equipment-floating-btn {
        padding: 1rem 2rem !important;
        font-size: 1rem !important;
        border-radius: 0.875rem !important;
        min-width: 200px !important;
    }
    
    .add-btn-glow {
        width: 130% !important;
        height: 130% !important;
    }
    
    .add-material-container {
        margin: 0.75rem 0 !important;
    }
    
    .add-material-container::before {
        width: 60px !important;
        height: 1.5px !important;
        top: -15px !important;
    }
    
    .add-material-container::after {
        width: 40px !important;
        height: 1px !important;
        bottom: -15px !important;
    }
}

@media (max-width: 480px) {
    .add-equipment-floating-btn {
        padding: 0.875rem 1.5rem !important;
        font-size: 0.95rem !important;
        min-width: 180px !important;
    }
    
    .add-equipment-floating-btn i {
        font-size: 1.1rem !important;
        margin-right: 0.5rem !important;
    }
}
</style>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 6rem) !important; padding-bottom: 6rem !important; min-height: 500px; height: 500px; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="row">
            <div class="col-lg-10 mx-auto text-center">
                <!-- Badge -->
                <div class="d-inline-flex align-items-center mb-4" style="background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(20px); border-radius: 50px; padding: 0.75rem 1.5rem; border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);">
                    <i class="fas fa-boxes me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">GESTION DU MATÉRIEL</span>
                </div>
                
                <!-- Main Title -->
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    Mon <span style="background: linear-gradient(135deg, #fbbf24, #f59e0b); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Matériel</span>
                </h1>
                
                <!-- Subtitle -->
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Gérez vos équipements et leur disponibilité
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Ajoutez du matériel • Modifiez les prix • Suivez les réservations
                    </p>
                </div>
                
                <!-- Decorative Elements -->
                <div class="d-flex justify-content-center align-items-center gap-3 mt-4">
                    <div style="width: 60px; height: 2px; background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent); border-radius: 1px;"></div>
                    <div style="width: 8px; height: 8px; background: rgba(251, 191, 36, 0.8); border-radius: 50%; box-shadow: 0 0 20px rgba(251, 191, 36, 0.5);"></div>
                    <div style="width: 60px; height: 2px; background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent); border-radius: 1px;"></div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Equipment Grid -->
<div class="container py-5">
    <div class="row">
        <div class="col-12">
            <!-- Add Material Button Section -->
            <div class="text-center mb-3">
                <div class="add-material-container">
                    <button onclick="showAddEquipmentModal()" class="btn btn-primary btn-lg add-equipment-floating-btn" title="Ajouter du matériel">
                        <i class="fas fa-plus"></i>Ajouter du matériel
                    </button>
                    <div class="add-btn-glow"></div>
                </div>
            </div>
            
            <!-- Enhanced Search & Filter Section -->
            <div class="mb-4">
                <!-- Main Search Bar -->
                <div class="p-4 mb-3" style="background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%); border-radius: 1.25rem; box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.08), 0 2px 8px -2px rgba(0, 0, 0, 0.04); border: 1px solid rgba(226, 232, 240, 0.8);">
                    <div class="row g-3 align-items-center">
                        <!-- Search Input -->
                        <div class="col-lg-5">
                            <label class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.875rem; display: flex; align-items: center;">
                                <i class="fas fa-search me-2" style="color: var(--primary-600); font-size: 0.875rem;"></i>
                                Recherche
                            </label>
                            <div class="position-relative">
                                <i class="fas fa-search position-absolute" style="left: 1.125rem; top: 50%; transform: translateY(-50%); color: var(--gray-400); font-size: 0.9375rem;"></i>
                                <input type="text" id="searchInput" class="form-control" placeholder="Rechercher par nom, marque, modèle..." 
                                       style="padding-left: 2.875rem; padding-right: 2.875rem; border-radius: 0.875rem; border: 2px solid var(--gray-200); height: 48px; font-size: 0.9375rem; transition: all 0.3s ease; background: white;">
                                <button class="btn btn-link position-absolute d-none" id="clearSearch" style="right: 0.5rem; top: 50%; transform: translateY(-50%); color: var(--gray-400); text-decoration: none; padding: 0.25rem 0.5rem;">
                                    <i class="fas fa-times-circle"></i>
                                </button>
                            </div>
                        </div>
                        
                        <!-- Category Filter -->
                        <div class="col-lg-3">
                            <label class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.875rem; display: flex; align-items: center;">
                                <i class="fas fa-folder-open me-2" style="color: var(--primary-600); font-size: 0.875rem;"></i>
                                Catégorie
                            </label>
                            <select class="form-select" id="categoryFilter" style="border-radius: 0.875rem; border: 2px solid var(--gray-200); height: 48px; font-size: 0.9375rem; transition: all 0.3s ease; background: white;">
                                <option value="" selected>Toutes catégories</option>
                                <option value="photo">Photographie</option>
                                <option value="video">Vidéo</option>
                                <option value="info">Informatique</option>
                                <option value="audio">Audio</option>
                                <option value="gaming">Gaming</option>
                                <option value="light">Éclairage</option>
                            </select>
                        </div>
                        
                        <!-- Sort Filter -->
                        <div class="col-lg-3">
                            <label class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.875rem; display: flex; align-items: center;">
                                <i class="fas fa-sort-amount-down me-2" style="color: var(--primary-600); font-size: 0.875rem;"></i>
                                Trier par
                            </label>
                            <select class="form-select" id="sortFilter" style="border-radius: 0.875rem; border: 2px solid var(--gray-200); height: 48px; font-size: 0.9375rem; transition: all 0.3s ease; background: white;">
                                <option value="name-asc" selected>Nom (A-Z)</option>
                                <option value="name-desc">Nom (Z-A)</option>
                                <option value="price-asc">Prix croissant</option>
                                <option value="price-desc">Prix décroissant</option>
                                <option value="availability">Disponibilité</option>
                            </select>
                        </div>
                        
                        <!-- Advanced Filter Button -->
                        <div class="col-lg-1">
                            <label class="form-label mb-2" style="font-size: 0.875rem; opacity: 0;">_</label>
                            <button id="advancedFilterToggle" class="btn w-100" style="background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); color: white; border: none; border-radius: 0.875rem; height: 48px; box-shadow: 0 4px 12px -2px rgba(37, 99, 235, 0.4); transition: all 0.3s ease;" title="Filtres avancés">
                                <i class="fas fa-sliders-h"></i>
                            </button>
                        </div>
                    </div>
                </div>
                
                <!-- Advanced Filters Panel (Hidden by default) -->
                <div id="advancedFiltersPanel" class="mt-3 mb-4" style="display: none; animation: slideDown 0.3s ease;">
                    <div class="p-4" style="background: white; border-radius: 1rem; border: 1px solid var(--gray-200); box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h6 class="mb-0" style="color: var(--gray-800); font-weight: 600;">
                                <i class="fas fa-filter me-2" style="color: var(--primary-600);"></i>
                                Filtres Avancés
                            </h6>
                            <button id="closeAdvancedFilters" class="btn btn-sm" style="color: var(--gray-500); padding: 0.25rem 0.5rem;">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                        
                        <div class="row g-3">
                            <!-- Price Range -->
                            <div class="col-md-6">
                                <label class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.875rem;">
                                    <i class="fas fa-tag me-1" style="color: var(--primary-600); font-size: 0.75rem;"></i>
                                    Fourchette de Prix
                                </label>
                                <div class="d-flex gap-2 align-items-center">
                                    <input type="number" id="priceMin" class="form-control form-control-sm" placeholder="Min" style="border-radius: 0.5rem;" min="0">
                                    <span style="color: var(--gray-400);">—</span>
                                    <input type="number" id="priceMax" class="form-control form-control-sm" placeholder="Max" style="border-radius: 0.5rem;" min="0">
                                </div>
                            </div>
                            
                            <!-- Availability -->
                            <div class="col-md-6">
                                <label class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.875rem;">
                                    <i class="fas fa-calendar-check me-1" style="color: var(--primary-600); font-size: 0.75rem;"></i>
                                    Disponibilité
                                </label>
                                <select id="availabilityFilter" class="form-select form-select-sm" style="border-radius: 0.5rem;">
                                    <option value="">Tous</option>
                                    <option value="1">Disponible</option>
                                    <option value="0">Non disponible</option>
                                </select>
                            </div>
                        </div>
                        
                        <!-- Action Buttons -->
                        <div class="d-flex gap-2 justify-content-end mt-3 pt-3" style="border-top: 1px solid var(--gray-200);">
                            <button class="btn btn-sm btn-outline-secondary" id="resetFilters" style="border-radius: 0.5rem; padding: 0.5rem 1rem;">
                                <i class="fas fa-redo me-1"></i>Réinitialiser
                            </button>
                            <button id="applyFilters" class="btn btn-sm btn-primary" style="border-radius: 0.5rem; padding: 0.5rem 1rem;">
                                <i class="fas fa-check me-1"></i>Appliquer
                            </button>
                        </div>
                    </div>
                </div>
                
                <!-- Results Bar & Quick Filters -->
                <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-4">
                    <!-- Results Count -->
                    <div class="d-flex align-items-center" style="background: white; padding: 0.625rem 1.125rem; border-radius: 0.75rem; border: 1px solid var(--gray-200); box-shadow: 0 1px 3px rgba(0,0,0,0.05);">
                        <i class="fas fa-box-open me-2" style="color: var(--primary-600); font-size: 0.875rem;"></i>
                        <span style="font-weight: 600; color: var(--gray-900); font-size: 0.9375rem;" id="equipmentCount">0</span>
                        <span style="color: var(--gray-500); font-size: 0.875rem; margin-left: 0.375rem;">équipements trouvés</span>
                    </div>
                    
                    <!-- View Toggle -->
                    <div class="btn-group" role="group" style="background: white; border-radius: 0.75rem; padding: 0.25rem; box-shadow: 0 1px 3px rgba(0,0,0,0.05); border: 1px solid var(--gray-200);">
                        <button type="button" class="btn view-toggle-btn active" data-view="grid" style="background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); color: white; border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; box-shadow: 0 2px 8px rgba(37, 99, 235, 0.3); transition: all 0.3s ease;">
                            <i class="fas fa-th-large"></i>
                        </button>
                        <button type="button" class="btn view-toggle-btn" data-view="list" style="background: transparent; color: var(--gray-500); border: none; padding: 0.5rem 1rem; border-radius: 0.5rem; transition: all 0.3s ease;">
                            <i class="fas fa-list"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row g-4" id="equipmentGrid">
                <!-- Equipment items will be populated here -->
            </div>

            <!-- Empty State -->
            <div id="emptyState" class="text-center py-5" style="display: none;">
                <i class="fas fa-boxes fa-3x text-muted mb-3"></i>
                <h4 class="text-muted">Aucun matériel trouvé</h4>
                <p class="text-muted">Commencez par ajouter votre premier équipement</p>
                <button class="btn btn-primary" onclick="showAddEquipmentModal()">
                    <i class="fas fa-plus me-2"></i>Ajouter du matériel
                </button>
            </div>

            <!-- Pagination -->
            <div class="text-center mt-5 pt-4">
                <nav aria-label="Equipment pagination">
                    <ul class="pagination pagination-modern justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">
                                <i class="fas fa-chevron-left me-1"></i>Précédent
                            </a>
                        </li>
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">
                                Suivant<i class="fas fa-chevron-right ms-1"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<!-- Add/Edit Equipment Modal -->
<div class="modal fade" id="equipmentModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered" style="max-height: 90vh;">
        <div class="modal-content equipment-modal-content">
            <!-- Modal Header -->
            <div class="modal-header equipment-modal-header">
                <div class="d-flex align-items-center">
                    <div class="modal-icon-container">
                        <i class="fas fa-plus-circle"></i>
                    </div>
                    <div class="ms-3">
                        <h4 class="modal-title mb-0 fw-bold" id="modalTitle">Ajouter du matériel</h4>
                        <p class="modal-subtitle mb-0">Remplissez les informations de votre équipement</p>
                    </div>
                </div>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body equipment-modal-body">
                <form id="equipmentForm" class="equipment-form">
                    <input type="hidden" id="equipmentId">
                    
                    <!-- Equipment Preview Section -->
                    <div class="equipment-preview-section mb-3">
                        <div class="preview-card">
                            <div class="preview-image-container">
                                <div class="preview-placeholder">
                                    <i class="fas fa-camera"></i>
                                    <span>Aperçu</span>
                                </div>
                            </div>
                            <div class="preview-info">
                                <h5 class="preview-title" id="previewTitle">Nom du matériel</h5>
                                <p class="preview-category" id="previewCategory">Catégorie</p>
                                <div class="preview-price" id="previewPrice">0 MAD/jour</div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Form Sections -->
                    <div class="row g-3">
                        <!-- Basic Information -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">
                                    <i class="fas fa-tag me-2"></i>Nom du matériel *
                                </label>
                                <input type="text" class="form-control form-control-modern" id="equipmentName" 
                                       placeholder="Ex: Canon EOS R5" required>
                                <div class="form-hint">Nom complet de votre équipement</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">
                                    <i class="fas fa-dollar-sign me-2"></i>Prix/jour (MAD) *
                                </label>
                                <input type="number" class="form-control form-control-modern" id="equipmentPrice" 
                                       placeholder="0" min="0" step="0.01" required>
                                <div class="form-hint">Prix de location par jour</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">
                                    <i class="fas fa-folder me-2"></i>Catégorie *
                                </label>
                                <select class="form-select form-select-modern" id="equipmentCategory" required>
                                    <option value="">Sélectionner une catégorie</option>
                                    <option value="Photographie">📷 Photographie</option>
                                    <option value="Vidéo">🎥 Vidéo</option>
                                    <option value="Audio">🎵 Audio</option>
                                    <option value="Informatique">💻 Informatique</option>
                                    <option value="Gaming">🎮 Gaming</option>
                                    <option value="Éclairage">💡 Éclairage</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">
                                    <i class="fas fa-toggle-on me-2"></i>Statut *
                                </label>
                                <select class="form-select form-select-modern" id="equipmentStatus" required>
                                    <option value="available">✅ Disponible</option>
                                    <option value="unavailable">❌ Non disponible</option>
                                    <option value="maintenance">🔧 En maintenance</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-align-left me-2"></i>Description
                        </label>
                        <textarea class="form-control form-control-modern" id="equipmentDescription" 
                                  rows="2" placeholder="Décrivez votre matériel, ses caractéristiques, son état..."></textarea>
                        <div class="form-hint">Description détaillée pour attirer les clients</div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-images me-2"></i>Photos du matériel
                        </label>
                        <div class="file-upload-area" onclick="document.getElementById('equipmentPhotos').click()">
                            <i class="fas fa-cloud-upload-alt"></i>
                            <p class="mb-1">Cliquez pour ajouter des photos</p>
                            <small>JPG, PNG, GIF (max 10MB)</small>
                        </div>
                        <input type="file" class="d-none" id="equipmentPhotos" multiple accept="image/*" onchange="addImagesToPreview()">
                        
                        <!-- Image Preview Container -->
                        <div id="imagePreviewContainer" class="image-preview-container d-none">
                            <div class="image-preview-grid" id="imagePreviewGrid">
                                <!-- Preview images will be added here -->
                            </div>
                            <div class="image-preview-info">
                                <small class="text-success">
                                    <i class="fas fa-check-circle"></i> <span id="imageCount">0</span> image(s)
                                </small>
                                <div id="imageProcessingIndicator" class="d-none">
                                    <small class="text-info">
                                        <i class="fas fa-spinner fa-spin"></i> Chargement...
                                    </small>
                                </div>
                            </div>
                        </div>
                        <div class="form-hint">Ajoutez jusqu'à 5 photos de qualité</div>
                    </div>
                </form>
            </div>
            
            <!-- Modal Footer -->
            <div class="modal-footer equipment-modal-footer">
                <div class="d-flex gap-3 w-100">
                    <button type="button" class="btn btn-outline-secondary btn-lg flex-fill" data-bs-dismiss="modal">
                        <i class="fas fa-times me-2"></i>Annuler
                    </button>
                    <button type="button" class="btn btn-primary btn-lg flex-fill" onclick="saveEquipment()">
                        <i class="fas fa-save me-2"></i>Enregistrer le matériel
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
let equipmentModal;

document.addEventListener('DOMContentLoaded', function() {
    equipmentModal = new bootstrap.Modal(document.getElementById('equipmentModal'));
    loadEquipment();
    
    // Setup preview updates
    setupPreviewUpdates();
    
    // Search functionality
    const searchInput = document.getElementById('searchInput');
    const clearSearchBtn = document.getElementById('clearSearch');
    const categoryFilter = document.getElementById('categoryFilter');
    const sortFilter = document.getElementById('sortFilter');
    
    // Show/hide clear button
    if (searchInput && clearSearchBtn) {
        searchInput.addEventListener('input', function() {
            if (this.value.length > 0) {
                clearSearchBtn.classList.remove('d-none');
            } else {
                clearSearchBtn.classList.add('d-none');
            }
            filterEquipment();
        });
        
        clearSearchBtn.addEventListener('click', function() {
            searchInput.value = '';
            clearSearchBtn.classList.add('d-none');
            searchInput.focus();
            filterEquipment();
        });
    }
    
    // Enhanced focus effects for inputs
    const formControls = [searchInput, categoryFilter, sortFilter];
    formControls.forEach(control => {
        if (control) {
            control.addEventListener('focus', function() {
                this.style.borderColor = 'var(--primary-500)';
                this.style.boxShadow = '0 0 0 4px rgba(37, 99, 235, 0.1)';
            });
            
            control.addEventListener('blur', function() {
                this.style.borderColor = 'var(--gray-200)';
                this.style.boxShadow = 'none';
            });
        }
    });
    
    // Filter change events
    if (categoryFilter) categoryFilter.addEventListener('change', filterEquipment);
    if (sortFilter) sortFilter.addEventListener('change', filterEquipment);
    
    // View toggle buttons
    const viewToggleBtns = document.querySelectorAll('.view-toggle-btn');
    const equipmentGrid = document.getElementById('equipmentGrid');
    
    // Add hover effects
    viewToggleBtns.forEach(btn => {
        btn.addEventListener('mouseenter', function() {
            if (!this.classList.contains('active')) {
                this.style.background = 'var(--gray-50)';
                this.style.color = 'var(--gray-700)';
            }
        });
        
        btn.addEventListener('mouseleave', function() {
            if (!this.classList.contains('active')) {
                this.style.background = 'transparent';
                this.style.color = 'var(--gray-500)';
            }
        });
    });
    
    viewToggleBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const viewType = this.getAttribute('data-view');
            
            // Remove active state from all buttons
            viewToggleBtns.forEach(b => {
                b.classList.remove('active');
                b.style.background = 'transparent';
                b.style.color = 'var(--gray-500)';
                b.style.boxShadow = 'none';
            });
            
            // Add active state to clicked button
            this.classList.add('active');
            this.style.background = 'linear-gradient(135deg, var(--primary-600), var(--primary-700))';
            this.style.color = 'white';
            this.style.boxShadow = '0 2px 8px rgba(37, 99, 235, 0.3)';
            
            // Update grid layout
            const cardColumns = equipmentGrid.querySelectorAll('[class*="col-"]');
            const equipmentCards = equipmentGrid.querySelectorAll('.card');
            
            if (viewType === 'list') {
                // List view - horizontal card layout
                cardColumns.forEach(card => {
                    card.className = 'col-12';
                });
                
                equipmentCards.forEach(card => {
                    // Change card to horizontal layout
                    card.style.flexDirection = 'row';
                    card.style.maxHeight = 'none';
                    card.style.height = '200px';
                    card.style.alignItems = 'stretch';
                    card.style.boxShadow = '0 4px 12px rgba(0, 0, 0, 0.08)';
                    card.style.transition = 'all 0.3s ease';
                    
                    const imgContainer = card.querySelector('.equipment-image-container');
                    const cardBody = card.querySelector('.card-body');
                    const placeholder = card.querySelector('.equipment-placeholder');
                    
                    if (imgContainer) {
                        imgContainer.style.flex = '0 0 300px';
                        imgContainer.style.maxWidth = '300px';
                        imgContainer.style.height = '100%';
                        imgContainer.style.overflow = 'hidden';
                        imgContainer.style.display = 'flex';
                        imgContainer.style.alignItems = 'center';
                        imgContainer.style.justifyContent = 'center';
                        imgContainer.style.borderRadius = '1rem 0 0 1rem';
                        
                        // Position badges for list view
                        const availabilityBadge = imgContainer.querySelector('.availability-badge');
                        const priceBadge = imgContainer.querySelector('.price-badge');
                        if (availabilityBadge) {
                            availabilityBadge.style.top = '0.75rem';
                            availabilityBadge.style.left = '0.75rem';
                            availabilityBadge.style.right = 'auto';
                            availabilityBadge.style.fontSize = '0.7rem';
                        }
                        if (priceBadge) {
                            priceBadge.style.bottom = '0.75rem';
                            priceBadge.style.left = '0.75rem';
                            priceBadge.style.right = 'auto';
                            priceBadge.style.fontSize = '0.7rem';
                            priceBadge.style.fontWeight = '600';
                        }
                    }
                    
                    if (placeholder) {
                        placeholder.style.width = '100%';
                        placeholder.style.height = '100%';
                        placeholder.style.borderRadius = '1rem 0 0 1rem';
                        placeholder.style.transition = 'transform 0.3s ease';
                    }
                    
                    if (cardBody) {
                        cardBody.style.flex = '1';
                        cardBody.style.display = 'flex';
                        cardBody.style.flexDirection = 'column';
                        cardBody.style.justifyContent = 'space-between';
                        cardBody.style.padding = '1.5rem 2rem';
                    }
                });
                
                equipmentGrid.classList.remove('g-4');
                equipmentGrid.classList.add('g-3');
            } else {
                // Grid view - vertical card layout
                cardColumns.forEach(card => {
                    card.className = 'col-lg-4 col-md-6';
                });
                
                equipmentCards.forEach(card => {
                    // Reset to vertical layout
                    card.style.flexDirection = 'column';
                    card.style.maxHeight = 'none';
                    card.style.height = '100%';
                    card.style.alignItems = 'stretch';
                    card.style.boxShadow = '0 2px 8px rgba(0, 0, 0, 0.06)';
                    card.style.transition = 'all 0.3s ease';
                    
                    const imgContainer = card.querySelector('.equipment-image-container');
                    const cardBody = card.querySelector('.card-body');
                    const placeholder = card.querySelector('.equipment-placeholder');
                    
                    if (imgContainer) {
                        imgContainer.style.flex = 'none';
                        imgContainer.style.maxWidth = 'none';
                        imgContainer.style.height = '250px';
                        imgContainer.style.overflow = 'hidden';
                        imgContainer.style.display = 'block';
                        imgContainer.style.alignItems = 'initial';
                        imgContainer.style.justifyContent = 'initial';
                        imgContainer.style.borderRadius = '1rem 1rem 0 0';
                        
                        // Reset badges position for grid view
                        const availabilityBadge = imgContainer.querySelector('.availability-badge');
                        const priceBadge = imgContainer.querySelector('.price-badge');
                        if (availabilityBadge) {
                            availabilityBadge.style.top = '1rem';
                            availabilityBadge.style.left = 'auto';
                            availabilityBadge.style.right = '1rem';
                            availabilityBadge.style.fontSize = '';
                        }
                        if (priceBadge) {
                            priceBadge.style.bottom = '1rem';
                            priceBadge.style.left = '1rem';
                            priceBadge.style.right = 'auto';
                            priceBadge.style.fontSize = '';
                            priceBadge.style.fontWeight = '';
                        }
                    }
                    
                    if (placeholder) {
                        placeholder.style.width = '100%';
                        placeholder.style.height = '250px';
                        placeholder.style.borderRadius = '1rem 1rem 0 0';
                        placeholder.style.transition = 'transform 0.3s ease';
                    }
                    
                    if (cardBody) {
                        cardBody.style.flex = '1';
                        cardBody.style.display = 'flex';
                        cardBody.style.flexDirection = 'column';
                        cardBody.style.justifyContent = 'space-between';
                        cardBody.style.padding = '1.5rem';
                    }
                });
                
                equipmentGrid.classList.remove('g-3');
                equipmentGrid.classList.add('g-4');
            }
        });
    });
    
    // Advanced filter panel toggle
    const advancedFilterToggle = document.getElementById('advancedFilterToggle');
    const advancedFiltersPanel = document.getElementById('advancedFiltersPanel');
    const closeAdvancedFilters = document.getElementById('closeAdvancedFilters');
    const resetFilters = document.getElementById('resetFilters');
    
    if (advancedFilterToggle && advancedFiltersPanel) {
        // Toggle panel
        advancedFilterToggle.addEventListener('click', function() {
            if (advancedFiltersPanel.style.display === 'none') {
                advancedFiltersPanel.style.display = 'block';
                advancedFiltersPanel.style.animation = 'slideDown 0.3s ease';
                this.style.background = 'linear-gradient(135deg, var(--primary-700), var(--primary-800))';
            } else {
                advancedFiltersPanel.style.display = 'none';
                this.style.background = 'linear-gradient(135deg, var(--primary-600), var(--primary-700))';
            }
        });
        
        // Close panel
        if (closeAdvancedFilters) {
            closeAdvancedFilters.addEventListener('click', function() {
                advancedFiltersPanel.style.display = 'none';
                advancedFilterToggle.style.background = 'linear-gradient(135deg, var(--primary-600), var(--primary-700))';
            });
        }
        
        // Reset filters
        if (resetFilters) {
            resetFilters.addEventListener('click', function() {
                // Reset all form inputs in the advanced filter panel
                const inputs = advancedFiltersPanel.querySelectorAll('input, select');
                inputs.forEach(input => {
                    if (input.tagName === 'SELECT') {
                        input.selectedIndex = 0;
                    } else {
                        input.value = '';
                    }
                });
            });
        }
        
        // Hover effect
        advancedFilterToggle.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-2px)';
            this.style.boxShadow = '0 6px 20px -2px rgba(37, 99, 235, 0.5)';
        });
        
        advancedFilterToggle.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = '0 4px 12px -2px rgba(37, 99, 235, 0.4)';
        });
    }
});

function loadEquipment() {
    // Charger les matériels du partenaire connecté depuis l'API
    const apiUrl = '${pageContext.request.contextPath}/api/materiel/partner';
    
    fetch(apiUrl, {
        method: 'GET',
        credentials: 'include'  // Inclure les cookies de session
    })
    .then(response => {
        if (!response.ok) {
            if (response.status === 401) {
                // Non authentifié, rediriger vers la page de connexion
                window.location.href = '${pageContext.request.contextPath}/pages/auth/login.jsp';
                return;
            }
            throw new Error('HTTP error! status: ' + response.status);
        }
        return response.json();
    })
    .then(data => {
        console.log('Matériels chargés:', data);
        
        // Convertir les données de l'API au format attendu par displayEquipment
        const equipment = data.map(item => {
            // Déterminer le statut
            let status = 'available';
            if (!item.disponibilite) {
                status = 'unavailable';
            }
            
            // Récupérer la première image ou utiliser une image par défaut
            let image = 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80';
            if (item.images && item.images.length > 0) {
                // Gérer les deux formats : objet {id, url} ou string (ancien format)
                const firstImage = item.images[0];
                let imagePath = '';
                
                if (typeof firstImage === 'object' && firstImage.url !== undefined) {
                    imagePath = firstImage.url;
                } else {
                    imagePath = firstImage;
                }
                
                // Construire l'URL complète de l'image
                if (imagePath && !imagePath.startsWith('http')) {
                    image = '${pageContext.request.contextPath}/' + imagePath;
                } else {
                    image = imagePath;
                }
            }
            
            return {
                id: item.idMateriel,
                name: item.nom,
                price: item.prix,
                category: item.categorie || 'Non catégorisé',
                status: status,
                image: image,
                description: item.description || '',
                bookings: 0, // À calculer depuis les réservations
                revenue: 0,   // À calculer depuis les factures
                rating: 4.5  // Valeur par défaut
            };
        });
        
        displayEquipment(equipment);
    })
    .catch(error => {
        console.error('Erreur lors du chargement des matériels:', error);
        // Afficher un message d'erreur
        const grid = document.getElementById('equipmentGrid');
        const emptyState = document.getElementById('emptyState');
        if (grid) grid.style.display = 'none';
        if (emptyState) {
            emptyState.style.display = 'block';
            emptyState.innerHTML = `
                <i class="fas fa-exclamation-triangle fa-3x text-warning mb-3"></i>
                <h4 class="text-warning">Erreur lors du chargement</h4>
                <p class="text-muted">${error.message}</p>
                <button class="btn btn-primary" onclick="loadEquipment()">
                    <i class="fas fa-redo me-2"></i>Réessayer
                </button>
            `;
        }
    });
}

function displayEquipment(equipment) {
    const grid = document.getElementById('equipmentGrid');
    const emptyState = document.getElementById('emptyState');
    const equipmentCount = document.getElementById('equipmentCount');
    
    if (equipment.length === 0) {
        grid.style.display = 'none';
        emptyState.style.display = 'block';
        equipmentCount.textContent = '0';
        return;
    }
    
    grid.style.display = 'flex';
    emptyState.style.display = 'none';
    equipmentCount.textContent = equipment.length;
    
    grid.innerHTML = equipment.map(item => {
        let statusClass, statusText;
        if (item.status === 'available') {
            statusClass = 'bg-success';
            statusText = 'Disponible';
        } else if (item.status === 'rented') {
            statusClass = 'bg-warning';
            statusText = 'Loué';
        } else {
            statusClass = 'bg-secondary';
            statusText = 'Maintenance';
        }
        
        // Generate star rating
        const stars = Array.from({length: 5}, (_, i) => {
            if (i < Math.floor(item.rating)) {
                return '<i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>';
            } else if (i === Math.floor(item.rating) && item.rating % 1 !== 0) {
                return '<i class="fas fa-star-half-alt" style="color: #fbbf24; font-size: 0.875rem;"></i>';
            } else {
                return '<i class="far fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>';
            }
        }).join('');
        
        // Utiliser l'image réelle si disponible, sinon le placeholder
        const imageHtml = item.image && !item.image.includes('unsplash.com') 
            ? '<img src="' + item.image + '" alt="' + item.name + '" style="width: 100%; height: 100%; object-fit: cover;">'
            : '<div class="equipment-placeholder"><i class="fas fa-box"></i></div>';
        
        return '<div class="col-lg-4 col-md-6">' +
            '<div class="card card-modern card-equipment h-100">' +
                '<div class="position-relative equipment-image-container">' +
                    imageHtml +
                    '<div class="availability-badge">' + statusText + '</div>' +
                    '<div class="price-badge">' + item.price + ' MAD/jour</div>' +
                '</div>' +
                '<div class="card-body">' +
                    '<div class="mb-2">' +
                        '<span class="badge" style="background: linear-gradient(135deg, rgba(37, 99, 235, 0.1), rgba(37, 99, 235, 0.2)); color: var(--primary-600); font-size: 0.75rem; padding: 0.375rem 0.75rem; border-radius: 0.5rem; font-weight: 600;">' +
                            '<i class="fas fa-tag me-1"></i>' + item.category +
                        '</span>' +
                    '</div>' +
                    '<h5 class="card-title mb-2">' + item.name + '</h5>' +
                    '<p class="card-text text-muted mb-3" style="font-size: 0.9375rem; line-height: 1.6;">' + (item.description || 'Équipement professionnel de qualité') + '</p>' +
                    '<div class="d-flex align-items-center mb-3">' +
                        '<div class="rating me-2">' + stars + '</div>' +
                        '<small class="text-muted">(' + item.rating + ')</small>' +
                    '</div>' +
                    '<div class="d-flex gap-2 align-items-stretch">' +
                        '<button class="btn btn-sm btn-outline-primary flex-fill" onclick="editEquipment(' + item.id + ')">' +
                            '<i class="fas fa-edit me-1"></i>Modifier' +
                        '</button>' +
                        '<button class="btn btn-sm btn-outline-danger" onclick="deleteEquipment(' + item.id + ')">' +
                            '<i class="fas fa-trash"></i>' +
                        '</button>' +
                    '</div>' +
                '</div>' +
            '</div>' +
        '</div>';
    }).join('');
}

function setupPreviewUpdates() {
    const nameInput = document.getElementById('equipmentName');
    const priceInput = document.getElementById('equipmentPrice');
    const categorySelect = document.getElementById('equipmentCategory');
    const previewTitle = document.getElementById('previewTitle');
    const previewCategory = document.getElementById('previewCategory');
    const previewPrice = document.getElementById('previewPrice');
    
    if (nameInput && previewTitle) {
        nameInput.addEventListener('input', function() {
            previewTitle.textContent = this.value || 'Nom du matériel';
        });
    }
    
    if (priceInput && previewPrice) {
        priceInput.addEventListener('input', function() {
            const price = this.value || '0';
            previewPrice.textContent = price + ' MAD/jour';
        });
    }
    
    if (categorySelect && previewCategory) {
        categorySelect.addEventListener('change', function() {
            const selectedOption = this.options[this.selectedIndex];
            previewCategory.textContent = selectedOption.text || 'Catégorie';
        });
    }
}

// Global array to store selected images
let selectedImages = [];

// Add images to preview (incremental)
function addImagesToPreview() {
    const fileInput = document.getElementById('equipmentPhotos');
    const newFiles = Array.from(fileInput.files);
    
    console.log('New files selected:', newFiles.length);
    
    // Add new files to the global array
    newFiles.forEach(file => {
        if (file.type.startsWith('image/') && !selectedImages.some(img => img.name === file.name && img.size === file.size)) {
            selectedImages.push(file);
            console.log('Added image:', file.name);
        }
    });
    
    // Update the file input to reflect all selected images
    updateFileInput();
    
    // Update the preview
    updateImagePreviewFromArray();
    
    // Clear the file input so it can be used again
    fileInput.value = '';
}

// Update file input with all selected images
function updateFileInput() {
    const fileInput = document.getElementById('equipmentPhotos');
    const dt = new DataTransfer();
    
    selectedImages.forEach(file => {
        dt.items.add(file);
    });
    
    fileInput.files = dt.files;
    console.log('File input updated with', selectedImages.length, 'images');
}

// Update preview from the global array
function updateImagePreviewFromArray() {
    const previewContainer = document.getElementById('imagePreviewContainer');
    const previewGrid = document.getElementById('imagePreviewGrid');
    const imageCount = document.getElementById('imageCount');
    const processingIndicator = document.getElementById('imageProcessingIndicator');
    
    console.log('Updating preview with', selectedImages.length, 'images');
    
    if (selectedImages.length > 0) {
        previewContainer.classList.remove('d-none');
        previewGrid.innerHTML = '';
        processingIndicator.classList.remove('d-none');
        
        let processedCount = 0;
        
        selectedImages.forEach((file, index) => {
            console.log('Processing image:', index, file.name);
            
            const reader = new FileReader();
            reader.onload = function(e) {
                const previewItem = document.createElement('div');
                previewItem.className = 'image-preview-item';
                previewItem.innerHTML = 
                    '<img src="' + e.target.result + '" alt="Preview ' + (index + 1) + '">' +
                    '<div class="image-preview-overlay">' +
                        '<button type="button" class="btn btn-danger btn-sm" onclick="removeImagePreview(' + index + ')">' +
                            '<i class="fas fa-times"></i>' +
                        '</button>' +
                    '</div>';
                previewGrid.appendChild(previewItem);
                processedCount++;
                console.log('Added preview for image:', index + 1, 'Total processed:', processedCount);
                
                // Update the main preview card with the first image
                if (index === 0) {
                    updateMainPreviewImage(e.target.result);
                }
                
                // Hide processing indicator when all images are loaded
                if (processedCount === selectedImages.length) {
                    processingIndicator.classList.add('d-none');
                    console.log('All images processed. Total:', selectedImages.length);
                }
            };
            reader.readAsDataURL(file);
        });
        
        imageCount.textContent = selectedImages.length;
    } else {
        previewContainer.classList.add('d-none');
        processingIndicator.classList.add('d-none');
        // Reset main preview to placeholder
        resetMainPreviewImage();
    }
}

// Update the main preview card with the first image
function updateMainPreviewImage(imageSrc) {
    const previewImageContainer = document.querySelector('.preview-image-container');
    if (previewImageContainer) {
        previewImageContainer.innerHTML = '<img src="' + imageSrc + '" alt="Equipment Preview" class="preview-image" style="width: 100%; height: 100%; object-fit: cover; border-radius: 0.5rem;">';
    }
}

// Reset the main preview card to placeholder
function resetMainPreviewImage() {
    const previewImageContainer = document.querySelector('.preview-image-container');
    if (previewImageContainer) {
        previewImageContainer.innerHTML = 
            '<div class="preview-placeholder">' +
                '<i class="fas fa-camera"></i>' +
                '<span>Aperçu</span>' +
            '</div>';
    }
}

// Image preview functionality
function updateImagePreview() {
    const fileInput = document.getElementById('equipmentPhotos');
    const previewContainer = document.getElementById('imagePreviewContainer');
    const previewGrid = document.getElementById('imagePreviewGrid');
    const imageCount = document.getElementById('imageCount');
    const processingIndicator = document.getElementById('imageProcessingIndicator');
    
    const files = fileInput.files;
    
    console.log('Selected files:', files.length); // Debug log
    
    if (files.length > 0) {
        previewContainer.classList.remove('d-none');
        previewGrid.innerHTML = '';
        processingIndicator.classList.remove('d-none');
        
        let processedCount = 0;
        const totalImages = Array.from(files).filter(file => file.type.startsWith('image/')).length;
        
        // Process all files sequentially
        Array.from(files).forEach((file, index) => {
            console.log('Processing file:', index, file.name, file.type); // Debug log
            
            if (file.type.startsWith('image/')) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const previewItem = document.createElement('div');
                    previewItem.className = 'image-preview-item';
                    previewItem.innerHTML = 
                        '<img src="' + e.target.result + '" alt="Preview ' + (index + 1) + '">' +
                        '<div class="image-preview-overlay">' +
                            '<button type="button" class="btn btn-danger btn-sm" onclick="removeImagePreview(' + index + ')">' +
                                '<i class="fas fa-times"></i>' +
                            '</button>' +
                        '</div>';
                    previewGrid.appendChild(previewItem);
                    processedCount++;
                    console.log('Added preview for image:', index + 1, 'Total processed:', processedCount); // Debug log
                    
                    // Hide processing indicator when all images are loaded
                    if (processedCount === totalImages) {
                        processingIndicator.classList.add('d-none');
                        console.log('All images processed. Total:', totalImages); // Debug log
                    }
                };
                reader.readAsDataURL(file);
            } else {
                console.log('Skipped non-image file:', file.name); // Debug log
            }
        });
        
        imageCount.textContent = totalImages;
        console.log('Total images to display:', totalImages); // Debug log
    } else {
        previewContainer.classList.add('d-none');
        processingIndicator.classList.add('d-none');
        console.log('No files selected'); // Debug log
    }
}

// Remove individual image preview
function removeImagePreview(index) {
    console.log('Removing image at index:', index);
    
    // Remove from global array
    selectedImages.splice(index, 1);
    
    // Update file input
    updateFileInput();
    
    // Update preview
    updateImagePreviewFromArray();
    
    console.log('Remaining images:', selectedImages.length);
}

function showAddEquipmentModal() {
    document.getElementById('modalTitle').textContent = 'Ajouter du matériel';
    document.querySelector('.modal-subtitle').textContent = 'Remplissez les informations de votre équipement';
    document.getElementById('equipmentForm').reset();
    document.getElementById('equipmentId').value = '';
    
    // Clear selected images array
    selectedImages = [];
    photosToDelete = [];
    
    // Hide preview container
    const previewContainer = document.getElementById('imagePreviewContainer');
    if (previewContainer) {
        previewContainer.classList.add('d-none');
    }
    
    // Reset image count
    const imageCount = document.getElementById('imageCount');
    if (imageCount) {
        imageCount.textContent = '0';
    }
    
    // Reset main preview image
    resetMainPreviewImage();
    
    // Reset preview
    document.getElementById('previewTitle').textContent = 'Nom du matériel';
    document.getElementById('previewCategory').textContent = 'Catégorie';
    document.getElementById('previewPrice').textContent = '0 MAD/jour';
    
    equipmentModal.show();
}

function editEquipment(id) {
    document.getElementById('modalTitle').textContent = 'Modifier le matériel';
    document.querySelector('.modal-subtitle').textContent = 'Modifiez les informations de votre équipement';
    document.getElementById('equipmentId').value = id;
    
    // Charger les données du matériel depuis l'API
    const apiUrl = '${pageContext.request.contextPath}/api/materiel/' + id;
    
    fetch(apiUrl, {
        method: 'GET',
        credentials: 'include'
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('HTTP error! status: ' + response.status);
        }
        return response.json();
    })
    .then(data => {
        console.log('Données du matériel chargées:', data);
        
        // Remplir le formulaire avec les données
        document.getElementById('equipmentName').value = data.nom || '';
        document.getElementById('equipmentPrice').value = data.prix || '';
        document.getElementById('equipmentCategory').value = data.categorie || '';
        document.getElementById('equipmentDescription').value = data.description || '';
        
        // Définir le statut
        const statusSelect = document.getElementById('equipmentStatus');
        if (data.disponibilite) {
            statusSelect.value = 'available';
        } else {
            statusSelect.value = 'unavailable';
        }
        
        // Mettre à jour l'aperçu
        document.getElementById('previewTitle').textContent = data.nom || 'Nom du matériel';
        document.getElementById('previewCategory').textContent = data.categorie || 'Catégorie';
        document.getElementById('previewPrice').textContent = (data.prix || 0) + ' MAD/jour';
        
        // Charger les images existantes
        selectedImages = [];
        photosToDelete = [];
        const previewContainer = document.getElementById('imagePreviewContainer');
        const previewGrid = document.getElementById('imagePreviewGrid');
        
        if (data.images && data.images.length > 0) {
            previewContainer.classList.remove('d-none');
            previewGrid.innerHTML = '';
            
            data.images.forEach((imageData, index) => {
                // Gérer les deux formats : objet {id, url} ou string (ancien format)
                let imageId = 0;
                let imageUrl = '';
                let fullUrl = '';
                
                if (typeof imageData === 'object' && imageData.id !== undefined) {
                    imageId = imageData.id;
                    imageUrl = imageData.url || imageData.urlPhoto || '';
                } else {
                    // Ancien format (string)
                    imageUrl = imageData;
                }
                
                // Construire l'URL complète
                fullUrl = imageUrl;
                if (imageUrl && !imageUrl.startsWith('http')) {
                    fullUrl = '${pageContext.request.contextPath}/' + imageUrl;
                }
                
                const previewItem = document.createElement('div');
                previewItem.className = 'image-preview-item';
                previewItem.setAttribute('data-photo-id', imageId);
                previewItem.setAttribute('data-image-url', imageUrl);
                previewItem.innerHTML = 
                    '<img src="' + fullUrl + '" alt="Photo ' + (index + 1) + '">' +
                    '<div class="image-preview-overlay">' +
                        '<button type="button" class="btn btn-danger btn-sm" onclick="removeExistingImage(this, ' + imageId + ')">' +
                            '<i class="fas fa-times"></i>' +
                        '</button>' +
                    '</div>';
                previewGrid.appendChild(previewItem);
                
                // Mettre à jour l'aperçu principal avec la première image
                if (index === 0) {
                    updateMainPreviewImage(fullUrl);
                }
            });
            
            document.getElementById('imageCount').textContent = data.images.length;
        } else {
            previewContainer.classList.add('d-none');
            resetMainPreviewImage();
        }
        
        // Ouvrir le modal
        equipmentModal.show();
    })
    .catch(error => {
        console.error('Erreur lors du chargement du matériel:', error);
        if (window.notificationSystem) {
            notificationSystem.error('Erreur lors du chargement du matériel');
        } else {
            alert('Erreur lors du chargement du matériel');
        }
    });
}

// Variable pour stocker les IDs des photos à supprimer
let photosToDelete = [];

function removeExistingImage(button, photoId) {
    // Ajouter l'ID de la photo à la liste des photos à supprimer
    if (photoId > 0) {
        photosToDelete.push(photoId);
    }
    
    // Supprimer l'élément du DOM
    button.closest('.image-preview-item').remove();
    
    // Mettre à jour le compteur
    const imageCount = document.getElementById('imageCount');
    const currentCount = parseInt(imageCount.textContent) || 0;
    imageCount.textContent = Math.max(0, currentCount - 1);
    
    // Si plus d'images, cacher le conteneur
    const previewGrid = document.getElementById('imagePreviewGrid');
    if (previewGrid.children.length === 0) {
        document.getElementById('imagePreviewContainer').classList.add('d-none');
        resetMainPreviewImage();
    }
}

function saveEquipment() {
    const form = document.getElementById('equipmentForm');
    if (!form.checkValidity()) {
        form.reportValidity();
        return;
    }
    
    // Vérifier que l'utilisateur est connecté en tant que partenaire
    console.log('Vérification de la session avant envoi...');
    
    // Récupérer les valeurs du formulaire
    const equipmentId = document.getElementById('equipmentId').value;
    const nom = document.getElementById('equipmentName').value;
    const prix = document.getElementById('equipmentPrice').value;
    const categorie = document.getElementById('equipmentCategory').value;
    const disponibilite = document.getElementById('equipmentStatus').value;
    const description = document.getElementById('equipmentDescription').value;
    
    // Validation
    if (!nom || !prix || !categorie) {
        if (window.notificationSystem) {
            notificationSystem.error('Veuillez remplir tous les champs obligatoires');
        } else {
            alert('Veuillez remplir tous les champs obligatoires');
        }
        return;
    }
    
    // Créer FormData pour envoyer les données avec les fichiers
    const formData = new FormData();
    
    // Si c'est une modification, ajouter l'ID
    if (equipmentId) {
        formData.append('idMateriel', equipmentId);
    }
    
    formData.append('nom', nom);
    formData.append('prix', prix);
    formData.append('categorie', categorie);
    formData.append('disponibilite', disponibilite);
    if (description) {
        formData.append('description', description);
    }
    
    // Ajouter les photos à supprimer (pour la modification)
    if (photosToDelete.length > 0) {
        formData.append('photosToDelete', photosToDelete.join(','));
    }
    
    // Ajouter les nouvelles images sélectionnées
    const fileInput = document.getElementById('equipmentPhotos');
    if (fileInput && fileInput.files) {
        for (let i = 0; i < fileInput.files.length; i++) {
            formData.append('photos', fileInput.files[i]);
        }
    }
    
    // Désactiver le bouton de soumission
    const submitBtn = document.querySelector('button[onclick="saveEquipment()"]');
    const originalText = submitBtn.innerHTML;
    submitBtn.disabled = true;
    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Enregistrement...';
    
    // Déterminer l'URL du servlet (ajout ou modification)
    const servletUrl = equipmentId 
        ? '${pageContext.request.contextPath}/partner/update-materiel'
        : '${pageContext.request.contextPath}/partner/add-materiel';
    
    console.log('Envoi des données à:', servletUrl);
    console.log('Mode:', equipmentId ? 'Modification' : 'Ajout');
    
    fetch(servletUrl, {
        method: 'POST',
        body: formData,
        credentials: 'include'
    })
    .then(response => {
        console.log('Réponse reçue, status:', response.status);
        if (!response.ok) {
            throw new Error('HTTP error! status: ' + response.status);
        }
        return response.json();
    })
    .then(data => {
        console.log('Données reçues:', data);
        if (data.success) {
            // Succès
            const successMsg = equipmentId 
                ? 'Équipement modifié avec succès !'
                : 'Équipement ajouté avec succès !';
            
            if (window.notificationSystem) {
                notificationSystem.success(successMsg);
            } else {
                alert(successMsg);
            }
            
            // Fermer le modal
            equipmentModal.hide();
            
            // Réinitialiser le formulaire
            form.reset();
            document.getElementById('equipmentId').value = '';
            selectedImages = [];
            photosToDelete = [];
            const previewContainer = document.getElementById('imagePreviewContainer');
            if (previewContainer) {
                previewContainer.classList.add('d-none');
            }
            resetMainPreviewImage();
            
            // Réinitialiser le titre du modal
            document.getElementById('modalTitle').textContent = 'Ajouter du matériel';
            document.querySelector('.modal-subtitle').textContent = 'Remplissez les informations de votre équipement';
            
            // Recharger la liste des équipements
            loadEquipment();
        } else {
            // Erreur
            const errorMsg = data.error || 'Erreur lors de l\'enregistrement de l\'équipement';
            if (window.notificationSystem) {
                notificationSystem.error(errorMsg);
            } else {
                alert(errorMsg);
            }
            
            // Si l'erreur indique qu'il faut se reconnecter, rediriger vers la page de connexion
            if (data.redirect || errorMsg.includes('connecté') || errorMsg.includes('reconnecter')) {
                setTimeout(() => {
                    window.location.href = '${pageContext.request.contextPath}/pages/auth/login.jsp';
                }, 2000);
            }
        }
    })
    .catch(error => {
        console.error('Erreur détaillée:', error);
        let errorMessage = 'Erreur lors de l\'envoi des données';
        if (error.message) {
            errorMessage += ': ' + error.message;
        }
        if (window.notificationSystem) {
            notificationSystem.error(errorMessage);
        } else {
            alert(errorMessage);
        }
    })
    .finally(() => {
        // Réactiver le bouton
        submitBtn.disabled = false;
        submitBtn.innerHTML = originalText;
    });
}

let equipmentToDelete = null;

function deleteEquipment(id) {
    equipmentToDelete = id;
    const deleteModal = new bootstrap.Modal(document.getElementById('deleteConfirmModal'));
    deleteModal.show();
}

function confirmDelete() {
    if (!equipmentToDelete) {
        return;
    }
    
    const deleteModal = bootstrap.Modal.getInstance(document.getElementById('deleteConfirmModal'));
    const deleteBtn = deleteModal._element.querySelector('button[onclick="confirmDelete()"]');
    const originalText = deleteBtn.innerHTML;
    deleteBtn.disabled = true;
    deleteBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Suppression...';
    
    // Créer les paramètres URL-encoded pour envoyer l'ID du matériel
    const params = new URLSearchParams();
    params.append('idMateriel', equipmentToDelete);
    
    // Appeler le servlet de suppression
    fetch('${pageContext.request.contextPath}/partner/delete-materiel', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: params.toString(),
        credentials: 'include'
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('HTTP error! status: ' + response.status);
        }
        return response.json();
    })
    .then(data => {
        if (data.success) {
            // Succès
            if (window.notificationSystem) {
                notificationSystem.success('Équipement supprimé avec succès !');
            } else {
                alert('Équipement supprimé avec succès !');
            }
            
            // Fermer le modal
            deleteModal.hide();
            
            // Recharger la liste des équipements
            loadEquipment();
        } else {
            // Erreur
            const errorMsg = data.error || 'Erreur lors de la suppression de l\'équipement';
            if (window.notificationSystem) {
                notificationSystem.error(errorMsg);
            } else {
                alert(errorMsg);
            }
        }
    })
    .catch(error => {
        console.error('Erreur lors de la suppression:', error);
        const errorMessage = 'Erreur lors de la suppression: ' + (error.message || 'Erreur inconnue');
        if (window.notificationSystem) {
            notificationSystem.error(errorMessage);
        } else {
            alert(errorMessage);
        }
    })
    .finally(() => {
        // Réactiver le bouton
        deleteBtn.disabled = false;
        deleteBtn.innerHTML = originalText;
        equipmentToDelete = null;
    });
}

function cancelDelete() {
    equipmentToDelete = null;
    const deleteModal = bootstrap.Modal.getInstance(document.getElementById('deleteConfirmModal'));
    deleteModal.hide();
}

function filterEquipment() {
    // Implement filtering logic
    loadEquipment();
}
</script>

<style>
/* Delete Modal Enhancements */
#deleteConfirmModal .modal-content {
    animation: modalSlideIn 0.3s ease-out;
}

#deleteConfirmModal .btn-outline-secondary:hover {
    background-color: #f1f5f9;
    border-color: #94a3b8;
    color: #475569;
    transform: translateY(-1px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

#deleteConfirmModal .btn-danger:hover {
    background: linear-gradient(135deg, #dc2626, #b91c1c);
    transform: translateY(-1px);
    box-shadow: 0 6px 20px rgba(239, 68, 68, 0.4);
}

#deleteConfirmModal .btn-close:hover {
    opacity: 1 !important;
    transform: scale(1.1);
}

@keyframes modalSlideIn {
    from {
        opacity: 0;
        transform: translateY(-20px) scale(0.95);
    }
    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
}

/* Icon animation */
#deleteConfirmModal .fa-trash {
    animation: trashPulse 2s ease-in-out infinite;
}

@keyframes trashPulse {
    0%, 100% {
        transform: scale(1);
    }
    50% {
        transform: scale(1.05);
    }
}
</style>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="border-radius: 20px; border: none; box-shadow: 0 32px 80px rgba(0, 0, 0, 0.25), 0 0 0 1px rgba(255, 255, 255, 0.1); backdrop-filter: blur(20px); background: rgba(255, 255, 255, 0.98); position: relative; overflow: hidden;">
            <!-- Background Pattern -->
            <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: linear-gradient(135deg, rgba(239, 68, 68, 0.02) 0%, rgba(220, 38, 38, 0.01) 100%); pointer-events: none;"></div>
            
            <div class="modal-header" style="background: linear-gradient(135deg, #ef4444 0%, #dc2626 50%, #b91c1c 100%); color: white; border-radius: 20px 20px 0 0; border-bottom: none; padding: 1.75rem 2rem 1.5rem; position: relative; z-index: 1;">
                <div class="d-flex align-items-center">
                    <div style="width: 52px; height: 52px; border-radius: 14px; background: rgba(255, 255, 255, 0.25); display: flex; align-items: center; justify-content: center; margin-right: 1.25rem; box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);">
                        <i class="fas fa-exclamation-triangle" style="font-size: 1.375rem;"></i>
                    </div>
                    <div>
                        <h5 class="modal-title fw-bold mb-1" id="deleteConfirmModalLabel" style="font-size: 1.375rem; letter-spacing: -0.025em;">Confirmer la suppression</h5>
                        <p class="mb-0" style="opacity: 0.9; font-size: 0.9375rem; font-weight: 500;">Cette action est irréversible</p>
                    </div>
                </div>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" style="opacity: 0.8; filter: brightness(1.2);"></button>
            </div>
            
            <div class="modal-body" style="padding: 2.5rem 2rem; position: relative; z-index: 1;">
                <div class="text-center">
                    <div style="width: 88px; height: 88px; border-radius: 50%; background: linear-gradient(135deg, rgba(239, 68, 68, 0.12), rgba(220, 38, 38, 0.08)); display: flex; align-items: center; justify-content: center; margin: 0 auto 2rem; box-shadow: 0 8px 32px rgba(239, 68, 68, 0.15); border: 3px solid rgba(239, 68, 68, 0.1);">
                        <i class="fas fa-trash" style="font-size: 2.25rem; color: #ef4444;"></i>
                    </div>
                    <h6 class="fw-bold mb-3" style="color: #111827; font-size: 1.25rem; letter-spacing: -0.025em;">Êtes-vous sûr de vouloir supprimer cet équipement ?</h6>
                    <p class="text-muted mb-0" style="line-height: 1.7; font-size: 1rem; max-width: 400px; margin: 0 auto;">
                        Cette action supprimera définitivement l'équipement de votre catalogue et toutes les données associées.
                        <br><strong class="text-danger" style="font-weight: 600;">Cette action ne peut pas être annulée.</strong>
                    </p>
                </div>
            </div>
            
            <div class="modal-footer" style="padding: 1.5rem 2rem 2rem; background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%); border-radius: 0 0 20px 20px; border-top: 1px solid rgba(226, 232, 240, 0.8); position: relative; z-index: 1;">
                <div class="d-flex gap-3 w-100">
                    <button type="button" class="btn btn-outline-secondary flex-fill" onclick="cancelDelete()" style="border-radius: 12px; padding: 0.875rem 1.75rem; font-weight: 600; font-size: 0.9375rem; border-color: #cbd5e1; color: #64748b; transition: all 0.2s ease; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);">
                        <i class="fas fa-times me-2"></i>Annuler
                    </button>
                    <button type="button" class="btn btn-danger flex-fill" onclick="confirmDelete()" style="border-radius: 12px; padding: 0.875rem 1.75rem; font-weight: 600; font-size: 0.9375rem; background: linear-gradient(135deg, #ef4444, #dc2626); border: none; box-shadow: 0 4px 16px rgba(239, 68, 68, 0.3); transition: all 0.2s ease;">
                        <i class="fas fa-trash me-2"></i>Supprimer
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../../layouts/footer.jsp" %>

