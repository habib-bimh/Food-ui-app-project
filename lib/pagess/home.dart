import 'package:flutter/material.dart';
import 'package:food_app/models/diet_model.dart';
import 'package:food_app/models/popular_model.dart';
import '../models/category_model.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  //methods

  void _getInitialInfo(){
    categories = CategoryModel.getCategorise();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }
  @override
  void initState() {
    _getInitialInfo();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(),
        body: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchField(),
            SizedBox(height: 40,),
            _categoriesSection(),
            SizedBox(height: 40),
            _dietaSection(),
            SizedBox(height: 40),
            _popularSection()
          ],
        ),
      ),
    );
  }
  _popularSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding:EdgeInsets.all(8.0),
          child: Text(
            "Popular",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black,

            ),
          ),
        ),
        SizedBox(height: 40,),
        ListView.separated(
          shrinkWrap: true,
          itemCount: popularDiets.length,
          separatorBuilder: (context, index) => SizedBox(height: 25,),
          padding: EdgeInsets.only(left: 20,right: 20),
          itemBuilder: (context,index){
            return Container(
              height:100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(popularDiets[index].iconPath),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(popularDiets[index].name,style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),),
                      Text(popularDiets[index].level+ " | " +popularDiets[index].duration+ " | "+ popularDiets[index].calorie,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff7B6F72)
                          )
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Image.network("https://cdn.pixabay.com/photo/2016/09/05/10/50/app-1646214_1280.png",height:35,width:35,),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: popularDiets[index].boxIsSelected ? Colors.white : Colors.transparent ,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: popularDiets[index].boxIsSelected ? [BoxShadow(
                      color: Color(0xff1D1617).withOpacity(0.07),
                      offset: Offset(0,10),
                      blurRadius: 40,
                      spreadRadius: 0
                  )] : []
              ),
            );
          },
        )
      ],);
  }
  _dietaSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start  ,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text("Recommendation\nfor Diet",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
        ),
        SizedBox(height: 15,),
        Container(
          //color: Colors.blue,
          height: 240,
          child: ListView.separated(
              padding: EdgeInsets.only(left: 20,right: 20),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context,index)=>SizedBox(width: 25),
              itemCount: diets.length,
              itemBuilder: (context,index){
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height:100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.network(diets[index].iconPath,fit: BoxFit.fill,),
                        ),
                      ),
                      Text(diets[index].name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                      Text(diets[index].level+ " | " +diets[index].duration+ " | " +diets[index].calorie,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xff7B6F72))),
                      Container(
                        height: 45,
                        width: 130,
                        child: Center(child: Text("View",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: diets[index].viewIsSelected ? Colors.white : Color(0xffC58BF2)))),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          gradient: LinearGradient(
                              colors: [
                                diets[index].viewIsSelected ? Color(0xff9DCEFF) : Colors.transparent,
                                diets[index].viewIsSelected ? Color(0xff92A3FD) : Colors.transparent
                              ]
                          ),

                        ),
                      )
                    ],
                  ),
                );
              }
          ),
        )
      ],
    );
  }
  _categoriesSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("Category",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
        ),
        SizedBox(height:15),
        Container(
          height: 150,
          //color: Colors.green,
          child: ListView.separated(
              padding: EdgeInsets.only(left: 20,right: 20),
              scrollDirection: Axis.horizontal,
              separatorBuilder:(BuildContext, int) => SizedBox(width: 25),
              itemCount: categories.length,
              itemBuilder:(context, index){
                return Container(
                  width: 120,
                  decoration: BoxDecoration(
                      color: categories[index ].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height:50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(categories[index].name,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black),)
                    ],
                  ),
                );
              } ),
        )
      ],
    );
  }

   _searchField(){
    return Container(
      margin: EdgeInsets.only(top: 40.0,left: 20.0,right: 20.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40.0,
                spreadRadius: 0.0
            )
          ]
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search Pancake",
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(Icons.search),
            suffixIcon: Container(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.2,
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Icon(Icons.filter),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
            )
        ),
      ),
    );
  }

  AppBar appBar(){
    return AppBar(
      title: Text(
        "Breakfast",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: (){},
        child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)
            ),
            child:Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),
      actions: [
        GestureDetector(
          onTap: (){},
          child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(10)
              ),
              child:Icon(Icons.more_horiz,color: Colors.black,)
          ),
        ),
      ],
    );
  }
}
