package Hibernate_demo1.com.fendo.inheritance.onetoonebyforeignkey;


public class EmployeeOneToOne {
    private int employeeId;
    private String name, email;

    private AddressOneToOne address;

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public AddressOneToOne getAddress() {
        return address;
    }

    public void setAddress(AddressOneToOne address) {
        this.address = address;
    }

}