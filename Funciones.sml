(* - Retorna true si  'date1'  es mayor que  'date2' *)

fun is_older (date1 : (int * int * int), date2 : (int * int * int)) =
    if ( #1 (date1) < #1 (date2)) 
	then true
    else if ( #1 (date1) = #1 (date2)) andalso (#2 (date1) < #2 (date2)) 
	then true
    else if ( #1 (date1) = #1 (date2)) andalso (#2 (date1) = #2 (date2)) andalso (#3 (date1) < #3 (date2)) then true
    else false 


(*- Returns the 'n' th element in the list 'strings' *)

fun get_nth (strings : string list, n: int) =
    if null strings then ""
    else if n = 1 then hd strings
    else get_nth(tl strings, n-1)



val MONTH_LIST = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Setiembre", "Octubre", "Noviembre", "Diciembre"]


(* - Returns a string representation of the date: 'date' *)



fun date_to_string (date : int * int * int) =
    get_nth(MONTH_LIST, #2 (date)) ^ " " ^ (Int.toString (#3 (date))) ^ ", " ^ (Int.toString (#1 (date)))


val MONTHS_DAYS = [31,28,31,30,31,30,31,31,30,31,30,31]


(* - Returns the month that contains the day: 'day' *)


(* fun number_before_reaching_sum (sum : int, nums : int list) =
let
fun accum (i : int, nums : int list) =
if (i + hd nums) >= sum then 0
else accum (i + hd nums, tl nums) + 1
in
accum(0, nums)
end

fun what_month (day : int) =
    number_before_reaching_sum(day, MONTHS_DAYS) + 1  *)



 (*para leer el archivo siga este a la lista de la cadena por línea:*)

 val infile = "/home/esteban/Desktop/txt.txt" ; 
 
 fun readlist (infile : string) =
 let val ins = TextIO.openIn infile  
 
 fun loop ins = case TextIO.inputLine 
 ins of SOME line => line :: loop ins | NONE => [] in loop ins before TextIO.closeIn ins
 end ; 
 
 val pureGraph = readlist(infile); 

(*y con esta función se puede analizar a tupla (x, y, z): *)

 fun creatGraph([],reList) = 
 reList |creatGraph(x::y::z::input,reList) = 
 creatGraph(input,reList@[(x,y,z)]);


(* Esta toma un archivo y cada linea de texto la guarda en una lista de strings*)

fun readlist (infile : string) = let
  val ins = TextIO.openIn infile
  fun loop ins =
   case TextIO.inputLine ins of
      SOME line => line :: loop ins
    | NONE      => []
in
  loop ins before TextIO.closeIn ins
end 

(* Toma las lineas de texto y las guarda en una lista de Strings*)

fun readlist (infile : string) = let
  val ins = TextIO.openIn infile
  fun loop ins =
   case TextIO.inputLine ins of
      SOME line => line :: loop ins
    | NONE      => []
in
  loop ins before TextIO.closeIn ins
end

﻿
(*Funcion que valida año bisiesto*)
fun es_bisiesto(pr : int)=
	if((pr div 400) == 0)
		then true
	else if((pr mod 4)== 0) andalso ((pr mod 100)==0)
		then true
	else false

(*Funcion que valida el mes y dia de un año biciesto*)
fun dia_mes_biciesto(d: int,m: int))=
	if(m != 02)
		then true
	else if(d <= 29) andalso (d>0)
		then true
	else false

(*Funcion que valida dias con lo meses*)
fun dia_mes_valido(d: int,m: int))=
	if(m==02) andalso (d<=28) andalso (d>0)
		then true
	elseif(m==04) andalso (d<=30) andalso (d>0)
		then true
	elseif(m==06) andalso (d<=30) andalso (d>0)
		then true
	elseif(m==09) andalso (d<=30) andalso (d>0)
		then true
	elseif(m==11) andalso (d<=30) andalso (d>0)
		then true
	elseif(d<=31) andalso (d>0)
		then true
	else false


(*Funcion valida fecha*)
fun Validar_fecha(date: (int * int * int))=
	val dia= (#1 date);
	val mes= (#2 date);
	val año= (#3 date);
	if(es_biciesto(año)== true) andalso(dia_mes_biciesto(dia,mes)==true)
		then true
	if(dia_mes_valido(dia,mes)==true)
		then true
	else false
