#include "calculator.h"

int main()
{
    Calculator calc;

    int n1,n2;
    std::cin>>n1>>n2;
    int re1=0;
    double re2 = 0.0;
    calc.set(n1,n2);
    re1 = calc.sub();
    std::cout<<re1<<std::endl;
    if(n2){
        re2 = calc.div();
        std::cout<<re2<<std::endl;
    }
    else{
        std::cout<<"ERROR"<<std::endl;
    }
    
}

