#include "Polynomial.h"

Polynomial::Polynomial() {
    degree = 0;
}

Polynomial::~Polynomial() {
   // cout << "deconstructor" << endl;
}

void Polynomial::read() {
	// 입력 받을 다항식의 차수를 먼저 입력받음
	std::cin >> degree;
	// 입력 받은 degree차 부터 0차 까지의 계수를 입력받음
	for (int i = degree; i >= 0; i--)
		std::cin >> coef[i];
}

void Polynomial::add(Polynomial a, Polynomial b) {
	
	if (a.degree > b.degree) {
		*this = a; // main 함수에서 add를 c 인스턴스가 호출했기 때문에 c가 a의 주소를 받음
		for (int i = 0; i <= b.degree; i++)
			coef[i] += b.coef[i]; // coef는 c 인스턴스의 coef를 의미함, c (a와 동일한 배열 값을 지님)에 b의 계수가 더해짐
	}
	else {
		*this = b; 
		for (int i = 0; i <= a.degree; i++)
			coef[i] += a.coef[i];
	}
}

void Polynomial::sub(Polynomial a, Polynomial b){
    if (a.degree > b.degree) {
		*this = a; // main 함수에서 sub를 c 인스턴스가 호출했기 때문에 c가 a의 주소를 받음
		for (int i = 0; i <= b.degree; i++)
			coef[i] -= b.coef[i]; // coef는 c 인스턴스의 coef를 의미함, c(a와 동일한 배열 값을 지님)에 b의 계수가 같은 차수끼리 subtract.
	}
	else {
		*this = b;
		for (int i = 0; i <= a.degree; i++)
			coef[i] -= a.coef[i];
	}
}

void Polynomial::mult(Polynomial a, Polynomial b){

    this->degree = a.degree + b.degree; // mult를 호출한 d 인스턴스에 degree 값을 부여함, 곱셈이기 때문에 두 다항식의 최고차항들의 합이 됨
	for(int i = 0; i <= this->degree; i++){
		this->coef[i] = 0; // 다항식의 계수들이 저장될 배열 값을 0 으로 초기화함
	}
    for(int i = 0; i <= a.degree; i++){
        for(int j = 0; j <= b.degree; j++){
            this->coef[i + j] += a.coef[i] * b.coef[j]; // d 다항식의 계수는 a,b 배열 값의 곱이 되고, 차수는 인덱스 값들의 합이 됨 
        }
    }
}

void Polynomial::trim()
{
	// display() 에서최고차항의 계수가 0이라면 for문에 걸리는 조건이 없음, +를 출력하게 됨
	// 차수가 0일때는 출력하지 않고 다음 차수로 넘어가는 로직
	while(degree>0 && coef[degree] == 0) degree --; 
}

void Polynomial::display() {
	

	for (int i = degree; i > 0; i--) { // 최고차항 degree부터 출력
		if (coef[i]) { // 계수가 0이 아닐 때
			if (i != degree)  // 첫 차수를 출력하고 다음 차수를 출력할 때
				std::cout << " + ";
			if (coef[i] == 1) // 계수가 1이어서 계수를 출력할 필요 없을 때
				std::cout << "x^" << i;
			else
				std::cout << coef[i] << "x^" << i; // 계수가 0도 아니고 1도 아닐때
	}
	if (coef[0]) // 0차의 계수가 0이 아닐 때
		std::cout << " + " << coef[0];
		
	std::cout << std::endl;
}
}

