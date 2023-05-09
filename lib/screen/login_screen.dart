import 'package:flutter/material.dart';
import 'package:friends/resource/app_color.dart';
import 'package:friends/screen/register_screen.dart';
import 'package:friends/widget/custom_button.dart';
import 'package:friends/widget/custom_button_login.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( leading: IconButton(
      icon:   Image.asset('assets/image/arrow.png'),
      onPressed: () {},
    ),),

      body: Padding(padding: EdgeInsets.all(16),
        child: Column(
          children: [
           Padding(padding: const EdgeInsets.all(16),child: Image.asset( 'assets/image/login.png')),

            const SizedBox(height: 8),
            const Text('Let s you in',style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold)),
            CustomButtonLogin(color: AppColors.witheTheme,title: 'Countinue with Facebook', onPressed: () {  }, icons:'assets/image/facebook.png',),
            const SizedBox(height: 8),
            CustomButtonLogin(color: AppColors.witheTheme,title: 'Countinue with Google', onPressed: () {  },icons: 'assets/image/google.png'),
            const SizedBox(height: 8),
            CustomButtonLogin(color: AppColors.witheTheme,title: 'Countinue with Apple', onPressed: () {  }, icons:'assets/image/apple.png',),

            Row(children: <Widget>[
              Expanded(
                flex:2,
                child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: const Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
              const Text(
              'or',
                style: TextStyle(color: AppColors.txtBlack, fontSize: 12),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: const Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
            ]),

            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.all(8),
              child: CustomButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const RegisterScreen();
                    },
                  ));
                },

                color: AppColors.colorApp,
                title: 'Sing in with password'
              ),
            ),
          ],

        ),
      ),
    );
  }
}
