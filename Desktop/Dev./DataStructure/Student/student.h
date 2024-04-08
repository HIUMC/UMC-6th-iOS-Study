#ifndef __STUDENT_H__
#define __STUDENT_H__

#include <iostream>

class student{
private:
    std::string name;
    int age;
    std::string university;
public:
    student(); // 생성자 
    void set();
    void printinfo();
};

#endif