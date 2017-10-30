!
!! summation.f90
!! 
!! Made by (Carlos Eduardo Martinez Nuñez)
!! Login   <carloseduardo@ltsp142.example.com>
!! 
!! Started on  Mon Oct 30 11:33:01 2017 Carlos Eduardo Martinez Nuñez
!! Last update Time-stamp: <30-oct-2017 12:19:57 carloseduardo>
!

! sum.f90
! Performs summations using in a loop using EXIT statement
! Saves input information and the summation in a data file

program summation
implicit none
integer :: n
real::mean, harmonic_mean,sum_i, a, sum
print*, "This program performs summations. Enter 0 to stop."
open(unit=10, file="data.txt")

sum = 0
n=0
sum_i=0

do
 print*, "Add data:"
 read*, a
 if (a == 0) then
  exit
else
    n = n + 1
    sum = sum + a
    sum_i=sum_i+(1/a)
 end if
 write(10,*) a 
end do
 mean=sum/real(n)
 harmonic_mean=real(n)/sum_i

 print*, "summation=", sum
 print*, "Mean=", mean
 print*, "Harmonic_mean=",harmonic_mean
write(10,*) "Mean=", mean
write(10,*) "Harmonic_mean=",harmonic_mean
close(10)

end
