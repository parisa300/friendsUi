
import 'package:flutter/material.dart';
import 'package:friends/resource/app_color.dart';
import 'package:friends/screen/list_onboarding.dart';
import 'package:friends/screen/login_screen.dart';
import 'package:friends/widget/custom_button.dart';

class OnBoardingSplash extends StatefulWidget {
  const OnBoardingSplash({Key? key}) : super(key: key);

  @override
  State<OnBoardingSplash> createState() => _OnBoardingSplashState();
}

class _OnBoardingSplashState extends State<OnBoardingSplash> {
  var list =ListOnBoarding().splashData;
  final _controller = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _controller,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      //  child: Image.asset('assets/images/logo.png'),
                      ),
                      Spacer(flex: 2),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          list[index]['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF424242),
                          ),
                        ),
                      ),

                      const Spacer(
                        flex: 2,
                      ),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          list[index]['image']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Spacer(),
                    ],
                  );
                },
                onPageChanged: (value) => setState(() => _currentPage = value),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        list.length,
                            (int index) => _buildDots(index: index),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: CustomButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,

                          );

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ));
                        },

                        color: AppColors.colorApp,
                        title: _currentPage + 1 == list.length
                            ? 'Finish'
                            : 'Next',
                      ),
                      ),
                    ),

                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  AnimatedContainer _buildDots({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xFF293241),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }
  }



