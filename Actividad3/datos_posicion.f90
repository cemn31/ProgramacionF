program projectile
  implicit none

  ! definimos constantes
  real, parameter :: g = 9.8
  real, parameter :: pi = 3.1415927
  

  ! definimos las variables
  real :: a, tv, v 
  real, dimension(20):: t=0.,x=0., y=0.
  integer::i,j,nps

  ! Leer valores para el ángulo a, y la velocidad inicial u desde la terminal
  
  write(*,*) 'MOVIMIENTO PARABÓLICO'
  write(*,*) 'DATOS DESPLAZAMIENTO VERTICAL Y HORIZONTAL'
  write(*,*) 'Introduzca los valores de  la velocidad inicial (v) en m&
       &/s y el número de datos'
  read(*,*) v,nps

   
  
  !Definimoos el Loop
  loopangulo:do j=15,90,15
     ! convirtiendo ángulo a radianes
     a = j * pi / 180.0
     ! las ecuación para el cálculo del tiempo de vuelo

     tv=2*v*sin(a)/g
  loopposicion: do i=0,nps
     t(i)=t(i)+i*(tv/real(nps))
     x(i)=x(i)+v*t(i)*cos(a)
     y(i)=y(i)+(2*v*t(i)*sin(a)-g*t(i)**2)/2
     ! output data to a file
     open(1, file='datostrayectoria.dat', status='unknown')
     write(1,1000) x(i), y(i)
     1000 format(f15.10,5x,f15.10)
  end do loopposicion
  write(1,1100)
  1100 format(/)
 
  do i=0,nps
     t(i)=0
     x(i)=0
     y(i)=0
     end do
  end do loopangulo
   close(1)

end program projectile
