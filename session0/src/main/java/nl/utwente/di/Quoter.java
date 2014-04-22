package nl.utwente.di;

public class Quoter {
	
	public double getBookPrice(String isbn) {
		double price;
		switch (isbn) {
		case "1":
			price = 10.0;
			break;
		case "2":
			price = 45.0;
			break;
		case "3":
			price = 20.0;
			break;
		case "4":
			price = 35.0;
			break;
		case "5":
			price = 50.0;
			break;
		default:
			price = 0.0;
			break;
		}
		return price;
	}

}
