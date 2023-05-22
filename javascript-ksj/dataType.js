// 8종류의 데이터타입을 공부해보자
// String, Number, Bigint, Boolean, Undefined, Null, Symbol, Object

// String **문자열
const str1 = "smith";
const str2 = "1";
const str3 = "true";
console.log(str1, typeof str1);

// Number **숫자
const num1 = 1;
const num2 = 1234123;
const num3 = 1.2;
console.log(num1, typeof num1);

// Boolean **참, 거짓
const bool1 = true;
const bool2 = false;
console.log(bool1, typeof bool1);

// Object **객체
const obj1 = [1,2,3,4,5,5,7]; // 배열, array
const obj2 = {
    userName: "smith",
    userAge: 25,
};
console.log(obj1, typeof obj1);

// Undefined 정의되지 않음
// const undef1; // 상수는(const) 반드시 값을 가져야한다.
let undef2;
console.log(undef2, typeof undef2);

// Null 아무것도 없음
let nulValue = null; // null은 아무것도 없다는 의미이다. (=void)
let objectType = null; // 오브젝트의 초기값으로 널을 사용할 수 있다.
console.log(nulValue, typeof nulValue);