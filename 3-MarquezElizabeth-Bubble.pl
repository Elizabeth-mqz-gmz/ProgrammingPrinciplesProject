#        Elizabeth Márquez Gómez
#   Principios de Programación 2020-1
#             Generación 17
#   Licenciatura en Ciencias Genómicas
# Universidad Nacional Autónoma de México

#Este programa recibe un conjunto de numeros entre 1-10,000 elementos, en un rango de -20,000-20,000. Y los ordena por Bubble sort.
#MAIN
  my @vec;
  my $lenght=0;
  my $aux=0;
  my $num=0;
  my $i;
  my $j;
  my $l;
  my $fail;
  my $win=0;
  #DESCRIPCIÓN DEL PROGRAMA
  print"Este programa recibe un conjunto de numeros enteros con signo y se encarga de ordenarlos de menor a mayor.\n";
  #RECEPCIÓN DE LOS DATOS DEL CONJUNTO POR EL USUARIO
  while (!$win){
    $fail = 0;
    print"Ingrese la cantidad de numeros enteros que desea ordenar, el conjunto puede contener entre 1 y 10,000 elementos.\n";
    $lenght = <STDIN>;
    #VALIDAR QUE EL NÚMERO DE ELEMENTOS DEL CONJUNTO NO SEA MAYOR AL LÍMITE SUPERIOR
    if($lenght > 10000){
      print"El numero de elementos es superior al limite establecido.\n Ingrese nuevamente el numero de elementos a ordenar.\n";
      $fail = 1;
    }
    #VALIDAR QUE EL NÚMERO DE ELEMENTOS DEL CONJUNTO NO SEA MENOR AL LÍMITE INFERIOR
    if ($lenght < 1) {
      print"El numero de elementos es inferior al limite establecido.\n Ingrese nuevamente el numero de elementos a ordenar.\n";
      $fail = 1;
    }
    $win = (!$fail) ? 1:0;
  }

  print"Ingrese los elementos del conjunto a ordenar, recuerde que los numeros deben estar en un rango entre -20,000 y 20,000.\n";
  #ESTE CONTADOR SE UTILIZA PARA INSERTAR LOS ELEMENTOS AL VECTOR DEL CONJUNTO
  for ($i = 0; $i < $lenght; $i++) {
    $num =  <STDIN>;
    #VALIDAR QUE EL NUMERO ENTRE EN EL RANGO
    if ($num > 20000 || $num < -20000) {
      print"El numero no entra en el rango establecido entre -20,000 y 20,000. Ingrese un numero dentro del rango.\n";
      $i-=1;
    }
    else{
      $vec[$i] = $num; #SI ES CORRECTO, LO INGRESA AL VECTOR
    }
  }
  #ORDENAMIENTO BURBUJA
  for ($j = 1; $j < $lenght; $j++){
    for ($l = 1; $l <= $lenght-$j; $l++){
      if ($vec[$l-1] > $vec[$l]) {
        $aux = $vec[$l-1];
        $vec[$l-1] = $vec[$l];
        $vec[$l] = $aux;
      }
    }
  }
  #MOSTRAR CONJUNTO ORDENADO AL USUARIO
  print"El conjunto ordenado es:\n";
  for ($i = 0; $i < $lenght; $i++){
    print"  $vec[$i]";
  }
  print"\n";


  #    ------DICCIONARIO DE VARIABLES------
  #             +----MAIN----+
  # *NOMBRE*      *TIPO*             *FUNCIÓN*
  # vec      Entera tipo vector     Almacenará hasta 10,000 números enteros
  # lenght       Entera             Almacena el tamaño del vector para el conjunto
  # aux      Entera temporal        Hacer el intercambio de valores en el ordenamiento
  # num          Entera             Recibe el elemento del usuario para agregarlo al conjunto
  # i            Entera             Se usa en el contador para insertar los elementos al vector y en el contador para mostar los elementos
  #                                 del conjunto ya ordenado
  # j            Entera             Se utiliza en el contador externo para el ordenamiento
  # l            Entera             Se utiliza en el contador interno para el ordenamiento
  # fail     Entera de estado       Revisa si hay alguna falla en las validaciones
  # win      Entera de estado       Controla el exito en las validaciones
