#include "student.h"

void student::set()
{
    std::string n;
    int a;
    std::string uni;
    std::cin>>n>>a>>uni;
    name = n;
    age = a;
    university = uni;
}

void student::printinfo()
{
    std::cout<<"이름 : "<<name<<std::endl;
    std::cout<<"나이 : "<<age<<std::endl;
    std::cout<<"학교 : "<<university;
}