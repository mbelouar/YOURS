<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Check if user is logged in and on specific page types
    boolean isClientPage = request.getRequestURI().contains("/client/");
    boolean isPartnerPage = request.getRequestURI().contains("/partner/");
    boolean isEquipmentPage = request.getRequestURI().contains("/equipment/");
    boolean isClientLoggedIn = session.getAttribute("client") != null;
    boolean isPartnerLoggedIn = session.getAttribute("partner") != null;
    boolean isLoggedIn = isClientLoggedIn || isPartnerLoggedIn;
    boolean showClientNav = (isClientPage || isEquipmentPage) && isClientLoggedIn;
    boolean showPartnerNav = isPartnerPage && isPartnerLoggedIn;
%>

<style>
/* Clean, minimal hover effects */

/* Notification Badge */
.notification-badge {
    position: absolute;
    top: -5px;
    right: -5px;
    background: #ef4444;
    color: white;
    border-radius: 50%;
    width: 18px;
    height: 18px;
    font-size: 0.75rem;
    font-weight: 600;
    display: flex;
    align-items: center;
    justify-content: center;
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.1); }
    100% { transform: scale(1); }
}

/* Notification Dropdown */
.notification-dropdown {
    max-height: 400px;
    overflow-y: auto;
}

.notification-item {
    padding: 1rem;
    border-bottom: 1px solid #f3f4f6;
    transition: background-color 0.2s ease;
}

.notification-item:hover {
    background-color: #f8fafc;
}

.notification-item:last-child {
    border-bottom: none;
}

.notification-item.unread {
    background-color: #eff6ff;
    border-left: 3px solid #3b82f6;
}

/* Simple Pickup Notification (One Line) */
.pickup-notification-simple {
    background: linear-gradient(135deg, #f0fdf4 0%, #ecfdf5 100%);
    border: none;
    border-left: 3px solid #10b981 !important;
    border-radius: 8px;
    padding: 0.75rem 1rem !important;
    transition: all 0.3s ease;
}

.pickup-notification-simple:hover {
    background: linear-gradient(135deg, #ecfdf5 0%, #d1fae5 100%);
    transform: translateX(2px);
}

.pickup-simple-content {
    display: flex;
    align-items: center;
    gap: 0.75rem;
}

.pickup-simple-icon {
    width: 36px;
    height: 36px;
    border-radius: 8px;
    background: linear-gradient(135deg, #10b981, #059669);
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

.pickup-simple-icon i {
    color: white;
    font-size: 1.125rem;
}

.pickup-simple-text {
    flex: 1;
    min-width: 0;
}

.pickup-simple-title {
    font-size: 0.9375rem;
    font-weight: 700;
    color: #065f46;
    margin-bottom: 0.125rem;
}

.pickup-simple-desc {
    font-size: 0.8125rem;
    color: #047857;
    margin-bottom: 0;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.btn-pickup-view {
    background: linear-gradient(135deg, #10b981, #059669);
    color: white;
    border: none;
    border-radius: 6px;
    padding: 0.375rem 0.75rem;
    font-size: 0.8125rem;
    font-weight: 600;
    display: flex;
    align-items: center;
    gap: 0.375rem;
    transition: all 0.3s ease;
    flex-shrink: 0;
}

.btn-pickup-view:hover {
    background: linear-gradient(135deg, #059669, #047857);
    transform: translateY(-1px);
    color: white;
}

.btn-pickup-view i {
    font-size: 0.875rem;
}

/* Enhanced Pickup Details Modal */
.pickup-modal-content {
    border: none;
    border-radius: 24px;
    overflow: hidden;
    box-shadow: 0 32px 80px rgba(0, 0, 0, 0.25), 0 0 0 1px rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(20px);
    background: rgba(255, 255, 255, 0.95);
    position: relative;
}

.pickup-modal-content::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.05) 0%, rgba(5, 150, 105, 0.02) 100%);
    pointer-events: none;
    z-index: 0;
}

.pickup-modal-content > * {
    position: relative;
    z-index: 1;
}

.pickup-modal-header {
    background: linear-gradient(135deg, #10b981 0%, #059669 50%, #047857 100%);
    color: white;
    padding: 1.25rem 1.5rem 1rem;
    border-bottom: none;
    position: relative;
    overflow: hidden;
}

.pickup-modal-header::before {
    content: '';
    position: absolute;
    top: -50%;
    right: -20%;
    width: 200px;
    height: 200px;
    background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
    border-radius: 50%;
    animation: float 6s ease-in-out infinite;
}

@keyframes float {
    0%, 100% { transform: translateY(0px) rotate(0deg); }
    50% { transform: translateY(-20px) rotate(180deg); }
}

.pickup-modal-icon {
    width: 40px;
    height: 40px;
    border-radius: 12px;
    background: rgba(255, 255, 255, 0.25);
    backdrop-filter: blur(10px);
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 1rem;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
    border: 1px solid rgba(255, 255, 255, 0.2);
}

.pickup-modal-icon i {
    font-size: 1.25rem;
    filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));
}

.pickup-modal-header .modal-title {
    color: white;
    font-weight: 700;
    font-size: 1.125rem;
    letter-spacing: -0.02em;
    text-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

.pickup-modal-body {
    padding: 1.25rem;
    background: transparent;
}

.pickup-modal-details {
    display: flex;
    flex-direction: column;
    gap: 0.875rem;
}

.pickup-modal-item {
    display: flex;
    align-items: flex-start;
    padding: 1rem;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.9) 0%, rgba(248, 250, 252, 0.8) 100%);
    border-radius: 12px;
    border: 1px solid rgba(16, 185, 129, 0.15);
    box-shadow: 0 2px 12px rgba(16, 185, 129, 0.08);
    backdrop-filter: blur(10px);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;
}

.pickup-modal-item::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 4px;
    height: 100%;
    background: linear-gradient(135deg, #10b981, #059669);
    border-radius: 0 2px 2px 0;
}

.pickup-modal-item:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 32px rgba(16, 185, 129, 0.15);
    border-color: rgba(16, 185, 129, 0.25);
}

.pickup-modal-item-icon {
    width: 36px;
    height: 36px;
    border-radius: 10px;
    background: linear-gradient(135deg, #10b981, #059669);
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 1rem;
    flex-shrink: 0;
    box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);
    position: relative;
}

.pickup-modal-item-icon::after {
    content: '';
    position: absolute;
    top: -2px;
    left: -2px;
    right: -2px;
    bottom: -2px;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.3), rgba(5, 150, 105, 0.3));
    border-radius: 14px;
    z-index: -1;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.pickup-modal-item:hover .pickup-modal-item-icon::after {
    opacity: 1;
}

.pickup-modal-item-icon i {
    color: white;
    font-size: 1rem;
    filter: drop-shadow(0 1px 2px rgba(0, 0, 0, 0.2));
}

.pickup-modal-item-content {
    flex: 1;
    display: flex;
    flex-direction: column;
}

.pickup-modal-label {
    font-size: 0.75rem;
    font-weight: 700;
    color: #047857;
    text-transform: uppercase;
    letter-spacing: 0.8px;
    margin-bottom: 0.5rem;
    opacity: 0.8;
}

