import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Customer%20Models/signup.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/UI/Select%20User/select_user.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/snackbar.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

class DSignupPage extends StatefulWidget {
  const DSignupPage({Key? key}) : super(key: key);

  @override
  _DSignupPageState createState() => _DSignupPageState();
}

class _DSignupPageState extends State<DSignupPage> {
  bool isHiddenPassword = true;
  bool isConfirmHiddenPassword = true;
  bool isChecked = false;
  ConnectivityResult result = ConnectivityResult.none;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();
  final TextEditingController vehicleController = TextEditingController();
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
                            const SizedBox(
                              height: 32.00,
                            ),
                            //USERNAME
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
                            //EMAIL
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
                            //FIRST NAME
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
                            //LAST NAME
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
                            //PHONE NUMBER
                            BlueTextFormFieldPN(
                              'Phone no.',
                              'assets/SignUp/phone.png',
                              phoneNoController,
                                  (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter phone number";
                                }
                                if (value.length < 10) {
                                  return "Please enter valid phone number";
                                }
                                return null;
                              },
                            ),
                            const SizedBox16(),
                            //LICENSE NUMBER
                            BlueTextFormField(
                              hintText: 'License No.',
                              icon: Icons.featured_video_sharp,
                              controller: licenseController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter your License Number";
                                }
                                return null;
                              },
                            ),
                            const SizedBox16(),
                            //VEHICLE NUMBER
                            BlueTextFormField(
                              hintText: 'Vehicle No.',
                              icon: Icons.directions_bike,
                              controller: vehicleController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter your Vehicle Number";
                                }
                                return null;
                              },
                            ),
                            const SizedBox16(),
                            //PASSWORD
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
                            //CONFIRM PASSWORD
                            ConfirmPassword(
                              confirmPasswordController: confirmPasswordController,
                              isConfirmHiddenPassword: isConfirmHiddenPassword,
                              passwordController: passwordController,
                              onPress: (){
                                setState(() {
                                  isConfirmHiddenPassword = !isConfirmHiddenPassword;
                                });
                              },),
                            const SizedBox(
                              height: 32.0,
                            ),
                            //SIGN UP BUTTON
                            LoginButton(text: 'REGISTER', onPress: () async{
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
                                  final license = licenseController.text;
                                  final vehicle = vehicleController.text;
                                  SharedPreferences sp = await SharedPreferences.getInstance();
                                  try {
                                    SignUp? signup = await NetworkHelper()
                                        .getDriverSignUpData(username, email, firstName,lastName,
                                        password, phone, license, vehicle);
                                    var token = signup?.token;
                                    if (token != null) {
                                      sp.setString('fName', firstName);
                                      sp.setString('lName', lastName);
                                      sp.setString('phone', phone);
                                      context.read<DataProvider>().firstName(firstName);
                                      context.read<DataProvider>().lastName(lastName);
                                      context.read<DataProvider>().pNumber(phone);
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
                                      style: kStyleNormal.copyWith(color: const Color(0xff3F84FC),fontWeight: FontWeight.w500)
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




