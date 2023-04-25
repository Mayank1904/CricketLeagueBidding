import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../resources/constants/colors.dart';
import '../components/skipper_scaffold.dart';
import '../components/skipper_text.dart';
import 'login_screen.dart';
import 'register_screen.dart';

import '../../models/intro/slider_model.dart';
import 'widgets/slider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SkipperScaffold(
      body: Column(children: [
        Expanded(
          // PageView Builder
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: slides.length,
              itemBuilder: (context, index) {
                // Contents of Slider that we
                // created in Modal Class
                return SliderWidget(
                  image: slides[index].getImage() ?? '',
                  title: slides[index].getTitle() ?? '',
                  description: slides[index].getDescription() ?? '',
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            slides.length,
            (index) => buildDot(index, context),
          ),
        ),
        Column(
          children: [
            Container(
              height: 40,
              margin: const EdgeInsets.all(20.0),
              width: double.infinity,
              color: AppColors.yellow,

              // Button
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()),
                  );

                  // _controller.nextPage(
                  //     duration: const Duration(milliseconds: 100),
                  //     curve: Curves.bounceIn);
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: SkipperText.bodyBold(
                  "Register",
                  color: AppColors.black,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Invited by a friend?\n',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Enter code',
                            style: TextStyle(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Already a user?\n',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Log in',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }

  Container buildDot(int index, BuildContext context) {
    // Another Container returned
    return Container(
      height: 5.0,
      width: currentIndex == index ? 20 : 5,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.yellow,
      ),
    );
  }
}
