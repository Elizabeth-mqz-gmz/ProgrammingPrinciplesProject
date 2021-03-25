/*      Elizabeth Márquez Gómez
  Principios de Programación 2020-1
            Generación 17
  Licenciatura en Ciencias Genómicas
Universidad Nacional Autónoma de México */

//El siguiente programa recibe un número entre 0 y 999,999 y lo muestra al usuario en su forma escrita
#include <stdio.h>
/*ESTA FUNCIÓN SE ENCARGA DE PARTIR AL NÚMERO POR UNIDADES Y ALMACENARLO EN UN VECTOR PARA PODER UBICAR
FÁCILMENTE EL NÚMERO DE CADA UNIDAD*/
int implode(int lim, int vec[3], int uni, int num) {
  int i = 0;
  while(uni >= lim){
    vec[i] = num / uni; //DIVISIÓN PARA OBTENER EL NÚMERO DE LA UNIDAD
    num -= vec[i]*uni; //RESTA AL NÚMERO LA CANTIDAD ENTERA PARA IR ELIMINANDO LAS UNIDADES
    i++;
    uni /= 10; //SE DIVIDE ENTRE 10 PARA IR PARTIENDO A LAS UNIDADES MAYOR A MENOR
  }
  return num;
}
//ESTA FUNCIÓN SE ENCARGA DE ARMAR EL NOMBRE DEL NÚMERO SEGÚN LO QUE ENCUENTRE EN LOS VECTORES
int name(int vec[3], int mil, int a) {
  //CENTENAS
  switch (vec[0]) {
    case 0: break;
    case 1:
          if(vec[1] == 0 && vec[2] == 0)
            printf(" cien ");
          else
            printf(" ciento ");
          break;
    case 2:
          printf(" doscientos ");
          break;
    case 3:
          printf(" trescientos ");
          break;
    case 4:
          printf(" cuatrocientos ");
          break;
    case 5:
          printf(" quinientos ");
          break;
    case 6:
          printf(" seiscientos ");
          break;
    case 7:
          printf(" setecientos ");
          break;
    case 8:
          printf(" ochocientos ");
          break;
    case 9:
          printf(" novecientos ");
          break;
  }
  //DECENAS
  switch (vec[1]) {
    case 0: break;
    case 1:
          if(vec[2] >= 6)
            printf(" dieci");
          else if(vec[2] == 0)
            printf(" diez ");
          break;
    case 2:
          if(vec[2] == 0)
            printf(" veinte");
          else
            printf(" veinti");
          break;
    case 3:
          printf(" treinta");
          if(vec[2] > 0)
            printf(" y ");
          break;
    case 4:
          printf(" cuarenta");
          if(vec[2] > 0)
            printf(" y ");
          break;
    case 5:
          printf(" cincuenta");
          if(vec[2] > 0)
            printf(" y ");
          break;
    case 6:
          printf(" sesenta");
          if(vec[2] > 0)
            printf(" y ");
          break;
    case 7:
          printf(" setenta");
          if(vec[2] > 0)
            printf(" y ");
          break;
    case 8:
          printf(" ochenta");
          if(vec[2] > 0)
            printf(" y ");
          break;
    case 9:
          printf(" noventa");
          if(vec[2] > 0)
            printf(" y ");
          break;
  }
  //UNIDADES
  switch (vec[2]) {
    case 0:
          if(vec[0] == 0 && vec[1] == 0 && mil == 0 && a == 0) //EN CASO DE QUE NO EXISTAN LOS MILLARES
            printf("cero");
          break;
    case 1:
          if(vec[1] == 1)
            printf(" once ");
          else if(vec[0] == 0 && vec[1] == 0 && mil)//PARA QUE NO PONGA 0, Y PONGA MIL
            printf("");
          else if((vec[0] == 1 && vec[1] == 0 && mil) || (mil))//CASOS COMO VEINTIUN
            printf("un ");
          else
            printf("uno ");
          break;
    case 2:
          if(vec[1] == 1)
            printf("doce ");
          else
            printf("dos ");
          break;
    case 3:
          if(vec[1] == 1)
            printf(" trece ");
          else
            printf("tres ");
          break;
    case 4:
          if(vec[1] == 1)
            printf(" catorce ");
          else
            printf("cuatro ");
          break;
    case 5:
          if(vec[1] == 1)
            printf(" quince ");
          else
            printf("cinco ");
          break;
    case 6:
          printf("seis ");
          break;
    case 7:
          printf("siete ");
          break;
    case 8:
          printf("ocho ");
          break;
    case 9:
          printf("nueve ");
          break;
  }
  if((vec[0]>0 || vec[1]>0 || vec[2]>0) && mil){
    printf("mil ");
    a = 1; //MARCADOR DE QUE HUBO MILLARES
  }
  else
    printf("\n");
  return a; //DEVUELVE LA MARCA SI SE TRATA DE MILLARES
}

int main() {
  int num, vec0[3]={0}, vec1[3]={0}, active=0, win=0;
  //DESCRIPCIÓN DEL PROGRAMA
  printf("Este programa recibe un numero entre 0 hasta 999,999 y lo muestra en su forma escrita.\n");
  //RECEPCIÓN DEL NÚMERO POR EL USUARIO Y VALIDACIÓN
  while(!win){
    printf("Ingrese el numero: ");
    scanf("%d", &num);
    win = (num >= 0 && num <= 999999) ? 1:0;
    if(!win)
      printf("El numero ingresado no entra en el rango de numeros aceptados entre 0-999999.\nIngreselo de nuevo\n");
  }
  /*LLAMAR A LA FUNCIÓN "implode" PARA OBTENER LOS NÚMEROS DE CADA UNIDAD EN LOS DOS VECTORES, MILLARES Y CENTENAS*/
  implode(1, vec1, 100, implode(1000, vec0, 100000, num));
  //LLAMAR A LA FUNCIÓN "nombra" PARA EL VECTOR DE MILLARES (vec0 000,xxx), AQUÍ SE OBTIENE LA SEÑAL SI HAY O NO MILLARES
  active = name(vec0, 1, 0);
  //LLAMAR A LA FUNCIÓN "nombra" PARA EL VECTOR DE CENTENAS (vec1 xxx,000)
  name(vec1, 0, active);

  return 0;
}
/*    ------DICCIONARIO DE VARIABLES------
          +----Función implode----+
  *NOMBRE*      *TIPO*      *FUNCIÓN*
  i           Entera        Indica los indices del vector
  lim         Entera        Límite hasta donde se divide uni, según la mitad de unidades (unidades o unidades de millar)
  vec         Entera        Almacenará al número
  uni         Entera        La unidad por la que va a empezar superior (centenas o centenas de millar)
  num         Entera        Número con el que va a trabajar
            +----Función name----+
  *NOMBRE*    *TIPO*      *FUNCIÓN*
  vec         Entera      Vector con el que va a trabajar
  mil         Entera      Si se trata del vector de millares, recibe una señal
  a           Entera      Indica que hubo valores en los millares, y ya no es posible escribir "cero"
                +----MAIN----+
  *NOMBRE*      *TIPO*          *FUNCIÓN*
  num           Entera          Almacena el número del usuario
  vec0     Entera tipo vector   Almacena los números de la parte de los millares
  vec1     Entera tipo vector   Almacena los números de la parte de las centeras
  active   Entera de estado     Indica si existen millares para el 2do vector
  win      Entera de estado     Sirve para controlar las validaciones en éxito del valor dado por el usuario
*/
