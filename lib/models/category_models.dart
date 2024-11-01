import 'package:flutter/material.dart';

class CategoryModels {
  String name;
  String iconPath;
  String categoryPage;
  Color boxColor;

  CategoryModels({
    required this.name,
    required this.iconPath,
    required this.categoryPage,
    required this.boxColor,
  });

  static List<CategoryModels> getCategories(){

    List<CategoryModels> categories = [];

    categories.add(
      CategoryModels(
        name: "Doctor", 
        iconPath: 'assets/icons/doctor-svgrepo-com.svg',
        categoryPage: '/doctor', 
        boxColor: Color(0xFFD4F6FF),
        )
    );

    categories.add(
      CategoryModels(
        name: "Location", 
        iconPath: 'assets/icons/location-pin-lock-svgrepo-com.svg',
        categoryPage: '/location', 
        boxColor: Color(0xFFFFCCEA),
        )
    );

    categories.add(
      CategoryModels(
        name: "Medicine", 
        iconPath: 'assets/icons/medicine-svgrepo-com.svg',
        categoryPage: '/appointment', 
        boxColor: Color(0xFFD4F6FF),
        )
    );

    categories.add(
      CategoryModels(
        name: "Appointment", 
        iconPath: 'assets/icons/time-svgrepo-com.svg',
        categoryPage: '/appointment', 
        boxColor: Color(0xFFFFCCEA),
        )
    );

    categories.add(
      CategoryModels(
        name: "Mobile JKN", 
        iconPath: 'assets/icons/mobile-jkn.png',
        categoryPage: 'app.bpjs.mobile', 
        boxColor: Color(0xFFD4F6FF),
        )
    );

    return categories;
  }
}