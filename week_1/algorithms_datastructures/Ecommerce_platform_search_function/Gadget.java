public class Gadget {
    int id;
    String name;
    String category;

    public Gadget(int id, String name, String category) {
        this.id = id;
        this.name = name;
        this.category = category;
    }

    public String toString() {
        return id + " - " + name + " (" + category + ")";
    }
}



  
     
