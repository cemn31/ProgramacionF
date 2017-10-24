program Resistencia

   !**************************************************************************************************
   !  Programa para calcular la trayectoria de un proyectil esférico con resistencia del aire        *
   !                                                                                                 *
   !     m -------------- masa del proyectil                                                         *
   !     r -------------- radio del proyectil                                                        *
   !     v0 ------------- velocidad de lanzamiento                                                   *
   !     vt-------------- velocidad terminal                                                         *
   !                                                                                                 *
   ! *************************************************************************************************
  use parametros  
  implicit none
  real :: vt,v0,m,r

  ! Leer valores para la velocidad inicial desde la terminal
  
  write(*,*) 'MOVIMIENTO PARABÓLICO CON RESISTENCIA DEL AIRE DE UN PROYECTIL ESFÉRICO DE HIERRO'
  write(*,*) 'TRAYECTORIA EN FUNCIÓN DEL ÁNGULO'
  write(*,*) 'Introduzca los valores de  la velocidad inicial (v) en m/s'
  read(*,*)   v0
  write(*,*) 'Introduzca la masa del proyectil en kgs'
  read(*,*)   m
  write(*,*) 'Introduzca el radio del proyectil en mts'
  read(*,*)   r
  call v_terminal(vt)
  call friccion(a,vt,v0,x,y,t,f_x,f_y)
  
end program Resistencia
*****************************************************************************************************
*****************************************************************************************************
 module parametros 
   implicit none
   !**************************************************************************************************
   !                                                                                                 *
   ! Modulo para calcular la velocidad terminal  de un proyectil esférico con resistencia del aire   *  
   !                                                                                                 *
   !     h -------------- incremento del tiempo                                                      *
   !     rho_a ----------Densidad del aire kg/m**3                                                   *
   !     size -----------Tamaño del array                                                            *
   !     g --------------Aceleración gravitacional                                                   *
   !     C --------------Constante de arrastre                                                       *
   ! *************************************************************************************************

  !definimos parametros y variables 
  real, parameter :: g = 9.8, pi = 3.1415927, rho_a=1.128, C=0.45, h=0.01
  integer:: size = 100
    
  end module parametros
*******************************************************************************************************
*******************************************************************************************************  
  subroutine v_terminal(vt)
  use parametros 
  implicit none 
  real, intent(in)::m,r
  real, intent(out):: vt
  !Calculo de la velocidad terminal
  
  vt= sqrt((2*m*g)/(rho_a*pi*r**2*C))

  end subroutine 
********************************************************************************************************
********************************************************************************************************
  subroutine friccion(a,vt,v0,x,y,t,f_x,f_y)
   !**************************************************************************************************
   !     v0--------------Velocidad inicial del proyectil                                             *
   !     vt -------------Velocidad terminal del proyectil vt = (d**2 *g)*( rho_p-rho_a)/18*mu        *
   !     a -------------- Angulo del proyectil                                                       *
   !     h --------------Incremento del tiempo                                                       *
   !     x_t y y_t ------Desplazamientos horizontal y vertical                                       *
   !     f_x y  f_y------Velocidades horizontales y verticales f_x = dx(t)/dt y f_y =dy(t)           *
   !**************************************************************************************************
  use parametros 
  implicit none
  real, intent(in) :: v0
  real :: a,vt
  real, dimension(size):: t, f_x, f_y, x, y
  integer::i,j

  !Definimoos el Loop angulo
   do j = 0,90,15

  ! convirtiendo ángulo a radianes
     a = j * pi / 180.0
  
    
  !Definimos loop posicion 
   do i = 0,size
     f_x(0) =v0*cos(a)
     f_y(0) =v0*sin(a)
     x(0)=0.
     y(0)=0.
     t(0)=0.   

     t(i+1)=t(i)+h
     x(i+1)=x(i)+h*f_x(i)
     y(i+1)=y(i)+h*f_y(i)

     f_x(i+1) = f_x(i) + (2*vt/(g*t(i+1)**2))*(v0*cos(a)-x(i+1))
     f_y(i+1) = f_y(i) + (2*vt/(g*t(i+1)**2))*(v0*sin(a)-y(i+1))-vt
     
     if (y(i)<0) exit 
   !Escribiendo datos 
     open(1, file='r_aire.dat', status='unknown')
     write(1,1000) x(i+1), y(i+1)
     1000 format(f18.10,5x,f18.10)
  end do 
  write(1,1100)
  1100 format(/)
 
  do i=0,size
     t(i)=0.
     x(i)=0.
     y(i)=0.
     f_x(i)=0.
     f_y(i)=0.
     end do
  end do 
   close(1)
end subroutine 
**********************************************************************************************************
**********************************************************************************************************
