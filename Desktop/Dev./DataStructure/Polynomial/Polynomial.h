#ifndef __POLYNOMIAL_H__
#define __POLYNOMIAL_H__

#include <iostream>
#define MAX_DEGREE	80

class Polynomial {
private:
	int	degree;				    
	int coef[MAX_DEGREE];   

public:
	Polynomial(); 
	~Polynomial();
	
	void read();
	void add(Polynomial a, Polynomial b);
    void sub(Polynomial a, Polynomial b);
    void mult(Polynomial a, Polynomial b);
    void trim();
	void display();
	
};

#endif
