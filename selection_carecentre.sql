----1-----
SELECT Record.staff.Id, Record.ChildID, 
FROM Record
INNER JOIN ChildLevel ON Record.ChildID=ChildLevel.ChildID;
------2------------
select * from MeaLName FULL JOIN   Child ON MealName.Meal_ID=MealName.Meal_ID;
--3--
--how much staff we have
select Distinct COUNT (Staff_Id) from Staff;
--4--
--list down the name of staff 
select person_name from Staff;
--provide the list of childs with their name and locations..
select ChildID, location, Name From child;
--is their any child from street 5.
select * from Child where address='street 5';