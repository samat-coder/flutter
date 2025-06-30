/*
    7. Write a program to convert temperature from degree centigrade to Fahrenheit.
*/
import'dart:io';
void main(){
    int? fahrenherit;
    

    print("enter the temprature into fahrenherit: ");
    fahrenherit=int.parse(stdin.readLineSync()!);
    
    double celcius=(fahrenherit-32)*5/9;
    print("temperature in celcius : ${celcius}");


}