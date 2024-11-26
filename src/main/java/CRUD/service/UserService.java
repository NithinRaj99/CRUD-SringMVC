package CRUD.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import CRUD.dao.UserDao;
import CRUD.model.User;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public void createUser(User user) {
		
		 this.userDao.saveUser(user);
	}
	
	public List<User> showUsers() {
		
		return this.userDao.getUsers();
	}
	
	 public int delete(int id) {
	        try {
	            this.userDao.deleteUser(id);
	            return 1; // Return 1 on successful deletion
	        } catch (Exception e) {
	            e.printStackTrace();
	            return 0; // Return 0 on failure
	        }
	 }
	 
	 public User singelUser(int id) {
	        
	      return this.userDao.getUser(id);
	        
	 }
	 
	 public void update(User user) {
		 
		 System.out.println("User ID to fetch: " + user.getId());
		 System.out.println("from service");
	        
	      this.userDao.updateUser(user);
	        
	 }
	 
	 public User validateUser(String username, String password) {
	        return userDao.validateUser(username, password);
	    }
	 
	 public boolean validateAdmin() {
		 
		return userDao.validateAdmin();
		
	}

}
