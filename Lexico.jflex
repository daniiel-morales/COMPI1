/*----------------------------------------------------------------------------
--------------Analisis Lexico Practica1_201314810-------------------
----------------------------------------------------------------------------*/

//-------------------> Importaciones 
//-------------------> Paquetes 
package Tools;
import java_cup.runtime.*;
%%
%{
    //-------------------> Codigo de usuario en sintaxis java
%}

//-------------------> Directivas
%public
%class LexicoCliente
%cupsym Simbolos
%cup
%char
%column
%full
//%ignorecase
%line
%unicode

//-------------------> Expresiones Regulares
int= (-)?[0-9]+
double= (-)?[0-9]+(.[0-9]+)?
tstring = "\"" ~"\""
//tchar = "'" ~"'"
id=[a-zA-Z][a-zA-Z0-9]*
contra=[a-zA-Z][a-zA-Z0-9]([a-zA-Z0-9]+)[a-zA-Z]

//-------------------> Estados
//%state COMENT_SIMPLE
//%state COMENT_MULTI

%%
/*-------------------------------------------------------------------
--------------------Reglas Lexicas--------------------------
-------------------------------------------------------------------*/

//-------------------> Comentarios
/*
<YYINITIAL> "#*"            {yybegin(COMENT_MULTI);}
<COMENT_MULTI> "*#"         {yybegin(YYINITIAL);}
<COMENT_MULTI>  .           {/* Omitir como es un comentario :D */}

<YYINITIAL> "//"            {yybegin(COMENT_SIMPLE);}
<COMENT_SIMPLE> [^"\n"]     {}
<COMENT_SIMPLE> "\n"        {yybegin(YYINITIAL);}
<COMENT_SIMPLE>  .          {/* Omitir como es un comentario :D */}
*/

//-------------------> Simbolos
<YYINITIAL> "$"         {   return new Symbol(Simbolos.doll, yycolumn, yyline, yytext());}
<YYINITIAL> "%%"        {   return new Symbol(Simbolos.andd, yycolumn, yyline, yytext());}
<YYINITIAL> "##"        {   return new Symbol(Simbolos.orr, yycolumn, yyline, yytext());}
<YYINITIAL> "="        {   return new Symbol(Simbolos.igual, yycolumn, yyline, yytext());}
<YYINITIAL> "=="        {   return new Symbol(Simbolos.igualdad, yycolumn, yyline, yytext());}
<YYINITIAL> ","         {   return new Symbol(Simbolos.coma, yycolumn, yyline, yytext());}
<YYINITIAL> ";"         {   return new Symbol(Simbolos.pcoma, yycolumn, yyline, yytext());}
<YYINITIAL> "+"         {   return new Symbol(Simbolos.mas, yycolumn, yyline, yytext());}
<YYINITIAL> "-"         {   return new Symbol(Simbolos.menos, yycolumn, yyline, yytext());}
<YYINITIAL> "*"         {   return new Symbol(Simbolos.por, yycolumn, yyline, yytext());}
<YYINITIAL> "/"         {   return new Symbol(Simbolos.dividir, yycolumn, yyline, yytext());}
<YYINITIAL> "Ptn"       {   return new Symbol(Simbolos.potencia, yycolumn, yyline, yytext());}
<YYINITIAL> "Rq"        {   return new Symbol(Simbolos.raiz, yycolumn, yyline, yytext());}
<YYINITIAL> "{"        	{   return new Symbol(Simbolos.allv, yycolumn, yyline, yytext());}
<YYINITIAL> "}"        	{   return new Symbol(Simbolos.cllv, yycolumn, yyline, yytext());}
<YYINITIAL> "["         {   return new Symbol(Simbolos.acor, yycolumn, yyline, yytext());}
<YYINITIAL> "]"         {   return new Symbol(Simbolos.ccor, yycolumn, yyline, yytext());}
<YYINITIAL> "("         {   return new Symbol(Simbolos.apar, yycolumn, yyline, yytext());}
<YYINITIAL> ")"         {   return new Symbol(Simbolos.cpar, yycolumn, yyline, yytext());}
<YYINITIAL> "@"         {   return new Symbol(Simbolos.arr, yycolumn, yyline, yytext());}
<YYINITIAL> "."         {   return new Symbol(Simbolos.pto, yycolumn, yyline, yytext());}

