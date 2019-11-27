import 'package:flutter/material.dart';
import 'package:onboarding_anim/onboarding_anim.dart';

void main() {
  runApp(
  MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.red
    ),
  home: MyApp()
));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<PageModel> pages = <PageModel>[
    PageModel(
      title: "Relax",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
      image: Image(image: NetworkImage("https://i-love-png.com/images/kraken_body03_final_01.png")),
    ),
    PageModel(
      title: "Flutter",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
      image: Image(image: NetworkImage("https://i-love-png.com/images/kraken_body01_final_01_1766.png"))
    ),
    PageModel(
      title: "Is Awesome",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
      image: Image(image: NetworkImage("https://i-love-png.com/images/kraken_body03_final_01.png"))
    ),
    PageModel(
      title: "And Beautiful",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
      image: Image(image: NetworkImage("https://i-love-png.com/images/kraken_body01_final_01_1766.png"))
    )
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingScreen (
        onboardingDecoration: OnboardingDecoration(
          aling: Alignment.topCenter,
          child: Image(
            image: NetworkImage("https://www.themexpert.com/images/easyblog_articles/531/b2ap3_large_Mountains.PNG"),
            width: MediaQuery.of(context).size.width,
          )
        ),
        pages: pages,
        onDone: () => print("Done"),
        onSkip: () => print("Skip")
      ),
    );
  }
}