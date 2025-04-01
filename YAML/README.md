# 📄 YAML-Based Python Application

## 🌟 Introduction

### What is YAML? 📜
YAML (YAML Ain't Markup Language) is a human-readable data serialization format often used for configuration files and data exchange between programming languages. Its simplicity and readability make it a popular choice for applications requiring structured data.

### Why Use YAML? 🚀
- **Readability:** Easy to read and understand due to its clean syntax.
- **Data Representation:** Supports complex data structures like lists, dictionaries, and scalars.
- **Language Agnostic:** Works well with various programming languages, including Python.
- **Widely Used:** Commonly used for configuration files (e.g., Docker Compose, Kubernetes).

This project demonstrates how to work with YAML files using Python for easy data manipulation and filtering.

This project is a simple Python application that reads data from a YAML file (`students.yaml`), displays all student information, and filters students based on their GPA. The purpose is to demonstrate how to work with YAML files using Python.

---

## 🔥 Features
- Load data from a YAML file 📂
- Display all students' information 👨‍🎓👩‍🎓
- Filter students by GPA 📊
- Easy-to-read code with clear explanations 📜

---

## 📦 Requirements
Make sure you have Python and PyYAML installed. You can install PyYAML using:
```bash
pip install pyyaml
```

---

## 📝 YAML File Structure (`students.yaml`)
```yaml
students:
  - name: Alice
    age: 21
    major: Computer Science
    gpa: 3.8
  - name: Bob
    age: 22
    major: Mathematics
    gpa: 3.5
  - name: Charlie
    age: 20
    major: Physics
    gpa: 3.9
  - name: David
    age: 23
    major: Chemistry
    gpa: 3.2
  - name: Eva
    age: 21
    major: Computer Science
    gpa: 3.7
```

---

## 💻 Python Application (`app.py`)
```python
import yaml

def load_data(file_path):
    with open(file_path, 'r') as file:
        data = yaml.safe_load(file)
    return data

def display_students(students):
    print("\nAll Students:")
    for student in students:
        print(f"Name: {student['name']}, Age: {student['age']}, Major: {student['major']}, GPA: {student['gpa']}")

def filter_students_by_gpa(students, min_gpa):
    filtered_students = [s for s in students if s['gpa'] >= min_gpa]
    print(f"\nStudents with GPA >= {min_gpa}:")
    if filtered_students:
        for student in filtered_students:
            print(f"Name: {student['name']}, Age: {student['age']}, Major: {student['major']}, GPA: {student['gpa']}")
    else:
        print("No students found.")

def main():
    data = load_data('students.yaml')
    students = data['students']
    display_students(students)
    min_gpa = float(input("\nEnter minimum GPA to filter students: "))
    filter_students_by_gpa(students, min_gpa)

if __name__ == "__main__":
    main()
```

---

## 🌳 Setting Up Your Virtual Environment
1. **Create a Virtual Environment**
```bash
python -m venv venv
```
2. **Activate the Virtual Environment**
```bash
# For Windows Command Prompt
.\venv\Scripts\activate

# For Linux / macOS
source venv/bin/activate
```

---

## 🚀 Running the Application
Make sure both `app.py` and `students.yaml` are in the same directory.

```bash
python app.py
```

---

## 📌 Expected Output
```
All Students:
Name: Alice, Age: 21, Major: Computer Science, GPA: 3.8
Name: Bob, Age: 22, Major: Mathematics, GPA: 3.5
Name: Charlie, Age: 20, Major: Physics, GPA: 3.9
Name: David, Age: 23, Major: Chemistry, GPA: 3.2
Name: Eva, Age: 21, Major: Computer Science, GPA: 3.7

Enter minimum GPA to filter students: 3.6

Students with GPA >= 3.6:
Name: Alice, Age: 21, Major: Computer Science, GPA: 3.8
Name: Charlie, Age: 20, Major: Physics, GPA: 3.9
Name: Eva, Age: 21, Major: Computer Science, GPA: 3.7
```

### 📸 Output Screenshot
![Output Screenshot](https://via.placeholder.com/800x400?text=Output+Screenshot)

---

## 📚 Conclusion
This application demonstrates how to load and process YAML files using Python. You can expand it by adding more features like sorting, updating, or saving changes back to the YAML file.

Happy Coding! 😄🚀

