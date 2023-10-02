import 'Department.dart';

class DepartmentController {
  Set<Department> departments = {};

  void displayAllDepartments() {
    if (departments.isEmpty) {
      print("No departments found.");
      return;
    }

    for (Department department in departments) {
      print("Department ID: ${department.id}");
      print("Department Name: ${department.name}");
      print("---------------------------");
    }
  }

  void displayDepartment(String departmentName) {
    Department department = findDepartment(departmentName);
    if (department != null) {
      print("Department ID: ${department.id}");
      print("Department Name: ${department.name}");
    } else {
      print("Department not found.");
    }
  }

  void addDepartment(String id, String name) {
    if (findDepartment(name) == null) {
      Department department = Department(id, name);
      departments.add(department);
      print("Department added successfully.");
    } else {
      print("Department name already exists. Department not added.");
    }
  }

  void updateDepartment(String departmentName, String newName) {
    Department department = findDepartment(departmentName);
    if (department != null) {
      if (findDepartment(newName) == null) {
        department.name = newName;
        print("Department updated successfully.");
      } else {
        print("New department name already exists. Update failed.");
      }
    } else {
      print("Department not found. Update failed.");
    }
  }

  void deleteDepartment(departmentName) {
    Department department = findDepartment(departmentName);
    if (department != null) {
      departments.remove(department);
      print("Department deleted successfully.");
    } else {
      print("Department not found. Deletion failed.");
    }
  }

   findDepartment(String departmentName) {
    for (Department department in departments) {
      if (department.name == departmentName) {
        return department;
      }
    }
    
  }
}
