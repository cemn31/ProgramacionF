program mcircular
!::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  !Aplicación Fortran para calcular la trayectoria y posiciones notables de la tierra
  !al rededor del sol
  !r------------radio medio de la tierra al sol
  !x------------Abcisa (coordenadas cartesianas)
  !y------------Ordenada (Coordenadas cartesianas)
  !f_x----------Función calculo de x
  !f_y----------Funición cálculo de y
  !a------------ángulo
!::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  implicit none
  integer::i,j
  double precision, parameter::r=1.496d8, pi=3.141592d0
  double precision::a,f_x,f_y
  double precision,dimension(0:360)::x,y

  !Creando documento para almacenar datos
  open (1,file="tr_tierra.txt",status="unknown")
  !loop para el cálculo de la trayectoria
  do i=0,360
     !angulo en grados
     a=dble(i)
     a=a*pi/180.0d0
     !llamando funciones
     x(i)=f_x(a)
     y(i)=f_y(a)
     write (1,*) x(i),y(i), a
  end do
  close(1)
!:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 !Creando segundo documento para las posiciones notables
 open (2,file="pst_tierra.txt",status="unknown")
 !loop para las posiciones notables 
  do j=0,360,30
     !angulo en grados
     a=dble(j)
     a=a*pi/180.0d0
     !llamando funciones
     x(j)=f_x(a)
     y(j)=f_y(a)
     write (2,*) x(j),y(j), a
  end do
  close(2)
end program mcircular 
!::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

!Función para el cálculo de la abcisa (x)
function f_x(a)
implicit none
 !Función de conversión de coordenadas polares a cartesianas
  double precision, parameter::r=1.496d8
  double precision::f_x
  double precision, intent(in)::a
  f_x=r*dcos(a)
end function f_x
!:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

!Función para el cálculo de la ordenada (y)
function f_y(a)
implicit none  
  !Función de conversión de coordenadas polares a cartesianas
  double precision, parameter::r=1.496d8
  double precision::f_y
  double precision, intent(in)::a
  f_y=r*dsin(a)
  end function f_y
