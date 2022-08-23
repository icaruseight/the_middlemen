import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Widgets/appbars.dart';

class PrivacyAndPolicy extends StatelessWidget {
  const PrivacyAndPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'Privacy Policy',),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('It is important for us to collect, store, use, process, distribute, and update the personal data of all users in order to offer our platform\'s users with our service. This Privacy and Personal Data Collection Policy (Privacy Policy) is offered to help our platform\'s users understand our policies regarding the collection and use of personal data.',style: kStyleNormal,),
            const SizedBox16(),
            Text('We strongly advise all users to read over our Privacy Policy and make sure they understand it. We also advise all users to check our website\'s Privacy Policy on a frequent basis, since it may be amended and changed at any time.',style: kStyleNormal,),
            const SizedBox16(),
            Text('BY USING OUR SERVICE, YOU AGREE TO OUR PRIVACY POLICY AND AGREE TO THE COLLECTION, STORAGE, USE, PROCESSING, SHARING, AND UPDATING OF YOUR PERSONAL DATA FOR THE PURPOSE OF PROVIDING OUR SERVICE.',style: kStyleNormal,),
            const SizedBox16(),
            Text('Whose personal data do we collect?',style: kStyleNormal.copyWith(fontWeight: FontWeight.w700),),
            const SizedBox16(),
            Text('We collect personal data only from those who use our platform to seek and obtain delivery service and those who provide delivery service through our platform.',style: kStyleNormal,),
            const SizedBox16(),
            Text('What kind of personal data do we collect?',style: kStyleNormal.copyWith(fontWeight: FontWeight.w700),),
            const SizedBox16(),
            Text('We collect information that may be necessary for us to assist users of our platform (either those who place delivery requests or those who provide delivery service as asked) in obtaining or providing delivery services. Addresses, phone numbers, emails, physical locations, and any other information that may be beneficial in the process of providing our services are examples of this data.',style: kStyleNormal,)
          ],
        ),
      ),
    );
  }
}
