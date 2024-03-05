import 'package:flutter/material.dart';
import'package:introduction_screen/introduction_screen.dart';
import'package:shared_preferences/shared_preferences.dart';
import'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  final List<PageViewModel>pages=[
  PageViewModel(
    title:'connect With Monkeys',
    body:'Uu uU Aa aa aA im a monkey give me banana give me GIVE ME!!! Im caesar the monkey king obey me u stupid monkeys',
    footer: SizedBox(
      height:45,
      width:150,
      child:ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(10),
          ),
          elevation:8,
        ),
        onPressed:(){},
        child:Text('Lets ducking go'),
    ),
  ),
  image: Image.network('data:image/jpeg;base64,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'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Connect With who love Tomura',
      body:
          'TOMURA SHIGARAKI IS LOVE TOMURA IS GOD, He is the leader of the League of Villains. TOMUARA IS MY LOVE HES THE BEST',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('LUV LOVE LUVV'),
        ),
      ),
      image: Image.network('https://images.ctfassets.net/n2b5gayhtps7/30QYGEJOaJsa0LmctCvttM/3c9dd3a1a08b5d607c9798b346c0c8c3/Tomura_Shigaraki_ready_for_war_-28Anime-29.webp?w=3840&q=75&fm=webp'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    PageViewModel(
      title: 'Connect With SHIN'  ,
      body:
          'MELON SODA IS GOOD.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('YESSS'),
        ),
      ),
      image: Image.network('https://steamuserimages-a.akamaihd.net/ugc/434949660508787972/065875393DD52642AE44E2099DC0241FFFC8955D/'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On Boarding'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        skip: const Text('Skip'),
        showDoneButton: true,
        done: const Text('Done'),
        showNextButton: true,
        next: const Icon(
          Icons.arrow_forward,
          size: 25,
        ),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}