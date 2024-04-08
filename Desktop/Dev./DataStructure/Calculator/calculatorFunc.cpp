#include "calculator.h"

void Calculator::set(int n1, int n2)
{
    num1 = n1;
    num2 = n2;
}

int Calculator::sub()
{
    return num1-num2;

}

double Calculator::div()
{
    return (double)num1/num2;
}

