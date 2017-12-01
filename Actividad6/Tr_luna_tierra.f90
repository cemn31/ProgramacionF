program tr_luna_tierra
!::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  !Aplicación Fortran para calcular la trayectoria de la luna respecto a la posicion
  !de la tierra alrededor del sol
  !al rededor del sol
  !r------------radio medio de la tierra al sol
  !xt------------Abcisa (coordenadas cartesianas)
  !yt------------Ordenada (Coordenadas cartesianas)
  !xl------------Abcisa de la luna respecto a la tierra
  !yl------------Ordenada de la luna respecto a la tierra
  !angle_a-------ángulo barrido por la tierra
  !angle_b-------ángulo barrido por la luna
  !Tl------------Periodo de la luna en seg
  !Tt------------Periodo de la tierra en seg
!::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  implicit none
  integer, parameter::t=8766
  integer:: i
  double precision, parameter:: pi=3.141592d0,  Tt=8.766d3, Tl=6.56d2
  double precision::x_t, y_t, x_l, y_l
  double precision::ang_a, ang_b
  double precision,dimension(0:t)::xt2, yt2, xl2, yl2,dt
   
 
     !Making file to storage data
    open (1,file="tr_luna_tierra.txt",status="unknown") 
    
     !loop to calculate trayectory
    do i=0,t,12
       !angulo en radianes
     dt(i)=dble(i)
     ang_a=(dt(i)*2.0d0*pi)/Tt
     ang_b=(dt(i)*2.0d0*pi)/Tl
     !Calling  subroutine
    call tr_luna (ang_a,ang_b,x_t,y_t,x_l,y_l)
   
    xt2(i)=x_t
    yt2(i)=y_t
    xl2(i)=x_l
    yl2(i)=y_l
   
     !Saving data
       write (1,*) xt2(i), yt2(i), xl2(i), yl2(i)
    end do
      close(1)
 end program tr_luna_tierra

!:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

subroutine tr_luna (angle_a,angle_b,xt,yt,xl,yl)
  implicit none
   
   double precision,intent(in)::angle_a, angle_b
   double precision, intent(out)::xt, yt, xl, yl
   double precision, parameter :: Rt=1.496d8, Rl=1.496d7 !radio de la tierray luna

     !procesing  data 
    xt=Rt*dcos(angle_a)
    yt=Rt*dsin(angle_a)
    xl=Rt*dcos(angle_a)+Rl*dcos(angle_b)
    yl=Rt*dsin(angle_a)+Rl*dsin(angle_b)


    end subroutine tr_luna
