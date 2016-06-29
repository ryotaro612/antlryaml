grammar Script;

script : (stmt ';' | ';')* EOF;

stmt: add | rm | set;

INT: '0' | [1-9][0-9]*;

int_seq: INT '-' INT;

index: INT | int_seq;

add: 'add' INT 'col' ('before' 'col' '[' INT ']')?;

rm: 'rm' index (',' index)*;

set: 'set' assign (',' assign)*;

assign: 'col' '[' index (',' index)* ']' '=' VAL;


VAL: '"' (ESC|.)*? '"' ;

fragment
ESC : '\\"' | '\\\\' ;

WS:  [ \t\r\n\u000C]+ -> skip;

COMMENT:   '/*' .*? '*/' -> skip;

LINE_COMMENT:   '//' ~[\r\n]* -> skip;