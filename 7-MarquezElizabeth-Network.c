/*      Elizabeth Márquez Gómez
  Principios de Programación 2020-1
            Generación 17
  Licenciatura en Ciencias Genómicas
Universidad Nacional Autónoma de México */

/*El siguiente programa trabaja con redes no dirigidas, recibe una lista de nodos con sus respectivas conexiones, genera una matriz
que muestra las relaciones, calcula el grado y coeficiente de clustering de cada nodo. La red tiene un límite entre 2-100 nodos*/

#include <stdio.h>
/*ESTA FUNCIÓN CALCULA EL FACTORIAL DE UN NÚMERO*/
int factorial(int a){
  int x, fac=1;
  for (x = 1; x <= a; x++)
    fac *= x;
  return fac;
}
/*ESTA FUNCIÓN CALCULA EL COEFICIENTE DE CLUSTERING DE UN NODO, RECIBE COMO PARÁMETROS EL NÚMERO DE NODOS, EL NODO A CALCULAR Y LA
MATRIZ QUE ALMACENA LAS RELACIONES DE LA RED*/
float cluster(int num, int nodo, int mat[][10]){
  int x=0, i, j, vec[10], real=0, numCom=0;
  float cluster;
  //ESTE CONTADOR GENERA UN VECTOR CON LOS VECINOS DE UN NODO.
  for(i = 0; i < num; i++)
    if(mat[nodo][i]){
      vec[x] = i;
      x++;
    }
  //AQUÍ SE GENERA UNA COMBINATORIA PARA OBTENER TODAS LAS POSIBLES CONEXIONES ENTRE LOS VECINOS DE UN NODO
  numCom = factorial(x) / (factorial(2)*factorial((x)-2));
  //AQUÍ SE REVISA LA MATRIZ DE LAS CONEXIONES DE LA RED, Y SE OBTIENEN LAS CONEXIONES REALES ENTRE LOS VECINOS DE UN NODO
  for(i = 0; i < x; i++)
    for(j = i+1; j < x; j++)
      if(mat[vec[i]][vec[j]])
        real++;
  //AQUÍ SE CALCULA EL COEFICIENTE, DIVIDIENDO LAS CONEXIONES REALES ENTRE LAS POSIBLES CONEXIONES DE LOS VECINOS DE UN NODO
  cluster = (float)real/(float)numCom;
  //EN CASO DE QUE SEA UN RESULTADO NAN, COMO 0/0, SE ASIGNA UN COEFICIENTE DE 0
  cluster = ((float)real == 0 && (float)numCom == 0) ? 0:cluster;
  return cluster;
}
int main() {
  int num = 0, i, j, x, state, mat[10][10]={0}, sum=0, win=0;
  //DESCRIPCIÓN DEL PROGRAMA
  printf("Este programa realiza el analisis de una red no dirigida. Recibe los nodos de una red y las conexiones entre ellos, y genera:\n\t-Una matriz de relaciones entre nodos\n\t-Grado de cada nodo\n\t-Coeficiente de clustering de cada nodo");
  //RECEPCIÓN Y VALIDACIÓN DE LOS NODOS
  while (!win) {
    printf("\nIngresa la cantidad de nodos en la red: ");
    scanf("%d", &num);
    win = (num >= 2 && num <= 10) ? 1:0;
    if(!win)
      printf("\nEl numero ingresado no esta en el rango aceptado para el numero de nodos, entre 2-10.\nIngreselo de nuevo.");
  }
  printf("A continuacion ingresa 1 si hay una conexion entre los nodos, o 0 en caso de que no exista conexion:\n");
  for (i = 0; i < num; i++)
    for (j = i+1; j < num; j++)
      if(!mat[i][j]){
        printf("\t\n¿El nodo N%d tiene conexion con el nodo N%d? ", i, j);
        fflush(stdin);
        scanf("%d", &state);
        if(state == 0 || state == 1){
          mat[i][j] = state;
          //AQUI SE CREA LA MATRIZ ESPEJO
          mat[j][i] = (state) ? 1 : 0;
        }
        else{
          printf("El estado que ingreso no es valido, introduzca de nuevo el estado de conexion.\nEscriba 1 si hay conexion o 0 si no hay conexion entre los nodos.");
          j-=1;
        }
      }
  //MOSTRAR MATRIZ DE CONEXIONES
  printf("  ");
  //MUESTRA LA FILA SUPERIOR, QUE CORRESPONDE A LOS IDENTIFICADORES DE LOS NODOS
  for (i = 0; i < num; i++)
    printf(" N%d ", i);
  printf("\n");
  //MUESTRA LA PRIMERA COLUMNA, QUE CORRESPONDE A LOS IDENTIFICADORES DE LOS NODOS
  for (i = 0; i < num; i++) {
    printf("N%d ", i);
    for (x = 0; x < num; x++) {
      //MUESTRA LAS CONEXIONES ENTRE LOS NODOS
      printf(" %d  ", mat[i][x]);
      if(x == num-1)
        printf("\n");
    }
  }
  //GRADO DE NODO, SE OBTIENE SUMANDO LOS 1 EXISTENTES EN UNA FILA, CADA FILA CORRESPONDE A UN NODO
  for (i = 0; i < num; i++) {
    for (j = 0; j < num; j++)
      sum += mat[i][j];
    printf("El grado del nodo N%d es: %d\n", i, sum);
    sum = 0;
  }
  //COEFICIENTE DE CLUSTERING, SE LLAMA A LA FUNCIÓN CLUSTER QUE DEVUELVE EL COEFICIENTE DE CLUSTERING DE CADA NODO
  for(i = 0; i < num; i++)
    printf("El coeficiente de clustering del nodo N%d es: %0.2f\n", i, cluster(num, i, mat));

  return 0;
}

