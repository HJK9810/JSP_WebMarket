package dao;

import java.util.ArrayList;
import java.util.List;

import dto.Product;

// 상품 제공용 class
public class ProductRepository {
	private List<Product> products = new ArrayList<>();

	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334x750 Renina HD display, 8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("new");

		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");

		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("old");

		products.add(phone);
		products.add(notebook);
		products.add(tablet);
	}

	public List<Product> getAllProducts() {
		return products;
	}
	
	// 상품 ID로 상품찾기 - stream사용 -> 1. filter로 찾기 2. 그 중에서 첫번째값 3. get으로 가져오기
	// 동일 코드는 for문 & if문 사용
	public Product getProductById(String productId) {
		return products.stream().filter(product -> product.getProductId().equals(productId)).findFirst().get();
	}
}