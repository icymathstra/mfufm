program main




 write(*,*) 'Hello, world!'
 write(*,*) 'Another note'
 
 a=5
 b=6
 c=a+b
 write(*,*) c
 


end program main


subroutine sum(a,b,c)
 real(8), intent(in) :: a, b
 real(8), intent(out) :: c

 c=a+b

end subroutine