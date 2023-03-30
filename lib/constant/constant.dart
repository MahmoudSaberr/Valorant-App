
import 'package:flutter/material.dart';

import '../data/repo/characters_repository.dart';
import '../data/service/web_service.dart';

String url = 'https://valorant-api.com/v1';
final Services apiProvider = Services();
final CharactersRepository charactersRepository = CharactersRepository(apiProvider: apiProvider);

class Constant {
  static const String valorantGame = "Valorant Game";
  static const String agents = "Agents";
  static const String abilities="Abilities";
  static const String descOne="Valorant is a free-to-play first-person tactical hero shooter "
      "developed and published by Riot Games, for Windows";
  static const String descTwo="gents are the playable characters in VALORANT"
      "representing an agent of the VALORANT Protocol";
  static const String descThree="Each agent serves as a different class with four abilities"
      "and are mostly unlocked by progressing through their Contract";

  static Color scaffoldBackgroundColor=const Color(0xFFBD3944);
  static Color primaryColor=const Color(0xFF53212B);
  static Color blackColor =  Colors.black;
  static Color whiteColor = Colors.white;
  static Color titleOnBoardingColor =const Color(0xffffffff);
  static Color discOnBoardingColor =const Color(0xffB3B3B3);
  static Color nextBtnOnBoardingColor =const Color(0xFFBD3944);
  static Color onBoardingDots=const Color(0xffD9D9D9);

  static TextStyle titleOnBoardingTextStyle=  TextStyle(
      fontWeight: FontWeight.w700,fontSize: 32,color: titleOnBoardingColor);
  static TextStyle descOnBoardingTextStyle=  TextStyle(
      fontWeight: FontWeight.w500,fontSize: 18,color: discOnBoardingColor);
  static TextStyle btnOnBoardingTextStyle= const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Color(0xffFFFFFF));

  Constant._();
}