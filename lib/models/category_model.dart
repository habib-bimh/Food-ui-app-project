import 'dart:ui';
import 'package:flutter/material.dart';

class CategoryModel{
  // parameter
  String name;
  String iconPath;
  Color boxColor;

  //constructor of the class
  CategoryModel(
      {
        required this.name,
        required this.iconPath,
        required this.boxColor,
      });
  //mathod
   static List<CategoryModel> getCategorise(){
     List<CategoryModel> categorise =[];

     categorise.add(
       CategoryModel(name: "Salad", iconPath:"assets/images/salad.jpg", boxColor: Color(0xff92A3FD))
     );
     categorise.add(
       CategoryModel(name: "Cack", iconPath: "assets/images/cack.jpg", boxColor: Color(0xffC58BF2))
     );
     categorise.add(
       CategoryModel(name: "Pie", iconPath:"assets/images/pie.jpeg" , boxColor: Color(0xff92A3FD))
     );
     categorise.add(
         CategoryModel(name: "Smoothie", iconPath:"assets/images/smoothie.jpg" , boxColor: Color(0xffC58BF2))
     );


      return categorise;
   }
}