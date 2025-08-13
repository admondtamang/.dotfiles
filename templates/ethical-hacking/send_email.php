<?php
$status = "";
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $to      = trim($_POST['to']);
    $subject = trim($_POST['subject']);
    $message = trim($_POST['message']);
    $from_email = trim($_POST['from_email']);
    $from_name  = trim($_POST['from_name']);

    // Create a properly formatted formal message
    $formatted_message = "Dear Recipient,\n\n";
    $formatted_message .= $message . "\n\n";

    $headers  = "From: $from_name <$from_email>\r\n";
    $headers .= "Reply-To: $from_email\r\n";
    $headers .= "X-Mailer: PHP/" . phpversion() . "\r\n";
    $headers .= "MIME-Version: 1.0\r\n";
    $headers .= "Content-Type: text/plain; charset=UTF-8\r\n";

    if (mail($to, $subject, $formatted_message, $headers)) {
        $status = "<div class='success'>✅ Email sent successfully!</div>";
    } else {
        $status = "<div class='error'>❌ Failed to send email.</div>";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Email Sender</title>
<style>
    * {
        box-sizing: border-box;
    }
    body {
        background: #f4f4f4;
        font-family: 'Arial', sans-serif;
        padding: 2rem;
        min-height: 100vh;
    }
    .main-container {
        max-width: 1200px;
        margin: 0 auto;
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 2rem;
        align-items: start;
    }
    .form-container, .preview-container {
        background: #fff;
        padding: 1.5rem;
        border: 3px solid #000;
        box-shadow: 5px 5px 0 black;
        animation: fadeIn 0.5s ease-in-out;
    }
    h2 {
        margin: 0 0 1.2rem 0;
        font-size: 1.5rem;
        text-align: center;
    }
    .form-group {
        margin-bottom: 1rem;
    }
    label {
        display: block;
        font-weight: bold;
        margin-bottom: 0.3rem;
        font-size: 0.9rem;
        color: #333;
    }
    input, textarea {
        width: 100%;
        padding: 0.8rem;
        border: 2px solid #000;
        outline: none;
        box-shadow: 3px 3px 0 #000;
        font-size: 1rem;
        background: #fff;
    }
    textarea {
        min-height: 120px;
        resize: vertical;
    }
    button {
        background: yellow;
        border: 2px solid #000;
        padding: 0.8rem;
        font-weight: bold;
        width: 100%;
        cursor: pointer;
        box-shadow: 3px 3px 0 #000;
        transition: transform 0.1s ease;
        font-size: 1rem;
    }
    button:hover {
        transform: translateY(-2px);
    }
    .loader {
        display: none;
        margin: 1rem auto;
        border: 4px solid #f3f3f3;
        border-top: 4px solid #000;
        border-radius: 50%;
        width: 30px;
        height: 30px;
        animation: spin 1s linear infinite;
    }
    .success, .error {
        padding: 0.8rem;
        margin-top: 1rem;
        border: 2px solid #000;
        text-align: center;
        box-shadow: 3px 3px 0 #000;
    }
    .success { background: #caffbf; }
    .error   { background: #ffadad; }
    
    /* Email Preview Styles */
    .email-preview {
        background: #fff;
        border: 1px solid #ddd;
        padding: 1rem;
        font-family: 'Times New Roman', serif;
        line-height: 1.6;
        white-space: pre-line;
        min-height: 300px;
        box-shadow: inset 0 0 10px rgba(0,0,0,0.1);
    }
    .email-header {
        border-bottom: 2px solid #000;
        padding-bottom: 0.5rem;
        margin-bottom: 1rem;
        background: #f9f9f9;
        padding: 0.5rem;
    }
    .email-details {
        font-size: 0.9rem;
        margin-bottom: 0.3rem;
    }
    .email-subject {
        font-weight: bold;
        font-size: 1.1rem;
        color: #333;
    }
    
    @media (max-width: 768px) {
        .main-container {
            grid-template-columns: 1fr;
        }
        body {
            padding: 1rem;
        }
    }
    
    @keyframes spin {
        0% {transform: rotate(0deg);}
        100% {transform: rotate(360deg);}
    }
    @keyframes fadeIn {
        0% {opacity: 0; transform: translateY(10px);}
        100% {opacity: 1; transform: translateY(0);}
    }
</style>
</head>
<body>
<div class="main-container">
    <!-- Form Section -->
    <div class="form-container">
        <h2>📧 Compose Email</h2>
        <?php if ($status) echo $status; ?>
        
        <form method="POST" onsubmit="showLoader()">
            <div class="form-group">
                <label for="from_name">Sender Name</label>
                <input type="text" id="from_name" name="from_name" placeholder="Enter your full name" oninput="updatePreview()" required>
            </div>
            
            <div class="form-group">
                <label for="from_email">Sender Email</label>
                <input type="email" id="from_email" name="from_email" placeholder="your.email@example.com" oninput="updatePreview()" required>
            </div>
            
            <div class="form-group">
                <label for="to">Recipient Email</label>
                <input type="email" id="to" name="to" placeholder="recipient@example.com" oninput="updatePreview()" required>
            </div>
            
            <div class="form-group">
                <label for="subject">Email Subject</label>
                <input type="text" id="subject" name="subject" placeholder="Enter email subject" oninput="updatePreview()" required>
            </div>
            
            <div class="form-group">
                <label for="message">Message Body</label>
                <textarea id="message" name="message" placeholder="Write your message here..." oninput="updatePreview()" required></textarea>
            </div>
            
            <div class="loader" id="loader"></div>
            <button type="submit">Send Email</button>
        </form>
    </div>
    
    <!-- Preview Section -->
    <div class="preview-container">
        <h2>📋 Email Preview</h2>
        
        <div class="email-header">
            <div class="email-details"><strong>From:</strong> <span id="preview-from">Your Name &lt;your.email@example.com&gt;</span></div>
            <div class="email-details"><strong>To:</strong> <span id="preview-to">recipient@example.com</span></div>
            <div class="email-details"><strong>Date:</strong> <?php echo date('M j, Y \a\t g:i A'); ?></div>
            <div class="email-subject">Subject: <span id="preview-subject">Your Email Subject</span></div>
        </div>
        
        <div class="email-preview" id="preview-body">
Dear Recipient,

[Your message will appear here as you type]

Best regards,
[Your Name]
[Your Email]

---
This email was sent via automated system.
Date: <?php echo date('Y-m-d H:i:s'); ?>
        </div>
    </div>
</div>

<script>
function updatePreview() {
    const fromName = document.getElementById('from_name').value || 'Your Name';
    const fromEmail = document.getElementById('from_email').value || 'your.email@example.com';
    const toEmail = document.getElementById('to').value || 'recipient@example.com';
    const subject = document.getElementById('subject').value || 'Your Email Subject';
    const message = document.getElementById('message').value || '[Your message will appear here as you type]';
    
    // Update header details
    document.getElementById('preview-from').textContent = `${fromName} <${fromEmail}>`;
    document.getElementById('preview-to').textContent = toEmail;
    document.getElementById('preview-subject').textContent = subject;
    
    // Update email body
    const formattedBody = `Dear Recipient,

${message}

Best regards,
${fromName}
${fromEmail}

---
This email was sent via automated system.
Date: <?php echo date('Y-m-d H:i:s'); ?>`;
    
    document.getElementById('preview-body').textContent = formattedBody;
}

function showLoader() {
    document.getElementById('loader').style.display = 'block';
}

// Initialize preview on page load
document.addEventListener('DOMContentLoaded', updatePreview);
</script>
</body>
</html>
