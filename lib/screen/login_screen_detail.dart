
import 'package:flutter/material.dart';
import 'package:friends/resource/app_color.dart';
import 'package:friends/widget/custom_button.dart';
import 'package:friends/widget/custom_container.dart';
import 'package:friends/widget/custom_password_filed.dart';
import 'package:friends/widget/custom_text_filed.dart';
import 'package:friends/widget/email_field.dart';
class LoginScreenDetail extends StatefulWidget {
  const LoginScreenDetail({Key? key}) : super(key: key);

  @override
  State<LoginScreenDetail> createState() => _LoginScreenDetailState();
}

class _LoginScreenDetailState extends State<LoginScreenDetail> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool? check1 = false;
    return Scaffold(
      appBar: AppBar( leading: IconButton(
        icon:   Image.asset('assets/image/arrow.png'),
        onPressed: () {},
      ),),

      body: Padding(padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(16),child: Image.asset( 'assets/image/pic_top.png')),

              const SizedBox(height: 8),
              const Text('Create Your Account',style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold)),

              const SizedBox(height: 16),
              EmailField(controller:emailController ,hint: 'Email',),
              const SizedBox(height: 16),
              CustomPasswordFiled(label:'Password', controller: passwordController,obscureText: true),
              const SizedBox(height: 16),

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Remember me'),
                  Checkbox( //only check box
                      value: check1, //unchecked
                      onChanged: (bool? value){
                        //value returned when checkbox is clicked
                        setState(() {
                          check1 = value;
                        });
                      }
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(8),
                child: CustomButton(
                    onPressed: () {

                    },

                    color: AppColors.colorApp,
                    title: 'Sing up'
                ),
              ),
            const SizedBox(height: 8),
              const Text('Forgot the password?',style: TextStyle(color: AppColors.colorApp),),
            const SizedBox(height: 16,),
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
                  'or continue with',
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

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CustomContainer(
                    icon: 'assets/image/facebook.png',
                  ),
                  SizedBox(width: 8,),
                  CustomContainer(
                    icon: 'assets/image/google.png',
                  ),
                  SizedBox(width: 8,),
                  CustomContainer(
                    icon: 'assets/image/apple.png',
                  )
                ],
              )
            ],

          ),
        ),
      ),
    );
  }
}
