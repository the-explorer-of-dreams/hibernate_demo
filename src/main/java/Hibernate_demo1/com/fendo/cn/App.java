package Hibernate_demo1.com.fendo.cn;

import Hibernate_demo1.com.fendo.Entity.*;
import org.hibernate.Hibernate;
import org.hibernate.Session;

import Hibernate_demo1.com.fendo.Util.HibernateUtils;

import java.util.HashSet;
import java.util.Set;

/**
 * Hello world!
 *
 */
public class App {
    public static void main(String[] args) {


        Session session = null;
        try {

            session = HibernateUtils.getSession();
            session.beginTransaction();

            //the original code
            //origin(session);
            //oneToOnePrimaryKey(session);
            //oneToOne(session);

//            oneToMany(session);
            manToMany(session);


            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            HibernateUtils.closeSession(session);
        }

    }


    public static void origin(Session session) {
        IdCard idCard = new IdCard();
        idCard.setCardNum("111111111");

        Person person = new Person();
        person.setName("张三");
        //建立关联
        person.setIdCard(idCard);

        //有可能抛出TransientObjectException异常,这是由一对一关联映射的特性决定的，它必须先保存关联对象IdCard
        //这样它采用foreign映射策略才能取得关联对象的标识
        //也就是它默认了cascade属性
        session.save(person);
    }

    public static void oneToOne(Session session) {
//        Student student = new Student();
//        student.setName("william");
//
//
//
//        StudyCode studyCode = new StudyCode();
//        studyCode.setIdentifyCode("20180001");
//        studyCode.setStudent(student);
//
//        student.setStudyCode(studyCode);
//
//        //session.save(student);
//        session.save(studyCode);


//        Student queryStudent = (Student)session.get(Student.class,1);
//
//        System.out.println("queryStudent RESULT;"+queryStudent.getStudyCode().getIdentifyCode());
//
//        StudyCode queryStudyCode =  (StudyCode)session.get(StudyCode.class,1);
//
//        System.out.println("queryStudyCode RESULT;"+queryStudyCode.getStudent().getName());
    }

    public static void oneToMany(Session session) {
        Classes classes =  new Classes();
        classes.setName("class-no-1");

        Student student = new Student();
        student.setName("william");
        student.setClasses(classes);


        StudyCode studyCode = new StudyCode();
        studyCode.setIdentifyCode("20180001");
        studyCode.setStudent(student);

        student.setStudyCode(studyCode);
//        Set<Student> studentSet = new HashSet<Student>() ;
//        studentSet.add(student);
//        classes.setStudentsSet(studentSet);

//        session.save(classes);
        session.save(student);
//        session.save(studyCode);

//        Student queryStudent = (Student)session.get(Student.class,1);
//
//        System.out.println("queryStudent RESULT;"+queryStudent.getClasses().getName());
//
//        Classes queryClasses = (Classes)session.get(Classes.class,1);
//
//        System.out.println("queryClasses RESULT;"+queryClasses.getStudentsSet());

    }

    public static void manToMany(Session session) {
        Classes classes =  new Classes();
        classes.setName("class-no-1");

        Student student = new Student();
        student.setName("william");
        student.setClasses(classes);


        StudyCode studyCode = new StudyCode();
        studyCode.setIdentifyCode("20180001");
        studyCode.setStudent(student);

        Course course =  new Course();
        course.setName("ENGLISH");


        student.setStudyCode(studyCode);
        student.getCoursesSet().add(course);
        session.save(student);


//        Student queryStudent = (Student)session.get(Student.class,1);
//
//        System.out.println("queryStudent RESULT;"+queryStudent.getClasses().getName());
//
//        Classes queryClasses = (Classes)session.get(Classes.class,1);
//
//        System.out.println("queryClasses RESULT;"+queryClasses.getStudentsSet());

    }

}

