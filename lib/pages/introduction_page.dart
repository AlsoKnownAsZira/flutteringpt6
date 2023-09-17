import 'package:flutter/material.dart';
import 'package:fluttering_pt6/pages/fakerDart.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class introduction_page extends StatelessWidget {
  const introduction_page({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome! please click next to continue",
          body:
              "A simple app to show the use of faker and introduction_screen packages",
          image: Center(
            child: Container(
              child: LottieBuilder.asset('lib/assets/lotties/login.json'),
            ),
          ),
        ),
         PageViewModel(
          title: "Please click done to enter the app",
          body:
              "This is the second page",
          image: Center(
            child: Container(
              child: LottieBuilder.asset('lib/assets/lotties/next.json'),
            ),
          ),
        )
      ],
     showNextButton: true,
     showBackButton: true,
     back: Text("Back"),
      next: Text("NEXT"),
      done: Text("DONE!"),
      onDone: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => fakerDart(),
            ));
      },
    );
  }
}
