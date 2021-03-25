#      Elizabeth Márquez Gómez
#   Principios de Programación 2020-1
#             Generación 17
#   Licenciatura en Ciencias Genómicas
# Universidad Nacional Autónoma de México */

#El siguiente programa recibe un número decimal y lo muestra en binario al usuario (utilizando operadores sobre bits)
#MAIN
  my @vec;
  my $dec=0;
  my $bin=0;
  my $i=0;
  my $win=0;
  #DESCRIPCIÓN DEL PROGRAMA
  print"Este programa recibe un numero en representacion decimal y lo muestra en su representacion binaria.\n";
  #RECEPCIÓN DE DATOS DEL USUARIO, VALIDAR QUE QUEPAN EN 2 BYTES
  while(!$win){
    print"Ingrese el numero en decimal: ";
    $dec = <STDIN>;
    if($dec <= 65535 && $dec >= -65535){
      $win = 1;
    }
    else{
      print"El numero ingresado no puede ser representado en 2 bytes\n";
    }
  }
  #ESTE CONTADOR REVISA EL VECTOR DESDE EL LSB HASTA EL MSB, HACE UN &
  #CON CORRIMIENTOS DE 1 PARA ENCONTRAR LAS POSICIONES REALES DEL NÚMERO EN BINARIO
  for ($i = 0; $i <= 15; $i++) {
    $bin = $dec&(1 << $i);
    $vec[15-$i] = ($bin<2) ? $bin : ($bin>>$i);
  }
  #MOSTRAR EL NUMERO EN BINARIO AL USUARIO
  print"\nEl numero en binario es: ";
  for ($i = 0; $i < 16; $i++){
    print"$vec[$i]";
  }
  print"\n";


#  ------DICCIONARIO DE VARIABLES------
#               +----MAIN----+
#   *NOMBRE*      *TIPO*             *FUNCIÓN*
#   vec      Entera tipo vector     Almacenará la representación binaria del número
#   i             Entera            Se utiliza en los contadores de corrimientos y el que muestra el binario al usuario
#   bin           Entera            Se encarga de almacenar el 1 o 0 para la representación en binario
#   dec           Entera            Almacena el decimal dado por el usuario
