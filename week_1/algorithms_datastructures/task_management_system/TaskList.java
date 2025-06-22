public class TaskList {
    Task head = null;

    // Add new task at end
    public void addTask(int id, String name, String status) {
        Task newTask = new Task(id, name, status);
        if (head == null) {
            head = newTask;
        } else {
            Task temp = head;
            while (temp.next != null) {
                temp = temp.next;
            }
            temp.next = newTask;
        }
    }
        // Search task by ID
    public Task searchTask(int id) {
        Task temp = head;
        while (temp != null) {
            if (temp.taskId == id) return temp;
            temp = temp.next;
        }
        return null;
    }

    // Traverse and print all tasks
    public void showTasks() {
        Task temp = head;
        if (temp == null) {
            System.out.println("No tasks found.");
            return;
        }
        System.out.println("All Tasks:");
        while (temp != null) {
            System.out.println(temp);
            temp = temp.next;
        }
    }

    // Delete task by ID
    public void deleteTask(int id) {
        if (head == null) return;

        if (head.taskId == id) {
            head = head.next;
            System.out.println("Task with ID " + id + " deleted.");
            return;
        }

        Task prev = head;
        Task curr = head.next;

        while (curr != null) {
            if (curr.taskId == id) {
                prev.next = curr.next;
                System.out.println("Task with ID " + id + " deleted.");
                return;
            }
            prev = curr;
            curr = curr.next;
        }

        System.out.println("Task with ID " + id + " not found.");
    }
}


