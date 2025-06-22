public class LibrarySystem {

    // Linear Search by title
    public static int linearSearch(Book[] books, String title) {
        for (int i = 0; i < books.length; i++) {
            if (books[i].title.equalsIgnoreCase(title)) {
                return i;
            }
        }
        return -1;
    }

    // Binary Search by title (array must be sorted by title)
    public static int binarySearch(Book[] books, String title) {
        int low = 0, high = books.length - 1;

        while (low <= high) {
            int mid = (low + high) / 2;
            int result = books[mid].title.compareToIgnoreCase(title);

            if (result == 0) return mid;
            else if (result < 0) low = mid + 1;
            else high = mid - 1;
        }

        return -1;
    }
    
}
