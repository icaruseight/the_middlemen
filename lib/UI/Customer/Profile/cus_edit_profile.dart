
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Customer%20Models/edit_profile.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/UI/Customer/BottomNavBar/bottom_nav_cus.dart';
import 'package:the_middlemen/UI/Customer/Home/cus_home.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/snackbar.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return BackAppBar(
        title: 'Edit Profile',
        bodyPass: const EditProfileContent(),
      );
  }
}

class EditProfileContent extends StatefulWidget {
  const EditProfileContent({Key? key}) : super(key: key);

  @override
  _EditProfileContentState createState() => _EditProfileContentState();
}

class _EditProfileContentState extends State<EditProfileContent> {
  late String token =
      Provider.of<DataProvider>(context, listen: false).token;
  late String username =
      Provider.of<DataProvider>(context, listen: false).username;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/Profile/profile.png',
                  height: 112,
                  width: 112,
                ),
                const SizedBox32(),
                 TextFormFieldForLoginRegister(
                    label: 'First Name',
                    imageName: 'assets/SignUp/personIcon.png',
                    textFieldDesignType:
                    "top" ,
                  controller: fnameController,
                ),
                 TextFormFieldForLoginRegister(
                    label: 'Last Name',
                    imageName: 'assets/SignUp/personIcon.png',
                    textFieldDesignType:
                    "noRadius",
                  controller: lnameController,
                ),
                 TextFormFieldForLoginRegister(
                    label: 'Phone',
                    imageName: 'assets/SignUp/phoneIcon.png',
                    textFieldDesignType:
                    "noRadius",
                   controller: phoneController,
                ),
                 TextFormFieldForLoginRegister(
                    label: 'Email Address',
                    imageName: 'assets/SignUp/email.png',
                    textFieldDesignType:
                    "noRadius",
                   controller: emailController,
                ),
                const SizedBox16(),
                SizedBox(
                  width: 120.sp,
                  child: ArrowButton(
                      text: 'Update',
                      color: const Color(0xff00A6FB),
                      arrow: 'assets/Profile/buttonarrow.png', onPress: ()async{
                        if(fnameController.text.isNotEmpty == true && lnameController.text.isNotEmpty == true && phoneController.text.isNotEmpty == true && emailController.text.isNotEmpty == true){
                        EditProfileModel editProfile = await NetworkHelper().updateCusProfile(fnameController.text, lnameController.text, phoneController.text, emailController.text, token, username);
                        if(editProfile.data?.username == username){
                          context.read<DataProvider>().firstName(fnameController.text);
                          context.read<DataProvider>().lastName(lnameController.text);
                          context.read<DataProvider>().pNumber(phoneController.text);
                          context.read<DataProvider>().email(emailController.text);
                          Navigator.push(context, MaterialPageRoute(builder: (context){return const BottomNavigationCus();}));
                        }
                        }else{
                          showSnackBar(
                            context,
                            "Attention",
                            Colors.blue,
                            Icons.info,
                            "Please enter all the fields",
                          );
                        }
                  },),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