.pickup-modal-value {
    font-size: 0.9375rem;
    font-weight: 600;
    color: #064e3b;
    line-height: 1.4;
    word-break: break-word;
}

.pickup-modal-footer {
    padding: 1rem 1.25rem;
    background: linear-gradient(135deg, rgba(248, 250, 252, 0.8) 0%, rgba(241, 245, 249, 0.6) 100%);
    border-top: 1px solid rgba(16, 185, 129, 0.1);
    backdrop-filter: blur(10px);
}

.pickup-modal-footer .btn-primary {
    background: linear-gradient(135deg, #10b981 0%, #059669 50%, #047857 100%);
    border: none;
    padding: 0.625rem 1.25rem;
    font-weight: 600;
    border-radius: 10px;
    font-size: 0.875rem;
    letter-spacing: 0.3px;
    text-transform: uppercase;
    box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;
}

.pickup-modal-footer .btn-primary::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
    transition: left 0.5s ease;
}

.pickup-modal-footer .btn-primary:hover::before {
    left: 100%;
}

.pickup-modal-footer .btn-primary:hover {
    background: linear-gradient(135deg, #059669 0%, #047857 50%, #065f46 100%);
    transform: translateY(-2px);
    box-shadow: 0 8px 24px rgba(16, 185, 129, 0.4);
}

.pickup-modal-footer .btn-primary:active {
    transform: translateY(0);
}

/* Modal Subtitle */
.pickup-modal-subtitle {
    font-size: 0.875rem;
    opacity: 0.9;
    font-weight: 500;
    margin-top: 0.25rem;
}

/* Instructions Section */
.pickup-modal-instructions {
    margin-top: 1.25rem;
    padding: 1rem;
    background: linear-gradient(135deg, rgba(59, 130, 246, 0.05) 0%, rgba(37, 99, 235, 0.02) 100%);
    border-radius: 12px;
    border: 1px solid rgba(59, 130, 246, 0.15);
}

.pickup-instructions-header {
    display: flex;
    align-items: center;
    margin-bottom: 0.75rem;
    gap: 0.5rem;
}

.pickup-instructions-header i {
    color: #3b82f6;
    font-size: 1rem;
}

.pickup-instructions-header h6 {
    margin: 0;
    font-weight: 600;
    color: #1e40af;
    font-size: 0.875rem;
}

.pickup-instructions-list {
    margin: 0;
    padding-left: 1.25rem;
    list-style: none;
}

.pickup-instructions-list li {
    position: relative;
    margin-bottom: 0.5rem;
    color: #374151;
    font-size: 0.8125rem;
    line-height: 1.4;
    font-weight: 500;
}

.pickup-instructions-list li::before {
    content: '✓';
    position: absolute;
    left: -1.25rem;
    color: #10b981;
    font-weight: 700;
    font-size: 0.75rem;
}

.pickup-instructions-list li:last-child {
    margin-bottom: 0;
}

/* Enhanced Footer Buttons */
.pickup-modal-footer .btn-outline-secondary {
    border: 2px solid #e5e7eb;
    color: #6b7280;
    font-weight: 600;
    border-radius: 10px;
    padding: 0.625rem 1rem;
    transition: all 0.3s ease;
    font-size: 0.8125rem;
}

.pickup-modal-footer .btn-outline-secondary:hover {
    background: #f9fafb;
    border-color: #d1d5db;
    color: #374151;
    transform: translateY(-1px);
}

/* Responsive Modal */
@media (max-width: 768px) {
    .pickup-modal-content {
        margin: 1rem;
        border-radius: 20px;
    }
    
    .pickup-modal-header {
        padding: 1.5rem 1.5rem 1rem;
    }
    
    .pickup-modal-body {
        padding: 1.5rem;
    }
    
    .pickup-modal-item {
        padding: 1.25rem;
    }
    
    .pickup-modal-instructions {
        padding: 1.25rem;
    }
    
    .pickup-modal-footer {
        padding: 1.25rem 1.5rem;
    }
    
    .pickup-modal-footer .d-flex {
        flex-direction: column;
        gap: 0.75rem !important;
    }
}

/* Responsive */
@media (max-width: 576px) {
    .pickup-simple-desc {
        font-size: 0.75rem;
    }
    
    .btn-pickup-view span {
        display: none;
    }
    
    .btn-pickup-view {
        padding: 0.375rem 0.5rem;
    }
}

/* Dropdown menu items */
#clientDropdownMenu .dropdown-item {
    padding: 0.75rem 1rem !important;
    margin: 0.1rem 0 !important;
    border-radius: 0.375rem !important;
    transition: all 0.2s ease !important;
    color: #6b7280 !important;
    font-weight: 500 !important;
    border: none !important;
}

#clientDropdownMenu .dropdown-item:hover {
    background-color: #374151 !important;
    color: white !important;
}

#clientDropdownMenu .dropdown-item.active {
    background-color: #dbeafe !important;
    color: #1e40af !important;
    font-weight: 600 !important;
}

#clientDropdownMenu .dropdown-item.active:hover {
    background-color: #1e40af !important;
    color: white !important;
}

#clientDropdownMenu .dropdown-item.text-danger {
    color: #dc2626 !important;
}

#clientDropdownMenu .dropdown-item.text-danger:hover {
    background-color: #dc2626 !important;
    color: white !important;
}

/* Main navigation items */
.navbar-client-dashboard .nav-link-client {
    padding: 0.5rem 0.75rem !important;
    margin: 0 0.125rem !important;
    border-radius: 0.75rem !important;
    transition: all 0.2s ease !important;
    color: #6b7280 !important;
    font-weight: 500 !important;
    border: none !important;
}

.navbar-client-dashboard .nav-link-client:hover {
    background-color: #374151 !important;
    color: white !important;
}

/* Profile dropdown button special styling */
.navbar-client-dashboard .nav-link-client[data-bs-toggle="dropdown"]:hover {
    background-color: #dbeafe !important;
    color: #1e40af !important;
}

.navbar-client-dashboard .nav-link-client.active {
    background-color: #dbeafe !important;
    color: #1e40af !important;
    font-weight: 600 !important;
}

.navbar-client-dashboard .nav-link-client.active:hover {
    background-color: #1e40af !important;
    color: white !important;
}

/* User avatar */
.navbar-client-dashboard .user-avatar {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 0.875rem;
    margin-right: 0.5rem;
    transition: all 0.2s ease;
}

/* User avatar large for dropdown header */
.user-avatar-large {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 1.25rem;
    margin-right: 0.75rem;
    transition: all 0.2s ease;
    flex-shrink: 0;
}

.navbar-client-dashboard .nav-link-client:hover .user-avatar {
    transform: scale(1.05);
    box-shadow: 0 2px 8px rgba(37, 99, 235, 0.3);
}

/* Dropdown menu */
#clientDropdownMenu {
    border: 1px solid #e5e7eb !important;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1) !important;
    border-radius: 0.5rem !important;
    padding: 0.5rem !important;
    margin-top: 0.5rem !important;
    min-width: 300px !important;
}

/* Dropdown header styling */
#clientDropdownMenu .dropdown-header {
    padding: 1rem !important;
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%) !important;
    border-bottom: 1px solid #e5e7eb !important;
    border-radius: 0.5rem 0.5rem 0 0 !important;
    margin: -0.5rem -0.5rem 0.5rem -0.5rem !important;
}

