/* 
    10. Write a Program to check the given number is Positive, Negative.
*/

import 'dart:io';
void main(){
    int? num;

        print("enter the number: ");
        num=int.parse(stdin.readLineSync()!);

        if(num>0){
            print("positive number");
        }
        else{
            print("negative number");
        }
    }
