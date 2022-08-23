import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Customer%20Models/login.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/UI/Customer/BottomNavBar/bottom_nav_cus.dart';
import 'package:the_middlemen/UI/Driver/BottomNavBar/bottom_nav_driver.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/login_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_middlemen/Widgets/show_dialog.dart';
import 'package:the_middlemen/Widgets/snackbar.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

class SelectUser extends StatefulWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  State<SelectUser> createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  bool isHiddenPassword = true;
  bool isChecked = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ConnectivityResult result = ConnectivityResult.none;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyD = GlobalKey<FormState>();
  // bool isCustomer = true;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/Logo/applogo.png',
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Column(
                  children: [
                    Text(
                      'Welcome, User',
                      style: kStyleTitle,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      'Please Select User Type',
                      style: kStyleTitle,
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: const Offset(0, 3))
                            ]),
                        child: TabBar(
                            isScrollable: true,
                            unselectedLabelStyle: TabText,
                            indicator: BoxDecoration(
                                color: kStyleAppColor,
                                borderRadius: BorderRadius.circular(4)),
                            labelColor: Colors.white,
                            labelStyle: TabText,
                            unselectedLabelColor: kStyleAppColor,
                            // Tabbar tabs
                            tabs: [
                              TabBarTabs(
                                  text: 'Customer',
                                  image: Icons.person_outline),
                              TabBarTabs(
                                text: 'Driver',
                                image: Icons.directions_bike_outlined,
                              )
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SizedBox(
                        height: 320,
                        child: TabBarView(children: [
                          //Customer Login(TAB 1)
                          Form(
                            key: _formKey,
                            child: LoginField(
                                emailController: emailController,
                                widget: PasswordTextFormField(
                                  passController: passwordController,
                                  isHiddenPassword: isHiddenPassword,
                                  icon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      isHiddenPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: kStyleAppColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isHiddenPassword = !isHiddenPassword;
                                      });
                                    },
                                  ),
                                ),
                                loginText: 'Customer Log In',
                                onPress: () async {
                                  /*    if (internetConnection())*/
                                  result =
                                      await Connectivity().checkConnectivity();
                                  if (result == ConnectivityResult.mobile ||
                                      result == ConnectivityResult.wifi) {
                                    if (_formKey.currentState!.validate()) {
                                      showWaitDialog(context, 'Please Wait...');
                                      final username = emailController.text;
                                      final password = passwordController.text;
                                      try {
                                        Login login = await NetworkHelper()
                                            .getCusLoginData(username, password);

                                        var token = login.data?.token;
                                        var fName = login.data?.user?[0]?[0]?.firstName;
                                        var lName = login.data?.user?[0]?[0]?.lastName;
                                        var phone = login.data?.user?[0]?[0]?.phone;
                                        var email = login.data?.user?[0]?[0]?.email;

                                        if (token != null) {
                                          final SharedPreferences sp = await SharedPreferences.getInstance();
                                          sp.setString('username', username);
                                          sp.setString('token', token);
                                          sp.setString('fName', fName!);
                                          sp.setString('lName', lName!);
                                          sp.setString('phone', phone!);
                                          sp.setString('email', email!);
                                          context.read<DataProvider>().tokenCus(token);
                                          context.read<DataProvider>().firstName(fName);
                                          context.read<DataProvider>().lastName(lName);
                                          context.read<DataProvider>().pNumber(phone);
                                          context.read<DataProvider>().email(email);
                                          context.read<DataProvider>().userName(username);
                                          Future.delayed(
                                            const Duration(seconds: 3),
                                              (){
                                                Navigator.of(context).pushReplacement(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                    const BottomNavigationCus(),
                                                  ),
                                                );
                                              }
                                          );
                                        }
                                      } catch (e) {
                                        Future.delayed(const Duration(milliseconds: 3000),
                                            (){
                                              Navigator.pop(context);
                                              FocusScope.of(context).requestFocus(FocusNode());
                                              showSnackBar(
                                                context,
                                                "Attention",
                                                Colors.red,
                                                Icons.info,
                                                "Credentials does not matched.",
                                              );
                                            });
                                        print(e);
                                      }
                                    } else {
                                      return print("Unsuccessful");
                                    }
                                  } else {
                                    showSnackBar(
                                      context,
                                      "Attention",
                                      Colors.blue,
                                      Icons.info,
                                      "You must be connected to the internet.",
                                    );
                                  }
                                }, isCustomer: true,),
                          ),




                          //Driver Login(TAB 2)
                          Form(
                            key: _formKeyD,
                            child: LoginField(
                              emailController: emailController,
                              widget: PasswordTextFormField(
                                passController: passwordController,
                                isHiddenPassword: isHiddenPassword,
                                icon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    isHiddenPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: kStyleAppColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isHiddenPassword = !isHiddenPassword;
                                    });
                                  },
                                ),
                              ),
                              loginText: 'Driver Log In',
                              onPress: () async {
                                result = await Connectivity().checkConnectivity();
                                if (result == ConnectivityResult.mobile ||
                                    result == ConnectivityResult.wifi) {
                                  if (_formKeyD.currentState!.validate()) {
                                    showWaitDialog(context, 'Please Wait...');
                                    final username = emailController.text;
                                    final password = passwordController.text;
                                    try {
                                      Login login = await NetworkHelper().getDriverLoginData(username, password);

                                      var token = login.data?.token;
                                      var fName = login.data?.user?[0]?[0]?.firstName;
                                      var lName = login.data?.user?[0]?[0]?.lastName;
                                      var email = login.data?.user?[0]?[0]?.email;
                                      var phone = login.data?.user?[0]?[0]?.phone;
                                      var license = login.data?.user?[0]?[0]?.license;
                                      var vehicle = login.data?.user?[0]?[0]?.vehicleNumber;
                                      if (token != null) {
                                        final SharedPreferences sp =
                                        await SharedPreferences
                                            .getInstance();
                                        sp.setString('d_username', username);
                                        sp.setString('token', token);
                                        sp.setString('fName', fName!);
                                        sp.setString('lName', lName!);
                                        sp.setString('phone', phone!);
                                        sp.setString('email', email!);
                                        sp.setString('license', license!);
                                        sp.setString('vehicle', vehicle!);
                                        context.read<DataProvider>().firstName(fName);
                                        context.read<DataProvider>().tokenCus(token);
                                        context.read<DataProvider>().lastName(lName);
                                        context.read<DataProvider>().email(email);
                                        context.read<DataProvider>().pNumber(phone);
                                        context.read<DataProvider>().licenseN(license, vehicle);

                                        Future.delayed(
                                          const Duration(seconds: 3),
                                            (){
                                              Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(
                                                  /*            settings: RouteSettings(name: '/1'),*/
                                                  builder: (context) =>
                                                  const BottomNavigationDriver(),
                                                ),
                                              );
                                            }
                                        );
                                      }
                                    } catch (e) {
                                      Future.delayed(
                                          const Duration(seconds: 3),
                                          (){
                                            Navigator.pop(context);
                                            FocusScope.of(context).requestFocus(FocusNode());
                                            showSnackBar(
                                              context,
                                              "Attention",
                                              Colors.red,
                                              Icons.info,
                                              "Credentials does not matched.",
                                            );
                                          }
                                      );

                                    }
                                  } else {
                                    return print("Unsuccessful");
                                  }
                                } else {
                                  showSnackBar(
                                    context,
                                    "Attention",
                                    Colors.blue,
                                    Icons.info,
                                    "You must be connected to the internet.",
                                  );
                                }
                              }, isCustomer: false,),
                          ),
                        ]),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
