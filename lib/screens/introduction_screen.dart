import 'package:flutter/material.dart';
import 'package:news_app/components/walkthrough_component.dart';
import 'package:news_app/controller/common_controller.dart';
import 'package:news_app/screens/login_screen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final list = const [
    WalkThroughComponent(
        text: "Where News Come First",
        assets: "assets/bbc.jpg",
        secondaryText: 'More News. More Often'),
    WalkThroughComponent(
        text: "The Power of Information",
        assets: "assets/bbc1.jpg",
        secondaryText: 'Expect The News First'),
    WalkThroughComponent(
        text: "Where News Come First",
        assets: "assets/bbc3.jpg",
        secondaryText: 'More News. More Often')
  ];
  int selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
void getToLogin() async{
  await CommonController().setIntroductionPref();
  if(mounted) {
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (c) => const LoginScreen(),) );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(onPressed: () {
                getToLogin();
              }, child: const Text('Skip')),
            ),
            indicator(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                child: ElevatedButton(
                    onPressed: () {

                      if (selectedIndex == list.length-1) {
                        getToLogin();
                      } else {
                        selectedIndex++;
                        _pageController.animateToPage(
                          selectedIndex,
                          duration: const Duration(microseconds: 300),
                          curve: Curves.easeIn,
                        );
                        setState(() {});
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      )
                    ),
                    child: Center(
                      child: Icon(
                        selectedIndex == list.length - 1
                            ? Icons.check
                            : Icons.arrow_forward,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,

        child: PageView(
          controller: _pageController,
          children: list,
          onPageChanged: (index) {

            selectedIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(list.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: AnimatedContainer(
            duration: const Duration(microseconds: 300),
            height: selectedIndex == index ? 20 : 10,
            width: selectedIndex == index ? 20 : 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue,
            ),
          ),
        );
      }),
    );
  }
}
