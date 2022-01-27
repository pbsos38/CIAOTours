alter table  employee  ADD CONSTRAINT chk_employee_first_name check(regexp_like(firstName,'^[[:alpha:]]+$'));
alter table  employee ADD CONSTRAINT chk_employee_last_name check(regexp_like(lastName,'^[[:alpha:]]+$'));
alter table employee ADD CONSTRAINT chk_employee_city check(regexp_like(city,'^[[:alpha:]]+$'));
alter table employee ADD CONSTRAINT chk_employee_hourlyWage check(hourlyWage >=0);
alter table employee ADD CONSTRAINT chk_employee_end_date check(employee_start_date<employee_end_date);
alter table employee ADD CONSTRAINT chk_emp_isAdmin check((isAdmin=1)or(isAdmin=0));
alter table employee ADD CONSTRAINT chk_emp_Bk check((isBookeeper=1)or(isBookeeper=0));
/*tour_booking constraints*/
alter table tour_bookings ADD CONSTRAINT chk_tour_booking_adminFee check(adminFee >=0);
alter table tour_bookings ADD CONSTRAINT chk_tour_booking_numOfHours check(numOfHours >=0);
alter table tour_bookings ADD CONSTRAINT chk_tour_booking_rate check(rate >=0);
/* 
expense constraints
*/
alter table expense ADD CONSTRAINT chk_expense_expenseAmount check(expenseAmount >=0);
/* 
workday CONSTRAINTS
*/
alter table workday ADD CONSTRAINT chk_workday_noOfHours check(noOfHours >=0);
/*
	daily_assistance_charges CONSTRAINTS
	to shorten the name daily assistance charges rate daily assistance field is abbriviated to rda
	likewise total rate is abbriviated to tr for the same reason as above.
	abbriviated daily assistance charges to dav in constraint name as id was too long.
*/
alter table daily_assistance_charges ADD CONSTRAINT chk_dac_rda check(rate_daily_Assistance  >=0);
alter table daily_assistance_charges ADD CONSTRAINT chk_dac_endDate check(endDate > startDate);
/* 
	usage fee constraints 
*/
alter table usage_fee ADD CONSTRAINT chk_usage_fee_usage_cost  check(usage_cost >= 0);