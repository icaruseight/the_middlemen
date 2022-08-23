import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/BottomNavBar/bottom_nav_cus.dart';
import 'package:the_middlemen/UI/Customer/SignUp/sign_up.dart';
import 'package:the_middlemen/UI/Driver/Driver%20Sign%20Up/d_sign_up.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

import 'buttons.dart';

class LoginField extends StatelessWidget {
   LoginField({
    Key? key,
    required this.emailController,required this.widget,required this.loginText,
    required this.onPress,required this.isCustomer
  }) : super(key: key);

  final TextEditingController emailController;
  final widget;
  final loginText;
  final onPress;
  bool isCustomer;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(loginText,style: kStyleTitle,),
              const SizedBox(height: 20,),
              BlueTextFormField(
                hintText: 'Username',
                icon: Icons.person_outline,
                controller: emailController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "This field is required";
                  }
                  }
              ),
              const SizedBox(height: 16,),
              widget,
              const SizedBox(height: 32,),
              LoginButton(text: 'LOGIN', onPress: onPress, color: kStyleAppColor),
          const SizedBox(
            height: 20.0,
          ),
          isCustomer == true ?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don’t have an account?  ',
                style: TextStyle(
                  fontFamily: 'NutinoSansReg',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff333333),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushAndRemoveUntil(
                    MaterialPageRoute(
                      /*            settings: RouteSettings(name: '/1'),*/
                      builder: (context) => SignupPage(),
                    ),
                    ModalRoute.withName('/'),
                  );
                  /*         Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) => SignupPage(),
                                        ),
                                        (route) => false);*/
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'NutinoSansReg',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3F84FC),
                  ),
                ),
              ),
            ],
          ) :
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please register if you haven\'t yet?  ',
                style: TextStyle(
                  fontFamily: 'NutinoSansReg',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff333333),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushAndRemoveUntil(
                    MaterialPageRoute(
                      /*            settings: RouteSettings(name: '/1'),*/
                      builder: (context) => DSignupPage(),
                    ),
                    ModalRoute.withName('/'),
                  );
                  /*         Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) => SignupPage(),
                                        ),
                                        (route) => false);*/
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontFamily: 'NutinoSansReg',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3F84FC),
                  ),
                ),
              ),
            ],
          )
          ]
        ),
        ),
      ],
    );
  }
}
