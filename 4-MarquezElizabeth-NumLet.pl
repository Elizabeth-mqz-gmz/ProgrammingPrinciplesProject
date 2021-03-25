#       Elizabeth Márquez Gómez
#   Principios de Programación 2020-1
#             Generación 17
#   Licenciatura en Ciencias Genómicas
# Universidad Nacional Autónoma de México

#El siguiente programa recibe un número entre 0 y 999,999 y lo muestra al usuario en su forma escrita

# ESTA FUNCIÓN SE ENCARGA DE PARTIR AL NÚMERO POR UNIDADES Y ALMACENARLO EN UN VECTOR PARA PODER UBICAR
# FÁCILMENTE EL NÚMERO DE CADA UNIDAD
sub implode {
  my ($lim, $uni, $num) = @_;
  my $i = 0;
  while($uni >= $lim){
    $vec[$i] = int($num / $uni); #DIVISIÓN PARA OBTENER EL NÚMERO DE LA UNIDAD
    $num -= $vec[$i]*$uni; #RESTA AL NÚMERO LA CANTIDAD ENTERA PARA IR ELIMINANDO LAS UNIDADES
    $i++;
    $uni /= 10; #SE DIVIDE ENTRE 10 PARA IR PARTIENDO A LAS UNIDADES MAYOR A MENOR
  }
  return $num, \@vec;
}
#ESTA FUNCIÓN SE ENCARGA DE ARMAR EL NOMBRE DEL NÚMERO SEGÚN LO QUE ENCUENTRE EN LOS VECTORES
sub name {
  my ($vecRef, $mil, $a) = @_;
  my @vec = @{$vecRef};
  #CENTENAS
    if($vec[0] == 1){
          if($vec[1] == 0 && $vec[2] == 0){
            print" cien ";}
          else{
            print" ciento ";}}
    if($vec[0] == 2){
          print" doscientos ";}
    if($vec[0] == 3){
          print" trescientos ";}
    if($vec[0] == 4){
          print" cuatrocientos ";}
    if($vec[0] == 5){
          print" quinientos ";}
    if($vec[0] == 6){
          print" seiscientos ";}
    if($vec[0] == 7){
          print" setecientos ";}
    if($vec[0] == 8){
          print" ochocientos ";}
    if($vec[0] == 9){
          print" novecientos ";}
  #DECENAS
    if($vec[1] == 1){
          if($vec[2] >= 6){
            print" dieci";}
          elsif($vec[2] == 0){
            print" diez ";}}
    if($vec[1] == 2){
          if($vec[2] == 0){
            print" veinte";}
          else{
            print" veinti";}}
    if($vec[1] == 3){
          print" treinta";
          if($vec[2] > 0){
            print" y ";}}
    if($vec[1] == 4){
          print" cuarenta";
          if($vec[2] > 0){
            print" y ";}}
    if($vec[1] == 5){
          print" cincuenta";
          if($vec[2] > 0){
            print" y ";}}
    if($vec[1] == 6){
          print" sesenta";
          if($vec[2] > 0){
            print" y ";}}
    if($vec[1] == 7){
          print" setenta";
          if($vec[2] > 0){
            print" y ";}}
    if($vec[1] == 8){
          print" ochenta";
          if($vec[2] > 0){
            print" y ";}}
    if($vec[1] == 9){
          print" noventa";
          if($vec[2] > 0){
            print" y ";}}
  #UNIDADES
    if($vec[2] == 0){
          if($vec[0] == 0 && $vec[1] == 0 && $mil == 0 && $a == 0){ #EN CASO DE QUE NO EXISTAN LOS MILLARES
            print"cero";}}
    if($vec[2] == 1){
          if($vec[1] == 1){
            print" once ";}
          elsif($vec[0] == 0 && $vec[1] == 0 && $mil){#PARA QUE NO PONGA 0, Y PONGA MIL
            print"";}
          elsif(($vec[0] == 1 && $vec[1] == 0 && $mil) || ($mil)){#CASOS COMO VEINTIUN
            print"un ";}
          else{
            print"uno ";}}
    if($vec[2] == 2){
          if($vec[1] == 1){
            print"doce ";}
          else{
            print"dos ";}}
    if($vec[2] == 3){
          if($vec[1] == 1){
            print" trece ";}
          else{
            print"tres ";}}
    if($vec[2] == 4){
          if($vec[1] == 1){
            print" catorce ";}
          else{
            print"cuatro ";}}
    if($vec[2] == 5){
          if($vec[1] == 1){
            print" quince ";}
          else{
            print"cinco ";}}
    if($vec[2] == 6){
          print"seis ";}
    if($vec[2] == 7){
          print"siete ";}
    if($vec[2] == 8){
          print"ocho ";}
    if($vec[2] == 9){
          print"nueve ";}
  if(($vec[0]>0 || $vec[1]>0 || $vec[2]>0) && $mil){
    print"mil ";
    $a = 1; #MARCADOR DE QUE HUBO MILLARES
  }
  else{
    print"\n";}
  return $a; #DEVUELVE LA MARCA SI SE TRATA DE MILLARES
}
#MAIN
  my $num;
  my @vec0=(0,0,0);
  my @vec1=(0,0,0);
  my $active=0;
  my $win=0;
  #DESCRIPCIÓN DEL PROGRAMA
  print"Este programa recibe un numero entre 0 hasta 999,999 y lo muestra en su forma escrita.\n";
  #RECEPCIÓN DEL NÚMERO POR EL USUARIO Y VALIDACIÓN
  while(!$win){
    print"Ingrese el numero: ";
    $num = <STDIN>;
    $win = ($num >= 0 && $num <= 999999) ? 1:0;
    if(!$win){
      print"El numero ingresado no entra en el rango de numeros aceptados entre 0-999999.\nIngreselo de nuevo\n";
    }
  }
  #LLAMAR A LA FUNCIÓN "implode" PARA OBTENER LOS NÚMEROS DE CADA UNIDAD EN LOS DOS VECTORES, MILLARES Y CENTENAS
  @res=implode(1000, 100000, $num);
  @vec0=@{$res[1]};
  @res2=implode(1, 100, $res[0]);
  @vec1=@{$res2[1]};
  #LLAMAR A LA FUNCIÓN "nombra" PARA EL VECTOR DE MILLARES (vec0 000,xxx), AQUÍ SE OBTIENE LA SEÑAL SI HAY O NO MILLARES
  $active = name(\@vec0, 1, 0);
  #LLAMAR A LA FUNCIÓN "nombra" PARA EL VECTOR DE CENTENAS (vec1 xxx,000)
  name(\@vec1, 0, $active);

  #   ------DICCIONARIO DE VARIABLES------
  #         +----Función implode----+
  # *NOMBRE*      *TIPO*      *FUNCIÓN*
  # i           Entera        Indica los indices del vector
  # lim         Entera        Límite hasta donde se divide uni, según la mitad de unidades (unidades o unidades de millar)
  # vec         Entera        Almacenará al número
  # uni         Entera        La unidad por la que va a empezar superior (centenas o centenas de millar)
  # num         Entera        Número con el que va a trabajar
  #           +----Función name----+
  # *NOMBRE*    *TIPO*      *FUNCIÓN*
  # vec         Entera      Vector con el que va a trabajar
  # mil         Entera      Si se trata del vector de millares, recibe una señal
  # a           Entera      Indica que hubo valores en los millares, y ya no es posible escribir "cero"
  #               +----MAIN----+
  # *NOMBRE*      *TIPO*          *FUNCIÓN*
  # num           Entera          Almacena el número del usuario
  # vec0     Entera tipo vector   Almacena los números de la parte de los millares
  # vec1     Entera tipo vector   Almacena los números de la parte de las centeras
  # active   Entera de estado     Indica si existen millares para el 2do vector
  # win      Entera de estado     Sirve para controlar las validaciones en éxito del valor dado por el usuario
