<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="noindex, nofollow">
    
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }
        
        body {
            height: 100vh;
            overflow: hidden;
            display: flex;
        }
        
        .login-container {
            display: flex;
            width: 100%;
            height: 100%;
        }
        
        .form-container {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            max-width: 500px;
        }
        
        .image-container {
            flex: 1.2;
            background-image: url("${url.resourcesPath}/img/wooden-background.jpg");
            background-size: cover;
            background-position: center;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 40px;
            position: relative;
        }
        
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.3);
        }
        
        .image-content {
            position: relative;
            z-index: 1;
        }
        
        h1 {
            font-size: 32px;
            margin-bottom: 10px;
            color: #333;
        }
        
        h2 {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        
        .subtitle {
            color: #777;
            margin-bottom: 30px;
        }
        
        .social-buttons {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
        }
        
        .social-button {
            flex: 1;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            background-color: white;
            transition: background-color 0.3s;
        }
        
        .social-button:hover {
            background-color: #f5f5f5;
        }
        
        .social-button img {
            width: 20px;
            margin-right: 10px;
        }
        
        .divider {
            display: flex;
            align-items: center;
            margin: 20px 0;
            color: #777;
        }
        
        .divider::before, .divider::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid #ddd;
        }
        
        .divider span {
            padding: 0 10px;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        
        .submit-button {
            background-color: #d14dc3;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s;
        }
        
        .submit-button:hover {
            background-color: #b23ca4;
        }
        
        .footer {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            color: #777;
        }
        
        .footer a {
            color: #777;
            text-decoration: none;
        }
        
        .footer a:hover {
            text-decoration: underline;
        }
        
        .pagination {
            position: absolute;
            bottom: 30px;
            right: 30px;
            display: flex;
            align-items: center;
            color: white;
            z-index: 2;
        }
        
        .pagination span {
            margin: 0 5px;
        }
        
        .pagination button {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: 1px solid white;
            background: transparent;
            color: white;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .author {
            margin-top: 20px;
            font-size: 16px;
        }
        
        #kc-error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        
        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
            }
            
            .form-container {
                max-width: 100%;
                padding: 20px;
            }
            
            .image-container {
                display: none;
            }
        }
    </style>
</head>

<body>
    <div class="login-container">
        <div class="form-container">
            <h1>Join ${realm.displayName!'Keycloak'}</h1>
            <p class="subtitle">Simplify your online business</p>
            
            <div class="social-buttons">
                <button class="social-button">
                    <img src="${url.resourcesPath}/img/google-icon.png" alt="Google">
                    Sign up with Google
                </button>
                <button class="social-button">
                    <img src="${url.resourcesPath}/img/twitter-icon.png" alt="Twitter">
                    <span class="sr-only">Twitter</span>
                </button>
            </div>
            
            <div class="divider">
                <span>Or, sign up with your email</span>
            </div>
            
            <form id="kc-form-login" action="${url.loginAction}" method="post">
                <#if message?has_content && (message.type != 'success')>
                    <div id="kc-error-message">
                        <p>${kcSanitize(message.summary)?no_esc}</p>
                    </div>
                </#if>
                
                <div class="form-group">
                    <input type="text" id="firstName" name="firstName" placeholder="Your first name" required />
                </div>
                
                <div class="form-group">
                    <input type="text" id="lastName" name="lastName" placeholder="Your name" required />
                </div>
                
                <div class="form-group">
                    <input type="email" id="email" name="email" placeholder="Your email" required />
                </div>
                
                <div class="form-group">
                    <input type="password" id="password" name="password" placeholder="Enter your password" required />
                </div>
                
                <div class="form-group">
                    <input type="password" id="password-confirm" name="password-confirm" placeholder="Retype your password" required />
                </div>
                
                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                
                <button class="submit-button" type="submit">Sign Up</button>
            </form>
            
            <div class="footer">
                <a href="#">Customer Support</a>
                <a href="#">Terms of Service</a>
            </div>
        </div>
        
        <div class="image-container">
            <div class="overlay"></div>
            <div class="image-content">
                <h2>Simplify your online business</h2>
                <p class="author">Tanya and Kate</p>
            </div>
            <div class="pagination">
                <span>1</span> of <span>5</span>
                <button aria-label="Previous"><</button>
                <button aria-label="Next">></button>
            </div>
        </div>
    </div>
</body>
</html>