package vendor;
import connection.*;

import java.sql.SQLException;
import java.util.Random;

public class RegisterDao {
	public static int register(User u) throws SQLException {
		int status = 0;
		DB_Connection con = null;
		Random rand = new Random();
		int id = rand.nextInt(1, 10000);
		try {
			con = new DB_Connection();

			String query = "insert into vendor_details(ven_id, first_name, last_name, ven_locality, ven_city, ven_pincode, contact_no, "
					+ "ven_state, vendor_email, password ) values("+id+ ",'"+u.getFname()+"','"+u.getLname()+"','"+u.getLocality()+"','"+u.getCity()+"',"+u.getPincode()+","+u.getMobile()+",'"+u.getState()+"','"+u.getEmail()+"','"+u.getPassword()+"')";
			
			con.storeRecord(query);
			status = 1;
		} catch (Exception e) {
			System.out.println(e);

		}
		
		finally {
			con.closeConnection();
		}

		return status;
	}
}