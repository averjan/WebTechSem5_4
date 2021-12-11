package server.mapper;

import server.entity.Apartment;
import server.entity.Role;
import server.entity.User;
import server.entity.UserOrder;

public class RowMapperFactory {
    static final RowMapperFactory instance = new RowMapperFactory();

    public static RowMapperFactory getInstance() {
        return RowMapperFactory.instance;
    }

    public RowMapper<User> getUserRowMapper() {
        return null;
    }

    public RowMapper<Role> getRoleRowMapper() {
        return null;
    }

    public RowMapper<UserOrder> getUserOrderRowMapper() {
        return null;
    }

    public RowMapper<Apartment> getApartmentRowMapper() {
        return null;
    }
}
