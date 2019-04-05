

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token NUM PONTO AV FV AC FC STRING DP VIR 
%left  NUM  
%left  STRING AC FC AV FV

%%
PROGRAMA:
        PROGRAMA OBJETO 
        |
        ;

VALOR:

 STRING{ $$ = $1; }
 |NUM{ $$ = $1; }
 |NUM PONTO NUM{  $$ = $1;  }
 |AC FC{$$=$1;}
 ;

ITEM:
STRING DP VALOR{ $$ = $1;}
;

LISTA:
ITEM VIR ITEM{ $$ = $1; }
|VALOR VIR VALOR{  $$ = $1; }
|VALOR VIR VALOR VIR{  $$ = $1; }
|VETOR VIR VETOR{  $$ = $1; }
;

VETOR:
AV LISTA FV{ $$ = $1; }
|AV VETOR FV { $$ = $1; }
|AV LISTA VETOR { $$ = $1; }
|AV VALOR VIR VETOR FV FV{ $$ = $1; }
|
;

OBJETO:
AC ITEM FC { $$ = $1;}
|AC LISTA FC{ $$ = $1;}
| AC STRING DP OBJETO FC { $$ = $1;}
| AC STRING DP VETOR FC { $$ = $1;}
;

%%

void yyerror(char *s) {
}

int main() {
 
  if (yyparse()==1){
    printf("INVALIDO\n");
  }else{ printf("VALIDO\n"); };
    
    return 0;

}