//-------------------> Palabras Reservadas
<YYINITIAL> "request"      	{   return new Symbol(Simbolos.rt, yycolumn, yyline, yytext());}
<YYINITIAL> "InicioUsuario"	{   return new Symbol(Simbolos.io, yycolumn, yyline, yytext());}
<YYINITIAL> "id"				{   return new Symbol(Simbolos.id, yycolumn, yyline, yytext());}
<YYINITIAL> "password"    	{   return new Symbol(Simbolos.pd, yycolumn, yyline, yytext());}
<YYINITIAL> "CrearUsuario" 	{   return new Symbol(Simbolos.co, yycolumn, yyline, yytext());}
<YYINITIAL> "nombre"   		{   return new Symbol(Simbolos.ne, yycolumn, yyline, yytext());}
<YYINITIAL> "apellido"  		{   return new Symbol(Simbolos.ao, yycolumn, yyline, yytext());}
<YYINITIAL> "telefono"      {   return new Symbol(Simbolos.tel, yycolumn, yyline, yytext());}
<YYINITIAL> "email" 			{   return new Symbol(Simbolos.el, yycolumn, yyline, yytext());}
<YYINITIAL> "direccion"   	{   return new Symbol(Simbolos.dn, yycolumn, yyline, yytext());}
<YYINITIAL> "tienda" 		{   return new Symbol(Simbolos.ta, yycolumn, yyline, yytext());}
<YYINITIAL> "tipo"    		{   return new Symbol(Simbolos.to, yycolumn, yyline, yytext());}
<YYINITIAL> "codigo"     	{   return new Symbol(Simbolos.cod, yycolumn, yyline, yytext());}
<YYINITIAL> "propietario"   {   return new Symbol(Simbolos.po, yycolumn, yyline, yytext());}
<YYINITIAL> "img"      		{   return new Symbol(Simbolos.ig, yycolumn, yyline, yytext());}
<YYINITIAL> "producto" 		{   return new Symbol(Simbolos.pro, yycolumn, yyline, yytext());}
<YYINITIAL> "cantidad" 		{   return new Symbol(Simbolos.cd, yycolumn, yyline, yytext());}
<YYINITIAL> "marca" 			{   return new Symbol(Simbolos.ma, yycolumn, yyline, yytext());}
<YYINITIAL> "color" 			{   return new Symbol(Simbolos.cr, yycolumn, yyline, yytext());}
<YYINITIAL> "tamaño" 		{   return new Symbol(Simbolos.tmo, yycolumn, yyline, yytext());}
<YYINITIAL> "sucursal" 		{   return new Symbol(Simbolos.sl, yycolumn, yyline, yytext());}
<YYINITIAL> "mate" 			{   return new Symbol(Simbolos.me, yycolumn, yyline, yytext());}
<YYINITIAL> "Cons" 			{   return new Symbol(Simbolos.cs, yycolumn, yyline, yytext());}
<YYINITIAL> "get" 			{   return new Symbol(Simbolos.gt, yycolumn, yyline, yytext());}
<YYINITIAL> "N"        		{   return new Symbol(Simbolos.nott, yycolumn, yyline, yytext());}
<YYINITIAL> "com"        	{   return new Symbol(Simbolos.cm, yycolumn, yyline, yytext());}

//-------------------> Datos
<YYINITIAL> {int}       {   return new Symbol(Simbolos.numero, yycolumn, yyline, yytext());}
<YYINITIAL> {double}       {   return new Symbol(Simbolos.decimal, yycolumn, yyline, yytext());}
<YYINITIAL> {id}        {   return new Symbol(Simbolos.idd	, yycolumn, yyline, yytext());}
<YYINITIAL> {tstring}    {   return new Symbol(Simbolos.cadena, yycolumn, yyline, yytext());}
<YYINITIAL> {contra}    {   return new Symbol(Simbolos.pass, yycolumn, yyline, yytext());}
//-------------------> Espacios
[ \t\r\n\f]              {/* Espacios en blanco, se ignoran */ }
 
//-------------------> Errores Lexicos
.                        {   System.out.println("Error Lexico: <<"+yytext()+">> Linea: "+yyline+" ,Columna: "+yycolumn);}

