package com.tedu.classes;

public class worker {
	public String workerid;
	    public String name;
		public String sex;
		public String age;
		public String username;
		public String password;
		public String role;
		public worker(){}
		public worker(String workerid, String name, String sex, String age,
				String username, String password, String role) {
			super();
			this.workerid = workerid;
			this.name = name;
			this.sex = sex;
			this.age = age;
			this.username = username;
			this.password = password;
			this.role = role;
		}
		public String getWorkerid() {
			return workerid;
		}
		public void setWorkerid(String workerid) {
			this.workerid = workerid;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getSex() {
			return sex;
		}
		public void setSex(String sex) {
			this.sex = sex;
		}
		public String getAge() {
			return age;
		}
		public void setAge(String age) {
			this.age = age;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getRole() {
			return role;
		}
		public void setRole(String role) {
			this.role = role;
		}
		
		
		
}
