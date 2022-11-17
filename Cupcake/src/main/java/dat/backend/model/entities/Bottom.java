package dat.backend.model.entities;

public class Bottom {
    private int id;
    private String type;
    private double price;

    public Bottom(int id, String type, double price) {
        this.id = id;
        this.type = type;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public String getType() {
        return type;
    }

    public double getPrice() {
        return price;
    }
}
