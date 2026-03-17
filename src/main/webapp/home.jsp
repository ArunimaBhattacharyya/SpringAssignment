<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.SpringBoot.entity.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>This is home.jsp</title>
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
    --accent-dim:   #1d4ed8;
    --text-primary: #f0f4ff;
    --text-muted:   #4a5580;
    --border:       rgba(50, 110, 230, 0.25);
  }

  html, body {
    height: 100%;
    background-color: var(--bg-deep);
    color: var(--text-primary);
    font-family: 'Inter', sans-serif;
    font-weight: 300;
    overflow-x: hidden;
  }

  /* Radial glow backdrop */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background:
      radial-gradient(ellipse at 20% 50%, rgba(30, 80, 200, 0.12) 0%, transparent 60%),
      radial-gradient(ellipse at 80% 20%, rgba(0, 120, 255, 0.08) 0%, transparent 50%);
    pointer-events: none;
    z-index: 0;
  }

  .page-wrapper {
    position: relative;
    z-index: 1;
    min-height: 100vh;
    display: grid;
    grid-template-rows: auto 1fr auto;
  }

  /* Header */
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

  nav { display: flex; gap: 2.4rem; }

  nav a {
    text-decoration: none;
    font-size: 0.72rem;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: var(--text-muted);
    transition: color 0.3s;
    position: relative;
  }

  nav a::after {
    content: '';
    position: absolute;
    left: 0; bottom: -4px;
    width: 0; height: 1px;
    background: var(--accent-blue);
    transition: width 0.35s ease;
  }

  nav a:hover { color: var(--accent-blue); }
  nav a:hover::after { width: 100%; }

  /* Hero */
  .hero {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding: 8rem 2rem 6rem;
    gap: 2rem;
    animation: fadeUp 1.2s ease both;
  }

  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(30px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  .eyebrow {
    font-size: 0.65rem;
    letter-spacing: 0.45em;
    text-transform: uppercase;
    color: var(--text-muted);
    animation: fadeUp 1.2s 0.1s ease both;
  }

  h1 {
    font-weight: 600;
    font-size: clamp(3rem, 8vw, 6.5rem);
    line-height: 1.0;
    letter-spacing: -0.03em;
    color: var(--text-primary);
    animation: fadeUp 1.2s 0.2s ease both;
  }

  h1 strong {
    color: var(--accent-blue);
    font-weight: 600;
  }

  .divider {
    width: 60px;
    height: 1px;
    background: linear-gradient(90deg, transparent, var(--accent-blue), transparent);
    animation: fadeUp 1.2s 0.35s ease both;
  }

  .subtitle {
    max-width: 480px;
    font-size: 0.88rem;
    line-height: 1.9;
    letter-spacing: 0.04em;
    color: var(--text-muted);
    animation: fadeUp 1.2s 0.45s ease both;
  }

  .cta-row {
    display: flex;
    gap: 1rem;
    animation: fadeUp 1.2s 0.6s ease both;
  }

  .btn {
    padding: 0.75rem 2.2rem;
    font-family: 'Inter', sans-serif;
    font-size: 0.75rem;
    font-weight: 600;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    text-decoration: none;
    cursor: pointer;
    border-radius: 8px;
    transition: all 0.25s ease;
  }

  .btn-primary {
    background: linear-gradient(135deg, #1d4ed8, #2563eb);
    color: #fff;
    border: none;
    box-shadow: 0 4px 16px rgba(37, 99, 235, 0.35);
  }

  .btn-primary:hover {
    box-shadow: 0 4px 24px rgba(37, 99, 235, 0.55);
    opacity: 0.9;
  }

  .btn-ghost {
    background: transparent;
    color: var(--text-muted);
    border: 1px solid var(--border);
  }

  .btn-ghost:hover {
    border-color: rgba(50, 110, 230, 0.5);
    color: var(--accent-blue);
  }

  /* Scroll hint */
  .scroll-hint {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
    font-size: 0.6rem;
    letter-spacing: 0.3em;
    text-transform: uppercase;
    color: var(--text-muted);
    animation: fadeUp 1.4s 1s ease both;
  }

  .scroll-hint .line {
    width: 1px;
    height: 36px;
    background: linear-gradient(to bottom, var(--accent-blue), transparent);
    animation: scrollPulse 2s ease-in-out infinite;
  }

  @keyframes scrollPulse {
    0%, 100% { opacity: 0.3; transform: scaleY(0.8); }
    50%       { opacity: 1;   transform: scaleY(1); }
  }

  /* Cards */
  .cards-section {
    padding: 2rem 3rem 7rem;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    gap: 1.4rem;
    max-width: 1100px;
    margin: 0 auto;
    width: 100%;
    animation: fadeUp 1.2s 0.75s ease both;
  }

  .card {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 2.2rem 2rem;
    position: relative;
    overflow: hidden;
    transition: border-color 0.35s, box-shadow 0.35s, transform 0.35s;
  }

  .card::before {
    content: '';
    position: absolute;
    top: 0; left: 0;
    width: 100%; height: 2px;
    background: linear-gradient(90deg, transparent, var(--accent-blue), transparent);
    opacity: 0;
    transition: opacity 0.35s;
  }

  .card:hover {
    border-color: rgba(37, 99, 235, 0.5);
    box-shadow: 0 8px 40px rgba(0, 0, 0, 0.6), 0 0 30px rgba(37, 99, 235, 0.07);
    transform: translateY(-4px);
  }

  .card:hover::before { opacity: 1; }

  .card-icon {
    font-size: 1.5rem;
    margin-bottom: 1.1rem;
    display: block;
  }

  .card-title {
    font-size: 1rem;
    font-weight: 600;
    color: var(--text-primary);
    margin-bottom: 0.6rem;
    letter-spacing: -0.01em;
  }

  .card-body {
    font-size: 0.78rem;
    line-height: 1.8;
    color: var(--text-muted);
  }

  /* Footer */
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

  @media (max-width: 640px) {
    header { padding: 1.2rem 1.5rem; }
    nav { gap: 1.5rem; }
    .hero { padding: 5rem 1.5rem 4rem; }
    .cards-section { padding: 2rem 1.5rem 5rem; }
    footer { flex-direction: column; gap: 0.5rem; text-align: center; }
  }
</style>
</head>
<body>

<a href="addemp"> Add New Employee </a>
<div class="page-wrapper">

  <header>
    <div class="logo-mark">Home.jsp</div>
    <nav>
      <a href="#">About</a>
      <a href="#">Work</a>
      <a href="#">Contact</a>
    </nav>
  </header>

  <main>
    <section class="hero">
      <p class="eyebrow">Welcome to your application</p>
      <h1><strong>Home.jsp</strong></h1>
      <div class="divider"></div>
      <p class="subtitle">A refined starting point for your Java web application — elegant, dark, and ready to build upon.</p>
      <div class="cta-row">
        <a href="#" class="btn btn-primary">Get Started</a>
        <a href="#" class="btn btn-ghost">Learn More</a>
      </div>
      <div class="scroll-hint">
        <div class="line"></div>
        Scroll
      </div>
    </section>

    <div class="employee-section">
          <h2 class="section-title">View All Employees</h2>

          <%
            List<Employee> listOfEmp = (List<Employee>) request.getAttribute("listOfEmp");
          %>

          <table class="employee">
            <tr>
              <th>Id</th>
              <th>Emp Id</th>
              <th>Name</th>
              <th>Email</th>
              <th>Contact No</th>
              <th>City</th>
            </tr>

            <% for(Employee emp : listOfEmp) { %>
            <tr>
              <td><%= emp.getId() %></td>
              <td><%= emp.getEmpId() %></td>
              <td><%= emp.getEmpName() %></td>
              <td><%= emp.getEmpEmail() %></td>
              <td><%= emp.getEmpContactNo() %></td>
              <td><%= emp.getEmpCity() %></td>
            </tr>
            <% } %>
          </table>
        </div>
  </main>

  <footer>
    <div>home.jsp &mdash; <span>Java Web Application</span></div>
    <div>&copy; 2026. All rights reserved.</div>
  </footer>

</div>
</body>
</html>
