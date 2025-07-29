<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  
</head>
<body>

<h1>🎓 SQL Student Database – Mini Project</h1>

<p>
This project builds a complete <strong>MySQL database system</strong> to manage students, teachers, classes, and marks efficiently.  
It comes bundled with <strong>20+ useful SQL queries</strong> that highlight concepts like 
<code>JOIN</code>, <code>GROUP BY</code>, <code>HAVING</code>, and <code>SUBQUERIES</code>.
</p>

<hr>

<h2>📁 Folder Contents</h2>
<ul>
  <li><strong>Student_db.sql</strong> includes:
    <ol>
      <li>Database & table creation scripts</li>
      <li>Sample data for each table</li>
      <li>20 common SQL queries with inline comments</li>
    </ol>
  </li>
</ul>

<hr>

<h2>🧮 Database Tables Overview</h2>

<h3>👨‍🎓 Students</h3>
<table border="1">
  <tr><th>Field</th><th>Type</th><th>Details</th></tr>
  <tr><td>student_id</td><td>INT (PK)</td><td>Primary key ID</td></tr>
  <tr><td>name</td><td>VARCHAR(50)</td><td>Full name</td></tr>
  <tr><td>age</td><td>INT</td><td>Age in years</td></tr>
  <tr><td>gender</td><td>VARCHAR(10)</td><td>Male or Female</td></tr>
  <tr><td>class_id</td><td>INT (FK)</td><td>Foreign key to Classes</td></tr>
</table>

<h3>🏫 Classes</h3>
<table border="1">
  <tr><th>Field</th><th>Type</th><th>Details</th></tr>
  <tr><td>class_id</td><td>INT (PK)</td><td>Unique class identifier</td></tr>
  <tr><td>class_name</td><td>VARCHAR(50)</td><td>e.g., 10th Grade</td></tr>
  <tr><td>teacher_id</td><td>INT (FK)</td><td>Linked to Teachers table</td></tr>
</table>

<h3>👩‍🏫 Teachers</h3>
<table border="1">
  <tr><th>Field</th><th>Type</th><th>Details</th></tr>
  <tr><td>teacher_id</td><td>INT (PK)</td><td>Primary ID for teacher</td></tr>
  <tr><td>name</td><td>VARCHAR(50)</td><td>Instructor name</td></tr>
  <tr><td>subject</td><td>VARCHAR(50)</td><td>Teaching subject</td></tr>
</table>

<h3>📋 Marks</h3>
<table border="1">
  <tr><th>Field</th><th>Type</th><th>Details</th></tr>
  <tr><td>mark_id</td><td>INT (PK)</td><td>Mark record ID</td></tr>
  <tr><td>student_id</td><td>INT (FK)</td><td>References Students</td></tr>
  <tr><td>subject</td><td>VARCHAR(50)</td><td>Subject name</td></tr>
  <tr><td>marks</td><td>INT</td><td>Scored marks</td></tr>
</table>

<hr>

<h2>🧪 Sample SQL Queries</h2>

<b>🔹 List all students:</b>
<pre>
SELECT name FROM Students;
</pre>

<b>🔹 Display students with their class names:</b>
<pre>
SELECT S.name, C.class_name
FROM Students S
JOIN Classes C ON S.class_id = C.class_id;
</pre>

<b>🔹 Gender-wise count of students per class:</b>
<pre>
SELECT 
  C.class_name,
  COUNT(CASE WHEN S.gender = 'Male' THEN 1 END) AS boys,
  COUNT(CASE WHEN S.gender = 'Female' THEN 1 END) AS girls
FROM Students S
JOIN Classes C ON S.class_id = C.class_id
GROUP BY C.class_name;
</pre>

<hr>

<h2>🚀 Getting Started</h2>
<ol>
  <li>Launch <strong>MySQL Workbench</strong></li>
  <li>Import or open <code>Student_db.sql</code></li>
  <li>Execute the script (F5)</li>
  <li>Run queries and explore results</li>
</ol>

<hr>

<h2>🧠 SQL Concepts Demonstrated</h2>
<ul>
  <li>Table creation and data insertion</li>
  <li><code>JOIN</code>, <code>GROUP BY</code>, <code>ORDER BY</code>, <code>HAVING</code></li>
  <li>Aggregate functions (<code>SUM</code>, <code>AVG</code>, <code>COUNT</code>)</li>
  <li>Subqueries and filtering</li>
  <li>Temporary table creation</li>
</ul>

<hr>

<p>⭐ You are welcome to <strong>fork</strong> and expand this project for your practice and learning!</p>

</body>
</html>
