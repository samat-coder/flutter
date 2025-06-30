/*
    2. Write a program to make addition, Subtraction, Multiplication and Division of Two Numbers.
*/
import 'dart:io';
void main(){
    int? a;
    int? b;

    print("enter the first value: ");
    a=int.parse(stdin.readLineSync()!);
    print("enter the second value: ");
    b=int.parse(stdin.readLineSync()!);

    print(a + b);
    print(a - b);
    print(a * b);
    print(a / b);
}