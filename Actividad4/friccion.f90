program resistencia
  implicit none
  real, parameter:: g=9.8, pi=3.1415927, rho_a=1.128, cd =0.45, dt=0.01
  real, parameter:: m=0.5, theta = 45., r = 0.5
  integer, parameter:: size=1000
  integer::i,j
  real::vt,a,C,f,v0
  real, dimension(0:size) ::t,v_x,v_y,x,y
  

   !Calculo de la velocidad terminal
  
  vt= sqrt((2*m*g)/(rho_a*pi*r**2*cd))
  
  C = m*g / vt
   
  f=(1-(dt*C)/m)
write (*,*)f
  ! convirtiendo ángulo a radianes
     a = theta * pi / 180.0
  !Condiciones iniciales
   
   open(1, file='friccion.dat', status='unknown')  
   
    do j=2,10,2
    
    v0=real(j)
     t(0)=0.
     x(0)=0.
     y(0)=0.
     v_x(0)=v0*cos(a)
     v_y(0)=v0*sin(a) 
    write(1,1000) t(0), x(0), y(0), v_x(0), v_y(0)   
    
     t(1)= t(0)+dt

     x(1) = x(0) + v0*t(1)*cos(a)
     y(1) = y(0) + v0*t(1)*sin(a)-0.5*g*t(1)**2
       
     v_x(1) = v0*cos(a)
     v_y(1) = v0*sin(a)-g*t(1)
     
     write(1,1000) t(1), x(1), y(1),v_x(1),v_y(1)
     
    do i=2,size

     t(i) = t(i-1) + dt
         
     x(i) = x(i-1) + dt*v_x(i-1)
     y(i) = y(i-1) + dt*v_y(i-1)
     
     v_x(i)= v_x(i-1)*(1-(dt*C)/m)
     v_y(i)= v_y(i-1)*(1-(dt*C)/m)-dt*g
    
     if (y(i)<0.) exit 
      
     write(1,1000) t(i), x(i), y(i),v_x(i),v_y(i)
     1000 format(f18.15,5x,f18.15, 5x, f18.15, 5x, f18.15,5x,f18.15) 
     end do 
     write(1,1100)
     1100 format(/)
     do i=2,size
     t(i)=0.
     x(i)=0.
     y(i)=0.
     v_x(i)=0.
     v_y(i)=0.
     end do

     end do 
     close(1)
  

end program resistencia

