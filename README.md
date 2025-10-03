#### **AWS re/Start Course**

This repository contains structured learning materials, demo scripts, and lesson notes for the AWS re/Start Program. It’s designed to guide learners through essential topics in Linux, Bash scripting, Python programming, Databases, and AWS cloud fundamentals.

Each module includes practical labs, code examples, and hands-on exercises to help learners build real-world cloud and system administration skills.


#### **Course Structure**
```python
aws-restart-course/
├── 01_linux_basics/
├── 02_bash_scripting/
├── 03_python_basics/
├── 04_databases/
└── 05_aws_labs/
```


**01_linux_basics:** Commands, permissions, users/groups, and system management

**02_bash_scripting:** Automation with scripts and administrative tasks

**03_python_basics:** Core programming concepts and file handling for cloud operations

**04_databases:** SQL fundamentals with practical exercises and ER diagrams

**05_aws_labs:** Cloud labs and project-based tasks using AWS services

#### **Purpose**

This repository helps learners and instructors:

Access lesson notes and lab materials easily

Track changes and updates for each cohort

Practice foundational cloud and DevOps skills


## **Real order of SQL execution (logical order)**

When you run a query like:
```sql
SELECT * 
FROM city
WHERE population > 500000
ORDER BY city_name;
```
SQL doesn't start with the `SELECT`. 
It actually processes the clauses in this logical order: 

<table>
  <tr>
    <th>Step</th>
    <th>Clause</th>
    <th>What happens</th>
  </tr>
  <tr>
    <td>1</td>
    <td>FROM</td>
    <td>SQL starts by locating and loading the table(s) — here, it fetches data from city.</td>
  </tr>
  <tr>
    <td>2</td>
    <td>WHERE</td>
    <td>It filters the rows that meet the condition (e.g., only cities with population &gt; 500000).</td>
  </tr>
  <tr>
    <td>3</td>
    <td>GROUP BY (if present)</td>
    <td>SQL groups rows that have the same values in specified columns.</td>
  </tr>
  <tr>
    <td>4</td>
    <td>HAVING (if present)</td>
    <td>It filters the groups formed in the previous step.</td>
  </tr>
  <tr>
    <td>5</td>
    <td>SELECT</td>
    <td>Only now does SQL pick the columns (or expressions) you asked for.</td>
  </tr>
  <tr>
    <td>6</td>
    <td>ORDER BY</td>
    <td>Finally, it sorts the result set in the requested order.</td>
  </tr>
  <tr>
    <td>7</td>
    <td>LIMIT / OFFSET (if present)</td>
    <td>SQL may restrict the number of rows returned.</td>
  </tr>
</table>





