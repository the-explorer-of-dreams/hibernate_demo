package Hibernate_demo1.com.fendo.cn;

import Hibernate_demo1.com.fendo.Entity.*;
import Hibernate_demo1.com.fendo.inheritance.collectionmapping.Question;
import Hibernate_demo1.com.fendo.inheritance.collectionmapping.User;
import Hibernate_demo1.com.fendo.inheritance.componentmapping.Address;

import Hibernate_demo1.com.fendo.inheritance.componentmapping.EmployeeComponent;
import Hibernate_demo1.com.fendo.inheritance.hierarchy.Contract_Employee;

import Hibernate_demo1.com.fendo.inheritance.hierarchy.Employee;
import Hibernate_demo1.com.fendo.inheritance.hierarchy.Regular_Employee;
import Hibernate_demo1.com.fendo.inheritance.namedquery.EmployeeNamedQuery;
import Hibernate_demo1.com.fendo.inheritance.onetoonebyforeignkey.AddressOneToOne;
import Hibernate_demo1.com.fendo.inheritance.onetoonebyforeignkey.EmployeeOneToOne;
import org.hibernate.Session;

import Hibernate_demo1.com.fendo.Util.HibernateUtils;
import org.hibernate.query.Query;

import java.util.*;

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
//            manToMany(session);
//            oneTablePerHierarchy(session);
//            collectionMappingQuery(session);
//            componentMapping(session);
//            onetoonebyforeignkey(session);
            namedQueryByAnnotation(session);

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

        Course englishCourse =  new Course();
        englishCourse.setName("ENGLISH");

        Course mathCourse = new Course();
        mathCourse.setName("MATH");


        student.setStudyCode(studyCode);
        student.getCoursesSet().add(englishCourse);
        student.getCoursesSet().add(mathCourse);
        session.save(student);


//        Student queryStudent = (Student)session.get(Student.class,1);
//
//        System.out.println("queryStudent RESULT;"+queryStudent.getClasses().getName());
//
//        Classes queryClasses = (Classes)session.get(Classes.class,1);
//
//        System.out.println("queryClasses RESULT;"+queryClasses.getStudentsSet());

    }

    public static void oneTablePerHierarchy(Session session){
        Employee e1 = new Employee();
        e1.setName("Yiibai");

        Regular_Employee e2 = new Regular_Employee();
        e2.setName("Max su");
        e2.setSalary(50000);
        e2.setBonus(5);

        Contract_Employee e3 = new Contract_Employee();
        e3.setName("Hippo su");
        e3.setPay_per_hour(1000);
        e3.setContract_duration("15 hours");

        session.persist(e1);
        session.persist(e2);
        session.persist(e3);
    }

    public static void collectionMapping(Session session){
        HashMap<String, User> map1 = new HashMap<String, User>();
        map1.put("java is a programming language", new User("张小哥",
                "user2@gmail.com", "usa"));
        map1.put("java is a platform", new User("王达叔",
                "user1@gmail.com", "China"));

        HashMap<String, User> map2 = new HashMap<String, User>();
        map2.put("servlet technology is a server side programming", new User(
                "John Milton", "john.su@gmail.com", "usa"));
        map2.put("Servlet is an Interface", new User("Ashok Kumar",
                "as-top@gmail.com", "China"));

        Question question1 = new Question("Java是什么?", map1);
        Question question2 = new Question("Servlet是什么?", map2);

        session.persist(question1);
        session.persist(question2);
    }

    public static void collectionMappingQuery(Session session){
        Query query = session.createQuery("from Question ");
        List<Question> list = query.list();

        Iterator<Question> iterator = list.iterator();
        while (iterator.hasNext()) {
            Question question = iterator.next();
            System.out.println("question id:" + question.getId());
            System.out.println("question name:" + question.getName());
            System.out.println("answers.....");
            Map<String, User> map = question.getAnswers();
            Set<Map.Entry<String, User>> set = map.entrySet();

            Iterator<Map.Entry<String, User>> iteratoranswer = set.iterator();
            while (iteratoranswer.hasNext()) {
                Map.Entry<String, User> entry = (Map.Entry<String, User>) iteratoranswer
                        .next();
                System.out.println("answer name:" + entry.getKey());
                System.out.println("answer posted by.........");
                User user = entry.getValue();
                System.out.println("username:" + user.getUsername());
                System.out.println("user emailid:" + user.getEmail());
                System.out.println("user country:" + user.getCountry());
            }
        }
    }

    public static void componentMapping(Session session){
        // creating transaction object


        EmployeeComponent e1 = new EmployeeComponent("Mina Sun", new Address("Haikou", "China", 221233));
        EmployeeComponent  e2 = new EmployeeComponent("Max Su", new Address("Haikou", "China",
                224123));

        session.save(e1);
        session.save(e2);

    }

    public static void onetoonebyforeignkey(Session session){
//        EmployeeOneToOne e1 = new EmployeeOneToOne();
//        e1.setName("Max Su");
//        e1.setEmail("maxsu@gmail.com");
//
//        AddressOneToOne address1 = new AddressOneToOne();
//        address1.setAddressLine1("1688, RenMin Road");
//        address1.setCity("Haikou");
//        address1.setState("Hainan");
//        address1.setCountry("China");
//        address1.setPincode(201301);
//
//        e1.setAddress(address1);
//        address1.setEmployee(e1);
//
//        session.persist(e1);
        AddressOneToOne address = (AddressOneToOne)session.get(AddressOneToOne.class,1);
        System.out.println("address.employee = " + address.getEmployee().getName());
    }

    public static void namedQueryByAnnotation(Session session){
// 装点示例数据
        EmployeeNamedQuery e1 = new EmployeeNamedQuery();
        e1.setName("Maxsu");
        e1.setJob("Java开发工程师");
        e1.setSalary(8900);
        session.save(e1);

        EmployeeNamedQuery e2 = new EmployeeNamedQuery();
        e2.setName("Minalee");
        e2.setJob("Python开发工程师");
        e2.setSalary(9500);
        session.save(e2);


        // Hibernate Named Query
        Query query = session.getNamedQuery("findEmployeeByName");
        query.setString("name", "Maxsu");

        List<EmployeeNamedQuery> employees = query.list();

        Iterator<EmployeeNamedQuery> itr = employees.iterator();
        while (itr.hasNext()) {
            EmployeeNamedQuery e = itr.next();
            System.out.println(e);
        }

    }
}

