public class Solution {
    public static void main(String[] args){
        Product p1= new Product(1, "pen", 5, 20);
        Product p2= new Product(2, "pencil", 4, 30);
        Product p3= new Product(3, "penpencil", 6, 40);
        Product p4= new Product(2, "Shampoo", 5, 5);
        

        InventoryManagementService inventory = new InventoryManagementService();

        inventory.addProduct(p1);
        inventory.addProduct(p2);
        inventory.addProduct(p3);
        inventory.updateProduct(p4);
        inventory.deleteProduct(3);
    }
}
