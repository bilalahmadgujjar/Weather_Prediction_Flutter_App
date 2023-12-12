
import 'dart:io';
import 'package:flutter/material.dart';



void main()
{
  performTasks();
}

void performTasks()
{
    task1();
    task2();
    task3();
}

void task1()
{
  String result ="Task 1 data ";
  print ('Task 1 complete ');
}
void task2()
{

  Duration threeseconds = Duration(seconds: 3);
  sleep(threeseconds);

   String result = 'Task 2 data ';
   print ('Task 2 complete ');

}

void task3()
{
   String result = 'Task 3 data ';
   print('Task 3 complete ');
}