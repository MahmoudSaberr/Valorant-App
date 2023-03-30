import '../../constant/constant.dart';
import '../../constant/strings.dart';

class OnBoardingContent {
  String image;
  String title;
  String description;
  OnBoardingContent(
      {required this.image,
      required this.title,
      required this.description,});
}

List onBoarding = [];
List<OnBoardingContent> contents = [
  OnBoardingContent(
      title: Constant.valorantGame,
      image: Names.onBoardingOne,
      description: Constant.descOne),
  OnBoardingContent(
      title: Constant.agents,
      image: Names.onBoardingTwo,
      description: Constant.descTwo),
  OnBoardingContent(
      title: Constant.abilities,
      image: Names.onBoardingThree,
      description: Constant.descThree),
];
