import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_app/constant/strings.dart';
import 'package:valorant_app/view/screens/home.dart';
import 'package:valorant_app/view/screens/onBoarding.dart';

import 'constant/constant.dart';
import 'cubit/characters_cubit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefInst = await SharedPreferences.getInstance();
  prefInst.get('isIntroRead') ?? prefInst.setBool('isIntroRead', false);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CharactersCubit>(
        create: (context) => CharactersCubit(charactersRepository),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Constant.scaffoldBackgroundColor,
      ),
      routes: {
        '/': (context) => AnimatedSplashScreen(
            splashIconSize: 251,
            splash: Names.splash,
            nextScreen: prefInst.getBool('isIntroRead') == true
                ?   const Home()
                :   Onbording(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor:  Constant.primaryColor
        ),
      },
    ),
  ));
}




