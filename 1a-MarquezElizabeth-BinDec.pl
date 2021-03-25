#       Elizabeth Márquez Gómez
#   Principios de Programación 2020-1
#             Generación 17
#   Licenciatura en Ciencias Genómicas
# Universidad Nacional Autónoma de México

# El siguiente programa recibe un numero binario y lo muestra al usuario en decimal, sólo se trabaja con números enteros positivos
#MAIN
  my @vec;
  my $x=0;
  my $i;
  my $dec=0;
  my $aux=0;
  # DESCRIPCIÓN DEL PROGRAMA
  print "Este programa recibe un numero en representacion binaria y lo muestra en su representacion decimal.\nSolo es posible ingresar representaciones de numeros enteros positivos.\n";
  #RECEPCIÓN DE LOS DATOS DEL USUARIO
  printf "Ingrese el numero binario comenzando por la cifra mas significativa, pulse la tecla enter despues de cada bit.\nRecuerde que un numero binario se representa con 0 y 1.\n";
  while ($x < 16) {
    $aux = <STDIN>;
    if($aux == 1 || $aux == 0){
      $vec[15-$x] = $aux;
      $x++;
    }
    else{
      printf("El numero ingresado no permite hacer una representacion correcta. Solo es posible ingresar 1 o 0.\nIntente nuevamente.\n");
    }
  }
  #ALMACENAR EL NÚMERO DECIMAL
  for ($i = 0; $i < 16; $i++){
    if($vec[15-$i] == 1){
      $dec |= $vec[15-$i] << (15-$i);
    }
  }
  #MOSTRAR EL NÚMERO AL USUARIO
  printf "El número en decimal es: $dec\n";

#  ------DICCIONARIO DE VARIABLES------
  #             +----MAIN----+
  # *NOMBRE*      *TIPO*             *FUNCIÓN*
  # vec      Entera tipo vector     Almacenará la representación binaria del número
  # x             Entera            Almacena el binario del usuario en un vector
  # i             Entera            Se utiliza en el contador para recorrer el vector
  # dec           Entera            Almacena el decimal obtenido del binario dado por el usuario
  # aux           Entera            Almacena el valor del bit dado por el usuario
#
