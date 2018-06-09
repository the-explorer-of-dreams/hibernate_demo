package Hibernate_demo1.com.fendo.Entity;

import java.util.HashSet;
import java.util.Set;

public class Course {
    private Integer id;
    private String name;
    private Set<Student> studentsSet = new HashSet<Student>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Student> getStudentsSet() {
        return studentsSet;
    }

    public void setStudentsSet(Set<Student> studentsSet) {
        this.studentsSet = studentsSet;
    }
}
