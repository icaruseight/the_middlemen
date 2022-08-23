import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Customer%20Models/view_shipment.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/UI/Customer/Features/LiveChat.dart';
import 'package:the_middlemen/UI/Customer/Features/calculate_and_ship.dart';
import 'package:the_middlemen/UI/Customer/Features/qr_scan_cus.dart';
import 'package:the_middlemen/UI/Customer/Features/receive_packages.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_type.dart';
import 'package:the_middlemen/UI/Customer/Tracking/tracking.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/snackbar.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

class CusHome extends StatelessWidget {
  const CusHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: BottomNavAppBar(
        title: 'Home',
      ),
      body: const CusHomeContent(),
    );
  }
}

class CusHomeContent extends StatefulWidget {
  const CusHomeContent({Key? key}) : super(key: key);

  @override
  _CusHomeContentState createState() => _CusHomeContentState();
}

class _CusHomeContentState extends State<CusHomeContent> {
  final TextEditingController trackController = TextEditingController();
  late String token =
      Provider.of<DataProvider>(context, listen: false).token;

  Future<ViewShipment?>? _viewShip;
  Future<ViewShipment?> getShipmentDetails() async{
    ViewShipment? list = await NetworkHelper().getViewShipmentData(token);
    return  list;
  }
  Future<void> refreshCollectionItems() async {

    setState(() {
      // This will update the futureItems
      _viewShip = getShipmentDetails();
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewShip = getShipmentDetails();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kStyleContainer,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [boxShadow]
                ),
                child: Column(
                  children: [
                    Text(
                      'Welcome to The Middlemen!',
                      style: kStyleTitle,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Ready to ship your package?',
                      style: kStyleNormal.copyWith(letterSpacing: 1),
                      textAlign: TextAlign.left,
                    ),
                    Image.asset('assets/Home/rider.png',height: 200,),
                    ArrowButton(
                        text: 'SHIP NOW',
                        color: const Color(0xff00A6FB),
                        onPress: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){return const SelectType();}));
                        },
                        arrow: 'assets/Profile/buttonarrow.png'),
                    const SizedBox(
                      height: 36,
                    ),
                    Text(
                      'To track your package please enter your tracking number',
                      style: kStyleNormal.copyWith(letterSpacing: 1),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    FutureBuilder<ViewShipment?>(
                        future: _viewShip,
                        builder: (context,snapshot){
                          var data = snapshot.data?.data?.where((element) => element?.trackingNumber == trackController.text);
                          return Column(
                            children: [
                              TrackingFormField('Enter your tracking number',
                                  Icons.backpack_outlined, trackController, (String? value) {
                                    if (value!.isEmpty) {
                                      return "This field is required";
                                    }
                                  }),
                              const SizedBox(
                                height: 16,
                              ),
                              ArrowButton(text: 'TRACK NOW', color: const Color(0xff00A6FB),
                                  onPress: (){
                                    if( data?.isNotEmpty == true)
                                     {
                                      Navigator.push(context, MaterialPageRoute(builder: (context){return Tracking(track: trackController.text);}));
                                    }else{
                                      showSnackBar(
                                        context,
                                        "Attention",
                                        Colors.red,
                                        Icons.info,
                                        "Shipment with the provided tracking number doesn\'t exist ",
                                      );
                                    }

                                  }, arrow: 'assets/Profile/buttonarrow.png'),
                            ],
                          );
                        }),
                    const SizedBox(
                      height: 16,
                    ),

                  ],
                ),
              ),
             const SizedBox(height: 60,),
             Column(
               children: [
                 Text(
                     'What are you looking for?',
                   style: kStyleTitle.copyWith(fontSize: 14.sp),
                 ),
                 const SizedBox(height: 16,),
                 Text(
                     'Here are our features',
                   style: kStyleNormal.copyWith(color: Colors.grey),
                 ),
                 const SizedBox(height: 24,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Features(icon: Icons.calculate_outlined,text: 'Calculate and ship packages',onPress: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context){return const CalculateAndShip();}));
                     },),
                     Features(icon: Icons.receipt_outlined, text: 'Receive Packages',onPress: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context){return const ReceivePackages();}));
                     },)
                   ],
                 ),
                 const SizedBox(height: 16,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Features(icon: Icons.scanner_outlined,text: 'QR Scan to track packages',onPress: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context){return const QRScannerCus();}));
                     },),
                     Features(icon: Icons.report, text: 'Support',onPress: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context){return const LiveChat();}));
                     },)
                   ],
                 ),
               ],
             )
            ],
          ),
        )
      ],
    );
  }
}


