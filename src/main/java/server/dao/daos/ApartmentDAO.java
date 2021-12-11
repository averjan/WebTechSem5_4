package server.dao.daos;

import server.entity.Apartment;
import server.exception.DAOException;

import java.util.List;

public interface ApartmentDAO {
    List<Apartment> getByPrice(double from, double to) throws DAOException;
    List<Apartment> getByRoomsNumber(int number) throws DAOException;
    List<Apartment> getByStatus(String status) throws DAOException;
    void updateStatus(Apartment apartment, String status) throws DAOException;
    void updateApartment(Apartment apartment) throws DAOException;
}
