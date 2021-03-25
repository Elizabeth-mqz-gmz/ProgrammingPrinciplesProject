#       Elizabeth Márquez Gómez
#   Principios de Programación 2020-1
#             Generación 17
#   Licenciatura en Ciencias Genómicas
# Universidad Nacional Autónoma de México

# El siguiente programa recibe dos conjuntos entre 0 y 20 elementos numericos enteros positivos con un rango de 0-10
# Al tener ambos conjuntos, obtiene la Unión, Intersección, y las Diferencias simétrica y asimetrica entre ambos.
# Este algoritmo utiliza operadores sobre bits, así obtiene las posiciones en donde hay una presencia en 1.
# Se utilizan operadores sobre bits

# FUNCIÓN PARA RECIBIR LA LONGITUD DE LOS CONJUNTOS Y SUS ELEMENTOS, VALIDARLA Y DEVOLVER
# EL NÚMERO QUE REPRESENTA LOS ELEMENTOS PRESENTES EN EL CONJUNTO
sub takeIn {
  my ($conj) = @_;
  my $win=0;
  my $lenght=0;
  my $c=0;
  my $a=0;
  my $i=0;
  while(!$win){
    print"Ingrese el numero de elementos del conjunto $conj: \nEl cantidad puede ir desde 0 hasta 20 elementos.\n";
    $lenght = <STDIN>;
    if($lenght >= 0 && $lenght <= 20){
      $win = 1;
    }
    else{
      print"El numero de elementos del conjunto no entra en el rango establecido de 0-20 elementos. Ingreselo de nuevo.\n";
    }
  }
  if($lenght > 0){
    print"\nIngrese los elementos del conjunto $conj:\nEl rango establecido para los elementos es entre 0 y 9\n";
    for ($i = 0; $i < $lenght; $i++) {
      print"\t";
      $a = <STDIN>;
      if($a >= 0 && $a < 10){
        $c |= 1<<$a;
      }
      else{
        print"El numero no esta en el rango establecido para elementos entre 0-9. Ingreselo de nuevo.\n";
        $i-=1;
      }
    }
  }
  return $c;
}
#FUNCIÓN PARA RECORRER LOS BITS DEL NÚMERO DECIMAL QUE REPRESENTA LOS ELEMENTOS DE LAS INTERACCIONES EN LOS CONJUNTOS
sub conjunct {
  my ($action) = @_;
  my $j;
  print"{";
  #AQUÍ SE APLICA UN & PARA OBTENER LOS 1 QUE CORRESPONDEN A LOS ELEMENTOS SEGÚN LA INTERACCIÓN
  for ($j = 0; $j < 10; $j++){
    if($action & 1<<$j){
      print" $j,";
    }
  }
  print"}";
}
  #MAIN
  my $c1=0;
  my $c2=0;
  #DESCRIPCIÓN DEL PROGRAMA
  print"Este programa recibe dos conjuntos de elementos y muestra las relaciones entre ellos:\n\tUnion\n\tInterseccion\n\tDiferencia simetrica\n\tDiferencia asimetrica\n";
  #LLAMAR A LAS FUNCIONES PARA RECIBIR LOS ELEMENTOS DE LOS CONJUNTOS, SE OBTIENE EL NÚMERO DECIMAL QUE REPRESENTA LOS ELEMENTOS
  $c1 = takeIn(1);
  $c2 = takeIn(2);
  #UNIÓN
  print"La union de los conjuntos es: ";
  conjunct($c1|$c2);
  #INTERSECCIÓN
  print"\nLa interseccion de los conjuntos es: ";
  conjunct($c1&$c2);
  #DIFERENCIA SIMÉTRICA
  print"\nLa diferencia simetrica de los conjuntos es: ";
  conjunct($c1^$c2);
  #DIFERENCIAS ASIMÉTRICAS
  print"\nLa diferencia asimetrica del conjunto 1 con el conjunto 2 es: ";
  conjunct($c1^($c1&$c2));
  print"\nLa diferencia asimetrica del conjunto 2 con el conjunto 1 es: ";
  conjunct($c2^($c1&$c2));
  print"\n";

  # ------DICCIONARIO DE VARIABLES------
  #       +----Función takeIn----+
  # *NOMBRE*      *TIPO*          *FUNCIÓN*
  # win       Entera de estado    Controles de validación en éxitos
  # lenght        Entera          Almacena el número de elementos de los conjuntos
  # c             Entera          Indica el número de conjunto
  # a             Entera          Almacena el elemento que será introducido al conjunto
  # i             Entera          Se usa en el contador para obtener el número en decimal que representará un conjunto
  # conj          Entera          Se recibe como parámetro de entrada, indica el número del conjunto
  #       +----Función conjunct----+
  # *NOMBRE*    *TIPO*      *FUNCIÓN*
  # j           Entera      Se usa en el contador que recorre los bits del decimal que representa la interacción de los conjuntos
  # action      Entera      Indica que interacción realizar entre los conjuntos
  #             +----MAIN----+
  # *NOMBRE*    *TIPO*      *FUNCIÓN*
  # c1          Entera      Almacena el número decimal que representa el conjunto 1
  # c2          Entera      Almacena el número decimal que representa el conjunto 2
