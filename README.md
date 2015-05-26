# VHDL Syntax and other things
Useful stuff for when you can't use StackOverflow

## [Operators](http://www.csee.umbc.edu/portal/help/VHDL/operator.html)
Highest precedence first,
left to right within same precedence group,
use parenthesis to control order.
Unary operators take an operand on the right.
"result same" means the result is the same as the right operand.
Binary operators take an operand on the left and right.
"result same" means the result is the same as the left operand.

**   exponentiation,  numeric ** integer,  result numeric
abs  absolute value,  abs numeric,  result numeric
not  complement,      not logic or boolean,  result same

*    multiplication,  numeric * numeric,  result numeric
/    division,        numeric / numeric,  result numeric
mod  modulo,          integer mod integer,  result integer
rem  remainder,       integer rem integer,  result integer

+    unary plus,      + numeric,  result numeric
-    unary minus,     - numeric,  result numeric

+    addition,        numeric + numeric,  result numeric
-    subtraction,     numeric - numeric,  result numeric
&    concatenation,   array or element & array or element, result array

sll  shift left logical,     logical array sll integer,  result same
srl  shift right logical,    logical array srl integer,  result same
sla  shift left arithmetic,  logical array sla integer,  result same
sra  shift right arithmetic, logical array sra integer,  result same
rol  rotate left,            logical array rol integer,  result same
ror  rotate right,           logical array ror integer,  result same

=    test for equality, result is boolean
/=   test for inequality, result is boolean
<    test for less than, result is boolean
<=   test for less than or equal, result is boolean
>    test for greater than, result is boolean
>=   test for greater than or equal, result is boolean

and  logical and,                logical array or boolean,  result is same
or   logical or,                 logical array or boolean,  result is same
nand logical complement of and,  logical array or boolean,  result is same
nor  logical complement of or,   logical array or boolean,  result is same
xor  logical exclusive or,       logical array or boolean,  result is same
xnor logical complement of exclusive or,  logical array or boolean,  result is same

## [Functions](http://www.ics.uci.edu/~jmoorkan/vhdlref/function.html)
```vhdl
function function_name (parameter_list) return type is
	declarations
begin
	sequential statements
end function_name;

-- Example

architecture FUNCTIONS of PAR is
	function PARITY (X : std_ulogic_vector) return std_ulogic is
	  	variable TMP : std_ulogic := '0';
	begin
		for J in X'range loop
		TMP := TMP xor X(J);
		end loop; -- works for any size X
		return TMP;
	end PARITY;
begin
	PARITY_BYTE <= PARITY(DATA_BYTE);
	PARITY_WORD <= PARITY(DATA_WORD);
end FUNCTIONS;
```