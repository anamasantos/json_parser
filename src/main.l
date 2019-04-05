
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}


%%

[0-9]+[\n]* {
          return NUM;
        }

[.] {
          return PONTO;
}

[[]   {
          return AV;
}

[]]   {
          return FV;
}


[{]   {
          return AC;
}

[}]   {
          return FC;
}

["]([a-zA-Z0-9]+[ ]*)+["]+[\n]* {
          return STRING;
}

[:] {
          return DP;
}


[,][\n]* {
          return VIR;
}

[ \t]+; 

[[:space:]]+
;



.   {yyerror("IVALIDO\n");}

%%

int yywrap() {
  return 1;
}
