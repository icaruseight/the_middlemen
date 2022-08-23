

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_package_option.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_payment.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

class ReceiverDetails extends StatefulWidget {
  const ReceiverDetails({Key? key}) : super(key: key);

  @override
  State<ReceiverDetails> createState() => _ReceiverDetailsState();
}

class _ReceiverDetailsState extends State<ReceiverDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'Ship Now',),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text('Step 4 of 6 ',style: kStyleTitle,),
                  const SizedBox16(),
                  Text('Please enter the receiver\'s details',style: kStyleNormal,),
                  const SizedBox32(),
                  BlueTextFormField(
                    hintText: 'Name',
                    icon: Icons.person_outline,
                    controller: nameController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter the receiver\'s Name";
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
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * 0.15.sp,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviousBtn(() {
              Navigator.of(context).pushReplacement(CustomPageRoute(child: const SelectPackage(),direction: AxisDirection.right));
            }),
              if(nameController.text.isNotEmpty && phoneNoController.text.isNotEmpty && emailController.text.isNotEmpty)
              NextBtn(() {
                Navigator.of(context).pushReplacement(CustomPageRoute(child: const SelectPayment()));
                context.read<DataProvider>().receiverInfo(nameController.text,phoneNoController.text,emailController.text);
              },'Next'),
          ],
        ),
      ),
    );
  }
}