/* Client dropdown header styling moved to CSS for consistency */

#clientDropdownMenu .dropdown-divider {
    margin: 0.5rem 0 !important;
    border-color: #e5e7eb !important;
}

/* Partner Dashboard Navigation */
.navbar-partner-dashboard .nav-link-partner {
    padding: 0.5rem 0.75rem !important;
    margin: 0 0.125rem !important;
    border-radius: 0.75rem !important;
    transition: all 0.2s ease !important;
    color: #6b7280 !important;
    font-weight: 500 !important;
    text-decoration: none !important;
}

.navbar-partner-dashboard .nav-link-partner:hover {
    background-color: #374151 !important;
    color: white !important;
}

.navbar-partner-dashboard .nav-link-partner[data-bs-toggle="dropdown"]:hover {
    background-color: #dbeafe !important;
    color: #1e40af !important;
}

.navbar-partner-dashboard .nav-link-partner.active {
    background-color: #dbeafe !important;
    color: #1e40af !important;
    font-weight: 600 !important;
}

.navbar-partner-dashboard .nav-link-partner.active:hover {
    background-color: #1e40af !important;
    color: white !important;
}

.navbar-partner-dashboard .user-avatar {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 0.875rem;
    margin-right: 0.5rem;
    transition: all 0.2s ease;
}

.navbar-partner-dashboard .nav-link-partner:hover .user-avatar {
    transform: scale(1.05);
    box-shadow: 0 2px 8px rgba(37, 99, 235, 0.3);
}

/* Partner Dropdown menu */
#partnerDropdownMenu {
    border: 1px solid #e5e7eb !important;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1) !important;
    border-radius: 0.5rem !important;
    padding: 0.5rem !important;
    margin-top: 0.5rem !important;
    min-width: 300px !important;
}

/* Partner dropdown header styling */
#partnerDropdownMenu .dropdown-header {
    padding: 1rem !important;
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%) !important;
    border-bottom: 1px solid #e5e7eb !important;
    border-radius: 0.5rem 0.5rem 0 0 !important;
    margin: -0.5rem -0.5rem 0.5rem -0.5rem !important;
}

#partnerDropdownMenu .dropdown-item {
    padding: 0.75rem 1rem !important;
    margin: 0.1rem 0 !important;
    border-radius: 0.375rem !important;
    transition: all 0.2s ease !important;
    color: #6b7280 !important;
    font-weight: 500 !important;
    border: none !important;
}

#partnerDropdownMenu .dropdown-item:hover {
    background-color: #374151 !important;
    color: white !important;
}

#partnerDropdownMenu .dropdown-item.active {
    background-color: #dbeafe !important;
    color: #1e40af !important;
    font-weight: 600 !important;
}

#partnerDropdownMenu .dropdown-item.active:hover {
    background-color: #1e40af !important;
    color: white !important;
}

#partnerDropdownMenu .dropdown-item.text-danger {
    color: #dc2626 !important;
}

#partnerDropdownMenu .dropdown-item.text-danger:hover {
    background-color: #dc2626 !important;
    color: white !important;
}

/* Public navigation items styling */
.navbar-modern .nav-link-modern {
    padding: 0.5rem 0.75rem !important;
    margin: 0 0.125rem !important;
    border-radius: 0.75rem !important;
    transition: all 0.2s ease !important;
    color: #6b7280 !important;
    font-weight: 500 !important;
    border: none !important;
}

.navbar-modern .nav-link-modern:hover {
    background-color: #374151 !important;
    color: white !important;
}

.navbar-modern .nav-link-modern.active {
    background-color: #dbeafe !important;
    color: #1e40af !important;
    font-weight: 600 !important;
}

.navbar-modern .nav-link-modern.active:hover {
    background-color: #1e40af !important;
    color: white !important;
}

/* Enhanced Authentication Buttons */
.btn-auth-login {
    background: transparent !important;
    color: var(--primary-600) !important;
    border: 2px solid var(--primary-600) !important;
    border-radius: 0.75rem !important;
    padding: 0.75rem 1.5rem !important;
    font-weight: 600 !important;
    font-size: 0.9375rem !important;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
    text-decoration: none !important;
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    letter-spacing: 0.01em !important;
    position: relative !important;
    overflow: hidden !important;
    min-width: 120px !important;
    height: 40px !important;
    box-shadow: 0 2px 4px rgba(37, 99, 235, 0.1) !important;
}

.btn-auth-login::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(37, 99, 235, 0.1), transparent);
    transition: left 0.6s ease;
}

.btn-auth-login:hover {
    background: var(--primary-600) !important;
    color: white !important;
    border-color: var(--primary-600) !important;
    transform: translateY(-2px) scale(1.02) !important;
    box-shadow: 0 8px 20px -5px rgba(37, 99, 235, 0.3), 0 4px 8px -2px rgba(37, 99, 235, 0.2) !important;
    text-decoration: none !important;
}

.btn-auth-login:hover::before {
    left: 100%;
}

.btn-auth-login:active {
    transform: translateY(-1px) scale(1.01) !important;
    box-shadow: 0 4px 12px -2px rgba(37, 99, 235, 0.3) !important;
}

.btn-auth-login i {
    transition: transform 0.3s ease;
}

.btn-auth-login:hover i {
    transform: translateX(2px);
}

.btn-auth-signup {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700)) !important;
    border: none !important;
    color: white !important;
    font-weight: 700 !important;
    padding: 0.75rem 1.5rem !important;
    border-radius: 0.75rem !important;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
    position: relative !important;
    overflow: hidden !important;
    box-shadow: 0 4px 12px -2px rgba(37, 99, 235, 0.3) !important;
    letter-spacing: 0.01em !important;
    text-decoration: none !important;
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    min-width: 130px !important;
    height: 40px !important;
}

.btn-auth-signup::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.25), transparent);
    transition: left 0.6s ease;
}

.btn-auth-signup:hover {
    background: linear-gradient(135deg, var(--primary-700), var(--primary-800)) !important;
    transform: translateY(-3px) scale(1.02) !important;
    box-shadow: 0 12px 25px -5px rgba(37, 99, 235, 0.4), 0 6px 12px -2px rgba(37, 99, 235, 0.3) !important;
    color: white !important;
    text-decoration: none !important;
}

.btn-auth-signup:hover::before {
    left: 100%;
}

.btn-auth-signup:active {
    transform: translateY(-1px) scale(1.01) !important;
    box-shadow: 0 6px 16px -2px rgba(37, 99, 235, 0.4) !important;
}

.btn-auth-signup i {
    transition: transform 0.3s ease;
}

.btn-auth-signup:hover i {
    transform: translateX(2px) scale(1.1);
}

/* Focus states for accessibility */
.btn-auth-login:focus,
.btn-auth-signup:focus {
    outline: 2px solid var(--primary-500) !important;
    outline-offset: 2px !important;
}

/* Mobile responsive adjustments */
@media (max-width: 768px) {
    .btn-auth-login,
    .btn-auth-signup {
        padding: 0.625rem 1.25rem !important;
        font-size: 0.875rem !important;
        min-width: 100px !important;
        height: 38px !important;
    }
    
    .navbar-nav .nav-item.ms-3 {
        margin-left: 0.75rem !important;
    }
}

