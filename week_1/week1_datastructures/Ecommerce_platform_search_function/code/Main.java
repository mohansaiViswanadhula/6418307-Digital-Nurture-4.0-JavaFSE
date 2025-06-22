import java.util.Arrays;
public class Main{
 public static void main(String[] args) {
        Gadget[] products = {
            new Gadget(101, "Laptop", "Electronics"),
            new Gadget(102, "Tablet", "Electronics"),
            new Gadget(103, "Camera", "Photography"),
            new Gadget(104, "Mobile", "Electronics"),
            new Gadget(105, "Watch", "Accessories")
        };

        String searchFor = "Tablet";

        // Linear Search
        int index1 = EcommerceSearch.linearSearch(products, searchFor);
        if (index1 != -1) {
            System.out.println("Product Found in Linear Search: " + products[index1]);
        } else {
            System.out.println("Product not found in Linear Search.");
        }

        // Sort before Binary Search
        Arrays.sort(products, (a, b) -> a.name.compareToIgnoreCase(b.name));

        // Binary Search
        int index2 = EcommerceSearch.binarySearch(products, searchFor);
        if (index2 != -1) {
            System.out.println("Product found in Binary search: " + products[index2]);
        } else {
            System.out.println("Product not found in Binary Search.");
        }
    }
}