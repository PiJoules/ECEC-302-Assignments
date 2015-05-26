# VHDL Syntax and other things
Useful stuff for when you can't use StackOverflow

## Stuff I noticed and bugged me as I learned more VHDL
- VHDL code is **case insensitive**, but constrants given in a .xcd file are **case sensistive**
- You cannot have 'dynamic' code outside of a process after the begin statement in an architecture
  - Essentially, stuff like `if`, `for`, or `while` statements cannot be used outside of a process. Outsde of a process, inside the architecture, after the begin statement, you can only port variables or values to other vaiables
  - Example:
  ```vhdl
	architecture beh of whatever is
	begin
		if condition then
			-- do something
		end if; -- illegal

		z <= temp; -- legal
	end beh;
  ````

## [Operators](http://www.csee.umbc.edu/portal/help/VHDL/operator.html)
- Highest precedence first
- left to right within same precedence group
- use parenthesis to control order
- Unary operators take an operand on the right
- "result same" means the result is the same as the right operand
- Binary operators take an operand on the left and right
- "result same" means the result is the same as the left operand

| Operator 			| Description 						| Example 								| Return Type
|:------------------|:----------------------------------|:--------------------------------------|:--------------
| **   				| exponentiation  					| numeric ** integer 					| result numeric
| abs  				| absolute value  					| abs numeric							| result numeric
| not  				| complement      					| not logic or boolean					| result same
| *    				| multiplication  					| numeric * numeric  					| result numeric
| /    				| division        					| numeric / numeric  					| result numeric
| mod  				| modulo          					| integer mod integer  					| result integer
| rem  				| remainder       					| integer rem integer  					| result integer
| +    				| unary plus      					| + numeric  							| result numeric
| -    				| unary minus     					| - numeric  							| result numeric
| +    				| addition        					| numeric + numeric  					| result numeric
| -   				| subtraction     					| numeric - numeric  					| result numeric
| &    				| concatenation   					| array or element & array or element 	| result array
| sll  				| shift left logical     			| logical array sll integer  			| result same
| srl  				| shift right logical    			| logical array srl integer  			| result same
| sla  				| shift left arithmetic  			| logical array sla integer  			| result same
| sra  				| shift right arithmetic 			| logical array sra integer  			| result same
| rol  				| rotate left            			| logical array rol integer  			| result same
| ror  				| rotate right           			| logical array ror integer  			| result same
| =    				| test for equality 				|										| result is boolean
| /=   				| test for inequality 				|										| result is boolean
| <    				| test for less than 				| 										| result is boolean
| <=   				| test for less than or equal 		|										| result is boolean
| >    				| test for greater than 			|										| result is boolean
| >=   				| test for greater than or equal 	|										| result is boolean
| and  				| logical and                		| logical array or boolean  			| result is same
| or   				| logical or                 		| logical array or boolean  			| result is same
| nand 				| logical complement of and  		| logical array or boolean  			| result is same
| nor  				| logical complement of or   		| logical array or boolean  			| result is same
| xor  				| logical exclusive or       		| logical array or boolean  			| result is same
| xnor 				| logical complement of exclusive or| logical array or boolean 				| result is same

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

## [Enums](http://web.engr.oregonstate.edu/~sllu/vhdl/lec2e.html)
```vhdl
TYPE my_type IS (reset, idle, rw_cycle, int_cycle);
SIGNAL state : my_state;
-- or
Signal state : my_state := idel;
```

## Length of std_logic_vector
```vhdl
variable len: integer;
signal arr: std_logic_vector(3 downto 0) := "1010";
begin
len := arr'length; -- 10
```

## [Converting from std_logic_vector to integer and back](http://stackoverflow.com/questions/16595894/how-to-typecast-integer-to-unsigned-in-vhdl)
```vhdl
use ieee.numeric_std.all; -- required

signal src_vec: std_logic_vector(3 downto 0) := "0101";
signal dest_vec: std_logic_vector(3 downto 0);
variable src_int: integer;
begin

-- std_logic_vector to int
src_int := to_integer(unsigned(src_vec)); -- unsigned can be replaced with signed

-- int to std_logic_vector
dest_vec <= std_logic_vector(to_unsigned(src_int, dest_vec'length));
```

## [If, elsif, else](http://www.ics.uci.edu/~jmoorkan/vhdlref/ifs.html)
```vhdl
if condition_1 then
	sequential statements
elsif condition2 then
	sequential statements
else
	sequential statements
end if;
```