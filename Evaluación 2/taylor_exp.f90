program taylor

    implicit none                  
        real (kind =8)::x,e_tay, re_taylor,exp_true
    integer::n,n1,t,j,k,npts
    npts=100
    t=15
    !Open file
   open (1,file="exp_taylor.txt",status="unknown") 
   !loop aproximation
   do k=1,t,2
      n1=k
   !loop terms
   do j=0,npts
    !Giving values to x
    x=0.1*real(j)
     !procesing the real functions
    exp_true= exp(x)
      ! call subroutine
    call exptaylor(x,n1,e_tay)
    re_taylor=e_tay
    !printing the results
    write(1,*) x, exp_true, re_taylor
    
 end do
 write (1,*) " "
 write (1,*) " "
 end do
 close(1)

end program taylor

!==========================
subroutine exptaylor(x,n,exptay)
!==========================
    implicit none
    ! function arguments:
    integer :: i
    integer, intent(in):: n
    real (kind=8)::term,partial_sum
    real (kind=8), intent(in)::x
    real (kind=8),intent(out):: exptay
    
  
    !inicializando variables
    term = 1.
    partial_sum= term
    !Loop aproximations
    do i=1,n
        ! j'th term is  x**i / i!  which is the previous term times x/i:
        term = term*x/real(i)   
        ! add this term to the partial sum:
        partial_sum = partial_sum + term   
        end do
     exptay = partial_sum  ! this is the value returned
end subroutine exptaylor
