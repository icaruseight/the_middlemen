import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/Profile/orders_list.dart';
import 'package:the_middlemen/UI/Select%20User/select_user.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';

import 'cus_edit_profile.dart';

class CusProfile extends StatelessWidget {
  const CusProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: BottomNavAppBar(
        title: 'Profile',
      ),
      body: const CusProfileContent(),
    );
  }
}

class CusProfileContent extends StatefulWidget {
  const CusProfileContent({Key? key}) : super(key: key);

  @override
  _CusProfileContentState createState() => _CusProfileContentState();
}

class _CusProfileContentState extends State<CusProfileContent> {

  @override
  Widget build(BuildContext context) {
    late String fName =
        Provider.of<DataProvider>(context, listen: false).fName;
    late String lName =
        Provider.of<DataProvider>(context, listen: false).lName;
    late String phoneNumber =
        Provider.of<DataProvider>(context, listen: false).phoneNumber;
    late String email =
        Provider.of<DataProvider>(context, listen: false).Email;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 34.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Profile Picture
                    Image.asset(
                      'assets/Profile/profile.png',
                      height: 75,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    //Profile Details
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$fName $lName',
                          style: kStyleNormal.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff444647)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/SignUp/phoneIcon.png',height: 18,width: 18,),
                            const SizedBox(width: 8,),
                            Text(
                              phoneNumber,
                              style: kStyleButton,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/SignUp/email.png',height: 18,width: 18,),
                            const SizedBox(width: 8,),
                            Text(
                              email,
                              style: kStyleButton,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Profile Menu Items
          Padding(
            padding: const EdgeInsets.only(top: 33.0, bottom: 24),
            child: Column(
              children: [
                ContentItems(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){return const OrderLists();}));
                  },
                  image: 'assets/Profile/menu.png',
                  label: 'My Orders List',
                  containerDesignType: 'top',
                ),
                itemDivider(),
                ContentItems(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const EditProfile();
                    }));
                  },
                  image: 'assets/Profile/profileicon.png',
                  label: 'Edit Profile',
                  containerDesignType: 'bottom',
                ),
              ],
            ),
          ),

          ArrowButton(
            text: 'LOGOUT',
            color: const Color(0xffFF3D3D),
            onPress: ()async{
              final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.remove('username');
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return const SelectUser();}));
            },
            arrow: 'assets/Profile/forwardarrowred.png',
          )
        ],
      ),
    );
  }
}