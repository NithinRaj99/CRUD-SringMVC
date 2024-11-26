package CRUD.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import CRUD.model.User;

@Repository
@Component
public class UserDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	// create user
	@Transactional
	public void saveUser(User user) {
		try {

			this.hibernateTemplate.save(user);

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	// get all users
	public List<User> getUsers() {

		try {

			List<User> users = this.hibernateTemplate.loadAll(User.class);
			return users;

		} catch (Exception e) {

			e.printStackTrace();
			return new ArrayList<>();
		}

	}

	// delete single user
	@Transactional
	public void deleteUser(int id) {

		try {

			User u = this.hibernateTemplate.load(User.class, id);
			this.hibernateTemplate.delete(u);

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	public User getUser(int id) {

		try {

			return this.hibernateTemplate.get(User.class, id);

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}

	}

	@Transactional
	public void updateUser(User user) {

		try {
			
			User updatedUser = this.hibernateTemplate.get(User.class, user.getId());
			System.out.println("calling dao");
			System.out.println("User ID to fetch: " + user.getId());
			System.out.println("from from dao");
	        if (updatedUser != null) {
	            // Update fields with the data from the passed user
	            updatedUser.setName(user.getName());
	            updatedUser.setUsername(user.getUsername());
	            updatedUser.setPassword(user.getPassword());
	            System.out.println("excuting dao");
	            System.out.println(updatedUser);
	            // Perform the update
	            this.hibernateTemplate.update(updatedUser);
	            
	        }

		} catch (Exception e) {

			System.out.println(e.getMessage());
		}

	}
	
	public User validateUser(String username, String password) {
        String query = "from User where username = ?0 and password = ?1";
        List<User> users = (List<User>) hibernateTemplate.find(query, username, password);

        return users.isEmpty() ? null : users.get(0);
    }
	
	public boolean validateAdmin() {
	    String query = "from User where username = ?0";
	    List<User> users = (List<User>) hibernateTemplate.find(query, "Admin");

	    // Return true if "Admin" exists, otherwise false
	    return !users.isEmpty();
	}

}
