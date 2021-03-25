#       Elizabeth Márquez Gómez
#   Principios de Programación 2020-1
#             Generación 17
#   Licenciatura en Ciencias Genómicas
# Universidad Nacional Autónoma de México

use POSIX; #Biblioteca para redondear las divisiones con la función floor();
# El siguiente programa recibe un conjunto de números no mayor a 10,000 elementos, y con un rango de -20,000 a 20,000
# Posteriormente, recibe un número por el usuario y se deberá devolver la posición en la que se encuentra ese número o
# si no se encuentra en el conjunto

#FUNCIÓN RECURSIVA PARA ENCONTRAR LA POSICIÓN
sub find {
  my ($vecRef, $max, $min, $midl, $num) = @_;
  my @vec = @{$vecRef};
  my $bug=0;
  my $pos=0;
  #SI NO ENTRA EN LOS RANGOS
  if($num < $vec[$min] || $num > $vec[$max]){
    print"El numero $num no se encuentra en el conjunto.\n";
    return;
  }
  #SI LOS LÍMITES SE CRUZAN, O ESTÁN CONSECUTIVOS, NO ESTÁ EL NÚMERO
  elsif($min > $max || ($max-$min == 1 && ($num != $vec[$min] || $num != $vec[$max]))){
    print"El numero $num no se encuentra en el conjunto.\n";
    return;
  }
  #ESTA SECCIÓN SE EJECUTA SI EL NÚMERO BUSCADO ES IGUAL AL NUMERO EN EL ÍNDICE "midl"
  elsif($vec[$midl] == $num){
    $pos = $midl+1;
    print"La posicion de $num es: $pos.\n";
    return;
  }
  #SI ESTA EN UN BUCLE ENTRE DOS NUMEROS
  elsif($max-$min == 1 && ($num == $vec[$min] || $num == $vec[$max])){
    $bug = ($num == $vec[$min]) ? $min : $max;
    $pos = $bug+1;
    print"La posicion de $num es: $pos.\n";
    return;
  }
  #ESTA SECCIÓN SE EJECUTA SI EL NÚMERO BUSCADO ES MAYOR AL NUMERO EN EL ÍNDICE "midl"
  elsif($num > $vec[$midl]){
    find(\@vec, $max, $midl, $midl+(floor(($max-$midl)/2)), $num);
  }
  #ESTA SECCIÓN SE EJECUTA SI EL NÚMERO BUSCADO ES MENOR AL NUMERO EN EL ÍNDICE "midl"
  elsif($num < $vec[$midl]){
    find(\@vec, $midl, $min, floor(($max-$min)/2), $num);
  }
}
  my @vec;
  my $l;
  my $j;
  my $i;
  my $lenght=0;
  my $aux=0;
  my $num=0;
  my $win=0;
  my $a=0;
  my $min=0;
  my $max=0;
  #DESCRIPCIÓN DEL PROGRAMA
  print"Este programa recibe un conjunto de elementos, y posteriormente buscara la posicion de un elemento segun el orden ascendente del conjunto.\n";
  #PEDIR LOS DATOS, VALIDAR Y ALMACENARLOS EN EL VECTOR
  while(!$win){
    print"\nIngrese el numero de elementos del conjunto: ";
    $lenght= <STDIN>;
    if($lenght >= 1 && $lenght <= 10000){
      $win = 1;
    }
    else{
      print"El numero no entra en el rango establecido para el $numero de elementos del conjunto";
    }
  }
  print"\nIngrese los elementos del conjunto";
  #VALIDAR LOS ELEMENTOS
  for ($i = 0; $i < $lenght; $i++) {
    $pos = $i+1;
    print"\n\tElemento $pos:";
    $a = <STDIN>;
    if($a >= -20000 && $a <= 20000){
      $vec[$i] = $a;
    }
    else{
      print"El numero ingresado esta fuera del rango entre -20000 y 20000. Ingreselo de nuevo.\n";
      $i-=1;
    }
  }
  #RECIBIR Y VALIDAR EL NUMERO A BUSCAR EN EL CONJUNTO
  $win = 0;
  while(!$win) {
    print"\nIngrese el elemento que desea buscar en el conjunto: ";
    $num = <STDIN>;
    if($num >= -20000 && $num <= 20000){
      $win = 1;
    }
    else{
      print"El numero no entra en el rango establecido de -20000 a 20000. Ingreselo de nuevo.\n";
    }
  }
  #ORDENAR EL VECTOR EN CASO DE QUE NO ESTE ORDENADO, BUBBLE SORT
  for ($j = 1; $j < $lenght; $j++){
    for ($l = 1; $l <= $lenght-$j; $l++){
      if ($vec[$l-1] > $vec[$l]) {
        $aux = $vec[$l-1];
        $vec[$l-1] = $vec[$l];
        $vec[$l] = $aux;
      }
    }
  }
  #OBTENER LA POSICIÓN DEL NUMERO CON LA FUNCIÓN
  $max = $lenght-1;
  find(\@vec, $max, $min, floor(($max-$min)/2), $num);

#  ------DICCIONARIO DE VARIABLES------
#           +----FUNCIÓN FIND----+
# *NOMBRE*         *TIPO*            *FUNCIÓN*
# vec      Entera tipo vector     Almacenará los elementos del conjuntos
# midl          Entera            Almacena la posición en la que se buscará el número
# min           Entera            Almacena el límite inferior en el rango de busqueda en el vector
# max           Entera            Almacena el límite superior en el rango de busqueda en el vector
# num           Entera            Almacena el número a buscar en el conjunto
#  pos           Entera            Almacena el valor de la posición que se mostrará al usuario, en términos desde 1-longitudConjunto
#  bug           Entera            Participa cuando se entra en un bucle
#               +----MAIN----+
#   *NOMBRE*      *TIPO*             *FUNCIÓN*
#   vec      Entera tipo vector     Almacenará los elementos del conjuntos
#   j             Entera            Se utiliza en el contador externo para el ordenamiento de los elementos del conjunto
#   l             Entera            Se utiliza en el contador interno para el ordenamiento de los elementos del conjunto
#   i             Entera            Se utiliza en el contador para ingresar los elementos al vector del conjunto
#   lenght        Entera            Almacena el numero de elementos del conjunto
#   aux       Entera temporal       Hacer el ercambio de valores en el ordenamiento
#   num           Entera            Almacena el número a buscar en el conjunto
#   win       Entera de estado      Para controles de validación en éxitos, también se usa en la búsqueda
#   a          Entera temporal      Almacenar los elementos del conjunto cuando los ingresa el usuario
#   min           Entera            Almacena el límite inferior en el rango de busqueda en el vector
#   max           Entera            Almacena el límite superior en el rango de busqueda en el vector
