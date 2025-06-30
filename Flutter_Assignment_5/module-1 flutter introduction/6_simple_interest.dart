/*
    6. Write a program to find the simple Interest.
*/
import'dart:io';
void main(){
    int? principal,rate,time;
    

    print("enter the principal amount: ");
    principal=int.parse(stdin.readLineSync()!);
    print("enter the rate of amount: ");
    rate=int.parse(stdin.readLineSync()!);
    print("enter the time: ");
    time=int.parse(stdin.readLineSync()!);

    double si=principal*rate*time/100;

    print("simple interest: ${si}");


}