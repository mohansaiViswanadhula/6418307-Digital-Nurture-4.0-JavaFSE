public class Main {
    public static void main(String[] args) {
        EmployeeSystem.addEmployee(new Employee(1, "Ravi", "Manager", 50000));
        EmployeeSystem.addEmployee(new Employee(2, "Priya", "Developer", 40000));
        EmployeeSystem.addEmployee(new Employee(3, "Anil", "Tester", 35000));
        System.out.println("All Employees:");
        EmployeeSystem.showAllEmployees();

        System.out.println("\nSearching for ID 2:");
        Employee e = EmployeeSystem.searchById(2);
        if (e != null) {
            System.out.println("Found: " + e);
        }

        System.out.println("\nDeleting ID 1:");
        EmployeeSystem.deleteEmployee(1);
        System.out.println("Updated Employees:");
        EmployeeSystem.showAllEmployees();
    }
}

