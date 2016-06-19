grammar Yaml; 

yaml: C_PRINTABLE;

// Character Set

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


// Character Encodings

C_BYTE_ORDER_MARK: '\uFEFF';

// Indicator Characters

C_SEQUENCE_ENTRY: '-';

C_MAPPING_KEY: '?';

C_MAPPING_VALUE: ':';

C_COLLECT_ENTRY: ',';

C_SEQUENCE_START: '[';

C_SEQUENCE_END: ']';

C_MAPPING_START: '{';

C_MAPPING_END: '}';

C_COMMENT: '#';

C_ANCHOR: '&';

C_ALIAS: '*';

C_TAG: '!';

C_LITERAL: '|';	 

C_FOLDED: '>';

C_SINGLE_QUOTE: '\''; 

C_DOUBLE_QUOTE:	'"';

C_DIRECTIVE: '%';

C_RESERVED: '@' 
          | '`';
          
C_INDICATOR: '-' 
           | '?' 
           | ':' 
           | ',' 
           | '[' 
           | ']' 
           | '{' 
           | '}'
		   | '#' 
		   | '&' 
		   | '*' 
		   | '!' 
		   | '|' 
		   | '>' 
		   | '\'' 
		   | '"'
		   | '%' 
		   | '@' 
		   | '`';
		   
C_FLOW_INDICATOR: ',' 
                | '[' 
                | ']' 
                | '{' 
                | '}';
                
// Line Break Characters

B_LINE_FEED: '\u000A'; /* LF */

B_CARRIAGE_RETURN: '\u000D'; /* CR */

b_char: B_LINE_FEED | B_CARRIAGE_RETURN;

nb_char: C_PRINTABLE b_char C_BYTE_ORDER_MARK;

b_break: ( B_CARRIAGE_RETURN B_LINE_FEED ) /* DOS, Windows */
       | B_CARRIAGE_RETURN                 /* MacOS upto 9.x */
       | B_LINE_FEED;                       /* UNIX, MacOS X */

b_as_line_feed: b_break;

b_non_content: b_break;

// White Space Characters