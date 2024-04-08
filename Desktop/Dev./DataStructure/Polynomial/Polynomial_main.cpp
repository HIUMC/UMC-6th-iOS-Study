#include "Polynomial.h"

int main()
{
	Polynomial a, b, c, d;
    
	a.read();
	b.read();
	// c.add(a,b);
    
	c.sub(a, b);  
    c.display();

	a.display();
    b.display();
    
	c.trim();
    c.display();

	d.mult(a, b);
	d.display();
    
    return 0;
}