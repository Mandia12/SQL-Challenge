create table Departments (
	Dept_no varchar not null primary key,
	Dept_name varchar not null
);

create table Titles (
	Title_id varchar not null primary key,
	Title varchar not null
);

create table Employees (
	Emp_no bigint not null primary key,
	Emp_title_id varchar not null,
	Birth_date date not null,
	First_name varchar not null,
	Last_name varchar not null,
	Sex varchar not null,
	Hire_date date not null,
	foreign key (Emp_title_id) references Titles(Title_id)
);

create table Dept_Emp (
	Emp_no bigint not null,
	foreign key (Emp_no) references Employees(Emp_no),
	Dept_no varchar not null,
	foreign key (Dept_no) references Departments(Dept_no),
	primary key (Emp_no, Dept_no)
);

create table Dept_Manager (
	Dept_no varchar not null,
	foreign key (Dept_no) references Departments(Dept_no),
	Emp_no bigint not null,
	foreign key (Emp_no) references Employees(Emp_no),
	primary key (Dept_no, Emp_no)
);

create table Salaries (
	Emp_no bigint not null,
	foreign key (Emp_no) references Employees(Emp_no),
	Salary bigint not null
);