/*    ------DICCIONARIO DE VARIABLES------
          +----Función factorial----+
  *NOMBRE*      *TIPO*      *FUNCIÓN*
  x           Entera        En el contador genera el cálculo del factorial
  fac         Entera        Almacena el valor del factorial y es el valor que retorna la función
           +----Función cluster----+
  *NOMBRE*    *TIPO*          *FUNCIÓN*
  x           Entera          Almacena el número de vecinos de un nodo
  i      Entera contadora     Se utiliza en el contador para obtener a los vecinos de un nodo y en el contador externo donde se obtienen
                              las conexiones reales entre los vecinos de un nodo
  j      Entera contadora     Se utiliza en el contador interno donde se obtienen las conexiones reales entre los vecinos de un nodo
  vec    Entera tipo vector   Almacena a los vecinos de un nodo
  real        Entera          Almacena el número de conexiones existentes entre los vecinos de un nodo
  numCom      Entera          Almacena el valor de la combinatoria que corresponde a las posibles conexiones entre los vecinos de un nodo
  cluster    Flotante         Almacena el valor del coeficiente de clustering de un nodo, es el valor que retorna la función
                +----MAIN----+
  *NOMBRE*      *TIPO*          *FUNCIÓN*
  num           Entera          Almacena el número de nodos en la red
  i        Entera contadora     Se utiliza en los contadores de:
                                  -insertar las conexiones en la matriz de relación
                                  -mostrar la matriz de conexiones al usuario
                                  -obtener los grados de cada nodo
                                  -obtener los coeficientes de clustering de cada nodo
  j        Entera contadora     Se utiliza en los contadores de:
                                  -insertar las conexiones en la matriz de relación
                                  -obtener los grados de cada nodo
  x        Entera contadora     Se utiliza en el contador para mostrar las conexiones en la matriz de relación
  state    Entera de estado     Saber el estado de conexión entre los nodos
  win      Entera de estado     Sirve para controlar las validaciones en éxito de los nodos dados por el usuario
  mat     Entera tipo matriz    Almacena las conexiones entre los nodos
  sum           Entera          Almacena la suma de conexiones de un nodo, la cuál representa el grado del nodo
*/