@media (max-width: 576px) {
    .btn-auth-login,
    .btn-auth-signup {
        padding: 0.5rem 1rem !important;
        font-size: 0.8125rem !important;
        min-width: 90px !important;
        height: 36px !important;
    }
    
    .navbar-nav .nav-item.ms-3 {
        margin-left: 0.5rem !important;
    }
    
    .btn-auth-login i,
    .btn-auth-signup i {
        margin-right: 0.375rem !important;
    }
}
</style>

<script>
// Check for client-side user session
function checkClientSession() {
    try {
        const user = localStorage.getItem('yours_user') || sessionStorage.getItem('yours_user');
        if (user) {
            // Parse user data
            const userData = JSON.parse(user);
            
            // Check if user is a client and on relevant pages (client pages or equipment pages)
            const isClientUser = userData.type === 'client';
            const isPartnerUser = userData.type === 'partner';
            const isClientPage = window.location.pathname.includes('/client/');
            const isPartnerPage = window.location.pathname.includes('/partner/');
            const isEquipmentPage = window.location.pathname.includes('/equipment/');
            
            if (isClientUser && (isClientPage || isEquipmentPage)) {
                // Force show client navigation
                const clientNav = document.querySelector('.navbar-client-dashboard');
                const partnerNav = document.querySelector('.navbar-partner-dashboard');
                const publicNav = document.querySelector('.navbar-modern');
                if (clientNav && publicNav) {
                    publicNav.style.display = 'none';
                    if (partnerNav) partnerNav.style.display = 'none';
                    clientNav.style.display = 'block';
                    
                    // DISABLED: Let JSP handle the display completely
                    // const userName = document.getElementById('clientUserName');
                    // const userFullName = document.getElementById('clientUserFullName');
                    // const userEmail = document.getElementById('clientUserEmail');
                    
                    // Only update if userData has valid values (not just localStorage fallback)
                    // if (userData && userData.prenom && userData.nom && userData.email) {
                    //     if (userName) userName.textContent = userData.prenom || 'Client';
                    //     if (userFullName) userFullName.textContent = `${userData.prenom || ''} ${userData.nom || ''}`.trim() || 'Client';
                    //     if (userEmail) userEmail.textContent = userData.email || 'client@email.com';
                    // }
                    // If no valid userData, leave the JSP server-side values intact
                }
            } else if (isPartnerUser && isPartnerPage) {
                // Force show partner navigation
                const clientNav = document.querySelector('.navbar-client-dashboard');
                const partnerNav = document.querySelector('.navbar-partner-dashboard');
                const publicNav = document.querySelector('.navbar-modern');
                if (partnerNav && publicNav) {
                    publicNav.style.display = 'none';
                    if (clientNav) clientNav.style.display = 'none';
                    partnerNav.style.display = 'block';
                    
                    // Update user info in navbar - only if we have valid userData
                    const userName = document.getElementById('partnerUserName');
                    const userFullName = document.getElementById('partnerUserFullName');
                    const userEmail = document.getElementById('partnerUserEmail');
                    
                    // Only update if userData has valid values (not just localStorage fallback)
                    if (userData && userData.prenom && userData.nom && userData.email) {
                        if (userName) userName.textContent = userData.prenom || 'Partenaire';
                        if (userFullName) userFullName.textContent = `${userData.prenom || ''} ${userData.nom || ''}`.trim() || 'Partenaire';
                        if (userEmail) userEmail.textContent = userData.email || 'partenaire@email.com';
                    }
                    // If no valid userData, leave the JSP server-side values intact
                }
            }
        }
    } catch (error) {
        console.error('Error checking user session:', error);
    }
}

// Function to highlight active dropdown menu item
function highlightActiveDropdownItem() {
    const currentPath = window.location.pathname;
    const dropdownItems = document.querySelectorAll('#clientDropdownMenu .dropdown-item');
    
    // Clear all active states first
    dropdownItems.forEach(item => {
        item.classList.remove('active');
    });
    
    // Check each dropdown item
    dropdownItems.forEach(item => {
        const href = item.getAttribute('href');
        if (href) {
            // Extract the page name from href
            const pageName = href.split('/').pop().replace('.jsp', '');
            
            // Check if current path contains this page
            if (currentPath.includes(pageName)) {
                item.classList.add('active');
            }
        }
    });
}

// Function to highlight active partner dropdown menu item
function highlightActivePartnerDropdownItem() {
    const currentPath = window.location.pathname;
    const dropdownItems = document.querySelectorAll('#partnerDropdownMenu .dropdown-item');
    
    // Clear all active states first
    dropdownItems.forEach(item => {
        item.classList.remove('active');
    });
    
    // Check each dropdown item
    dropdownItems.forEach(item => {
        const href = item.getAttribute('href');
        if (href) {
            // Extract the page name from href
            const pageName = href.split('/').pop().replace('.jsp', '');
            
            // Check if current path contains this page
            if (currentPath.includes(pageName)) {
                item.classList.add('active');
            }
        }
    });
}

// Function to highlight active main navigation item
function highlightActiveMainNavItem() {
    const currentPath = window.location.pathname;
    const mainNavItems = document.querySelectorAll('.navbar-client-dashboard .nav-link-client');
    
    // Clear all active states first
    mainNavItems.forEach(item => {
        item.classList.remove('active');
    });
    
    // Check each main navigation item
    mainNavItems.forEach(item => {
        const href = item.getAttribute('href');
        if (href) {
            // Extract the page name from href
            const pageName = href.split('/').pop().replace('.jsp', '');
            
            // Check if current path contains this page
            if (currentPath.includes(pageName)) {
                item.classList.add('active');
            }
        }
    });
}

// Function to highlight active partner navigation item
function highlightActivePartnerNavItem() {
    const currentPath = window.location.pathname;
    const partnerNavItems = document.querySelectorAll('.navbar-partner-dashboard .nav-link-partner');
    
    // Clear all active states first
    partnerNavItems.forEach(item => {
        item.classList.remove('active');
    });
    
    // Check each partner navigation item
    partnerNavItems.forEach(item => {
        const href = item.getAttribute('href');
        if (href) {
            // Extract the page name from href
            const pageName = href.split('/').pop().replace('.jsp', '');
            
            // Check if current path contains this page
            if (currentPath.includes(pageName)) {
                item.classList.add('active');
            }
        }
    });
}

// Function to highlight active public navigation item
function highlightActivePublicNavItem() {
    const currentPath = window.location.pathname;
    const publicNavItems = document.querySelectorAll('.navbar-modern .nav-link-modern');
    
    // Clear all active states first
    publicNavItems.forEach(item => {
        item.classList.remove('active');
    });
    
    // Check each public navigation item
    publicNavItems.forEach(item => {
        const href = item.getAttribute('href');
        const dataSection = item.getAttribute('data-section');
        
        if (href && href.startsWith('#')) {
            // For hash links, check if we're on the homepage and the section matches
            if (currentPath === '/' || currentPath.includes('index.jsp')) {
                // Check if this is the current section based on scroll position or URL hash
                const currentHash = window.location.hash;
                if (currentHash === href || (href === '#accueil' && !currentHash)) {
                    item.classList.add('active');
                }
            }
        } else if (dataSection) {
            // For section-based navigation, check if current path matches
            if (currentPath.includes(dataSection)) {
                item.classList.add('active');
            }
        }
    });
}

