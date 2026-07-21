import java.util.Arrays;
import java.util.Comparator;

public class Main {

    public static void main(String[] args) {

        Product[] products = {
                new Product(103, "Keyboard", "Electronics"),
                new Product(101, "Laptop", "Electronics"),
                new Product(104, "Headphones", "Electronics"),
                new Product(102, "Mouse", "Electronics")
        };

        int targetId = 102;

        System.out.println("Linear Search:");

        Product linearResult =
                SearchAlgorithms.linearSearch(products, targetId);

        if (linearResult != null)
            System.out.println(linearResult);
        else
            System.out.println("Product not found.");

        Arrays.sort(products, Comparator.comparingInt(Product::getProductId));

        System.out.println("\nBinary Search:");

        Product binaryResult =
                SearchAlgorithms.binarySearch(products, targetId);

        if (binaryResult != null)
            System.out.println(binaryResult);
        else
            System.out.println("Product not found.");
    }
}