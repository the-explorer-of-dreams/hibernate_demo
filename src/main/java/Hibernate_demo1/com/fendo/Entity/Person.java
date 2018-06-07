package Hibernate_demo1.com.fendo.Entity;

public class Person {

    private String id;

    private String name;


    //用户与身份证信息，一对一的关系
    private IdCard idCard;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public IdCard getIdCard() {
        return idCard;
    }

    public void setIdCard(IdCard idCard) {
        this.idCard = idCard;
    }

}