// Run on page load
document.addEventListener('DOMContentLoaded', function() {
    checkClientSession();
    
    // Initialize Bootstrap dropdowns
    try {
        const dropdownElementList = [].slice.call(document.querySelectorAll('[data-bs-toggle="dropdown"]'));
        dropdownElementList.map(function (dropdownToggleEl) {
            return new bootstrap.Dropdown(dropdownToggleEl);
        });
    } catch (error) {
        console.error('Error initializing dropdowns:', error);
    }
    
    // Highlight active dropdown menu item based on current page
    highlightActiveDropdownItem();
    
    // Highlight active partner dropdown menu item based on current page
    highlightActivePartnerDropdownItem();
    
    // Highlight active main navigation item based on current page
    highlightActiveMainNavItem();
    
    // Highlight active partner navigation item based on current page
    highlightActivePartnerNavItem();
    
    // Highlight active public navigation item based on current page
    highlightActivePublicNavItem();
    
    // Add fallback dropdown functionality for profile
    const profileDropdown = document.getElementById('clientProfileDropdown');
    const dropdownMenu = document.getElementById('clientDropdownMenu');
    
    if (profileDropdown && dropdownMenu) {
        profileDropdown.addEventListener('click', function(e) {
            e.preventDefault();
            console.log('Profile dropdown clicked');
            
            // Toggle dropdown visibility
            if (dropdownMenu.style.display === 'block') {
                dropdownMenu.style.display = 'none';
            } else {
                dropdownMenu.style.display = 'block';
                dropdownMenu.style.position = 'absolute';
                dropdownMenu.style.top = '100%';
                dropdownMenu.style.right = '0';
                dropdownMenu.style.zIndex = '1000';
            }
        });
        
        // Close dropdown when clicking outside
        document.addEventListener('click', function(e) {
            if (!profileDropdown.contains(e.target) && !dropdownMenu.contains(e.target)) {
                dropdownMenu.style.display = 'none';
            }
        });
    }
    
    // Add fallback dropdown functionality for notifications
    const notificationDropdown = document.getElementById('notificationDropdown');
    const notificationMenu = document.getElementById('notificationDropdownMenu');
    
    if (notificationDropdown && notificationMenu) {
        notificationDropdown.addEventListener('click', function(e) {
            e.preventDefault();
            console.log('Notification dropdown clicked');
            
            // Toggle dropdown visibility
            if (notificationMenu.style.display === 'block') {
                notificationMenu.style.display = 'none';
            } else {
                notificationMenu.style.display = 'block';
                notificationMenu.style.position = 'absolute';
                notificationMenu.style.top = '100%';
                notificationMenu.style.right = '0';
                notificationMenu.style.zIndex = '1000';
            }
        });
        
        // Close dropdown when clicking outside
        document.addEventListener('click', function(e) {
            if (!notificationDropdown.contains(e.target) && !notificationMenu.contains(e.target)) {
                notificationMenu.style.display = 'none';
            }
        });
    }
    
    // Add fallback dropdown functionality for partner notifications
    const partnerNotificationDropdown = document.getElementById('partnerNotificationDropdown');
    const partnerNotificationMenu = document.getElementById('partnerNotificationDropdownMenu');
    
    if (partnerNotificationDropdown && partnerNotificationMenu) {
        partnerNotificationDropdown.addEventListener('click', function(e) {
            e.preventDefault();
            console.log('Partner notification dropdown clicked');
            
            // Toggle dropdown visibility
            if (partnerNotificationMenu.style.display === 'block') {
                partnerNotificationMenu.style.display = 'none';
            } else {
                partnerNotificationMenu.style.display = 'block';
                partnerNotificationMenu.style.position = 'absolute';
                partnerNotificationMenu.style.top = '100%';
                partnerNotificationMenu.style.right = '0';
                partnerNotificationMenu.style.zIndex = '1000';
            }
        });
        
        // Close dropdown when clicking outside
        document.addEventListener('click', function(e) {
            if (!partnerNotificationDropdown.contains(e.target) && !partnerNotificationMenu.contains(e.target)) {
                partnerNotificationMenu.style.display = 'none';
            }
        });
    }
});

// Notification Management Functions
function addPickupNotification(equipmentName, partnerAddress, partnerPhone) {
    const notificationList = document.getElementById('notificationList');
    const notificationBadge = document.getElementById('notificationBadge');
    
    // Remove empty state if it exists
    const emptyState = notificationList.querySelector('.text-center');
    if (emptyState) {
        emptyState.remove();
    }
    
    // Create notification item
    const notificationItem = document.createElement('div');
    notificationItem.className = 'notification-item unread pickup-notification-simple';
    notificationItem.innerHTML = 
        '<div class="pickup-simple-content">' +
            '<div class="pickup-simple-icon">' +
                '<i class="bi bi-check-circle-fill"></i>' +
            '</div>' +
            '<div class="pickup-simple-text">' +
                '<h6 class="pickup-simple-title">Réservation Acceptée !</h6>' +
                '<p class="pickup-simple-desc">Votre équipement est prêt à être récupéré</p>' +
            '</div>' +
            '<button class="btn btn-pickup-view" onclick="showPickupDetailsModal(\'' + equipmentName + '\', \'' + partnerAddress + '\', \'' + partnerPhone + '\')">' +
                '<i class="bi bi-eye"></i>' +
                '<span>Voir</span>' +
            '</button>' +
        '</div>';
    
    // Store data for modal
    notificationItem.dataset.equipment = equipmentName;
    notificationItem.dataset.address = partnerAddress;
    notificationItem.dataset.phone = partnerPhone;
    
    // Add to top of list
    notificationList.insertBefore(notificationItem, notificationList.firstChild);
    
    // Show badge
    notificationBadge.style.display = 'flex';
    notificationBadge.textContent = getUnreadCount();
    
    // Show dropdown briefly
    const notificationDropdown = document.getElementById('notificationDropdown');
    const notificationMenu = document.getElementById('notificationDropdownMenu');
    notificationMenu.style.display = 'block';
    setTimeout(() => {
        notificationMenu.style.display = 'none';
    }, 3000);
}

function markAsRead(button) {
    const notificationItem = button.closest('.notification-item');
    notificationItem.classList.remove('unread');
    button.remove();
    
    // Update badge
    const notificationBadge = document.getElementById('notificationBadge');
    const unreadCount = getUnreadCount();
    if (unreadCount === 0) {
        notificationBadge.style.display = 'none';
    } else {
        notificationBadge.textContent = unreadCount;
    }
}

function getUnreadCount() {
    return document.querySelectorAll('.notification-item.unread').length;
}

function clearAllNotifications() {
    const notificationList = document.getElementById('notificationList');
    notificationList.innerHTML = 
        '<div class="text-center text-muted py-3">' +
            '<i class="bi bi-bell-slash fs-4 mb-2"></i>' +
            '<p class="mb-0">Aucune notification</p>' +
        '</div>';
    
    const notificationBadge = document.getElementById('notificationBadge');
    notificationBadge.style.display = 'none';
}

