import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Driver%20Models/shipment_list.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/UI/Driver/Home/delivered.dart';
import 'package:the_middlemen/UI/Driver/Home/pending.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/driver_orders.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';

import '../qr_scan.dart';

class DriverHome extends StatelessWidget {
  const DriverHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: BottomNavAppBar(
        title: 'Orders',
      ),
      body: const DriverHomeContent(),
    );
  }
}

class DriverHomeContent extends StatefulWidget {
  const DriverHomeContent({Key? key}) : super(key: key);

  @override
  _DriverHomeContentState createState() => _DriverHomeContentState();
}

class _DriverHomeContentState extends State<DriverHomeContent> {
  late String token =
      Provider.of<DataProvider>(context, listen: false).token;

  Future<ShipmentList?>? _shipmentList;
  Future<ShipmentList?> getShipmentDetails() async{
    ShipmentList? list = await NetworkHelper().getShipmentList(token);
    return  list;
  }

  Future<void> refreshCollectionItems() async {

      setState(() {
        // This will update the futureItems
        _shipmentList = getShipmentDetails();
      });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _shipmentList = getShipmentDetails();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
                color: const Color(0xffF5FCFF),
                height: double.infinity,
                width: double.infinity,
                child: SafeArea(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 40,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
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
                              // Tab bar tabs
                              tabs: [
                                TabBarTabsD(
                                  text: 'Assigned'
                                ),
                                TabBarTabsD(text: 'Delivered')
                              ]),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TabBarView(
                            children: [

                              RefreshIndicator(
                                onRefresh: refreshCollectionItems,
                                child: ListView(
                                  children: [
                                    FutureBuilder<ShipmentList?>(
                                      future: _shipmentList,
                                      builder: (context, snapshot) {
                                        if(snapshot.hasData){
                                          var def = snapshot.data?.data;
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              physics: const ScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              itemCount: def?.length,
                                              itemBuilder: (BuildContext context,
                                                  int index){
                                                if(def?[index]?.status == "On Route"){
                                                return pendingOrder(
                                                    name: '${def?[index]?.receiver}',
                                                    location: '${def?[index]?.destination}',
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context){return PendingOrder(
                                                      id: def?[index]?.id,
                                                      payment: def?[index]?.paymentType,
                                                      deliveryDate: def?[index]?.deliveryDate,
                                                      ofType: def?[index]?.ofType,
                                                      package: def?[index]?.packageType,
                                                      weight: def?[index]?.weight,
                                                      size: def?[index]?.size,
                                                      price: def?[index]?.price,
                                                      rname: def?[index]?.receiver,
                                                      rphone: def?[index]?.phoneNumber,
                                                      remail: def?[index]?.email,
                                                      dest: def?[index]?.destination,
                                                      tracking: def?[index]?.trackingNumber,
                                                    );}));
                                                  });}else{
                                                  return Container();
                                                }
                                              }
                                          );
                                        }else{
                                          return Center(child: Column(
                                            children: [
                                              Image.asset('assets/UserType/loading.gif',width: 120,height: 120,),
                                              Text('Please Wait',style: kStyleNormal,)
                                            ],
                                          ),);
                                        }
                                      }
                                    ),
                                    const SizedBox16(),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24),
                                        child: itemDivider()),
                                    const SizedBox16(),
                                    Text('Scan tracking label to begin deliveries',style: kStyleNormal,textAlign: TextAlign.center,),
                                    Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Column(
                                        children: [
                                          ArrowButton(
                                              text: 'SCAN',
                                              color: const Color(0xff00A6FB),
                                              onPress: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context){return const QRScanner();}));
                                              },
                                              arrow: 'assets/Profile/buttonarrow.png'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //DeliveredTAB
                              RefreshIndicator(
                                onRefresh: refreshCollectionItems,
                                child: ListView(
                                  children: [
                                    FutureBuilder<ShipmentList?>(
                                      future: _shipmentList,
                                        builder: (context, snapshot) {
                                          if(snapshot.hasData){
                                            var data = snapshot.data?.data?.where((element) => element?.status == 'Delivered');
                                            var def = snapshot.data?.data;
                                            return ListView.builder(
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                itemCount: data?.map((e) => e?.status == 'Delivered') == 'Delivered' ? snapshot.data?.data?.length : 1,
                                                itemBuilder: (BuildContext context,
                                                    int index){
                                                  if(def?[index]?.status == "Delivered"){
                                                    return pendingOrder(
                                                        name: '${def?[index]?.receiver}',
                                                        location: '${def?[index]?.destination}',
                                                        onTap: (){
                                                        Navigator.push(context, MaterialPageRoute(builder: (context){return DeliveredOrder(
                                                          id: def?[index]?.id,
                                                          payment: def?[index]?.paymentType,
                                                          deliveryDate: def?[index]?.deliveryDate,
                                                          ofType: def?[index]?.ofType,
                                                          package: def?[index]?.packageType,
                                                          weight: def?[index]?.weight,
                                                          size: def?[index]?.size,
                                                          price: def?[index]?.price,
                                                          rname: def?[index]?.receiver,
                                                          rphone: def?[index]?.phoneNumber,
                                                          remail: def?[index]?.email,
                                                          dest: def?[index]?.destination,
                                                        );}));
                                                      },);}else{
                                                    return Center(
                                                      child: Text('You haven\'t delivered an order yet.',style: kStyleNormal,),
                                                    );
                                                  }
                                                }
                                            );
                                          }else{
                                            return Center(child: Column(
                                              children: [
                                                Image.asset('assets/UserType/loading.gif',width: 120,height: 120,),
                                                Text('Please Wait',style: kStyleNormal,)
                                              ],
                                            ),);
                                          }
                                        }
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        );
  }
}
