%{
#include <iostream>
#include <stdlib.h>
#include "calc2.tab.h"  /* We want the tokens defined in calc2.y. */
%}

%option noyywrap

%%

                        /* 'val' in 'yylval.val' is the field declared in
                           calc2.y with the %union directive. */
[0-9]+                  { yylval.val = atoi(yytext); return NUM; }
"+"                     { return PLUS; }
"-"                     { return MINUS; }
"*"                     { return MUL; }
"/"                     { return DIV; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
[ \t\r\n]+              { /* Ignore white characters. */ }
.                       { std::cerr << "Invalid token" << std::endl; exit(1); }

%%
