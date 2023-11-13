---------------------------------------------------
-- Create Tables for Project Phase4_team6_version1
---------------------------------------------------
-- 1-Table EMPLOYEE
CREATE TABLE FALL22_004_6_EMPLOYEE(
    Emp_ID CHAR(9) NOT NULL,
    E_First VARCHAR(20) NOT NULL,
    E_Middle CHAR,
    E_Last VARCHAR(20) NOT NULL,
    B_date DATE,
    gender CHAR,
    E_address VARCHAR(35),
    E_email VARCHAR(35),
    cell_phone VARCHAR(13),
    PRIMARY KEY (Emp_ID)
);
--2-Table CLIENT
CREATE TABLE FALL22_004_6_CLIENT(
    CLIENT_ID CHAR(9) NOT NULL,
    C_type VARCHAR(15) NOT NULL,
    C_address VARCHAR(35),
    C_email VARCHAR(20),
    way_met_center VARCHAR(20),
    way_of_contact VARCHAR(20),
    PRIMARY KEY (CLIENT_ID)
);
--3-Table FOODS
CREATE TABLE FALL22_004_6_FOODS(
    F_NUM CHAR(9) NOT NULL,
    sales_price DECIMAL(10,2),
    purchase_price DECIMAL(10,2),
    PRIMARY KEY (F_NUM)
);
--4-Table UTILITIES
CREATE TABLE FALL22_004_6_UTILITIES(
    U_CODE CHAR(9) NOT NULL,
    U_date DATE,
    cost_per_month DECIMAL(10,2),
    PRIMARY KEY (U_CODE)
);
--5-Table SALARY
CREATE TABLE FALL22_004_6_SALARY(
    SAL_ID CHAR(9) NOT NULL,
    annual_salary DECIMAL(10,2),
    PRIMARY KEY (SAL_ID),
    FOREIGN KEY (SAL_ID) REFERENCES FALL22_004_6_EMPLOYEE(EMP_ID)
);
--6-Table HOURLY
CREATE TABLE FALL22_004_6_HOURLY(
    HOURLY_ID CHAR(9) NOT NULL,
    hourly_rate DECIMAL(10,2),
    work_type VARCHAR(20),
    PRIMARY KEY (HOURLY_ID),
    FOREIGN KEY (HOURLY_ID) REFERENCES FALL22_004_6_EMPLOYEE(EMP_ID)
);
--7-TABLE EVENT_STAFF
CREATE TABLE FALL22_004_6_EVENT_STAFF(
    ESTAFF_ID CHAR(9) NOT NULL,
    PRIMARY KEY (ESTAFF_ID),
    FOREIGN KEY (ESTAFF_ID) REFERENCES FALL22_004_6_SALARY(SAL_ID)
);
--8-Table PLANNER
CREATE TABLE FALL22_004_6_PLANNER(
    CLIENT_ID CHAR(9) NOT NULL,
    PLANNER_ID CHAR(9) NOT NULL,
    P_firstname VARCHAR(20),
    P_middle CHAR,
    P_lastname VARCHAR(20),
    P_email VARCHAR(20),
    P_rating INT,
    PRIMARY KEY (CLIENT_ID, PLANNER_ID),
    FOREIGN KEY (CLIENT_ID) REFERENCES FALL22_004_6_CLIENT(CLIENT_ID)
);
--9-Table EVENT 
CREATE TABLE FALL22_004_6_EVENT(
    EVENT_ID CHAR(9) NOT NULL,
    E_name VARCHAR(35),
    E_date DATE,
    amount_of_participants INT,
    staff_ID CHAR(9) NOT NULL,
    staff_hrs_worked DECIMAL(10,2),
    CLIENT_ID CHAR(9) NOT NULL,
    PRIMARY KEY (EVENT_ID),
    FOREIGN KEY (staff_ID) REFERENCES FALL22_004_6_EVENT_STAFF(ESTAFF_ID),
    FOREIGN KEY (CLIENT_ID) REFERENCES FALL22_004_6_CLIENT(CLIENT_ID)
);
--10-Table PUBLIC
CREATE TABLE FALL22_004_6_PUBLIC(
    PUBLIC_ID CHAR(9) NOT NULL,
    duration DECIMAL (10,2),
    PRIMARY KEY (PUBLIC_ID),
    FOREIGN KEY (PUBLIC_ID) REFERENCES FALL22_004_6_EVENT(EVENT_ID)
);
--11-Table ELECTRICITY
CREATE TABLE FALL22_004_6_ELECTRICITY(
    EU_CODE CHAR(9) NOT NULL,
    kwh_per_month DECIMAL(10,2),
    PRIMARY KEY (EU_CODE),
    FOREIGN KEY (EU_CODE) REFERENCES FALL22_004_6_UTILITIES(U_CODE)
);
--12-Table TABLES
CREATE TABLE FALL22_004_6_TABLES(
    TAB_ID CHAR(9) NOT NULL,
    T_type VARCHAR(30),
    sitting_amount INT,
    amount_in_stock INT,
    PRIMARY KEY (TAB_ID)
);
--13-Table ADMIN_STAFF
CREATE TABLE FALL22_004_6_ADMIN_STAFF(
    ADMIN_ID CHAR(9) NOT NULL,
    job_position VARCHAR(20),
    PRIMARY KEY (ADMIN_ID),
    FOREIGN KEY (ADMIN_ID) REFERENCES FALL22_004_6_SALARY(SAL_ID)
);
--14-Table WORKS_0N
CREATE TABLE FALL22_004_6_WORKS_ON(
    HOURLY_ID CHAR(9) NOT NULL,
    EVENT_ID CHAR(9) NOT NULL,
    hrs_worked DECIMAL(10,2),
    PRIMARY KEY (HOURLY_ID, EVENT_ID),
    FOREIGN KEY (HOURLY_ID) REFERENCES FALL22_004_6_HOURLY(HOURLY_ID),
    FOREIGN KEY (EVENT_ID) REFERENCES FALL22_004_6_EVENT(EVENT_ID)
);
--15-Table CLIENT_PHONE
CREATE TABLE FALL22_004_6_CLIENT_PHONE(
    CLIENT_ID CHAR(9) NOT NULL,
    C_phone VARCHAR(13) NOT NULL,
    PRIMARY KEY (CLIENT_ID),
    FOREIGN KEY (CLIENT_ID) REFERENCES FALL22_004_6_CLIENT(CLIENT_ID)
);
--16-Table CORPORATION
CREATE TABLE FALL22_004_6_CORPORATION(
    CORP_ID CHAR(9) NOT NULL,
    c_name VARCHAR(35),
    PRIMARY KEY (CORP_ID),
    FOREIGN KEY (CORP_ID) REFERENCES FALL22_004_6_CLIENT(CLIENT_ID)
);
--17-Table INDIVIDUAL
CREATE TABLE FALL22_004_6_INDIVIDUAL(
    IND_ID CHAR(9) NOT NULL,
    I_firstname VARCHAR(20) NOT NULL,
    I_middle CHAR,
    I_lastname VARCHAR(20) NOT NULL,
    PRIMARY KEY (IND_ID),
    FOREIGN KEY (IND_ID) REFERENCES FALL22_004_6_CLIENT(CLIENT_ID)
);
--18-Table PLANNER_PHONE
CREATE TABLE FALL22_004_6_PLANNER_PHONE(
    CLIENT_ID CHAR(9) NOT NULL,
    PLANNER_ID CHAR(9) NOT NULL,
    P_phone VARCHAR(15) NOT NULL,
    PRIMARY KEY (CLIENT_ID, PLANNER_ID, P_phone),
    FOREIGN KEY (CLIENT_ID, PLANNER_ID) REFERENCES FALL22_004_6_PLANNER(CLIENT_ID, PLANNER_ID)
);
--19-Table SOCIAL
CREATE TABLE FALL22_004_6_SOCIAL(
    SOCIAL_ID CHAR(9) NOT NULL,
    S_time TIMESTAMP,
    PRIMARY KEY (SOCIAL_ID),
    FOREIGN KEY (SOCIAL_ID) REFERENCES FALL22_004_6_EVENT(EVENT_ID)
);
--20-Table HALL
CREATE TABLE FALL22_004_6_HALL(
    HALL_ID CHAR(9) NOT NULL,
    Hall_name VARCHAR(20),
    size_sqft DECIMAL(10,2),
    capacity INT,
    amount_connections INT,
    min_cost DECIMAL(10,2),
    max_cost DECIMAL(10,2),
    UNIQUE (Hall_name),
    PRIMARY KEY (HALL_ID)
);
--21-Table EXHIBIT 
CREATE TABLE FALL22_004_6_EXHIBIT(
    EXIB_ID CHAR(9) NOT NULL,
    num_sqft DECIMAL(10,2),
    PRIMARY KEY (EXIB_ID),
    FOREIGN KEY (EXIB_ID) REFERENCES FALL22_004_6_PUBLIC(PUBLIC_ID)
);
--22-Table CONVENTION
CREATE TABLE FALL22_004_6_CONVENTION(
    CONV_ID CHAR(9) NOT NULL,
    setting_type VARCHAR(15),
    PRIMARY KEY (CONV_ID),
    FOREIGN KEY (CONV_ID) REFERENCES FALL22_004_6_PUBLIC(PUBLIC_ID)
);
--23-Table CONCERT
CREATE TABLE FALL22_004_6_CONCERT(
    CONC_ID CHAR(9),
    artist VARCHAR(70),
    PRIMARY KEY (CONC_ID),
    FOREIGN KEY (CONC_ID) REFERENCES FALL22_004_6_PUBLIC(PUBLIC_ID)
);
--24-Table SERVES
CREATE TABLE FALL22_004_6_SERVES(
    F_NUM CHAR(9) NOT NULL,
    EVENT_ID CHAR(9) NOT NULL,
    amount_drinks INT,
    amount_meals INT,
    PRIMARY KEY (F_NUM, EVENT_ID),
    FOREIGN KEY (F_NUM) REFERENCES FALL22_004_6_FOODS(F_NUM),
    FOREIGN KEY (EVENT_ID) REFERENCES FALL22_004_6_EVENT(EVENT_ID)
);
--25-Table WATER
CREATE TABLE FALL22_004_6_WATER(
    WU_CODE CHAR(9) NOT NULL,
    gal_per_month DECIMAL(10,2),
    PRIMARY KEY (WU_CODE),
    FOREIGN KEY (WU_CODE) REFERENCES FALL22_004_6_UTILITIES(U_CODE)
);
--26-Table TABLE_CLOTHES
CREATE TABLE FALL22_004_6_TABLE_CLOTHES(
    TAB_ID CHAR(9) NOT NULL,
    TC_ID CHAR(9) NOT NULL,
    TC_type VARCHAR(15),
    color VARCHAR(15),
    cleaning_cost DECIMAL(10,2),
    amount_in_stock INT,
    PRIMARY KEY (TAB_ID, TC_ID),
    FOREIGN KEY (TAB_ID) REFERENCES FALL22_004_6_TABLES(TAB_ID)
);
--27-Table MEAL_CHOICE
CREATE TABLE FALL22_004_6_MEAL_CHOICE(
    FM_NUM CHAR(9) NOT NULL,
    meal_name VARCHAR(350) NOT NULL,
    meal_type VARCHAR(35) NOT NULL,
    UNIQUE(meal_name),
    PRIMARY KEY (FM_NUM, meal_name, meal_type),
    FOREIGN KEY (FM_NUM) REFERENCES FALL22_004_6_FOODS(F_NUM)
);
--28-Table DRINK_TYPE
CREATE TABLE FALL22_004_6_DRINK_TYPE(
    DM_NUM CHAR(9) NOT NULL,
    D_name VARCHAR(35) NOT NULL,
    D_type VARCHAR(20) NOT NULL,
    UNIQUE(D_name),
    PRIMARY KEY(DM_NUM, D_name, D_type),
    FOREIGN KEY (DM_NUM) REFERENCES FALL22_004_6_FOODS(F_NUM)
);
--29-Table HALL_RENTS
CREATE TABLE FALL22_004_6_HALL_RENTS(
    HALL_ID CHAR(9) NOT NULL,
    EVENT_ID CHAR(9) NOT NULL,
    cost_per_event DECIMAL(10,2),
    PRIMARY KEY (HALL_ID, EVENT_ID),
    FOREIGN KEY (HALL_ID) REFERENCES FALL22_004_6_HALL(HALL_ID),
    FOREIGN KEY (EVENT_ID) REFERENCES FALL22_004_6_EVENT(EVENT_ID)
);
--30-Tables TABLES_REQUIRED
CREATE TABLE FALL22_004_6_TABLES_REQUIRED(
   EVENT_ID CHAR(9) NOT NULL,
   TAB_ID CHAR(9) NOT NULL,
   Num_tables_required INT,
   PRIMARY KEY (EVENT_ID, TAB_ID),
   FOREIGN KEY (EVENT_ID) REFERENCES FALL22_004_6_EVENT(EVENT_ID),
   FOREIGN KEY (TAB_ID) REFERENCES FALL22_004_6_TABLES(TAB_ID)
);
--31-Tables ELEC_USAGE
CREATE TABLE FALL22_004_6_ELEC_USAGE(
   HALL_ID CHAR(9),
   E_CODE CHAR(9),
   PRIMARY KEY(HALL_ID, E_CODE),
   FOREIGN KEY(HALL_ID) REFERENCES FALL22_004_6_HALL(HALL_ID),
   FOREIGN KEY(E_CODE) REFERENCES FALL22_004_6_ELECTRICITY(EU_CODE)
);



