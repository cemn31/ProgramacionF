!
!! pinumber.f90
!! 
!! Made by (Carlos Eduardo Martinez Nuñez)
!! Login   <carloseduardo@ltsp142.example.com>
!! 
!! Started on  Mon Oct 30 12:24:10 2017 Carlos Eduardo Martinez Nuñez
!! Last update Time-stamp: <30-oct-2017 12:51:52 carloseduardo>
!

program pinumber
  implicit none
 
integer ::i,size
real::pi_number,sum

print*, "This program performs the calculation of pi number."
print*,"Introduce the amoung of terms "
read*, size
sum= 0
do i=0, size
sum= sum+ ((-1)**i)/(2*real(i)+1)
end do
pi_number=4*sum
print*, "pi number=", pi_number
 end program pinumber
