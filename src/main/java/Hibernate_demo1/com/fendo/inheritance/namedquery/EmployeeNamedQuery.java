package Hibernate_demo1.com.fendo.inheritance.namedquery;

import javax.persistence.*;

@NamedQueries(
        {
                @NamedQuery(
                        name = "findEmployeeByName",
                        query = "from EmployeeNamedQuery e where e.name = :name"
                )
        }
)

@Entity
@Table(name="em")
public class EmployeeNamedQuery {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    int id;
    String name;
    int salary;
    String job;


    public String toString() {
        return id + " " + name + " " + salary + " " + job;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

}
