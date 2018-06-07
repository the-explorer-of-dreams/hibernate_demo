package Hibernate_demo1.com.fendo.cn;

import org.hibernate.Hibernate;
import org.hibernate.Session;

import Hibernate_demo1.com.fendo.Entity.IdCard;
import Hibernate_demo1.com.fendo.Entity.Person;
import Hibernate_demo1.com.fendo.Util.HibernateUtils;

/**
 * Hello world!
 *
 */
public class App
{
    public static void main( String[] args )
    {

        Session session = null;
        try{

            session = HibernateUtils.getSession();
            session.beginTransaction();

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

            session.getTransaction().commit();
        }catch(Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }finally{
            HibernateUtils.closeSession(session);
        }
    }
}