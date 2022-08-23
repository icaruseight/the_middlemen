import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Customer%20Models/signup.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/UI/Select%20User/select_user.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/snackbar.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isHiddenPassword = true;
  bool isConfirmHiddenPassword = true;
  bool isChecked = false;
  ConnectivityResult result = ConnectivityResult.none;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackAppBar(
        title: 'Sign Up',
        bodyPass: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            reverse: false,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox32(),
                            BlueTextFormField(
                              hintText: 'Username',
                              icon: Icons.person_outline,
                              controller: nameController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter username";
                                }
                                return null;
                              },
                            ),
                            const SizedBox16(),
                            BlueTextFormField(
                              hintText: 'Email',
                              icon: Icons.email_outlined,
                              controller: emailController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter email";
                                }
                                if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return "Please enter valid email";
                                }
                                return null;
                              },
                            ),
                            const SizedBox16(),
                            BlueTextFormField(
                              hintText: 'First Name',
                              icon: Icons.person_outline,
                              controller: fNameController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter your First Name";
                                }
                                return null;
                              },
                            ),
                            const SizedBox16(),
                            BlueTextFormField(
                              hintText: 'Last Name',
                              icon: Icons.person_outline,
                              controller: lNameController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter your Last Name";
                                }
                                return null;
                              },
                            ),
                            const SizedBox16(),
                            BlueTextFormFieldPN(
                              'Phone no.',
                              'assets/SignUp/phone.png',
                              phoneNoController,
                                  (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter your phone number";
                                }
                                if (value.length < 10) {
                                  return "Please enter valid phone number";
                                }
                                return null;
                              },
                            ),
                            const SizedBox16(),
                            SignUpPass(
                              passwordController: passwordController,
                              isHiddenPassword: isHiddenPassword,
                              isConfirmHiddenPassword: isConfirmHiddenPassword,
                              onPress: (){
                              setState(() {
                                isHiddenPassword = !isHiddenPassword;
                              });
                            },),
                            const SizedBox16(),
                            ConfirmPassword(
                              confirmPasswordController: confirmPasswordController,
                              isConfirmHiddenPassword: isConfirmHiddenPassword,
                              passwordController: passwordController,
                              onPress: (){
                              setState(() {
                                isConfirmHiddenPassword = !isConfirmHiddenPassword;
                              });
                            },),
                            const SizedBox32(),
                            LoginButton(text: 'Sign Up', onPress: () async{
                              result =
                              await Connectivity().checkConnectivity();
                              if (result == ConnectivityResult.mobile ||
                                  result == ConnectivityResult.wifi) {
                                if (_formKey.currentState!.validate()) {

                                  final username = nameController.text;
                                  final email = emailController.text;
                                  final firstName = fNameController.text;
                                  final lastName = lNameController.text;
                                  final phone = phoneNoController.text;
                                  final password = passwordController.text;
                                  try {
                                    SignUp? signup = await NetworkHelper()
                                        .getCusSignUpData(username, email, firstName,lastName,
                                        password,phone);
                                    var token = signup?.token;
                                    if (token != null) {
                                      showSnackBar(
                                        context,
                                        "Success",
                                        Colors.green,
                                        Icons.info,
                                        "Your account has been registered.",
                                      );
                                      Navigator.of(context)
                                          .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SelectUser(),
                                          ),
                                              (route) => route.isFirst);
                                    }
                                  } catch (e) {
                                    showSnackBar(
                                      context,
                                      "Attention",
                                      Colors.red,
                                      Icons.info,
                                      "The email has already been taken.",
                                    );
                                    print(e);
                                  }
                                }else {
                                  return print("Unsuccessful");
                                }
                              }else {
                                showSnackBar(
                                  context,
                                  "Attention",
                                  Colors.blue,
                                  Icons.info,
                                  "You must be connected to the internet.",
                                );
                              }
                            },color: kStyleAppColor),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?  ',
                                  style: kStyleNormal.copyWith(color: Colors.grey)
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => const SelectUser(),
                                      ),
                                      ModalRoute.withName('/'),
                                    );
                                  },
                                  child: Text(
                                    'Log In',
                                    style: kStyleNormal.copyWith(color: Color(0xff3F84FC),fontWeight: FontWeight.w500)
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


