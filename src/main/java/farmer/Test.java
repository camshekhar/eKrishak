package farmer;
import connection.*;

import java.sql.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;

public class Test {
	public static void main(String[] args) {

//String mobile = (String) session.getAttribute("f_mobile");
//String logMsg = (String) session.getAttribute("logMsg");
		DB_Connection connection = null;
		boolean status = false, orderStatus = false;
		ResultSet farmer = null, order = null, details = null;
		String fname = "", lname = "", city = "", email = "", cnf_mobile = "", cropName = "", farmer_name = "";
		int f_id = 0, order_id = 0, cropQuantity = 0;

		try {
			connection = new DB_Connection();

			String orderDetails = "Select * from crop_order_details";
			order = connection.getRecords(orderDetails);

			if(order.next()) {
				order_id = order.getInt("order_id");
			}
			String fileName = "./test.pdf";
			Document document = new Document();

			PdfWriter.getInstance(document, new FileOutputStream(fileName));

			document.open();

			Paragraph paragraph = new Paragraph("hello" + order_id);
			document.add(paragraph);

			document.close();
			System.out.println("Finished");
		}

		catch (Exception e) {
			System.out.println(e);
		}
	}
}
