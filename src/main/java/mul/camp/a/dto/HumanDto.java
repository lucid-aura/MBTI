package mul.camp.a.dto;

public class HumanDto {
	private String name;
	private int age;
	public HumanDto() {
		
	}
	public HumanDto(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "HumanDto [name=" + name + ", age=" + age + "]";
	}
}
