public class EcommerceSearch {


    // Linear search: O(n)
    public static int linearSearch(Gadget[] products, String name) {
        for (int i = 0; i < products.length; i++) {
            if (products[i].name.equalsIgnoreCase(name)) {
                return i;
            }
        }
        return -1;
    }

    // Binary search: O(log n) — works only on sorted arrays
    public static int binarySearch(Gadget[] products, String name) {
        int low = 0;
        int high = products.length - 1;

        while (low <= high) {
            int mid = (low + high) / 2;
            int compare = products[mid].name.compareToIgnoreCase(name);

            if (compare == 0) return mid;
            else if (compare < 0) low = mid + 1;
            else high = mid - 1;
        }

        return -1;
    }

    
}
