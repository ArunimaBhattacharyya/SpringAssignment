<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.SpringBoot.entity.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Employee</title>
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
    --bg-input:     #080f1e;
    --accent-blue:  #2563eb;
    --accent-light: #3b82f6;
    --accent-dim:   #1d4ed8;
    --text-primary: #f0f4ff;
    --text-muted:   #4a5580;
    --border:       rgba(50, 110, 230, 0.25);
    --border-focus: rgba(37, 99, 235, 0.7);
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

  .back-link {
    text-decoration: none;
    font-size: 0.72rem;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: var(--text-muted);
    transition: color 0.3s;
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }

  .back-link::before {
    content: '←';
    font-size: 0.9rem;
    transition: transform 0.3s;
  }

  .back-link:hover { color: var(--accent-blue); }
  .back-link:hover::before { transform: translateX(-3px); }

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

  /* ── Form card ── */
  .form-card {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: 16px;
    width: 100%;
    max-width: 480px;
    overflow: hidden;
  }

  .form-card-header {
    padding: 2rem 2.4rem 1.6rem;
    border-bottom: 1px solid var(--border);
    background: rgba(37, 99, 235, 0.05);
  }

  .form-eyebrow {
    font-size: 0.6rem;
    letter-spacing: 0.4em;
    text-transform: uppercase;
    color: var(--text-muted);
    margin-bottom: 0.5rem;
  }

  .form-title {
    font-size: 1.5rem;
    font-weight: 600;
    letter-spacing: -0.02em;
    color: var(--text-primary);
  }

  .form-title span { color: var(--accent-blue); }

  .form-body {
    padding: 2rem 2.4rem 2.4rem;
    display: flex;
    flex-direction: column;
    gap: 1.2rem;
  }

  /* ── Field ── */
  .field {
    display: flex;
    flex-direction: column;
    gap: 0.45rem;
    animation: fadeUp 0.6s ease both;
  }

  .field:nth-child(2) { animation-delay: 0.05s; }
  .field:nth-child(3) { animation-delay: 0.10s; }
  .field:nth-child(4) { animation-delay: 0.15s; }
  .field:nth-child(5) { animation-delay: 0.20s; }

  .field label {
    font-size: 0.68rem;
    font-weight: 500;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    color: var(--text-muted);
  }

  .field input {
    background: var(--bg-input);
    border: 1px solid var(--border);
    border-radius: 8px;
    padding: 0.75rem 1rem;
    font-family: 'Inter', sans-serif;
    font-size: 0.88rem;
    font-weight: 300;
    color: var(--text-primary);
    width: 100%;
    outline: none;
    transition: border-color 0.25s, box-shadow 0.25s, background 0.25s;
    -webkit-appearance: none;
  }

  .field input:hover {
    border-color: rgba(50, 110, 230, 0.45);
  }

  .field input:focus {
    border-color: var(--border-focus);
    box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
    background: rgba(8, 15, 30, 0.9);
  }

  /* ── Divider ── */
  .form-divider {
    height: 1px;
    background: linear-gradient(90deg, transparent, var(--border), transparent);
    margin: 0.4rem 0;
  }

  /* ── Submit ── */
  .submit-btn {
    margin-top: 0.6rem;
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
    cursor: pointer;
    box-shadow: 0 4px 20px rgba(37, 99, 235, 0.35);
    transition: box-shadow 0.25s, opacity 0.25s, transform 0.15s;
    animation: fadeUp 0.6s 0.25s ease both;
  }

  .submit-btn:hover {
    box-shadow: 0 6px 28px rgba(37, 99, 235, 0.55);
    opacity: 0.92;
  }

  .submit-btn:active {
    transform: scale(0.985);
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
    .form-card-header,
    .form-body { padding-left: 1.5rem; padding-right: 1.5rem; }
    footer { flex-direction: column; gap: 0.5rem; text-align: center; padding: 1.4rem 1.5rem; }
  }
</style>
</head>
<body>

<%
    Employee emp = (Employee) request.getAttribute("emp");
%>

<div class="page-wrapper">

  <header>
    <div class="logo-mark">Employee DB</div>
    <a href="/allemp" class="back-link">Back to Dashboard</a>
  </header>

  <main>
    <div class="form-card">

      <div class="form-card-header">
        <p class="form-eyebrow">Human Resources</p>
        <h1 class="form-title">Edit <span>Employee</span></h1>
      </div>

      <form action="/updateemp" method="post" class="form-body">

        <input type="hidden" name="id" value="<%= emp.getId() %>">

        <div class="field">
          <label for="empName">Full Name</label>
          <input type="text" id="empName" name="empName" value="<%= emp.getEmpName() %>" required />
        </div>

        <div class="field">
          <label for="empEmail">Email Address</label>
          <input type="email" id="empEmail" name="empEmail" value="<%= emp.getEmpEmail() %>" required />
        </div>

        <div class="field">
          <label for="empContactNo">Contact Number</label>
          <input type="tel" id="empContactNo" name="empContactNo" value="<%= emp.getEmpContactNo() %>" required />
        </div>

        <div class="field">
          <label for="empCity">City</label>
          <input type="text" id="empCity" name="empCity" value="<%= emp.getEmpCity() %>" />
        </div>

        <div class="form-divider"></div>

        <button type="submit" class="submit-btn">Update Employee</button>

      </form>
    </div>
  </main>

  <footer>
    <div>edit_emp.jsp &mdash; <span>Java Web Application</span></div>
    <div>&copy; 2026. All rights reserved.</div>
  </footer>

</div>
</body>
</html>