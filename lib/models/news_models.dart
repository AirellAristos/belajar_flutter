import 'dart:ffi';
import 'package:flutter/material.dart';

class NewsModels {
  String name;
  String news;
  String duration;
  String newsType;
  Color boxColor;
  bool viewIsSelected;

  NewsModels({
    required this.name,
    required this.news,
    required this.duration,
    required this.newsType,
    required this.boxColor,
    required this.viewIsSelected
  });

  static List <NewsModels> getNews(){
    List <NewsModels> news = [];

    news.add(
      NewsModels(
      name: "Pentingnya Menjaga Kesehatan Jantung Sekarang", 
      news: "Kesehatan jantung sangat penting...", 
      duration: "30 detik baca",
      newsType: "Kesehatan",
      boxColor:Color(0xFFD4F6FF),
      viewIsSelected: true)
    );

      news.add(
      NewsModels(
      name: "Tips Sederhana Menjaga Kesehatan Jantung", 
      news: "Menjaga kesehatan jantung dapat dilakukan dengan...", 
      duration: "40 detik baca",
      newsType: "Kesehatan",
      boxColor: Color(0xFFFFCCEA) , 
      viewIsSelected: true)
    );

    return news;
  }

}