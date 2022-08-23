import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/receiver_details.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_destination.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_payment.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';

class SelectPackage extends StatefulWidget {
  const SelectPackage({Key? key}) : super(key: key);

  @override
  State<SelectPackage> createState() => _SelectPackageState();
}
  final now =   DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final cheap = DateTime(now.year, now.month, now.day + 3);
  String formatter = DateFormat.yMMMMd('en_US').format(now);
  String formatter2 = DateFormat.yMMMMd('en_US').format(tomorrow);
  String formatter3 = DateFormat.yMMMMd('en_US').format(cheap);

class _SelectPackageState extends State<SelectPackage> {


  List<String> packageIcon = [
    'assets/ShipNow/express.png',
    'assets/ShipNow/normal.png',
    'assets/ShipNow/cheap.png'
  ];

  List<String> title = [
    'Express Package',
    'Normal Package',
    'Cheap Package'
  ];

  List<String> desc = [
    '20% Extra Charge\nEstimated delivery:  $formatter',
    '5% Extra Charge\nEstimated delivery:  $formatter2',
    'No Extra Charge\nEstimated delivery:  $formatter3',
  ];

  final List _selectedIndexs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'Ship Now',),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 24),
            child: Column(
              children: [
                Text('Step 3 of 6',style: kStyleTitle,),
                const SizedBox32(),
                Text('Please select your package type',style: kStyleTitle.copyWith(fontSize: 12.sp),textAlign: TextAlign.center,),
                const SizedBox16(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1.35,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        final _isSelected = _selectedIndexs.contains(index);
                        return PackageOption(
                          packageIcon: packageIcon[index],
                          onTap: () {
                              setState(
                                    () {
                                  if (_isSelected) {
                                    _selectedIndexs.remove(index);
                                  } else if (_selectedIndexs.isNotEmpty) {
                                    _selectedIndexs.clear();
                                    _selectedIndexs.add(index);
                                  } else {
                                    _selectedIndexs.add(index);
                                  }
                                },
                              );
                            },
                          isSelected: _isSelected,
                          title: title[index],
                          desc: desc[index],
                        );
                      }),
                )
              ],
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
              Navigator.of(context).pushReplacement(CustomPageRoute(child: const SelectDestination(),direction: AxisDirection.right));
            }),
            if(_selectedIndexs.isNotEmpty)
            NextBtn(() {
              getdate(){
                if(_selectedIndexs.contains(0)){
                  return formatter;
                }else if(_selectedIndexs.contains(1)){
                  return formatter2;
                }else{
                  return formatter3;
                }
              }
              context.read<DataProvider>().packageType(_selectedIndexs);
              context.read<DataProvider>().deliveryDate(getdate());
              Navigator.of(context).pushReplacement(CustomPageRoute(child: const ReceiverDetails()));
            },'Next'),
          ],
        ),
      ),
    );
  }
}

