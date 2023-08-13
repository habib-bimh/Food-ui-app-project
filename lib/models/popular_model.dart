//class

class PopularDietsModel {
  //parameter
    String name;
    String iconPath;
    String level;
    String duration;
    String calorie;
    bool boxIsSelected;
    //constructor of the class
    PopularDietsModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,
});
    //mathod
    static List<PopularDietsModel> getPopularDiets(){
      List<PopularDietsModel> popularDiets = [];
      popularDiets.add(
        PopularDietsModel(name: "Blueberry Pancake",
            iconPath: "https://recipetineats.com/wp-content/uploads/2019/01/Blueberry-Pancakes_8.jpg",
            level: "Medium",
            duration:"20mins",
            calorie: "230KCal",
            boxIsSelected: true)
      );
      popularDiets.add(
          PopularDietsModel(name: "Blueberry Pancake",
              iconPath: "https://recipetineats.com/wp-content/uploads/2019/01/Blueberry-Pancakes_8.jpg",
              level: "Medium",
              duration:"20mins",
              calorie: "230KCal",
              boxIsSelected: true)
      );
      popularDiets.add(
          PopularDietsModel(name: "Blueberry Pancake",
              iconPath: "https://recipetineats.com/wp-content/uploads/2019/01/Blueberry-Pancakes_8.jpg",
              level: "Medium",
              duration:"20mins",
              calorie: "230KCal",
              boxIsSelected: true)
      );
      popularDiets.add(
          PopularDietsModel(name: "Blueberry Pancake",
              iconPath: "https://recipetineats.com/wp-content/uploads/2019/01/Blueberry-Pancakes_8.jpg",
              level: "Medium",
              duration:"20mins",
              calorie: "230KCal",
              boxIsSelected: true)
      );
      return popularDiets;
    }



}