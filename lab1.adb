with Ada.Text_IO; use Ada.Text_IO;
with MakeList;

procedure lab1 is
   package IIO is new Ada.Text_IO.Integer_IO(integer);
   use IIO;

   -- Making the size declared already globally
   size: Integer := 0;
   fileIn, fileOut: File_Type;
begin
   Open(File => fileIn, Mode => In_File, Name => "Read.txt");
   Create(File => fileOut, Mode => Out_File, Name => "Results.txt");
   Put(fileOut, "enter a size for the array: ");
   get(fileIn, size);
   Put(fileOut, size);
   New_Line(fileOut);

   -- C option
   declare
      --Declare the pt, length, and the package local
      pt,length,num: Integer := 0;
      --Wrap the put for generic for intger
      procedure intPut(X: Integer) is
      begin
         Put(fileOut, X, 4, 10);
      end intPut;
      --Create the generic array for C
      package Clist is new MakeList(size, integer, intPut);
      use Clist;

   begin

      -- Run a test to show that AddToList, PrintList, PrintList(pt),
      -- DeleteList and ListLength work as intended
      Put_Line(fileOut, "Begin C!");
      for k in 1 .. size loop
         Put(fileOut, "Enter a Integer! ");
         get(fileIn, num);
         Put(fileOut, num);
         New_Line(fileOut);
         AddToList(num);
      end loop;
      Put_Line(fileOut, "C List is: ");
      PrintList;
      New_Line(fileOut);
      length := ListLength;
      for pt in 1..length loop
        Printlist(pt);
      end loop;
      New_Line(fileOut);
      DeleteList(2);
      PrintList;
      New_Line(fileOut);
   end;

   -- B option
   declare
      --Declare the pt, length, and the package local
      pt,length: Integer := 0;
      floatnum: Float := 0.0;
      --Create Float IO for B
      package FIO is new Ada.Text_IO.Float_IO(Float);
      use FIO;
      --Wrap the put for generic for float
      procedure FloatPut(X: Float) is
      begin
         Put(fileOut, X, 3, 1, 0);
      end FloatPut;
      --Create the generic array for B
      package Blist is new MakeList(size, Float, FloatPut);
      use Blist;

   begin

      -- Run a test to show that AddToList, PrintList, PrintList(pt),
      -- DeleteList and ListLength work as intended.
      Put_Line(fileOut, "Begin B!");
      for k in 1 .. size loop
         Put(fileOut, "Enter a Float! ");
         get(fileIn, floatnum);
         Put(fileOut, floatnum, 3, 1, 0);
         New_Line(fileOut);
         AddToList(floatnum);
      end loop;
      Put_Line(fileOut, "B List is: ");
      PrintList;
      New_Line(fileOut);
      length := ListLength;
      for pt in 1..length loop
        Printlist(pt);
      end loop;
      New_Line(fileOut);
      DeleteList(2);
      PrintList;
      New_Line(fileOut);
   end;

      -- A option
   declare
      --Declare the pt, length, and the package local
      pt,length: Integer := 0;
      --Declare job type
      type jobtype is (Programmer, Software_Engineer, Sales, Inventory_Conrtol,
                       Customer, Manager);

      package JIO is new Ada.Text_IO.Enumeration_IO(jobtype);
      use JIO;

      --Wrap the put for generic for float
      procedure StringPut(x: jobtype) is
      begin
         Put(fileOut, x, 18);
      end StringPut;
      --Declare job
      job: jobtype;
      --Create the generic array for A
      package Alist is new MakeList(size, jobtype, StringPut);
      use Alist;

   begin
      
      -- Run a test to show that AddToList, PrintList, PrintList(pt),
      -- DeleteList and ListLength work as intended.
      Put_Line(fileOut, "Begin A!");
      for k in 1 .. size loop
         Put(fileOut, "Enter a Job! ");
         get(fileIn, job);
         Put(fileOut, job);
         New_Line(fileOut);
         AddToList(job);
      end loop;
      Put_Line(fileOut, "A List is: ");
      PrintList;
      New_Line(fileOut);
      length := ListLength;
      for pt in 1..length loop
        Printlist(pt);
      end loop;
      New_Line(fileOut);
      DeleteList(2);
      PrintList;
      New_Line(fileOut);
      close(File => fileOut);
      close(File => fileIn);
   end;
end lab1;
