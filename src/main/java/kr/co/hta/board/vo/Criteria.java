package kr.co.hta.board.vo;

public class Criteria {
	
	private String name;
	private String publisher;
	private Integer minPrice;
	private Integer maxPrice;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Integer getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(Integer minPrice) {
		this.minPrice = minPrice;
	}
	public Integer getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(Integer maxPrice) {
		this.maxPrice = maxPrice;
	}
	@Override
	public String toString() {
		return "Criteria [name=" + name + ", publisher=" + publisher + ", minPrice=" + minPrice + ", maxPrice="
				+ maxPrice + "]";
	}
	
}
