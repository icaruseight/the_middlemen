import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Driver%20Models/shipment_list.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/Widgets/appbars.dart';

class Tracking extends StatefulWidget {
  Tracking({required this.track});
  final track;

  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  int currentStep = 0;

  late String token =
      Provider.of<DataProvider>(context, listen: false).token;

  Future<ShipmentList?>? _viewShip;
  Future<ShipmentList?> getShipmentDetails() async{
    ShipmentList? list = await NetworkHelper().getShipmentList(token);
    return  list;
  }
  Future<void> refreshCollectionItems() async {

    setState(() {
      // This will update the futureItems
      _viewShip = getShipmentDetails();
    });

  }

  List<Step> getSteps() => [
    Step(
      isActive: currentStep >=0,
      title: Text('Processing',style: kStyleNormal,),
      content: Text('Your package is being processed.',style: kStyleNormal)
    ),
    Step(
        isActive: currentStep >=1,
        title: Text('On Route',style: kStyleNormal),
        content: Text('Our delivery team is on route to deliver your package',style: kStyleNormal)
    ),
    Step(
        isActive: currentStep >=2,
        title: Text('Delivered',style: kStyleNormal),
        content: Text('Your package has been delivered!',style: kStyleNormal)
    )
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewShip = getShipmentDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'Track Your Package',),
      body: ListView(
        children: [
          FutureBuilder<ShipmentList?>(
              future: _viewShip,
              builder: (context,snapshot){
                if(snapshot.hasData){
                  var data = snapshot.data?.data?.where((element) => element?.trackingNumber == widget.track);
                  var name = data?.map((e) => e?.receiver).toString().replaceAll('(', '').replaceAll(')', '');
                  var phone = data?.map((e) => e?.phoneNumber).toString().replaceAll('(', '').replaceAll(')', '');
                  var dest = data?.map((e) => e?.destination).toString().replaceAll('(', '').replaceAll(')', '');
                  var status = data?.map((e) => e?.status).toString().replaceAll('(', '').replaceAll(')', '');
                  currentStepGet(){
                    if(status == 'On Route'){

                        currentStep = 1;

                    }else if(status == 'Delivered'){
                        currentStep = 2;

                    }else{
                        currentStep = 0;
                    }
                    return currentStep;
                  }
                  return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tracking Number: ${widget.track}',style: kStyleNormal.copyWith(fontSize: 10.sp),),
                      const SizedBox16(),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [boxShadowBlue]
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.wysiwyg_rounded),
                            const SizedBox(width: 8,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Receiver:  $name',style: kStyleNormal,),
                                Text('Phone:  $phone',style: kStyleNormal,),
                                Text('$dest',style: kStyleNormal.copyWith(color: Colors.grey,fontSize: 12.sp),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox16(),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [boxShadowBlue]
                        ),
                        child: Stepper(
                          currentStep: currentStepGet(),
                          type: StepperType.vertical,
                          steps: getSteps(),
                            controlsBuilder: (context, _) {
                              return Row(
                                children: <Widget>[
                                  Container(),
                                  Container(),
                                ],
                              );
                            },

                        ),
                      ),
                    ],
                  ),
                );
              }else{
                  return Center(child: Column(
                    children: [
                      Image.asset('assets/UserType/loading.gif',width: 120,height: 120,),
                      Text('Please Wait',style: kStyleNormal,)
                    ],
                  ),);
          }})
        ],
      ),
    );
  }
}
