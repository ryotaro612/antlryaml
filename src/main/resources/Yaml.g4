grammar Yaml; 

yaml: C_PRINTABLE;
//C_PRINTABLE: #x9 | #xA | #xD | [#x20-#x7E] | #x85 | [#xA0-#xD7FF] | [#xE000-#xFFFD] | [#x10000-#x10FFFF];
C_PRINTABLE: '\u0009'
           | '\u000A' 
           | '\u000D'
           | '\u0020' .. '\u007E'
           | '\u0085'
           | '\u00A0' .. '\uD7FF'
           | '\uE000' .. '\uFFFD'
           | '\uD800\uDC00' ..  '\uDBFF\uDFFF';
           
NB_JSON: '\u0009' 
       | '\u0020' .. '\uDBFF\uDFFF';