#include "Arraystack.h"
#include <string>

int main()
{
	ArrayStack stack;
	std::string s = "";
	char ch = '\0';
	char prev = '\0';
	
	getline(std::cin,s);
	for(int i=0; i<s.length(); i++)
	{
		ch = s[i];
		switch(ch){
			case '(' : case '{' : case '[' :
				stack.push(ch);
				break;

			case ')' : case '}' : case ']' :
				if(stack.isEmpty()){
					std::cout<<"ERROR"<<std::endl;
					return -1;
				}
				prev = stack.pop();
				if((ch == ')' && prev != '(') || (ch == '}' && prev != '{') || (ch == ']' && prev != '[')){
				std::cout<<"ERROR"<<std::endl;
				return -1;
			}
			break;
		}
	}
	if(!stack.isEmpty())
	{
		std::cout<<"ERROR"<<std::endl;
	}
	std::cout<<"SUCCESS";
	
	return 0;
}