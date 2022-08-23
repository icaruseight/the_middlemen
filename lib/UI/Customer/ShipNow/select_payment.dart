import 'dart:core';

import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Models/Customer%20Models/pricing.dart';
import 'package:the_middlemen/Models/Customer%20Models/shipment.dart';
import 'package:the_middlemen/Nerwork/network_helper.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/receiver_details.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/tracking_label.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/snackbar.dart';

class SelectPayment extends StatefulWidget {
  const SelectPayment({Key? key}) : super(key: key);

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  final List _selectedPaymentT = [];

  List<String> images = [
    'assets/ShipNow/cod.png',
    'assets/ShipNow/esewa.png'
  ];

  List name = [
    'Cash on Delivery',
    'eSewa'
  ];
  late List parcelType =
      Provider.of<DataProvider>(context, listen: false).parcelType;
  late String weight =
      Provider.of<DataProvider>(context, listen: false).weightT;
  late double size =
      Provider.of<DataProvider>(context, listen: false).sizeT;
  late String rname =
      Provider.of<DataProvider>(context, listen: false).reName;
  late String rphone =
      Provider.of<DataProvider>(context, listen: false).rePhone;
  late String remail =
      Provider.of<DataProvider>(context, listen: false).reEmail;
  late List selectedPackage =
      Provider.of<DataProvider>(context, listen: false).pacType;
  late String start =
      Provider.of<DataProvider>(context, listen: false).startAd;
  late String dest =
      Provider.of<DataProvider>(context, listen: false).destAd;
  late String token =
      Provider.of<DataProvider>(context, listen: false).token;
  late String deliveryDate =
      Provider.of<DataProvider>(context, listen: false).date;
  late String distance =
      Provider.of<DataProvider>(context, listen: false).dist;

  
  //Function to differentiate parcel type
  parType(){
    String parcel;
    if(parcelType.contains(0)){
      parcel = 'Document';
    }else{
      parcel = 'parcel';
    }
    return parcel;
  }

  parcelCost(){
    double p;

    if(parcelType.contains(0)){

      p = 300;
    }else{
      if(size > double.parse(weight)){
        p = 800;
      }else{
        p = 500;
      }
    }
    return p;
  }

  packageCost(){
    double pacCost = parcelCost();
    if(selectedPackage.contains(0)){
      pacCost = (pacCost + ((20/100)*pacCost));
    }
    else if(selectedPackage.contains(1)){
      pacCost = (pacCost + ((5/100)*pacCost));
    }
    else{
      pacCost;
    }
    return pacCost;
  }
  payType(){
    String payment;
    if(_selectedPaymentT.contains(0)){
      payment = 'Cash On Delivery';
    }else{
      payment = 'eSewa';
    }
    return payment;
  }

