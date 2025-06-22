public class Main {
    public static void main(String[] args) {
        TaskList tasks = new TaskList();

        // Add tasks
        tasks.addTask(1, "Design homepage", "Pending");
        tasks.addTask(2, "Fix login bug", "In Progress");
        tasks.addTask(3, "Deploy update", "Completed");

        // Show tasks
        tasks.showTasks();

        // Search task
        System.out.println("\nSearching for Task ID 2:");
        Task found = tasks.searchTask(2);
        if (found != null) {
            System.out.println("Found: " + found);
        } else {
            System.out.println("Task not found.");
        }

        // Delete a task
        System.out.println("\nDeleting Task ID 1...");
        tasks.deleteTask(1);

        // Show tasks after deletion
        tasks.showTasks();
    }
}
