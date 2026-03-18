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

  nav { display: flex; gap: 2.4rem; align-items: center; }

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

  .btn-add {
    padding: 0.55rem 1.4rem;
    font-family: 'Inter', sans-serif;
    font-size: 0.72rem;
    font-weight: 600;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    text-decoration: none;
    cursor: pointer;
    border-radius: 8px;
    background: linear-gradient(135deg, #1d4ed8, #2563eb);
    color: #fff;
    border: none;
    box-shadow: 0 4px 16px rgba(37, 99, 235, 0.35);
    transition: all 0.25s ease;
  }

  .btn-add:hover {
    box-shadow: 0 4px 24px rgba(37, 99, 235, 0.55);
    opacity: 0.9;
  }

  main {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 4rem 2rem;
    animation: fadeUp 0.9s ease both;
  }

  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(20px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  .table-wrapper {
    width: 100%;
    max-width: 1100px;
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: 12px;
    overflow: hidden;
  }

  .table-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 1.2rem 1.6rem;
    border-bottom: 1px solid var(--border);
    background: rgba(37, 99, 235, 0.05);
  }

  .table-header h2 {
    font-size: 0.75rem;
    font-weight: 600;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: var(--accent-light);
    margin: 0;
  }

  .table-meta {
    font-size: 0.65rem;
    letter-spacing: 0.1em;
    color: var(--text-muted);
    text-transform: uppercase;
  }

  table.employee {
    width: 100%;
    border-collapse: collapse;
    font-size: 0.82rem;
  }

  table.employee thead {
    background: rgba(37, 99, 235, 0.08);
  }

  table.employee th {
    padding: 0.85rem 1.4rem;
    text-align: left;
    font-size: 0.65rem;
    font-weight: 600;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    color: var(--text-muted);
    border-bottom: 1px solid var(--border);
    white-space: nowrap;
  }

  table.employee td {
    padding: 0.9rem 1.4rem;
    color: var(--text-primary);
    font-weight: 300;
    border-bottom: 1px solid rgba(50, 110, 230, 0.08);
    white-space: nowrap;
  }

  table.employee tbody tr:last-child td {
    border-bottom: none;
  }

  table.employee tbody tr {
    transition: background 0.2s ease;
  }

  table.employee tbody tr:hover {
    background: rgba(37, 99, 235, 0.06);
  }

  table.employee td:first-child,
  table.employee th:first-child {
    color: var(--text-muted);
    font-size: 0.72rem;
    width: 56px;
  }

  table.employee td:nth-child(2) {
    font-family: 'Courier New', monospace;
    font-size: 0.78rem;
    color: var(--accent-light);
  }

  /* ── Per-row action buttons ── */
  .actions {
    display: flex;
    gap: 0.5rem;
    align-items: center;
  }

  .btn-edit,
  .btn-delete {
    display: inline-block;
    padding: 0.3rem 0.85rem;
    font-family: 'Inter', sans-serif;
    font-size: 0.62rem;
    font-weight: 600;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    text-decoration: none;
    border-radius: 6px;
    cursor: pointer;
    border: none;
    transition: all 0.2s ease;
    white-space: nowrap;
  }

  .btn-edit {
    background: rgba(37, 99, 235, 0.15);
    color: var(--accent-light);
    border: 1px solid rgba(37, 99, 235, 0.3);
  }

  .btn-edit:hover {
    background: rgba(37, 99, 235, 0.28);
    border-color: rgba(37, 99, 235, 0.6);
  }

  .btn-delete {
    background: rgba(220, 38, 38, 0.1);
    color: #f87171;
    border: 1px solid rgba(220, 38, 38, 0.25);
  }

  .btn-delete:hover {
    background: rgba(220, 38, 38, 0.22);
    border-color: rgba(220, 38, 38, 0.5);
  }

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

  @media (max-width: 768px) {
    header { padding: 1.2rem 1.5rem; }
    nav { gap: 1.5rem; }
    main { padding: 2.5rem 1rem; }
    .table-wrapper { border-radius: 0; border-left: none; border-right: none; overflow-x: auto; }
    .table-header { padding: 1rem 1.2rem; }
    table.employee th,
    table.employee td { padding: 0.75rem 1rem; }
    footer { flex-direction: column; gap: 0.5rem; text-align: center; }
  }
</style>
</head>
<body>

<div class="page-wrapper">

  <header>
    <div class="logo-mark">Employee DB</div>
    <nav>
      <a href="#">About</a>
      <a href="#">Work</a>
      <a href="#">Contact</a>
      <a href="/addemp" class="btn-add">+ Add Employee</a>
    </nav>
  </header>

  <main>
    <div class="table-wrapper">
      <div class="table-header">
        <h2>Employees</h2>
        <span class="table-meta">employees table</span>
      </div>

      <%
        List<Employee> listOfEmp = (List<Employee>) request.getAttribute("listOfEmp");
      %>

      <table class="employee">
        <thead>
          <tr>
            <th>#</th>
            <th>Emp ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Contact No</th>
            <th>City</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <% for(Employee emp : listOfEmp) { %>
          <tr>
            <td><%= emp.getId() %></td>
            <td><%= emp.getEmpId() %></td>
            <td><%= emp.getEmpName() %></td>
            <td><%= emp.getEmpEmail() %></td>
            <td><%= emp.getEmpContactNo() %></td>
            <td><%= emp.getEmpCity() %></td>
            <td>
              <div class="actions">
                <a href="/editemp/<%= emp.getId() %>" class="btn-edit">Edit</a>
                <a href="/deleteemp/<%= emp.getId() %>"
                   class="btn-delete"
                   onclick="return confirm('Delete <%= emp.getEmpName() %>?')">Delete</a>
              </div>
            </td>
          </tr>
          <% } %>
        </tbody>
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