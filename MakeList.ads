generic
   size: integer;
   type itemType is private;
   with procedure Put(X: itemType);
package MakeList is
   procedure AddToList(I: in itemType);
   procedure PrintList;
   procedure PrintList(point: in integer);
   procedure DeleteList(point: in integer);
   function ListLength return integer;
end MakeList;
