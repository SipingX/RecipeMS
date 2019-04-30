package pojo;

public class Include extends IncludeKey {
    private String quantity;

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity == null ? null : quantity.trim();
    }

	@Override
	public String toString() {
		return "Include [quantity=" + quantity + ", getRecipe()=" + getRecipe()
				+ ", getMaterial()=" + getMaterial() + "]";
	}
    
}