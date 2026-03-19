<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.SpringBoot.entity.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Employee</title>
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

  .page-wrapper {
    position: relative;
    z-index: 1;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
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

  /* ── Main ── */
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

  /* ── Profile wrapper ── */
  .profile-wrapper {
    width: 100%;
    max-width: 680px;
    display: flex;
    flex-direction: column;
    gap: 1.2rem;
  }

  /* ── Avatar banner ── */
  .avatar-banner {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: 16px;
    padding: 2.4rem;
    display: flex;
    align-items: center;
    gap: 2rem;
    position: relative;
    overflow: hidden;
  }

  .avatar-banner::before {
    content: '';
    position: absolute;
    top: 0; left: 0;
    width: 100%; height: 3px;
    background: linear-gradient(90deg, transparent, var(--accent-blue), transparent);
  }

  .avatar {
    width: 72px;
    height: 72px;
    border-radius: 50%;
    background: linear-gradient(135deg, #1d4ed8, #2563eb);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.6rem;
    font-weight: 600;
    color: #fff;
    letter-spacing: -0.02em;
    flex-shrink: 0;
    box-shadow: 0 4px 20px rgba(37, 99, 235, 0.4);
  }

  .avatar-info {
    display: flex;
    flex-direction: column;
    gap: 0.3rem;
  }

  .avatar-eyebrow {
    font-size: 0.6rem;
    letter-spacing: 0.4em;
    text-transform: uppercase;
    color: var(--text-muted);
  }

  .avatar-name {
    font-size: 1.6rem;
    font-weight: 600;
    letter-spacing: -0.02em;
    color: var(--text-primary);
  }

  .avatar-id {
    font-family: 'Courier New', monospace;
    font-size: 0.78rem;
    color: var(--accent-light);
  }

  /* ── Details grid ── */
  .details-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;
  }

  .detail-card {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 1.4rem 1.6rem;
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
    transition: border-color 0.25s, transform 0.25s;
    animation: fadeUp 0.6s ease both;
  }

  .detail-card:nth-child(1) { animation-delay: 0.05s; }
  .detail-card:nth-child(2) { animation-delay: 0.10s; }
  .detail-card:nth-child(3) { animation-delay: 0.15s; }
  .detail-card:nth-child(4) { animation-delay: 0.20s; }

  .detail-card:hover {
    border-color: rgba(37, 99, 235, 0.45);
    transform: translateY(-2px);
  }

  .detail-label {
    font-size: 0.6rem;
    font-weight: 600;
    letter-spacing: 0.3em;
    text-transform: uppercase;
    color: var(--text-muted);
  }

  .detail-value {
    font-size: 0.95rem;
    font-weight: 400;
    color: var(--text-primary);
    word-break: break-all;
  }

  .detail-value.mono {
    font-family: 'Courier New', monospace;
    font-size: 0.85rem;
    color: var(--accent-light);
  }

  /* ── Action row ── */
  .action-row {
    display: flex;
    gap: 1rem;
  }

  .btn-primary {
    flex: 1;
    padding: 0.85rem;
    background: linear-gradient(135deg, #1d4ed8, #2563eb);
    color: #fff;
    border: none;
    border-radius: 8px;
    font-family: 'Inter', sans-serif;
    font-size: 0.75rem;
    font-weight: 600;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    text-decoration: none;
    text-align: center;
    cursor: pointer;
    box-shadow: 0 4px 16px rgba(37, 99, 235, 0.35);
    transition: box-shadow 0.25s, opacity 0.25s;
  }

  .btn-primary:hover {
    box-shadow: 0 6px 24px rgba(37, 99, 235, 0.55);
    opacity: 0.92;
  }

  .btn-ghost {
    flex: 1;
    padding: 0.85rem;
    background: transparent;
    color: var(--text-muted);
    border: 1px solid var(--border);
    border-radius: 8px;
    font-family: 'Inter', sans-serif;
    font-size: 0.75rem;
    font-weight: 600;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    text-decoration: none;
    text-align: center;
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

  @media (max-width: 600px) {
    header { padding: 1.2rem 1.5rem; }
    main { padding: 2rem 1rem; }
    .avatar-banner { flex-direction: column; text-align: center; }
    .details-grid { grid-template-columns: 1fr; }
    .action-row { flex-direction: column; }
    footer { flex-direction: column; gap: 0.5rem; text-align: center; }
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
    <div class="profile-wrapper">

      <!-- Avatar Banner -->
      <div class="avatar-banner">
        <div class="avatar">
          <%= emp.getEmpName().substring(0, 1).toUpperCase() %>
        </div>
        <div class="avatar-info">
          <p class="avatar-eyebrow">Employee Profile</p>
          <h1 class="avatar-name"><%= emp.getEmpName() %></h1>
          <p class="avatar-id"><%= emp.getEmpId() %></p>
        </div>
      </div>

      <!-- Details Grid -->
      <div class="details-grid">

        <div class="detail-card">
          <span class="detail-label">Employee ID</span>
          <span class="detail-value mono"><%= emp.getEmpId() %></span>
        </div>

        <div class="detail-card">
          <span class="detail-label">Full Name</span>
          <span class="detail-value"><%= emp.getEmpName() %></span>
        </div>

        <div class="detail-card">
          <span class="detail-label">Email Address</span>
          <span class="detail-value"><%= emp.getEmpEmail() %></span>
        </div>

        <div class="detail-card">
          <span class="detail-label">Contact Number</span>
          <span class="detail-value"><%= emp.getEmpContactNo() %></span>
        </div>

        <div class="detail-card">
          <span class="detail-label">City</span>
          <span class="detail-value"><%= emp.getEmpCity() %></span>
        </div>

        <div class="detail-card">
          <span class="detail-label">Record ID</span>
          <span class="detail-value mono">#<%= emp.getId() %></span>
        </div>

      </div>

      <!-- Action Buttons -->
      <div class="action-row">
        <a href="/editemp/<%= emp.getId() %>" class="btn-primary">Edit Employee</a>
        <a href="/allemp" class="btn-ghost">Back to Dashboard</a>
      </div>

    </div>
  </main>

  <footer>
    <div>view_employee.jsp &mdash; <span>Java Web Application</span></div>
    <div>&copy; 2026. All rights reserved.</div>
  </footer>

</div>
</body>
</html>