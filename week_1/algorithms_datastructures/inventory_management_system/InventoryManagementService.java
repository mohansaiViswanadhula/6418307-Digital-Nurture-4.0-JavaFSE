import java.util.ArrayList;
import java.util.List;

public class InventoryManagementService{

    List<Product> products = new ArrayList<Product>();

    public void addProduct(Product product){
        products.add(product);
        System.out.println("Added a product:"+product.productId);
    }

    public void updateProduct(Product product){
        for(Product currentProduct:products){
            if(currentProduct.productId==product.productId){
                currentProduct.price=product.price;
                currentProduct.quantity=product.quantity;
                currentProduct.productName=product.productName;
            }
        }

        System.out.println("Product with productId: "+product.productId+" updated");
    }

    public void deleteProduct(int productId){
        for(int i=0; i<products.size();i++){
            if(products.get(i).productId==productId){
                products.remove(i);
            }
        }
        System.out.println("Product with productId: "+productId+" deleted");
    }
}