  pacType(){
    String package;
    if(selectedPackage.contains(0)){
      package = 'Express';
    }else if(selectedPackage.contains(1)){
      package = 'Standard';
    }else{
      package = 'Cheap';
    }
    return package;
  }


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _pricing = getPricing();
  }
  var distRate;
  distanceRate(){
    var dist = double.parse(distance);
    if(dist <= 5){
      dist = 40;
    }else if (dist > 5 && dist <= 10){
      dist = 400;
    }else if (dist > 10 && dist <= 20){
      dist = 600;
    }else if (dist > 20 && dist <= 50){
      dist = 1000;
    }else if (dist > 50 && dist <= 100){
      dist = 1500;
    }else if (dist > 100){
      dist = 2000;
    }
    return dist;
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'Ship Now',),
      body:


            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24),
                  child: Column(children: [
                    Text(
                      'Step 5 of 6',
                      style: kStyleTitle,
                    ),
                    const SizedBox32(),
                    Text(
                      'Just one more step before you confirm your order!',
                      style: kStyleTitle.copyWith(fontSize: 12.sp, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox16(),
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: MediaQuery.of(context).size.height * 0.17,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [boxShadowBlue],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          PricingContent(title: 'Price',amt: 'Rs. ${parcelCost()}',titleStyle: kStyleNormal,amtStyle: kStyleNormal,),
                          const SizedBox8(),
                          PricingContent(title: 'Distance Rate',amt: 'Rs. ${distanceRate()}',titleStyle: kStyleNormal,amtStyle: kStyleNormal),
                          const SizedBox8(),
                          PricingContent(title: 'Package Type (${pacType()})',amt: 'Rs. ${packageCost() - parcelCost()}',titleStyle: kStyleNormal,amtStyle: kStyleNormal),
                          const SizedBox8(),
                          PricingContent(title: 'Total Amount',amt: 'Rs. ${packageCost() + distanceRate()} ',titleStyle: kStyleNormal.copyWith(color: Colors.blue),amtStyle: kStyleNormal.copyWith(color: Colors.blue)),
                        ],
                      ),
                    ),
                    const SizedBox32(),
                    Text('Please select your payment method',style: kStyleNormal,),
                    const SizedBox16(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.37,
                      child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, i) {
                            final _isSelected = _selectedPaymentT.contains(i);
                            var _isSelectedPay = name[i];
                            return PaymentOptions(
                              icon: images[i],
                              name: name[i],
                              onTap: () {
                                  setState(
                                        () {
                                      if (_isSelected) {
                                        _selectedPaymentT.remove(i);
                                      } else if (_selectedPaymentT.isNotEmpty) {
                                        _selectedPaymentT.clear();
                                        _selectedPaymentT.add(i);
                                      } else {
                                        _selectedPaymentT.add(i);
                                      }
                                    },
                                  );
                                if(_selectedPaymentT.contains(1)) {
                                  _initPayment(_isSelectedPay);
                                }
                              },
                              isSelected: _isSelected,
                            );
                          }),
                    )
                  ]),
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
              Navigator.of(context).pushReplacement(CustomPageRoute(child: const ReceiverDetails(),direction: AxisDirection.right));
            }),
            if(_selectedPaymentT.isNotEmpty)
              NextBtn(() async{
                  Shipment shipment = await NetworkHelper().getShipmentData(parType(), weight, size.toString(), packageCost().toString(), rname, pacType(), rphone, start, dest, 'Processing', payType(), remail,token,deliveryDate);
              if(shipment.id != null) {
                Navigator.of(context).pushReplacement(CustomPageRoute(child: TrackingLabel(id: shipment.id,type: shipment.ofType,weight: shipment.weight,size: shipment.size,package_type: shipment.packageType,rname: shipment.receiver,rphone: shipment.phoneNumber,remail: shipment.email,start: shipment.start,dest: shipment.destination,status: shipment.status,price: shipment.price,payment: shipment.paymentType,trackingid: shipment.trackingNumber,deliveryDate: shipment.deliveryDate)));
              }

            },'Next'),
          ],
        ),
      ),
    );
  }
  _initPayment(String product)async{
    ESewaConfiguration _configuration = ESewaConfiguration(
        clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
        secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
        environment: ESewaConfiguration.ENVIRONMENT_TEST
    );

    ESewaPnp _esewaPnp = ESewaPnp(configuration: _configuration);
    var total =  packageCost() + distanceRate();
    ESewaPayment _payment = ESewaPayment(
        amount: total,
        productName: parType(),
        productID: "1",
        callBackURL: "http:example.com");
    try {
      final _res = await _esewaPnp.initPayment(payment: _payment);
      if(_res.status == "Complete"){
        showSnackBar2(
          context,
          'Payment was successful',
          Colors.green,
        );
      }else{
        showSnackBar2(
          context,
          'Payment was successful',
          Colors.green,
        );
      }
      // Handle success
    } on ESewaPaymentException catch(e) {
      // Handle error
    }
  }
}


