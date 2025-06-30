/*
    4. Write a program to find the Area of Circle 
*/
import 'dart:io';
void main(){
    int? number;

    print("enter the number: ");
    number=int.parse(stdin.readLineSync()!);

    int square=number*number;
    int cube=number*number*number;

    print("square is: ${square}");
    print("cube is: ${cube}");
}