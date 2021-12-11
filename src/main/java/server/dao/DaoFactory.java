package server.dao;

import server.dao.daos.ApartmentDAO;
import server.dao.daos.RoleDAO;
import server.dao.daos.UserDAO;
import server.dao.daos.UserOrderDAO;
import server.dao.impl.ApartmentDAOImpl;
import server.dao.impl.RoleDAOImpl;
import server.dao.impl.UserDAOImpl;
import server.dao.impl.UserOrderDAOImpl;
import server.connection.ProxyConnection;
import server.connection.ConnectionPool;
import server.exception.DAOException;

public class DaoFactory {
    private final ProxyConnection connection;

    public UserDAO getUserDao() {
        return new UserDAOImpl(connection);
    }

    public RoleDAO getRoleDao() {
        return new RoleDAOImpl(connection);
    }

    public UserOrderDAO getUserOrderDao() {
        return new UserOrderDAOImpl(connection);
    }

    public ApartmentDAO getApartmentDao() {
        return new ApartmentDAOImpl(connection);
    }

    private DaoFactory(ConnectionPool pool) throws DAOException {
        this.connection = pool.getConnection();
    }
}
