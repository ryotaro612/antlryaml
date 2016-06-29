grammar Script;

script : (stmt ';' | ';')* EOF;

stmt: mkp | mkc | rm | set;

mkp: 'mkp' elems (before)?;

mkc: 'mkc' expr (',' expr)* (before)? in;

rm: 'rm' elems (in)?;

set: 'set' assign (',' assign)* in;

elems: ELEM (',' ELEM)*;

before: 'before' ELEM;

in: 'in' ELEM;

expr: ELEM | assign;

assign: ELEM '=' VAL;

ELEM : '\'' [a-zA-Z]+ '\'';

VAL: '"' (ESC|.)*? '"' ;

fragment
ESC : '\\"' | '\\\\' ;

WS:  [ \t\r\n\u000C]+ -> skip;

COMMENT:   '/*' .*? '*/' -> skip;

LINE_COMMENT:   '//' ~[\r\n]* -> skip;