package server.service;

import server.service.impl.ApartmentServiceImpl;
import server.service.impl.RoleServiceImpl;
import server.service.impl.UserOrderServiceImpl;
import server.service.impl.UserServiceImpl;
import server.service.services.ApartmentService;
import server.service.services.RoleService;
import server.service.services.UserOrderService;
import server.service.services.UserService;

public class ServiceFactory {
    static final ServiceFactory instance = new ServiceFactory();

    public static ServiceFactory getInstance() {
        return ServiceFactory.instance;
    }

    public ApartmentService getApartmentService() {
        return new ApartmentServiceImpl();
    }

    public RoleService getRoleService() {
        return new RoleServiceImpl();
    }

    public UserService getUserService() {
        return new UserServiceImpl();
    }

    public UserOrderService getUserOrderService() {
        return new UserOrderServiceImpl();
    }
}
