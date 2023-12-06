import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<String> coverImages = [
  'cover-capybara.jpg',
  'cover-anaconda.jpg',
  'cover-anteater.jpg',
  'cover-eagle.jpg',
  'cover-frog.jpg',
  'cover-jaguar.jpg',
  'cover-sloth.jpg',
];

const Color colorWhite = Colors.white;
const Color colorBlack = Colors.black;
const Color colorYellowAccent = Colors.yellowAccent;
const Color colorLightGreen = Colors.lightGreen;
const Color colorGrey = Colors.grey;

Future<List<Map<String, dynamic>>?> loadJsonData(String path) async {
  try {
    String jsonString = await rootBundle.loadString(path);
    List<dynamic> jsonData = json.decode(jsonString);
    return List<Map<String, dynamic>>.from(jsonData);
  } catch (e) {
    return null;
  }
}
