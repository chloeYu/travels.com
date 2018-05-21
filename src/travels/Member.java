package travels;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

// Member Table DTO(Data Transfer Object)
public class Member {
	private String id;
	private String password;
	private String firstname;
	private String lastname;
	private Date birth;
	private String gender;
	private String tel;
	private String email;
	private Date reg_time;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
		/*SimpleDateFormat sd = new SimpleDateFormat("yyyy-mm-dd");
		System.out.println("birth Input: " + birth);
		try {
			this.birth = new Date(sd.parse(birth).getTime());
		} catch (ParseException e) {
			System.out.println("setBirth Error: " + e.getMessage());
		}*/
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String address) {
		this.email = address;
	}
	public Date getReg_time() {
		return reg_time;
	}
	public void setReg_time(Date reg_time) {
		this.reg_time = reg_time;
	}
}
