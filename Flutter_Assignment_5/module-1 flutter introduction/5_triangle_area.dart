/*
    5. Write a program to find the Area of Triangle
*/
import 'dart:io';
void main(){
    double base_,height,area;  
    print("enter the base of triangle: ");
    base_=double.parse(stdin.readLineSync()!);
    print("enter the height of triangle: ");
    height=double.parse(stdin.readLineSync()!); 

    area=base_*height/2;
    print("area of trianle: ${area}");
}