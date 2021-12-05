package server.dao;

import server.dao.daos.ApartmentDAO;
import server.dao.daos.RoleDAO;
import server.dao.daos.UserDAO;
import server.dao.daos.UserOrderDAO;
import server.dao.impl.ApartmentDAOImpl;
import server.dao.impl.RoleDAOImpl;
import server.dao.impl.UserDAOImpl;
import server.dao.impl.UserOrderDAOImpl;

public class DaoFactory {
    private static final DaoFactory instance = new DaoFactory();

    public UserDAO getUserDao() {
        return new UserDAOImpl();
    }

    public RoleDAO getRoleDao() {
        return new RoleDAOImpl();
    }

    public UserOrderDAO getUserOrderDao() {
        return new UserOrderDAOImpl();
    }

    public ApartmentDAO getApartmentDao() {
        return new ApartmentDAOImpl();
    }

    private DaoFactory() {
    }

    public static DaoFactory getInstance() {
        return DaoFactory.instance;
    }
}
