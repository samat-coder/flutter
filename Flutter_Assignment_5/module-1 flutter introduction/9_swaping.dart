/*
    9. Write a Program to show swap of two No's without using third variable.
*/
import 'dart:io';
void main(){
    int a=50,b=40,c;

    print("------------before swaping------------");
    print("a : $a  ");
    print("b : $b");

    c=a+b;
    a=c-a;
    b=c-b;
    print("------------after swaping------------");
    print("a : $a");
    print("b : $b");
}