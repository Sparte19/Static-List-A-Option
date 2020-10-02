with Ada.Text_IO; use Ada.Text_IO;
with lab1;
package body MakeList is
   --Set up the len, pt, array, and the IO package to be used
   len: Integer;
   pt: Integer range 0..size;
   fileOut: File_Type;
   lab: array(1..size) of itemType;
   package IIO is new Ada.Text_IO.Integer_IO (Integer); use IIO; 
   -- AddToList will be called in the process to add to the array.
   procedure AddToList (I: in itemType) is
   begin
      if pt < size then
         pt := pt + 1;
         lab(pt) := I;
      else
         Put_Line("Error! Overflow!");
      end if;
   end AddToList;
   
   -- The method PrintList will loop and print out the values
   -- within the array.
   procedure PrintList is
   begin
      for K in 1..pt loop
         Put(lab(K));
      end loop;
      New_Line;
   end PrintList;
   
   -- The method PrintList(point) will only print out what the
   -- current pointer is at.
   procedure PrintList (point: in Integer) is
   begin
      Put(lab(point));
   end PrintList;
   
   -- The method DeleteList(point) will delete the given point
   -- within the array and will move the stack down.
   procedure DeleteList (point: in Integer) is
   begin
   if point = size or point = pt then
      pt := pt - 1;
   elsif point >= 1 and point < pt then
      for K in point..(pt-1) loop
         lab(K) := lab(K+1);
         end loop;
         pt := pt - 1;
   else
         Put_Line("Error! Underflow!");
      end if;
   end DeleteList;

   -- The function ListLength will count the value in the array and return
   -- the length of the array.
   function ListLength return Integer is
   begin
      for K in 1..pt loop
            len := len+1;
      end loop;
      return len;
   end ListLength;
   begin
   -- Setting the values inside the array and length to empty
   -- while setting up the pointer, pt, at the starting point in the array.
   pt := 0;
   len := 0;

end MakeList;
