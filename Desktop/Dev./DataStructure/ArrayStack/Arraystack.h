#ifndef _ARRAYSTACK_H__
#define _ARRAYSTACK_H__

#include <iostream>
#define MAX 100
 

class ArrayStack{
private:
    int top;
    int data[MAX];

public:
    ArrayStack();
    ~ArrayStack();

    bool isEmpty();
    bool isFull();

    void push(int a);
    int pop();
    int peek();
    void display();
};

#endif