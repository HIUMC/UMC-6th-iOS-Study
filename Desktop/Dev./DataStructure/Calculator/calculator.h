#ifndef __CALCULATOR_H__
#define __CALCULATOR_H__

#include <iostream>

class Calculator{
private:
    int num1;
    int num2;
    
public:
    void set(int n1, int n2);
    int sub();
    double div();
};

#endif