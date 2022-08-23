import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Select%20User/select_user.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';

class DriverProfile extends StatelessWidget {
  const DriverProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: BottomNavAppBar(
        title: 'Profile',
      ),
      body: const DriverProfileContent(),
    );
  }
}

class DriverProfileContent extends StatefulWidget {
  const DriverProfileContent({Key? key}) : super(key: key);

  @override
  _DriverProfileContentState createState() => _DriverProfileContentState();
}

class _DriverProfileContentState extends State<DriverProfileContent> {
  late String fName =
      Provider.of<DataProvider>(context, listen: false).fName;
  late String lName =
      Provider.of<DataProvider>(context, listen: false).lName;
  late String phoneNumber =
      Provider.of<DataProvider>(context, listen: false).phoneNumber;
  late String license =
      Provider.of<DataProvider>(context, listen: false).license;
  late String vehicle =
      Provider.of<DataProvider>(context, listen: false).vehicle;
  late String email =
      Provider.of<DataProvider>(context, listen: false).Email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        color: kStyleAppColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          boxShadowBlue,
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/Profile/driver.png',height: 50,width: 50,),
                                const SizedBox(width: 16,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('$fName $lName',style: kStyleNormal.copyWith(
                                          fontWeight: FontWeight.w500),),
                                      const SizedBox(height: 8,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          const Icon(Icons.email_outlined,color: Colors.black,
                                            size: 20,),
                                          const SizedBox(width: 4,),
                                          Expanded(
                                            child: Text(email,style: kStyleNormal.copyWith(
                                                color: const Color(0xff292929),
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400),),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 8,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.phone_outlined,color: Colors.black,
                                            size: 20,),
                                          const SizedBox(width: 4,),
                                          Text(phoneNumber,style: kStyleNormal.copyWith(
                                              color: const Color(0xff292929),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),)
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: profileContent(icon: 'assets/Profile/license.png',desc: 'License no.',value: license,)),
              ],
            ),
            Row(
              children: [
                Expanded(child: profileContent(icon: 'assets/DriverProfile/vehicle.png',desc: 'Vehicle no.',value: vehicle,)),
              ],
            ),
            const SizedBox(height: 12,),
            ArrowButton(
              text: 'LOGOUT',
              color: const Color(0xffFF3D3D),
              onPress: () async {
                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.remove('username');
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return const SelectUser();}));
              },
              arrow: 'assets/Profile/forwardarrowred.png',
            )
          ],
        ),
      ),
    );
  }
}
