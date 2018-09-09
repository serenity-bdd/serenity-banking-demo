package starter.model;

public class DrinkOrder {
    private final String product;
    private final Integer quantity;

    public DrinkOrder(String product, Integer quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public String getProduct() {
        return product;
    }

    public Integer getQuantity() {
        return quantity;
    }
}
