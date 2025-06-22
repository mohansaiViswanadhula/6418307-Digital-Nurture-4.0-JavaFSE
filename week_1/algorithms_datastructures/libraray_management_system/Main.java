import java.util.*;
public class Main{
    public static void main(String[] args) {
        Book[] books = {
            new Book(1, "the alchemist", "Paulo Coelho"),
            new Book(2, "harry potter", "rowling"),
            new Book(3, "1984", "George Orwell"),
            new Book(4, "dsa in java", "prakat"),
            new Book(5, "me", "ravindra")
        };

        String searchTitle = "1984";
        int index1 =LibrarySystem.linearSearch(books, searchTitle);
        if (index1 != -1)
            System.out.println("Linear Search: Found -> " + books[index1]);
        else
            System.out.println("Linear Search: Book not found");

        
        Arrays.sort(books, (a, b) -> a.title.compareToIgnoreCase(b.title));

        int index2 = LibrarySystem.binarySearch(books, searchTitle);
        if (index2 != -1)
            System.out.println("Binary Search: Found -> " + books[index2]);
        else
            System.out.println("Binary Search: Book not found");
    }
}

