public class Solution {
     public static void main(String[] args) {
        Order[] orders = new Order[5];
        orders[0] = new Order(1, "ravi", 500.50);
        orders[1] = new Order(2, "mahesh", 200.75);
        orders[2] = new Order(3, "suresh", 100.00);
        orders[3] = new Order(4, "mohan", 800.25);
        orders[4] = new Order(5, "sai", 600.00);

        System.out.println("Orders sorted using Bubble Sort:");
        SortOrders.bubbleSort(orders);
        for (Order i : orders) {
            System.out.println(i);
        }

        
        orders[0] = new Order(1, "ravi", 500.50);
        orders[1] = new Order(2, "mahesh", 200.75);
        orders[2] = new Order(3, "suresh", 100.00);
        orders[3] = new Order(4, "mohan", 800.25);
        orders[4] = new Order(5, "sai", 600.00);

        System.out.println("\nOrders sorted using Quick Sort:");
        SortOrders.quickSort(orders, 0, orders.length - 1);
        for (Order i : orders) {
            System.out.println(i);
        }
    }
}

    

