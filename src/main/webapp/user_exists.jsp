<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Already Registered</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  :root {
    --bg-deep:      #050810;
    --bg-card:      #0c1220;
    --accent-blue:  #2563eb;
    --accent-light: #3b82f6;
    --text-primary: #f0f4ff;
    --text-muted:   #4a5580;
    --border:       rgba(50, 110, 230, 0.25);
  }

  html, body {
    min-height: 100%;
    background-color: var(--bg-deep);
    color: var(--text-primary);
    font-family: 'Inter', sans-serif;
    font-weight: 300;
  }

  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background:
      radial-gradient(ellipse at 20% 40%, rgba(30, 80, 200, 0.13) 0%, transparent 60%),
      radial-gradient(ellipse at 80% 70%, rgba(0, 120, 255, 0.08) 0%, transparent 50%);
    pointer-events: none;
    z-index: 0;
  }

  /* ── Header ── */
  header {
    padding: 1.6rem 3rem;
    border-bottom: 1px solid var(--border);
    display: flex;
    align-items: center;
    justify-content: space-between;
    backdrop-filter: blur(6px);
    background: rgba(5, 8, 16, 0.80);
    position: sticky;
    top: 0;
    z-index: 10;
  }

  .logo-mark {
    font-size: 0.85rem;
    font-weight: 600;
    letter-spacing: 0.2em;
    color: var(--accent-blue);
    text-transform: uppercase;
  }

  /* ── Page layout ── */
  .page-wrapper {
    position: relative;
    z-index: 1;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
  }

  main {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 4rem 2rem;
    animation: fadeUp 0.8s ease both;
  }

  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(24px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* ── Card ── */
  .card {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: 16px;
    width: 100%;
    max-width: 420px;
    overflow: hidden;
    text-align: center;
  }

  .card-header {
    padding: 2rem 2.4rem 1.6rem;
    border-bottom: 1px solid var(--border);
    background: rgba(220, 38, 38, 0.05);
  }

  .card-icon {
    font-size: 2rem;
    margin-bottom: 0.8rem;
  }

  .card-eyebrow {
    font-size: 0.6rem;
    letter-spacing: 0.4em;
    text-transform: uppercase;
    color: var(--text-muted);
    margin-bottom: 0.5rem;
  }

  .card-title {
    font-size: 1.4rem;
    font-weight: 600;
    letter-spacing: -0.02em;
    color: var(--text-primary);
  }

  .card-title span { color: #f87171; }

  .card-body {
    padding: 2rem 2.4rem 2.4rem;
    display: flex;
    flex-direction: column;
    gap: 1rem;
  }

  .card-message {
    font-size: 0.85rem;
    line-height: 1.8;
    color: var(--text-muted);
  }

  .divider {
    height: 1px;
    background: linear-gradient(90deg, transparent, var(--border), transparent);
  }

  /* ── Buttons ── */
  .btn-primary {
    display: block;
    width: 100%;
    padding: 0.9rem;
    background: linear-gradient(135deg, #1d4ed8, #2563eb);
    color: #fff;
    border: none;
    border-radius: 8px;
    font-family: 'Inter', sans-serif;
    font-size: 0.78rem;
    font-weight: 600;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    text-decoration: none;
    cursor: pointer;
    box-shadow: 0 4px 20px rgba(37, 99, 235, 0.35);
    transition: box-shadow 0.25s, opacity 0.25s;
  }

  .btn-primary:hover {
    box-shadow: 0 6px 28px rgba(37, 99, 235, 0.55);
    opacity: 0.92;
  }

  .btn-ghost {
    display: block;
    width: 100%;
    padding: 0.9rem;
    background: transparent;
    color: var(--text-muted);
    border: 1px solid var(--border);
    border-radius: 8px;
    font-family: 'Inter', sans-serif;
    font-size: 0.78rem;
    font-weight: 600;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    text-decoration: none;
    cursor: pointer;
    transition: border-color 0.25s, color 0.25s;
  }

  .btn-ghost:hover {
    border-color: rgba(50, 110, 230, 0.5);
    color: var(--accent-blue);
  }

  /* ── Footer ── */
  footer {
    border-top: 1px solid var(--border);
    padding: 1.8rem 3rem;
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 0.65rem;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    color: var(--text-muted);
  }

  footer span { color: var(--accent-blue); }

  @media (max-width: 560px) {
    header { padding: 1.2rem 1.5rem; }
    main { padding: 2rem 1rem; }
    footer { flex-direction: column; gap: 0.5rem; text-align: center; }
  }
</style>
</head>
<body>

<div class="page-wrapper">

  <header>
    <div class="logo-mark">Employee DB</div>
  </header>

  <main>
    <div class="card">

      <div class="card-header">
        <div class="card-icon">⚠️</div>
        <p class="card-eyebrow">Registration Failed</p>
        <h1 class="card-title">Already <span>Registered</span></h1>
      </div>

      <div class="card-body">
        <p class="card-message">
          This user is already registered in the system.<br>
          Please log in with your existing credentials.
        </p>

        <div class="divider"></div>

        <a href="login.jsp" class="btn-primary">Go to Login</a>
        <a href="/allemp" class="btn-ghost">Back to Dashboard</a>
      </div>

    </div>
  </main>

  <footer>
    <div>already_registered.jsp &mdash; <span>Java Web Application</span></div>
    <div>&copy; 2026. All rights reserved.</div>
  </footer>

</div>
</body>
</html>