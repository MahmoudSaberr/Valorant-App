import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_app/view/screens/home.dart';

import '../../constant/constant.dart';
import '../../data/model/onboarding_model.dart';


class Onbording extends StatefulWidget {
  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Container buildDot(int index, BuildContext context, Color color) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(20), color:
      currentIndex==index ? Constant.scaffoldBackgroundColor
          :  Constant.whiteColor
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller:  pageController,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 43),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Image.asset(
                            contents[i].image,
                            height: 370,
                            width: 320,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(contents[i].title,
                              style: Constant.titleOnBoardingTextStyle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(contents[i].description,
                              textAlign: TextAlign.center,
                              style: Constant.descOnBoardingTextStyle),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
                  (index) =>  buildDot(
                  index,
                  context,
                  currentIndex == onBoarding.length - index
                      ? Constant.primaryColor
                      : Constant.onBoardingDots),
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: Constant.nextBtnOnBoardingColor,
                borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.all(40),
            width: 360,
            child: TextButton(
              child: Text(
                  currentIndex == contents.length - 1
                      ? "Continue"
                      : "Next",
                  style: Constant.btnOnBoardingTextStyle),
              onPressed: () async {
                setState(()async {
                  if ( currentIndex == contents.length - 1) {
                    SharedPreferences prefInst =
                    await SharedPreferences.getInstance();
                    prefInst.setBool('isIntroRead', true);

                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx)=>const Home()));
                  }
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
