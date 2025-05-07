// Simple script to enhance the login/registration experience

// Wait for DOM content to load
document.addEventListener('DOMContentLoaded', function() {
    // Get references to elements
    const socialButtons = document.querySelectorAll('.social-button');
    const paginationButtons = document.querySelectorAll('.pagination button');
    const passwordField = document.getElementById('password');
    const passwordConfirmField = document.getElementById('password-confirm');
    const loginForm = document.getElementById('kc-form-login');
    
    // Add click handlers for social buttons
    if (socialButtons) {
        socialButtons.forEach(button => {
            button.addEventListener('click', function(e) {
                // Prevent default if not properly configured yet
                if (!this.form) {
                    e.preventDefault();
                    // This would be replaced with actual authentication logic
                    console.log('Social login clicked:', this.innerText);
                    
                    // You can redirect to Keycloak social provider URLs here
                    // window.location.href = 'your-keycloak-social-provider-url';
                }
            });
        });
    }
    
    // Pagination functionality for the right panel
    // This would control a slideshow if implemented
    if (paginationButtons) {
        let currentSlide = 1;
        const totalSlides = 5; // Update this based on your actual content
        
        paginationButtons.forEach(button => {
            button.addEventListener('click', function() {
                if (this.innerText === '<') {
                    currentSlide = Math.max(1, currentSlide - 1);
                } else {
                    currentSlide = Math.min(totalSlides, currentSlide + 1);
                }
                
                // Update slide counter
                const slideCounters = document.querySelectorAll('.pagination span');
                if (slideCounters && slideCounters[0]) {
                    slideCounters[0].innerText = currentSlide;
                }
                
                // Here you would change the content of the right panel
                // based on the current slide
                
                console.log('Changed to slide:', currentSlide);
            });
        });
    }
    
    // Password validation
    if (loginForm && passwordField && passwordConfirmField) {
        loginForm.addEventListener('submit', function(e) {
            // Only run this on registration page
            if (passwordConfirmField) {
                if (passwordField.value !== passwordConfirmField.value) {
                    e.preventDefault();
                    
                    // Create error message if it doesn't exist
                    let errorDiv = document.getElementById('kc-error-message');
                    if (!errorDiv) {
                        errorDiv = document.createElement('div');
                        errorDiv.id = 'kc-error-message';
                        loginForm.insertBefore(errorDiv, loginForm.firstChild);
                    }
                    
                    errorDiv.innerHTML = '<p>Passwords do not match.</p>';
                    
                    // Focus on password confirm field
                    passwordConfirmField.focus();
                }
            }
        });
    }
    
    // Input field enhancements
    const inputFields = document.querySelectorAll('input');
    if (inputFields) {
        inputFields.forEach(field => {
            // Add focus and blur events for styling
            field.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });
            
            field.addEventListener('blur', function() {
                if (!this.value) {
                    this.parentElement.classList.remove('focused');
                }
            });
            
            // If field already has a value (e.g., from autofill)
            if (field.value) {
                field.parentElement.classList.add('focused');
            }
        });
    }
});