program main




 write(*,*) 'Hello, world!'
 write(*,*) 'Another note'
 


end program main


subroutine sum(a,b,c)
 real(8), intent(in) :: a, b
 real(8), intent(out) :: c

 c=a+b

end subroutine