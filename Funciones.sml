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