// Partner Notification Management Functions
function addPartnerNotification(title, message, type = 'info') {
    const notificationList = document.getElementById('partnerNotificationList');
    const notificationBadge = document.getElementById('partnerNotificationBadge');
    
    // Remove empty state if it exists
    const emptyState = notificationList.querySelector('.text-center');
    if (emptyState) {
        emptyState.remove();
    }
    
    // Create notification item
    const notificationItem = document.createElement('div');
    notificationItem.className = 'notification-item unread p-3 border-bottom';
    notificationItem.innerHTML = 
        '<div class="d-flex justify-content-between align-items-start">' +
            '<div class="flex-grow-1">' +
                '<h6 class="mb-1 fw-semibold">' + title + '</h6>' +
                '<p class="mb-2 text-muted small">' + message + '</p>' +
                '<small class="text-muted">' + new Date().toLocaleTimeString() + '</small>' +
            '</div>' +
            '<button class="btn btn-sm btn-outline-secondary ms-2" onclick="markPartnerAsRead(this)">Marquer lu</button>' +
        '</div>';
    
    notificationList.insertBefore(notificationItem, notificationList.firstChild);
    
    // Show badge
    notificationBadge.style.display = 'flex';
    notificationBadge.textContent = getPartnerUnreadCount();
    
    // Show dropdown briefly
    const notificationDropdown = document.getElementById('partnerNotificationDropdown');
    const notificationMenu = document.getElementById('partnerNotificationDropdownMenu');
    notificationMenu.style.display = 'block';
    setTimeout(() => {
        notificationMenu.style.display = 'none';
    }, 3000);
}

function markPartnerAsRead(button) {
    const notificationItem = button.closest('.notification-item');
    notificationItem.classList.remove('unread');
    button.remove();
    
    // Update badge
    const notificationBadge = document.getElementById('partnerNotificationBadge');
    const unreadCount = getPartnerUnreadCount();
    if (unreadCount === 0) {
        notificationBadge.style.display = 'none';
    } else {
        notificationBadge.textContent = unreadCount;
    }
}

function getPartnerUnreadCount() {
    return document.querySelectorAll('.notification-item.unread').length;
}

function clearAllPartnerNotifications() {
    const notificationList = document.getElementById('partnerNotificationList');
    notificationList.innerHTML = 
        '<div class="text-center text-muted py-3">' +
            '<i class="bi bi-bell-slash fs-4 mb-2"></i>' +
            '<p class="mb-0">Aucune notification</p>' +
        '</div>';
    
    const notificationBadge = document.getElementById('partnerNotificationBadge');
    notificationBadge.style.display = 'none';
}

// Show pickup details modal
function showPickupDetailsModal(equipmentName, partnerAddress, partnerPhone) {
    // Create modal if it doesn't exist
    let modal = document.getElementById('pickupDetailsModal');
    if (!modal) {
        modal = document.createElement('div');
        modal.id = 'pickupDetailsModal';
        modal.className = 'modal fade';
        modal.setAttribute('tabindex', '-1');
        modal.innerHTML = 
            '<div class="modal-dialog modal-dialog-centered">' +
                '<div class="modal-content pickup-modal-content">' +
                    '<div class="modal-header pickup-modal-header">' +
                        '<div class="d-flex align-items-center">' +
                            '<div class="pickup-modal-icon">' +
                                '<i class="bi bi-check-circle-fill"></i>' +
                            '</div>' +
                            '<div>' +
                                '<h5 class="modal-title">Réservation Confirmée</h5>' +
                                '<p class="mb-0 pickup-modal-subtitle">Votre équipement est prêt à être récupéré</p>' +
                            '</div>' +
                        '</div>' +
                        '<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>' +
                    '</div>' +
                    '<div class="modal-body pickup-modal-body">' +
                        '<div class="pickup-modal-details">' +
                            '<div class="pickup-modal-item">' +
                                '<div class="pickup-modal-item-icon">' +
                                    '<i class="bi bi-box-seam"></i>' +
                                '</div>' +
                                '<div class="pickup-modal-item-content">' +
                                    '<span class="pickup-modal-label">Équipement réservé</span>' +
                                    '<span class="pickup-modal-value" id="modalEquipmentName"></span>' +
                                '</div>' +
                            '</div>' +
                            '<div class="pickup-modal-item">' +
                                '<div class="pickup-modal-item-icon">' +
                                    '<i class="bi bi-geo-alt-fill"></i>' +
                                '</div>' +
                                '<div class="pickup-modal-item-content">' +
                                    '<span class="pickup-modal-label">Point de récupération</span>' +
                                    '<span class="pickup-modal-value" id="modalPartnerAddress"></span>' +
                                '</div>' +
                            '</div>' +
                            '<div class="pickup-modal-item">' +
                                '<div class="pickup-modal-item-icon">' +
                                    '<i class="bi bi-telephone-fill"></i>' +
                                '</div>' +
                                '<div class="pickup-modal-item-content">' +
                                    '<span class="pickup-modal-label">Contact partenaire</span>' +
                                    '<span class="pickup-modal-value" id="modalPartnerPhone"></span>' +
                                '</div>' +
                            '</div>' +
                            '<div class="pickup-modal-item">' +
                                '<div class="pickup-modal-item-icon">' +
                                    '<i class="bi bi-clock-fill"></i>' +
                                '</div>' +
                                '<div class="pickup-modal-item-content">' +
                                    '<span class="pickup-modal-label">Heures d\'ouverture</span>' +
                                    '<span class="pickup-modal-value">Lun-Ven: 9h00-18h00<br>Sam: 9h00-16h00</span>' +
                                '</div>' +
                            '</div>' +
                        '</div>' +
                        '<div class="pickup-modal-instructions">' +
                            '<div class="pickup-instructions-header">' +
                                '<i class="bi bi-info-circle-fill"></i>' +
                                '<h6>Instructions importantes</h6>' +
                            '</div>' +
                            '<ul class="pickup-instructions-list">' +
                                '<li>Présentez-vous avec une pièce d\'identité valide</li>' +
                                '<li>Vérifiez l\'état de l\'équipement avant de partir</li>' +
                                '<li>Contactez le partenaire en cas de retard</li>' +
                            '</ul>' +
                        '</div>' +
                    '</div>' +
                    '<div class="modal-footer pickup-modal-footer">' +
                        '<div class="d-flex gap-2 w-100">' +
                            '<button type="button" class="btn btn-outline-secondary flex-fill" data-bs-dismiss="modal">' +
                                '<i class="bi bi-x-circle me-2"></i>Fermer' +
                            '</button>' +
                            '<button type="button" class="btn btn-primary flex-fill" onclick="openMaps()">' +
                                '<i class="bi bi-geo-alt me-2"></i>Ouvrir dans Maps' +
                            '</button>' +
                        '</div>' +
                    '</div>' +
                '</div>' +
            '</div>';
        document.body.appendChild(modal);
    }
    
    // Update modal content
    document.getElementById('modalEquipmentName').textContent = equipmentName;
    document.getElementById('modalPartnerAddress').textContent = partnerAddress;
    document.getElementById('modalPartnerPhone').textContent = partnerPhone;
    
    // Show modal
    const bsModal = new bootstrap.Modal(modal);
    bsModal.show();
}

