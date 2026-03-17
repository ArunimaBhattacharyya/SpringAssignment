<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
<style>
    *, *::before, *::after {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        background-color: #050810;
        font-family: 'Inter', sans-serif;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background-image:
            radial-gradient(ellipse at 20% 50%, rgba(30, 80, 200, 0.12) 0%, transparent 60%),
            radial-gradient(ellipse at 80% 20%, rgba(0, 120, 255, 0.08) 0%, transparent 50%);
    }

    .card {
        background: #0c1220;
        border: 1px solid rgba(50, 110, 230, 0.25);
        border-radius: 16px;
        padding: 2.8rem 2.5rem;
        width: 100%;
        max-width: 420px;
        box-shadow:
            0 0 0 1px rgba(0, 80, 200, 0.08),
            0 20px 60px rgba(0, 0, 0, 0.7),
            0 0 80px rgba(20, 80, 200, 0.07);
    }

    .card-header {
        text-align: center;
        margin-bottom: 2rem;
    }

    .icon {
        width: 52px;
        height: 52px;
        background: linear-gradient(135deg, #1a3a8f, #2563eb);
        border-radius: 14px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 1rem;
        font-size: 1.4rem;
        box-shadow: 0 4px 20px rgba(37, 99, 235, 0.4);
    }

    h1 {
        font-size: 1.6rem;
        font-weight: 600;
        color: #f0f4ff;
        letter-spacing: -0.02em;
        margin-bottom: 0.3rem;
    }

    .subtitle {
        font-size: 0.8rem;
        color: #4a5580;
        letter-spacing: 0.02em;
    }

    .divider {
        height: 1px;
        background: linear-gradient(90deg, transparent, rgba(50, 100, 230, 0.3), transparent);
        margin-bottom: 1.8rem;
    }

    .field {
        margin-bottom: 1.1rem;
    }

    label {
        display: block;
        font-size: 0.72rem;
        font-weight: 500;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        color: #4a6090;
        margin-bottom: 0.45rem;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        background: #080e1c;
        border: 1px solid rgba(50, 90, 200, 0.2);
        border-radius: 8px;
        padding: 0.7rem 1rem;
        color: #d0d8f0;
        font-family: 'Inter', sans-serif;
        font-size: 0.88rem;
        outline: none;
        transition: border-color 0.25s, box-shadow 0.25s;
    }

    input[type="text"]::placeholder,
    input[type="email"]::placeholder,
    input[type="password"]::placeholder {
        color: #2a3550;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="password"]:focus {
        border-color: #2563eb;
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
    }

    .btn-row {
        display: flex;
        gap: 0.75rem;
        margin-top: 1.6rem;
    }

    input[type="submit"] {
        flex: 1;
        padding: 0.75rem;
        background: linear-gradient(135deg, #1d4ed8, #2563eb);
        color: #fff;
        border: none;
        border-radius: 8px;
        font-family: 'Inter', sans-serif;
        font-size: 0.82rem;
        font-weight: 600;
        letter-spacing: 0.05em;
        text-transform: uppercase;
        cursor: pointer;
        transition: opacity 0.2s, box-shadow 0.2s;
        box-shadow: 0 4px 16px rgba(37, 99, 235, 0.35);
    }

    input[type="submit"]:hover {
        opacity: 0.9;
        box-shadow: 0 4px 24px rgba(37, 99, 235, 0.55);
    }

    input[type="reset"] {
        flex: 1;
        padding: 0.75rem;
        background: transparent;
        color: #4a6090;
        border: 1px solid rgba(50, 90, 200, 0.2);
        border-radius: 8px;
        font-family: 'Inter', sans-serif;
        font-size: 0.82rem;
        font-weight: 500;
        letter-spacing: 0.05em;
        text-transform: uppercase;
        cursor: pointer;
        transition: border-color 0.2s, color 0.2s;
    }

    input[type="reset"]:hover {
        border-color: rgba(50, 90, 200, 0.5);
        color: #8ba0d0;
    }

    .bottom-link {
        text-align: center;
        margin-top: 1.4rem;
        font-size: 0.75rem;
        color: #3a4a70;
    }

    .bottom-link a {
        color: #2563eb;
        text-decoration: none;
        font-weight: 500;
        transition: opacity 0.2s;
    }

    .bottom-link a:hover { opacity: 0.75; }
</style>
</head>
<body>

<div class="card">
    <div class="card-header">
        <div class="icon">🔐</div>
        <h1>Create Account</h1>
        <p class="subtitle">Fill in the details below to register</p>
    </div>

    <div class="divider"></div>

    <form action="register" method="post">

        <div class="field">
            <label>Username</label>
            <input type="text" name="user" placeholder="Enter your username">
        </div>

        <div class="field">
            <label>Email</label>
            <input type="email" name="email" placeholder="Enter your email">
        </div>

        <div class="field">
            <label>Password</label>
            <input type="password" name="password" placeholder="Create a password">
        </div>

        <div class="field">
            <label>Confirm Password</label>
            <input type="password" name="confirmpassword" placeholder="Repeat your password">
        </div>

        <div class="btn-row">
            <input type="submit" value="Register">
            <input type="reset" value="Reset">
        </div>

    </form>

    <p class="bottom-link">Already have an account? <a href="/login">Sign in</a></p>
</div>

</body>
</html>