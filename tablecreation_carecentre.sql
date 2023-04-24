create table Admin (
    Admin_ID number not null constraint admin_pk primary key,
    FirstName varchar2(100),
    LastName varchar2(100),
    Email varchar2(20) not null,
    PhoneNo number not null
);
/

create table Staff (
    Staff_ID number not null constraint staff_pk primary key,
    Admin_ID number not null,
    RankDate date not null,
    FirstName varchar2(4000),
    LastName varchar2(4000),
    Gender varchar2(4000),
    Phone number,
 CONSTRAINT fk_mca_admin FOREIGN KEY (Admin_ID) REFERENCES Admin (Admin_ID)
);

create table Child (
    ChildID number not null constraint child_pk primary key,
    Staff_ID number not null,
    Admin_ID number not null,
    Meal_ID number not null,
    Name varchar2(4000) not null,
    DOB date not null,
    gender varchar2(4000),
    Address varchar2(4000),
contact number(20),
CONSTRAINT fk_mca_admin FOREIGN KEY (Admin_ID) REFERENCES Admin (Admin_ID),
CONSTRAINT fk_mca_staff FOREIGN KEY (Staff_ID) REFERENCES Staff (Staff_ID),
CONSTRAINT fk_mca_mealName FOREIGN KEY (Meal_ID) REFERENCES MealName (Meal_ID)
);


/
create table MealName (
    Meal_ID number not null constraint mealname_pk primary key,
    Description varchar2(4000)

);
/

create table Meal (
    Meal_ID number not null,
    MealTime timestamp,
    Admin_ID number not null,
    Staff_ID number not null,
CONSTRAINT fk_mca_admin FOREIGN KEY (Admin_ID) REFERENCES Admin (Admin_ID),
CONSTRAINT fk_mca_staff FOREIGN KEY (Staff_ID) REFERENCES Staff (Staff_ID),
CONSTRAINT fk_mca_mealName FOREIGN KEY (Meal_ID) REFERENCES MealName (Meal_ID)
);
/

create table Parent (
    Parent_ID number not null constraint parent_pk primary key,
    Admin_ID number not null,
    Name varchar2(4000) not null,
    Address varchar2(4000),
    Contact number not null,
CONSTRAINT fk_mca_admin FOREIGN KEY (Admin_ID) REFERENCES Admin (Admin_ID)
);

/
create table ChildLevel (
    LevelNumber number not null constraint childlevel_pk primary key,
    ChildID number not null,
    Staff_ID number not null,
    Admin_ID number not null,
    Meal_ID number not null,
    MealTime TimeStamp not null,
    status varchar2(4000),
CONSTRAINT fk_mca_admin FOREIGN KEY (Admin_ID) REFERENCES Admin (Admin_ID),
CONSTRAINT fk_mca_staff FOREIGN KEY (Staff_ID) REFERENCES Staff (Staff_ID),
CONSTRAINT fk_mca_mealName FOREIGN KEY (Meal_ID) REFERENCES MealName (Meal_ID),
CONSTRAINT fk_mca_meal FOREIGN KEY (MealTime) REFERENCES Meal (MealTime),
CONSTRAINT fk_mca_child FOREIGN KEY (ChildID) REFERENCES Child (childID)
);
/

create table Record (
    Admin_ID number not null,
    Rec_ID number not null constraint record_pk primary key,
    Parent_ID number not null,
    ChildID number not null,
    Staff_ID number not null,
    Meal_ID varchar2(4000) not null,
    MealTime timestamp not null,
CONSTRAINT fk_mca_staff FOREIGN KEY (Staff_ID) REFERENCES Staff (Staff_ID),
CONSTRAINT fk_mca_mealName FOREIGN KEY (Meal_ID) REFERENCES MealName (Meal_ID),
CONSTRAINT fk_mca_meal FOREIGN KEY (MealTime) REFERENCES Meal (MealTime),
CONSTRAINT fk_mca_admin FOREIGN KEY (Admin_ID) REFERENCES Admin (Admin_ID),
CONSTRAINT fk_mca_Parent FOREIGN KEY (Parent_ID) REFERENCES Parent (Parent_ID),
CONSTRAINT fk_mca_Child FOREIGN KEY (ChildID) REFERENCES Child (ChildID)
);
/
