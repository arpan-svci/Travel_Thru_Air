package database;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;

public class Dao {
	String sql="SELECT * FROM LOGIN WHERE USER_NAME=? AND PASS=?";
	String sql1="UPDATE LOGIN SET STATUS=? WHERE USER_NAME=?AND PASS=?";
	String sql_in="INSERT INTO LOGIN VALUES(?,?,?,?,?,?,?)";
	String sql2="SELECT * FROM AIRLINE WHERE START=? AND END=?";
	String url="jdbc:mysql://localhost:3306/IT_ASS";
	String username="root";
	String password="4186";
	Connection con;
	public Dao(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url,username,password);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public Dao(Connection con1) {
		con=con1;
	}
	public boolean check(String user_name,String pass) {
		try {
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1, user_name);
			st.setString(2, pass);
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				return true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	public boolean login(String user_name,String pass){
		try {
			if(check(user_name,pass)) {
				PreparedStatement st=con.prepareStatement(sql1);
				st.setString(2, user_name);
				st.setString(3, pass);
				return true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public void insert(String name,String email,String phone,String dob,String age, String user_name,String pass) {
		try {
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1, user_name);
			st.setString(2, pass);
			ResultSet rs=st.executeQuery();
			if(!rs.next()) {
				PreparedStatement st1=con.prepareStatement(sql_in);
				st1.setString(1,user_name);
				st1.setString(2,pass);
				st1.setString(3,name);
				st1.setString(4,email);
				st1.setString(5,phone);
				st1.setString(6,dob);
				st1.setString(7,age);
				st1.execute();
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public void getData(String start,String end,PrintWriter out) {
		
	}
	public void addFlight(String fid,String company,int cap) {
		System.out.print("hello");
		String sql="INSERT INTO PLANE VALUES(?,?,?)";
		try {
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1, fid);
			st.setString(2, company);
			st.setInt(3, cap);
			st.execute();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Obj> searchFlight(String source,String destination,String date) throws SQLException{
		ArrayList<Obj> a=new ArrayList<Obj>();
		String Sql="SELECT * FROM SERVICE WHERE BOARDING=? AND DESTINATION=?";
		PreparedStatement pt=con.prepareStatement(Sql);
		pt.setString(1,	source);
		pt.setString(2, destination);
//		pt.setString(3, date);
		ResultSet rs=pt.executeQuery();
		while(rs.next()) {
			Obj n=new Obj();
			n.setId(rs.getString("AIR_ID"));
			n.setSource(rs.getString("BOARDING"));
			n.setDestination(rs.getString("DESTINATION"));
			n.setFare(rs.getString("FARE"));
			n.setStops("1");
			n.setTime_arrival(rs.getString("ARRIVAL"));
			n.setTime_deperature(rs.getString("DEPARTURE"));
			a.add(n);
		}
		return a;
	}
	public ArrayList<Obj> searchFlightMod(String source,String destination,String date) throws SQLException{
		ArrayList<Obj> a=new ArrayList<Obj>();
		Queue<Obj> q=new LinkedList<Obj>();
		String Sql="SELECT * FROM SERVICE WHERE BOARDING=?";
		PreparedStatement pt=con.prepareStatement(Sql);
		pt.setString(1,	source);
		pt.setString(2, destination);
//		pt.setString(3, date);
		ResultSet rs=pt.executeQuery();
		while(rs.next()) {
			Obj n=new Obj();
			n.setId(rs.getString("AIR_ID"));
			n.setSource(rs.getString("BOARDING"));
			n.setDestination(rs.getString("DESTINATION"));
			n.setFare(rs.getString("FARE"));
			n.setStops("");
			n.setTime_arrival(rs.getString("ARRIVAL"));
			n.setTime_deperature(rs.getString("DEPARTURE"));
			if(n.getDestination().equals(destination)) {
				a.add(n);
			}
			else {
				q.add(n);
			}
		}
		while(!q.isEmpty()) {
			Obj temp=q.poll();
			String id=temp.getId();
			String source1=temp.getSource();
			String destination1=temp.getDestination();
			int fare=Integer.parseInt(temp.getFare());
			String stops=temp.getStops();
			String arrival=temp.getTime_arrival();
			String dep=temp.getTime_deperature();
			String sql="SELECT * FROM SERVICE WHERE AIR_ID=? AND BOARDING=? AND DEPARTURE>?";
			PreparedStatement pt1=con.prepareStatement(sql);
			pt1.setString(1, id);
			pt1.setString(2, destination1);
			pt1.setString(3,arrival);
			ResultSet rs1=pt1.executeQuery();
			while(rs1.next()) {
				Obj n=new Obj();
				n.setId(id);
				n.setSource(source1);
				n.setDestination(rs1.getString("DESTINATION"));
				n.setFare(Integer.toString(Integer.parseInt(rs1.getString("FARE")))+fare);
				n.setStops(stops.concat(source1).concat("\n"));
				n.setTime_arrival(rs.getString("ARRIVAL"));
				n.setTime_deperature(dep);
				if(n.getDestination().equals(destination)) {
					a.add(n);
				}
				else {
					q.add(temp);
				}
			}
		}
		return a;
	}
	public void addService(String id,String boarding,String destination,String departure,String arrival,String fare) throws SQLException {
		String sql="INSERT INTO SERVICE VALUES(?,?,?,?,?,?)";
		PreparedStatement pt=con.prepareStatement(sql);
		pt.setString(1, id);
		pt.setString(2, boarding);
		pt.setString(3, destination);
		pt.setString(4, departure);
		pt.setString(5, arrival);
		pt.setInt(6, Integer.parseInt(fare));
		pt.execute();
	}
	public ArrayList<Obj> searchFlight(String id) throws SQLException{
		ArrayList<Obj> a=new ArrayList<Obj>();
		String Sql="SELECT * FROM SERVICE WHERE AIR_ID=?";
		PreparedStatement pt=con.prepareStatement(Sql);
		pt.setString(1,	id);
		ResultSet rs=pt.executeQuery();
		while(rs.next()) {
			Obj n=new Obj();
			n.setId(rs.getString("AIR_ID"));
			n.setSource(rs.getString("BOARDING"));
			n.setDestination(rs.getString("DESTINATION"));
			n.setFare(rs.getString("FARE"));
			n.setStops("1");
			n.setTime_arrival(rs.getString("ARRIVAL"));
			n.setTime_deperature(rs.getString("DEPARTURE"));
			a.add(n);
		}
		return a;
	}
	public ArrayList<Obj> specialDeal() throws SQLException{
		ArrayList<Obj> a=new ArrayList<Obj>();
		sql="SELECT * FROM SERVICE NATURAL JOIN SPECIAL WHERE DEPARTURE<TIME_DEAL AND DEPARTURE>SYSDATE()";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			Obj n=new Obj();
			n.setId(rs.getString("AIR_ID"));
			n.setSource(rs.getString("BOARDING"));
			n.setDestination(rs.getString("DESTINATION"));
			double fare=(double)rs.getInt("FARE");
			double discount=(double)rs.getInt("DISCOUNT");
			fare=fare*(100-discount)/100;
			n.setFare(Double.toString(fare));
			n.setStops("1");
			n.setTime_arrival(rs.getString("ARRIVAL"));
			n.setTime_deperature(rs.getString("DEPARTURE"));
			a.add(n);
		}
		return a;
	}
	public void addSpecialDeal(String id,String date,String discount) throws SQLException {
		sql="INSERT INTO SPECIAL VALUES(?,?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, date);
		ps.setInt(3, Integer.parseInt(discount));
		ps.execute();
	}
}

