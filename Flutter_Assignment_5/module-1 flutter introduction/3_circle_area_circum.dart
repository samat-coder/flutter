/*
    3. Write a program to make a square and cube of number.
*/
import 'dart:io';
void main(){
    int? radius;
    double area,circumference;

    print("enter the radius: ");
    radius=int.parse(stdin.readLineSync()!);

    area=3.14*radius*radius;
    print("area of circle: ${area}");

    circumference=2*3.14*radius;
    print("circumference of area: ${circumference}");

}