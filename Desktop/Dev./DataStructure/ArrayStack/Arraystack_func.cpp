#include "Arraystack.h"

ArrayStack::ArrayStack() //: data{}  //-> 배열 초기화. 따라서 ArrayStack::ArrayStack() : data{}, top(-1) 이런 식으로 초기화 가능 
{
    top = -1;
    //data[MAX] = {0}; // 생략하고 생성사 옆 data{} 해도 가능
}


ArrayStack::~ArrayStack()
{

}

bool ArrayStack::isEmpty()
{
    if(top==-1) return true;
    else return false;

    // return top == -1;
}

bool ArrayStack::isFull()
{
    if(top==MAX-1) return true;
    else return false;

    // return MAX-1;
}

void ArrayStack::push(int a)
{
    if(isFull()) std::cout<<"ERROR"<<std::endl;
    else{
        top += 1;
        data[top] = a; // data[++top] = a;
    }
}

int ArrayStack::pop()
{
    if(isEmpty()) 
    {
        std::cout<<"Stack is EMPTY"<<std::endl;
        return -1;
    }

    else{
        int e = data[top];
        top = top - 1;
        return e; // data[top--];
    }
}

int ArrayStack::peek()
{
    if(isEmpty()) 
    {
        std::cout<<"Stack is FULL"<<std::endl;
        return 0;
    }

    else return data[top];
}

void ArrayStack::display()
{
    if(isEmpty())
    {
        std::cout<<"Stack is EMPTY - No display"<<std::endl;
    }
    for(int i=0; i<=top; i++)
    {
        std::cout<<data[i]<<' '<<std::endl;
    }
}
