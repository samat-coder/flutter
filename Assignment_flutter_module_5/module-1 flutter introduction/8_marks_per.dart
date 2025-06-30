/*
    8. Write a program to calculate sum of 5 subjects & find the percentage. Subject marks entered byuser. 
*/
import 'dart:io';
void main(){
    double? marks;
    double totalmarks=0;

    for(int i=1; i<=5; i++)
    {
        print("enter the subject marks ${i}: ");
        marks=double.parse(stdin.readLineSync()!);
        totalmarks+=marks;
    }
    double per=totalmarks/5;

    print("percentage is: ${per}");
    
    
}