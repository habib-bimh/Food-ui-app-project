import 'package:flutter/cupertino.dart';
// parameter
class DietModel {

  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;
//constructor of the class
  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected
});
//mathod
  static List<DietModel> getDiets(){
    List<DietModel> diets= [];

    diets.add(DietModel(
        name: "Huny Pancake",
        iconPath: "https://c.recipeland.com/images/r/19757/c8ff0b80e801c8348d93_1024.jpg",
        level: "Easy",
        duration: "30mins",
        calorie: "180KCal",
        viewIsSelected: true
    ));
    diets.add(DietModel(
        name: "Cake",
        iconPath: "https://img.taste.com.au/hbNtzI2Q/taste/2021/08/clinkers-cake-173208-2.jpg",
        level: "Easy",
        duration: "20mins",
        calorie: "150KCal",
        viewIsSelected: false
    ));
    diets.add(DietModel(
        name: "Ice-cream",
        iconPath: "https://www.carveyourcraving.com/wp-content/uploads/2021/06/chocolate-icecream-in-an-icecream-maker.jpg",
        level: "Easy",
        duration: "5mins",
        calorie: "130KCal",
        viewIsSelected: true
    ));
    diets.add(DietModel(
        name: "Faluda",
        iconPath: "https://1.bp.blogspot.com/-wyUaeRvBHlE/YAlSz6_O6HI/AAAAAAAAFyI/En7RIsWz_okAcMMp3mny1bFDGiO6cF3_ACLcBGAsYHQ/s1140/carrot%2Bfalooda.jpeg",
        level: "Easy",
        duration: "20mins",
        calorie: "850KCal",
        viewIsSelected: true
    ));

    return diets;


  }

}