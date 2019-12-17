package Bo;

public class singletonTest {
	private static singletonTest instance = null;
	String s;
	private singletonTest() {
		s = "Test";
	}
	public static singletonTest getInstance() {
		if(instance == null) {
			instance = new singletonTest();
		}
		return instance;
	}
	public String getString() {
		return this.s;
	}
	public void setString(String st) {
		this.s = st;
	}
}
