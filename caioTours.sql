
/* 
	standard drop tables commands
*/
/*drop table paystubs;*/
drop table payroll;
drop table usage_Fee;
Drop table daily_assistance_charges;
Drop table workday;
Drop table expense;
Drop table daysOff;
Drop table tour_bookings;
Drop table login;
Drop table employee;
Drop table employees_type;

/* 
	removed employee id
	changed employee_Type_name to description
*/
create table Employees_type(
	employee_type_id smallint,
	description varchar(35),
	CONSTRAINT PK_EmployeesType_id PRIMARY KEY (employee_type_id));

/* 
	added employee type id
	removed salary because I don't understand why to implement field.
*/
create table employee(
	employee_id smallint,
	employee_type_id smallint not null,
	firstName varchar(35) not null,
	lastName varchar(35)not null,
	address varchar(35)not null,
	city varchar(35) not null,
	emailAddress varchar(35) not null,
	employee_start_date timestamp not null,
	employee_end_date timestamp ,
	hourlyWage float ,
	Monthly_salary float,
	isAdmin smallint not null,
	isBookeeper smallint not null,
	institution_id smallint not null,
	bankAccount_number int not null,
	transit_id  smallint not null,
	CONSTRAINT PK_employeeId PRIMARY KEY (employee_id),
	CONSTRAINT FK_employees_employees_type FOREIGN KEY (employee_type_id)
	REFERENCES employees_type(employee_type_id)	
);
/* 
	removed pk restriction from password
	changed login from varchar to smallint
*/
create table login(
	login_id smallint,
	employee_id smallint not null,
	password varchar(35) not null,
	CONSTRAINT PK_login_id PRIMARY KEY (login_id),
	CONSTRAINT FK_log_in_employees FOREIGN KEY (employee_id)
	REFERENCES employee(employee_id)	
);
/* 
	changed number of hours from float to INTEGER
	changed day to day_of_tour_booking as day is a reserved key word.
*/
create table tour_bookings(
	tour_booking_id smallint,
	employee_id smallint not null,
	day_of_tour_booking timestamp not null,
	adminFee float not null,
	adminDescription varchar(35),
	numOfHours int not null,
	rate float not null,
	name varchar2(35) not null,
	description varchar(35),
	CONSTRAINT PK_tour_booking_id PRIMARY KEY (tour_booking_id),
	CONSTRAINT FK_tour_booking_employees FOREIGN KEY (employee_id)
	REFERENCES employee(employee_id)	
);
/* 
	changed date to date of day off as date was a reserved word
*/
create table daysOff(
	days_off_id smallint,
	employee_id smallint not null,
	date_of_dayOff date not null,
	CONSTRAINT PK_days_off_id PRIMARY KEY (days_off_id),
	CONSTRAINT FK_days_off_employees FOREIGN KEY (employee_id)
	REFERENCES employee(employee_id)	
);
/* 
	replaced day with day_of_expense as day is a keyword.
	why is there an amount and expense amount removing amount.
*/
create table expense(
	expense_id smallint,
	employee_id smallint not null,
	day_of_expense timestamp not null,
	description varchar(35),
	expenseAmount float not null,
	CONSTRAINT PK_expense_id PRIMARY KEY (expense_id),
	CONSTRAINT FK_expense_employees FOREIGN KEY (employee_id)
	REFERENCES employee(employee_id)	
);
/* 
	renamed date to day of workday
	changed number of hours to int from FLOAT
*/
create table workDay(
	workday_id smallint,
	employee_id smallint not null,
	noOfHours int not null,
	date_of_workDay timestamp not null,
	CONSTRAINT PK_workday_id PRIMARY KEY (workday_id),
	CONSTRAINT FK_workday_employees FOREIGN KEY (employee_id)
	REFERENCES employee(employee_id)	
);
/* 
	no changes to note
*/
create table daily_assistance_charges(
	daily_assistance_charges_id smallint,
	employee_id smallint not null,
	startDate date not null,
	endDate date null,
	rate_daily_Assistance float not null,
	total_rate float not null,
	Client_name VARCHAR(35) not null,
	CONSTRAINT PK_daily_assistance_charges_id PRIMARY KEY (daily_assistance_charges_id),
	CONSTRAINT FK_d_ass_employees FOREIGN KEY (employee_id)
	REFERENCES employee(employee_id)		
);
/* 
*/
create table usage_fee(
	usage_fee_id smallint,
	employee_id smallint not null,
	usage_cost float not null,
	office_usage varchar(35) not null,
	CONSTRAINT PK_daily_usage_fee_id PRIMARY KEY (usage_fee_id),	
		CONSTRAINT FK_usage_fee_employees FOREIGN KEY (employee_id)
	REFERENCES employee(employee_id)	
);
/*
talk with team evrething below here.
add bank account number also to paystub. transit id institution number employee
*/
/* 
	instead of a single workday changed it to summation value.
	I don't think days off should be a factor but a calculated amount but i added total_rate
	number of days off as a column.
	I dont see daily adjustment id so i didnt include it.
	change non salary gains to a better name.
	took away soome id's and added summation values to be recorded/
*/
create table payroll(
	payroll_id smallint,
	employee_id smallint,
	workday_id smallint,
	days_off_id smallint,
	expense_id smallint,
	tour_booking_id smallint,
	daily_assistance_charges_id smallint,
	usage_fee_id smallint,
	Pay_month date not null,
	date_of_creation date not null,
	date_of_payroll_creation date,
	CONSTRAINT PK_payroll_id PRIMARY KEY (payroll_id),
	CONSTRAINT FK_payroll_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
	CONSTRAINT FK_payroll_workday_id FOREIGN KEY (workday_id) REFERENCES workDay(workday_id),	
	CONSTRAINT FK_payroll_days_off_id FOREIGN KEY (days_off_id)REFERENCES daysOff(days_off_id),
	CONSTRAINT FK_payroll_expense_id FOREIGN KEY (expense_id)REFERENCES expense(expense_id),	
	CONSTRAINT FK_payroll_tour_booking_id FOREIGN KEY (tour_booking_id)REFERENCES tour_bookings(tour_booking_id),	
	CONSTRAINT FK_payroll_daily_assistance_charges_id FOREIGN KEY (daily_assistance_charges_id) REFERENCES daily_assistance_charges(daily_assistance_charges_id),	
	CONSTRAINT FK_payroll_usage_fee_id FOREIGN KEY (usage_fee_id)  REFERENCES usage_fee(usage_fee_id)
);



