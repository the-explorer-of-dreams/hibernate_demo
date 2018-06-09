package Hibernate_demo1.com.fendo.Entity;

import javax.swing.*;
import java.util.HashSet;
import java.util.Set;

public class Student {
    private Integer id;
    private String name;
    private Classes classes;
    private StudyCode studyCode;
    private Set<Course> coursesSet = new HashSet<Course>();

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

    public Classes getClasses() {
        return classes;
    }

    public void setClasses(Classes classes) {
        this.classes = classes;
    }

    public StudyCode getStudyCode() {
        return studyCode;
    }

    public void setStudyCode(StudyCode studyCode) {
        this.studyCode = studyCode;
    }

    public Set<Course> getCoursesSet() {
        return coursesSet;
    }

    public void setCoursesSet(Set<Course> coursesSet) {
        this.coursesSet = coursesSet;
    }
}
