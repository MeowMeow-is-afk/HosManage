package com.dao;

import java.sql.*;
import java.util.*;

import com.entity.Specialist;

public class SpecialistDao {
	private Connection cn;

	public SpecialistDao(Connection cn) {
		super();
		this.cn = cn;
	}

	public boolean addSpecialist(String spec) {
		boolean f = false;
		try {
			String sql = "insert into specialist(spec_name) values(?)";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, spec);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Specialist> getAllSpecialist(){
		List<Specialist> list = new ArrayList<>();
		Specialist s = null;
		try {
			String sql = "select * from specialist";
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				s = new Specialist();
				s.setId(rs.getInt(1));
				s.setSpecialistName(rs.getString(2));
				list.add(s);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
