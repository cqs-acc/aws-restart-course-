# Lesson Note: File Handling in Python 

## 1. Introduction to File Handling 

In programming, file handling allows us to store, retrieve, and manipulate data permanently. 
Unlike variables whose data disappears when a program ends, files keep data even after execution. 
This is essential in data analytics, where datasets (like CSV, TXT, and JSON) must be read and written frequently. 

Python makes file handling very simple through the built-in `open()` function. 

## 2. The open() Function 

The `open()` function is used to open a file and returns a file object that lets you interact with the file. 

**Syntax:**  
```python
file_object = open("filename", "mode") 
```

- **filename** → the name or path of the file you want to open.  
- **mode** → defines what you want to do with the file (read, write, append, etc.).  

## 3. File Opening Modes 

| Mode | Meaning | Description |
|------|----------|-------------|
| 'r' | Read | Opens file for reading (default). File must exist. |
| 'w' | Write | Opens file for writing. Creates file if not exist, overwrites if it does. |
| 'a' | Append | Opens file for writing. Adds new content at the end without deleting old data. |
| 'x' | Create | Creates a new file; raises error if it already exists. |
| 'r+' | Read & Write | Opens for both reading and writing. File must exist. |
| 'b' | Binary mode | Used for binary files (like images, PDFs). Usually combined: 'rb', 'wb'. |

## 4. Writing to Files 

To write data into a file:  
```python
f = open("example.txt", "w") 
f.write("Hello Data Analyst!\nWelcome to file handling in Python.") 
f.close() 
```

**Explanation:**  
- `"w"` creates or overwrites the file.  
- `write()` adds content.  
- `close()` ensures data is saved and the file is released.  

## 5. Reading from Files 

You can read content using several methods.  

### read() — Reads the whole file  
```python
f = open("example.txt", "r") 
content = f.read() 
print(content) 
f.close() 
```

### readline() — Reads one line at a time  
```python
f = open("example.txt", "r") 
print(f.readline()) 
print(f.readline()) 
f.close() 
```

### readlines() — Reads all lines into a list  
```python
f = open("example.txt", "r") 
lines = f.readlines() 
print(lines) 
f.close() 
```
Each line becomes a separate list item — useful when analyzing line-based data.  

## 6. The with Statement (Best Practice)  

Opening files using **with** is the safest way to handle files.  
It automatically closes the file, even if an error occurs.  

```python
with open("example.txt", "r") as f: 
    content = f.read() 
    print(content) 
# No need to call f.close() 
```

**Why use with?**  
- Prevents memory leaks.  
- Cleaner, shorter, and error-safe.  

## 7. The File Pointer — tell() and seek()  

Every file operation has a pointer (cursor) showing where the next read/write happens.  

**tell() — shows current position**  
```python
with open("example.txt", "r") as f: 
    print(f.tell())  # usually 0 at start 
    f.read(5) 
    print(f.tell())  # pointer moved after reading 5 bytes 
```

**seek() — moves pointer to a new position**  
```python
with open("example.txt", "r") as f: 
    f.seek(7)     # skip first 7 characters 
    print(f.read()) 
```
This helps when you want to re-read or partially process a file.  

## 8. Appending Data to a File  
```python
with open("example.txt", "a") as f: 
    f.write("\nThis line was added later.") 
```

## 9. Checking If a File Exists  
```python
import os 
if os.path.exists("example.txt"): 
    print("The file exists!") 
else: 
    print("File not found.") 
```
You can also check if a path is a file or a directory:  
```python
os.path.isfile("example.txt") 
os.path.isdir("data_folder") 
```

## 10. Working with Real Data Files (for Data Analytics)  

In data analytics, you’ll often read data from structured files like CSV or JSON.  

### Reading Text Data (e.g., Logs or Notes)  
```python
with open("notes.txt", "r") as f: 
    data = f.readlines() 
    for line in data: 
        print(line.strip()) 
```
This is useful for reading logs or raw text data line by line.  

### Writing Processed Results to a File  
```python
results = ["John, 85", "Mary, 90", "Tunde, 78"] 
with open("scores.txt", "w") as f: 
    for item in results: 
        f.write(item + "\n") 
```

### Reading CSV Files (manually)  
```python
with open("data.csv", "r") as f: 
    for line in f: 
        values = line.strip().split(",") 
        print(values) 
```

## 11. Handling Exceptions in File Operations  
```python
try: 
    f = open("missing.txt", "r") 
    print(f.read()) 
except FileNotFoundError: 
    print("The file does not exist.") 
finally: 
    if 'f' in locals(): 
        f.close() 
```

## 12. File Handling and Functions (Integration)  
```python
def read_file(filename): 
    with open(filename, "r") as f: 
        return f.read() 

def write_file(filename, content): 
    with open(filename, "w") as f: 
        f.write(content) 

write_file("summary.txt", "Python file handling is powerful!") 
print(read_file("summary.txt")) 
```

## 13. Practice Exercises  

- Create a text file named `notes.txt` and write three lines about Python.  
- Append another line without deleting previous content.  
- Use `tell()` and `seek()` to manipulate the file pointer.  
- Handle a missing file gracefully using `try-except`.  
- Write a Python function that accepts a list of employee names and writes each to a file.  

## 14. Real-World Relevance for Data Analysts  

| Task | Use of File Handling |
|------|----------------------|
| Reading raw CSVs before using pandas | open() + split() |
| Saving processed data summaries | write() |
| Logging analysis steps | append() |
| Reading JSON configuration files | open() + json.load() |
| Managing data pipelines | read/write control files |

## 15. Summary  

- `open()` creates a file object.  
- Modes define what operation you perform (`r`, `w`, `a`, `x`, `b`).  
- `read()`, `write()`, `tell()`, `seek()`, and `close()` are core methods.  
- Always prefer the `with` statement — safer and cleaner.  
- Combine file handling with functions, error handling, and loops for data-driven scripts.  
