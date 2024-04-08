#ifndef _PERSON_H__
#define _PERSON_H__

#include <iostream>

class Person{
private:
    std::string name;
    int age;
    std::string occupation;
    
public:
    Person();
    Person(std::string name, int age, std::string occupation);

    ~Person();

    void set();
    void displayInfo();
    void wishGoodDay();
};

#endif