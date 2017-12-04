program s_taylor
  !::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ! APLICACIÓN FORTRAN PARA CALCULAR LA APROXIMACIÓN DE LA FUNCION Sin(x)
  ! USANDO LA SERIE DE MACLAURIN
  !sin_true---------------Función real de Sin(x)
  !y----------------------Aproximación 0 de sin(x)
  !x----------------------ángulos en radianes
  !stay-------------------Función Sin(x) aproximada
  !re_taylor--------------Función aproximada en la subrutina
  !:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    implicit none                  
    integer::n1,n,j,k,np,t
    real (kind=8), parameter:: pi=3.141592
    real (kind=8)::stay, re_taylor,x,sin_true,y
   
    !data in degrees
    np=720
    t=10
    do k=0,t

       n1=k
    !Open file
   open (1,file="sin_taylor.txt",status="unknown") 
  
        !loop terms
   do j=-np,np 
    !Giving values to x
      x=(pi*j)/180.
     !procesing the real functions
      sin_true= sin(x)
      y=x
      ! call subroutine
    call sintaylor(x,n1,stay)
    re_taylor=stay
    !printing the results
    write(1,*) x, sin_true, re_taylor,y
    end do
 write (1,*) " "
 write (1,*) " "
end do 
 close(1)
 
end program s_taylor

!::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
subroutine sintaylor(x,n,staylor
!:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    implicit none
    ! function arguments:
    integer :: i
    integer, intent(in):: n
    real (kind=8)::term,partial_sum
    real (kind=8), intent(in)::x
    real (kind=8),intent(out):: staylor
    
  
    !inicializando variables
    term = x
    partial_sum= term
    !Loop aproximations
    do i=1,n
        ! j'th term is  x**i / i!  which is the previous term times x/i:
        term =(-1**i)*(term*x*x)/(2*i*(2*i+1))  
        ! add this term to the partial sum:
        partial_sum = partial_sum + term   
        end do
     staylor = partial_sum ! this is the value returned
end subroutine sintaylor
