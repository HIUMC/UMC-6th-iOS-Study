#include "person.h"
#include <string>

Person::Person()
{
    name = "";
    age = 0;
    occupation = "";
    // constructor

}
void Person::set()
{
    /*std::string n;
    int a;
    std::string oc;
    std::cin>>n>>a;
    std::cin.ignore();
    std::getline(std::cin,oc);
    name = n;
    age = a;
    occupation = oc;*/
    std::cin>>name>>age;
    std::cin.ignore();
    getline(std::cin,occupation);
}

Person::Person(std::string name, int age, std::string occupation) : name(name), age(age), occupation(occupation) //const, & 는 멤버 이니셜라이져 무조건 사용
{
    
}

void Person::displayInfo()
{
    std::cout<<"Name: "<<name<<std::endl;
    std::cout<<"Age: "<<age<<std::endl;
    std::cout<<"Occupation: "<<occupation<<std::endl;
}

void Person::wishGoodDay()
{
    std::cout<<"Have a good day, "<<name<<'!'<<std::endl;
}

Person::~Person()
{
    // destructor
}