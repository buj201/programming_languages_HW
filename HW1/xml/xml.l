%{
#include <iostream>
#include <stdlib.h>
#include "xml.tab.h"  /* We want the tokens defined in xml.y. */

/* Change test_flag to 1 to print tokens found by lexer */
int test_flag = 0;
%}

%option noyywrap

ATTRIBUTES         [ \t]+[A-Za-z0-9]+[ \t]*=[ \t]*\"[ A-Za-z0-9.:/]*\"
TAG               [A-Za-z0-9]+
OPENTAG           <[ \t]*{TAG}{ATTRIBUTES}*[ \t]*>
CLOSETAG          <\/{TAG}>

%%

{OPENTAG}                {if (test_flag){
                            std::cout << yytext <<std::endl;
                          }
                          yylval.strval = strdup(yytext);
                          return OPENINGTAG; }
{CLOSETAG}               {if (test_flag){
                            std::cout << yytext <<std::endl;
                          }
                          yylval.strval = strdup(yytext);
                          return CLOSINGTAG; }
[ A-Za-z0-9]*              { /* Ignore data. */ }
[\t\r\n]+              { /* Ignore whitespaces per assignment instructions in forum. */ }
.                       { std::cerr << "Invalid token" << std::endl; exit(1); }

%%

