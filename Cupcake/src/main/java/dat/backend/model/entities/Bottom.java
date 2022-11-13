package dat.backend.model.entities;

public class Bottom {
    private int id;
    private String type;
    private int price;

    public Bottom(int id, String type, int price) {
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

    public int getPrice() {
        return price;
    }
}
