import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/Settings/privacy_and_policy.dart';
import 'package:the_middlemen/UI/Customer/Settings/terms_and_conditions.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/show_dialog.dart';

import 'faq.dart';

class CusSettings extends StatelessWidget {
  const CusSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kStyleBackground,
      appBar: BottomNavAppBar(
        title: 'Settings',
      ),
      body: const CusSettingsContent(),
    );
  }
}



class CusSettingsContent extends StatefulWidget {
  const CusSettingsContent({Key? key}) : super(key: key);

  @override
  _CusSettingsContentState createState() => _CusSettingsContentState();
}

class _CusSettingsContentState extends State<CusSettingsContent> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Column(
            children: [
              ContentItems(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FAQ();
                  }));
                },
                image: 'assets/Settings/faq.png',
                label: 'FAQ',
                containerDesignType: 'top',
              ),
              itemDivider(),
              ContentItems(
                onTap: () {
                  showFeedbackDialog(context);
                },
                image: 'assets/Settings/rateus.png',
                label: 'Rate Us',
                containerDesignType: 'both',
              ),
              itemDivider(),
              ContentItems(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PrivacyAndPolicy();
                  }));
                },
                image: 'assets/Settings/privacy.png',
                label: 'Privacy Policy',
                containerDesignType: 'both',
              ),
              itemDivider(),
              ContentItems(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TermsAndConditions();
                  }));
                },
                image: 'assets/Settings/terms.png',
                label: 'Terms and Conditions',
                containerDesignType: 'bottom',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
