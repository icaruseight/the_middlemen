import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Customer%20Models/view_shipment.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_type.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/snackbar.dart';

class OrderLists extends StatefulWidget {
  const OrderLists({Key? key}) : super(key: key);

  @override
  State<OrderLists> createState() => _OrderListsState();
}

class _OrderListsState extends State<OrderLists> {
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
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'My Orders List',
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                Text('View Your Orders List',style: kStyleTitle,textAlign: TextAlign.center,),
                const SizedBox(
                  height: 24,
                ),
                Image.asset('assets/Profile/orders.png',height: 120,width: 120,),
                const SizedBox(
                  height: 24,
                ),
                FutureBuilder<ViewShipment?>(
                    future: _viewShip,
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        var def = snapshot.data?.data;
                        return Container(
                          padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 30),
                          decoration:  BoxDecoration(
                            color: kStyleAppColor,
                            boxShadow: [boxShadowBlue],
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                          ),
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: RefreshIndicator(
                            onRefresh: refreshCollectionItems,
                            child: ListView.builder(
                                reverse: false,
                                itemCount: def?.length == 0 ? 1 : def?.length,
                                itemBuilder: (context,index){

                                  if(def?.isNotEmpty == true){
                                    var tn = def?[index]?.trackingNumber;

                                  return OrdersListContent(
                                    color: kStyleBackground,
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
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        dialogButton(
                                                            tn: tn,
                                                            onTap: () {
                                                            Clipboard.setData(ClipboardData(text: '$tn'));
                                                            Navigator.pop(context);
                                                            FocusScope.of(context).requestFocus(FocusNode());
                                                            showSnackBar2(
                                                              context,
                                                              'Copied to Clipboard',
                                                              Colors.white,
                                                            );
                                                            },
                                                            text: "Copy",
                                                            color: Colors.blue,
                                                        ),
                                                        Visibility(
                                                          visible: def?[index]?.status == 'Processing'? true : false,
                                                          child: dialogButton(onTap: ()async{
                                                            await NetworkHelper().shipmentDelete(tn!, token);
                                                            Navigator.pop(context);
                                                            _viewShip = getShipmentDetails();
                                                          },
                                                            text: 'Cancel',
                                                            color: Colors.red, tn: 'tn',
                                                          )
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],));
                                    },
                                  );}else{
                                    return Center(child: Column(
                                      children: [
                                        Text('You haven\'t made an order yet\nPlease make an order to continue',textAlign: TextAlign.center,style: kStyleTitle,),
                                        const SizedBox32(),
                                        ArrowButton(text: 'Order Now', color: Colors.blue, onPress: (){
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SelectType();}));
                                        }, arrow: 'assets/Profile/buttonarrow.png')
                                      ],
                                    ));
                                  }
                                }),
                          ),
                        );
                      }else{
                        return Center(child: Column(
                          children: [
                            Image.asset('assets/UserType/loading.gif',width: 120,height: 120,),
                            Text('Please Wait',style: kStyleNormal,)
                          ],
                        ),);
                      }
                })
              ]
            ),
          ),
        ],
      ),
    );
  }
}



