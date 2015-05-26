# VHDL Syntax and other things
Useful stuff for when you can't use StackOverflow

## Functions
```vhdl
function function_name (parameter_list) return type is
	declarations
begin
	sequential statements
end function_name;

-- Example
function PARITY (X : std_ulogic_vector) return std_ulogic is
  	variable TMP : std_ulogic := '0';
begin
	for J in X'range loop
	TMP := TMP xor X(J);
	end loop; -- works for any size X
	return TMP;
end PARITY;

architecture FUNCTIONS of PAR is
begin
  PARITY_BYTE <= PARITY(DATA_BYTE);
  PARITY_WORD <= PARITY(DATA_WORD);
end FUNCTIONS;
```