// Global function to add pickup notification (called from product details page)
window.addPickupNotification = addPickupNotification;

// Function to open maps with partner address
function openMaps() {
    const address = document.getElementById('modalPartnerAddress').textContent;
    const encodedAddress = encodeURIComponent(address);
    const mapsUrl = `https://www.google.com/maps/search/?api=1&query=${encodedAddress}`;
    window.open(mapsUrl, '_blank');
}
</script>

<!-- Client Dashboard Navigation -->
<nav class="navbar navbar-expand-lg navbar-client-dashboard fixed-top" style="display: <%= showClientNav ? "block" : "none" %>;">
        <div class="container-fluid px-4">
            <!-- Brand -->
            <a class="navbar-brand fw-bold d-flex align-items-center" href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                <i class="fas fa-camera-retro me-2 text-primary" style="font-size: 1.5rem;"></i>
                <span style="background: linear-gradient(135deg, var(--primary-600), var(--primary-800)); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent; font-weight: 800;">YOURS</span>
            </a>

            <!-- Mobile toggle -->
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarClientNav">
                <i class="fas fa-bars text-primary"></i>
            </button>

            <!-- Navigation items -->
            <div class="collapse navbar-collapse" id="navbarClientNav">
                <!-- Left Navigation -->
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link nav-link-client d-flex align-items-center" href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                            <i class="bi bi-speedometer2 me-2"></i>Tableau de bord
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-client d-flex align-items-center" href="${pageContext.request.contextPath}/pages/equipment/list-simple.jsp">
                            <i class="bi bi-grid me-2"></i>Matériel
                        </a>
                    </li>
                    <li class="nav-item">
                       <a class="nav-link nav-link-client d-flex align-items-center" href="${pageContext.request.contextPath}/reservations">
                       <i class="bi bi-calendar-check me-2"></i>Réservations
                       </a>

                    </li>
                </ul>

                <!-- Right Navigation -->
                <ul class="navbar-nav ms-auto align-items-center">

                    <!-- Notifications Dropdown -->
                    <li class="nav-item dropdown me-3">
                        <a class="nav-link nav-link-client d-flex align-items-center position-relative" href="#" role="button" id="notificationDropdown">
                            <i class="bi bi-bell fs-5"></i>
                            <span class="notification-badge" id="notificationBadge" style="display: none;">1</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end notification-dropdown shadow-lg border-0" id="notificationDropdownMenu" style="min-width: 350px;">
                            <div class="dropdown-header d-flex justify-content-between align-items-center">
                                <h6 class="mb-0">Notifications</h6>
                                <button class="btn btn-sm btn-outline-secondary" onclick="clearAllNotifications()">Tout effacer</button>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div id="notificationList">
                                <div class="text-center text-muted py-3">
                                    <i class="bi bi-bell-slash fs-4 mb-2"></i>
                                    <p class="mb-0">Aucune notification</p>
                                </div>
                            </div>
                        </div>
                    </li>

                    <!-- Profile Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-link-client d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" id="clientProfileDropdown">
                            <div class="user-avatar me-2">
                                <i class="bi bi-person-circle"></i>
                            </div>
                            <div class="user-info d-none d-lg-block">
                                <%
                                    String navbarClientName = (String) session.getAttribute("clientName");
                                    if (navbarClientName == null || navbarClientName.isEmpty()) {
                                        navbarClientName = "Client";
                                    }
                                %>
                                <div class="user-name" id="clientUserName"><%= navbarClientName %></div>
                                <small class="user-role">Client</small>
                            </div>
                            <i class="bi bi-chevron-down ms-2"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end client-dropdown shadow-lg border-0" id="clientDropdownMenu">
                            <li class="dropdown-header">
                                <div class="d-flex align-items-center">
                                    <div class="user-avatar-large me-3">
                                        <i class="bi bi-person-circle"></i>
                                    </div>
                                    <div>
                                    <%
                                        String clientName = (String) session.getAttribute("clientName");
                                        String clientEmail = (String) session.getAttribute("clientEmail");
                                        if (clientName == null || clientName.isEmpty()) {
                                            clientName = "Client";
                                        }
                                        if (clientEmail == null || clientEmail.isEmpty()) {
                                            clientEmail = "client@email.com";
                                        }
                                    %>
                                    <h6 class="mb-0" id="clientUserFullName"><%= clientName %></h6>
                                    <small class="text-muted" id="clientUserEmail"><%= clientEmail %></small>
                                    </div>
                                </div>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/profile.jsp">
                                    <i class="bi bi-person me-2 text-primary"></i>Mon Profil
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/settings.jsp">
                                    <i class="bi bi-gear me-2 text-primary"></i>Paramètres
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/favorites.jsp">
                                    <i class="bi bi-heart me-2 text-danger"></i>Favoris
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/invoices.jsp">
                                    <i class="bi bi-receipt me-2 text-success"></i>Factures
                                </a>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item rounded text-danger" href="${pageContext.request.contextPath}/pages/auth/logout.jsp">
                                    <i class="bi bi-box-arrow-right me-2"></i>Déconnexion
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<!-- Partner Navigation -->
<nav class="navbar navbar-expand-lg navbar-partner-dashboard fixed-top" style="display: <%= showPartnerNav ? "block" : "none" %>;">
    <div class="container-fluid px-4">
        <!-- Brand -->
        <a class="navbar-brand fw-bold d-flex align-items-center" href="${pageContext.request.contextPath}/pages/partner/dashboard.jsp">
            <i class="fas fa-camera-retro me-2 text-primary" style="font-size: 1.5rem;"></i>
            <span style="background: linear-gradient(135deg, var(--primary-600), var(--primary-800)); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent; font-weight: 800;">YOURS</span>
        </a>

        <!-- Mobile toggle -->
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarPartnerNav">
            <i class="fas fa-bars text-primary"></i>
        </button>

        <!-- Navigation items -->
        <div class="collapse navbar-collapse" id="navbarPartnerNav">
            <!-- Left Navigation -->
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link nav-link-partner d-flex align-items-center" href="${pageContext.request.contextPath}/pages/partner/dashboard.jsp">
                        <i class="bi bi-speedometer2 me-2"></i>Tableau de bord
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-partner d-flex align-items-center" href="${pageContext.request.contextPath}/pages/partner/equipment.jsp">
                        <i class="bi bi-box-seam me-2"></i>Mon Matériel
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-partner d-flex align-items-center" href="${pageContext.request.contextPath}/pages/partner/reservations.jsp">
                        <i class="bi bi-calendar-check me-2"></i>Réservations
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-partner d-flex align-items-center" href="${pageContext.request.contextPath}/pages/partner/earnings.jsp">
                        <i class="bi bi-wallet2 me-2"></i>Mes Gains
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-partner d-flex align-items-center" href="${pageContext.request.contextPath}/pages/partner/analytics.jsp">
                        <i class="bi bi-bar-chart me-2"></i>Analytiques
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-partner d-flex align-items-center" href="${pageContext.request.contextPath}/pages/partner/ai-models.jsp">
                        <i class="bi bi-robot me-2"></i>Modèles IA
                    </a>
                </li>
            </ul>

            <!-- Right Navigation -->
            <ul class="navbar-nav ms-auto align-items-center">
                <!-- Notifications Dropdown -->
                <li class="nav-item dropdown me-3">
                    <a class="nav-link nav-link-partner d-flex align-items-center position-relative" href="#" role="button" id="partnerNotificationDropdown">
                        <i class="bi bi-bell fs-5"></i>
                        <span class="notification-badge" id="partnerNotificationBadge" style="display: none;">1</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end notification-dropdown shadow-lg border-0" id="partnerNotificationDropdownMenu" style="min-width: 350px;">
                        <div class="dropdown-header d-flex justify-content-between align-items-center">
                            <h6 class="mb-0">Notifications</h6>
                            <button class="btn btn-sm btn-outline-secondary" onclick="clearAllPartnerNotifications()">Tout effacer</button>
                        </div>
                        <div class="dropdown-divider"></div>
                        <div id="partnerNotificationList">
                            <div class="text-center text-muted py-3">
                                <i class="bi bi-bell-slash fs-4 mb-2"></i>
                                <p class="mb-0">Aucune notification</p>
                            </div>
                        </div>
                    </div>
                </li>

                <!-- Profile Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link nav-link-partner d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" id="partnerProfileDropdown">
                        <div class="user-avatar me-2">
                            <i class="bi bi-person-circle"></i>
                        </div>
                        <div class="user-info d-none d-lg-block">
                                <%
                                    String navbarPartnerName = (String) session.getAttribute("partnerName");
                                    if (navbarPartnerName == null || navbarPartnerName.isEmpty()) {
                                        navbarPartnerName = "Partenaire";
                                    }
                                %>
                                <div class="user-name" id="partnerUserName"><%= navbarPartnerName %></div>
                            <small class="user-role">Partenaire</small>
                        </div>
                        <i class="bi bi-chevron-down ms-2"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end partner-dropdown shadow-lg border-0" id="partnerDropdownMenu">
                        <li class="dropdown-header">
                            <div class="d-flex align-items-center">
                                <div class="user-avatar-large me-3">
                                    <i class="bi bi-person-circle"></i>
                                </div>
                                <div>
                                    <%
                                        String partnerName = (String) session.getAttribute("partnerName");
                                        String partnerEmail = (String) session.getAttribute("partnerEmail");
                                        if (partnerName == null || partnerName.isEmpty()) {
                                            partnerName = "Partenaire";
                                        }
                                        if (partnerEmail == null || partnerEmail.isEmpty()) {
                                            partnerEmail = "partenaire@email.com";
                                        }
                                    %>
                                    <h6 class="mb-0" id="partnerUserFullName"><%= partnerName %></h6>
                                    <small class="text-muted" id="partnerUserEmail"><%= partnerEmail %></small>
                                </div>
                            </div>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/partner/profile.jsp">
                                <i class="bi bi-person me-2 text-primary"></i>Mon Profil
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/partner/settings.jsp">
                                <i class="bi bi-gear me-2 text-primary"></i>Paramètres
                            </a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item rounded text-danger" href="${pageContext.request.contextPath}/pages/auth/logout.jsp">
                                <i class="bi bi-box-arrow-right me-2"></i>Déconnexion
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Public Navigation -->
<nav class="navbar navbar-expand-lg navbar-modern fixed-top" style="display: <%= (showClientNav || showPartnerNav) ? "none" : "block" %>;">
    <div class="container">
        <!-- Brand -->
        <a class="navbar-brand fw-bold d-flex align-items-center" href="${pageContext.request.contextPath}/">
            <i class="fas fa-camera-retro me-2 text-primary" style="font-size: 1.5rem;"></i>
            <span style="background: linear-gradient(135deg, var(--primary-600), var(--primary-800)); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent; font-weight: 800;">YOURS</span>
        </a>

        <!-- Mobile toggle -->
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <i class="fas fa-bars text-primary"></i>
        </button>

        <!-- Navigation items -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link nav-link-modern smooth-scroll" href="#accueil" data-section="accueil">
                        <i class="fas fa-home me-2"></i>Accueil
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-modern smooth-scroll" href="#materiel" data-section="materiel">
                        <i class="fas fa-th-large me-2"></i>Mat&eacute;riel
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-modern smooth-scroll" href="#categories" data-section="categories">
                        <i class="fas fa-tags me-2"></i>Cat&eacute;gories
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-modern smooth-scroll" href="#contact" data-section="contact">
                        <i class="fas fa-envelope me-2"></i>Contact
                    </a>
                </li>
            </ul>

            <!-- User menu -->
            <ul class="navbar-nav">
                <!-- If user is not logged in -->
                <% if (!isLoggedIn) { %>
                    <li class="nav-item">
                        <a class="btn btn-outline-primary btn-auth-login" href="${pageContext.request.contextPath}/pages/auth/login.jsp">
                            <i class="fas fa-sign-in-alt me-2"></i>Connexion
                        </a>
                    </li>
                    <li class="nav-item ms-3">
                        <a class="btn btn-gradient btn-auth-signup" href="${pageContext.request.contextPath}/pages/auth/register-client.jsp">
                            <i class="fas fa-user-plus me-2"></i>S'inscrire
                        </a>
                    </li>
                <% } else if (isClientLoggedIn) { %>
                    <!-- If client is logged in -->
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-link-modern dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-user-circle me-2"></i>
                            ${sessionScope.client.prenom} ${sessionScope.client.nom}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0" style="border-radius: 1rem; padding: 0.5rem;">
                            <li><a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                                <i class="fas fa-tachometer-alt me-2 text-primary"></i>Tableau de bord
                            </a></li>
                            <li><a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/profile.jsp">
                                <i class="fas fa-user me-2 text-primary"></i>Mon profil
                            </a></li>
                            <li><a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/reservations.jsp">
                                <i class="fas fa-calendar-check me-2 text-primary"></i>Mes réservations
                            </a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item rounded text-danger" href="${pageContext.request.contextPath}/pages/auth/logout.jsp">
                                <i class="fas fa-sign-out-alt me-2"></i>Déconnexion
                            </a></li>
                        </ul>
                    </li>
                <% } else if (isPartnerLoggedIn) { %>
                    <!-- If partner is logged in -->
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-link-modern dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-user-circle me-2"></i>
                            ${sessionScope.partner.prenom} ${sessionScope.partner.nom}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0" style="border-radius: 1rem; padding: 0.5rem;">
                            <li><a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/partner/dashboard.jsp">
                                <i class="fas fa-tachometer-alt me-2 text-primary"></i>Tableau de bord
                            </a></li>
                            <li><a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/partner/profile.jsp">
                                <i class="fas fa-user me-2 text-primary"></i>Mon profil
                            </a></li>
                            <li><a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/partner/equipment.jsp">
                                <i class="fas fa-box-seam me-2 text-primary"></i>Mon matériel
                            </a></li>
                            <li><a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/partner/reservations.jsp">
                                <i class="fas fa-calendar-check me-2 text-primary"></i>Mes réservations
                            </a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item rounded text-danger" href="${pageContext.request.contextPath}/pages/auth/logout.jsp">
                                <i class="fas fa-sign-out-alt me-2"></i>Déconnexion
                            </a></li>
                        </ul>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
