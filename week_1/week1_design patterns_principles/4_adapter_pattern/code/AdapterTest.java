interface PaymentProcessor {
    void processPayment(double amount);
}

class OldGateway {
    public void makePayment(double amt) {
        System.out.println("Paid " + amt + " using OldGateway");
    }
}

class PaymentAdapter implements PaymentProcessor {
    private OldGateway gateway;

    public PaymentAdapter(OldGateway gateway) {
        this.gateway = gateway;
    }

    public void processPayment(double amount) {
        gateway.makePayment(amount);
    }
}

public class AdapterTest {
    public static void main(String[] args) {
        OldGateway oldGateway = new OldGateway();
        PaymentProcessor processor = new PaymentAdapter(oldGateway);
        processor.processPayment(1000.0);
    }
}
