import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Customer%20Models/view_shipment.dart';
import 'package:the_middlemen/Models/Driver%20Models/shipment_list.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/UI/Customer/Tracking/tracking.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';

class ReceivePackages extends StatefulWidget {
  const ReceivePackages({Key? key}) : super(key: key);

  @override
  _ReceivePackagesState createState() => _ReceivePackagesState();
}

class _ReceivePackagesState extends State<ReceivePackages> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewShip = getShipmentDetails();
  }
  @override
  Widget build(BuildContext context) {
    late String phoneNumber =
        Provider.of<DataProvider>(context, listen: false).phoneNumber;
    late String email =
        Provider.of<DataProvider>(context, listen: false).Email;
    return Scaffold(
      appBar: CustomAppBar(title: 'Receive Package',),
      backgroundColor: kStyleBackground,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: FutureBuilder<ShipmentList?>(
                future: _viewShip,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    var def = snapshot.data?.data;
                    var data = snapshot.data?.data?.where((element) => element?.email == email);
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 1,
                      child: ListView.builder(
                          itemCount: data?.map((e) => e?.email == email) == email ? snapshot.data?.data?.length : 1,
                          itemBuilder: (context,index){
                            if(snapshot.data?.data?[index]?.email == email){
                              var tn =snapshot.data?.data?[index]?.trackingNumber;
                              return OrdersListContent(
                                color: Colors.white,
                                trackingNo: '${def?[index]?.trackingNumber}',
                                image: def?[index]?.ofType == 'parcel'? 'assets/ShipNow/parcel.png': 'assets/ShipNow/mail.png',
                                receiver: '${def?[index]?.receiver}',
                                price: '${def?[index]?.price}',
                                onTap: (){
                                  showDialog(barrierColor: Colors.blueAccent.withOpacity(0.3),
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (_) => Stack(
                                        clipBehavior: Clip.none,
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.all(16),
                                            height: MediaQuery.of(context).size.height * 0.57,
                                            width: MediaQuery.of(context).size.width * 0.8,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(16)
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Receiver: ${def?[index]?.receiver}\n${def?[index]?.phoneNumber} \n${def?[index]?.destination}',style: kStyleNormal,),
                                                const SizedBox16(),
                                                itemDivider(),
                                                const SizedBox16(),
                                                Text('Package Details',style: kStyleNormal,),
                                                const SizedBox16(),
                                                Text('Parcel Type: ${def?[index]?.ofType}\nPackage Type: ${def?[index]?.packageType}\nWeight: ${def?[index]?.weight} kg\nDimensional Weight: ${def?[index]?.size} kg\nPayment Method: ${def?[index]?.paymentType}',style: kStyleNormal,),
                                                const SizedBox16(),
                                                itemDivider(),
                                                const SizedBox16(),
                                                Text('Tracking Number: ${def?[index]?.trackingNumber}',style: kStyleNormal,),
                                                const SizedBox16(),
                                                Text('Status: ${def?[index]?.status}',style: kStyleNormal,),
                                                const SizedBox16(),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: dialogButton(
                                                    tn: tn,
                                                    onTap: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (context){return Tracking(track: tn);}));
                                                    },
                                                    text: "TRACK",
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],));
                                },
                              );
                            }else{
                              return Center(child: Column(
                                children: [
                                  Image.asset('assets/Home/emptybox.jpg',),
                                  const SizedBox16(),
                                  Text('There are no packages that you\'re receiving at the moment.',style: kStyleNormal,textAlign: TextAlign.center,),
                                ],
                              ));
                            }

                          }),
                    );
                  }else{
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          )
        ],
      ),
    );
  }
}
