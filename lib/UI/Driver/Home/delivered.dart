import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'available_orders.dart';

class DeliveredOrder extends StatelessWidget {
  DeliveredOrder({required this.id,required this.payment,required this.deliveryDate,required this.ofType,required this.package,required this.weight, required this.size,required this.price, required this.rname,required this.rphone,required this.remail, required this.dest});
  final id,payment,deliveryDate,ofType,package,weight,size,price,rname,rphone,remail,dest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'Delivered',),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xffF5FCFF),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: ListView(
            children: [
              // Order Number
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order No. $id'),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        border: Border.all(width: 2, color: const Color(0xff4FC72E))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.01, horizontal: 8.05),
                      child: Text(
                        'Paid',
                        style: kStyleTitle.copyWith(
                          fontSize: 14,
                          color: const Color(0xff4FC72E),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Scheduled Date
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$deliveryDate',
                      style: kStyleNormal.copyWith(
                          color: const Color(0xff76A063), fontSize: 14),
                    ),
                    Text('$payment',
                        style: kStyleNormal.copyWith(
                            color: const Color(0xff76A063), fontSize: 14))
                  ],
                ),
              ),
              // Receiver Details and Navigator
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            boxShadowBlue,
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 31,
                                        backgroundColor: Colors.grey,
                                        child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 30,
                                            child: Image.asset(ofType == 'parcel'? 'assets/ShipNow/parcel.png': 'assets/ShipNow/mail.png',height: 40,width: 40,)),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Package Details',style: kStyleTitle.copyWith(fontSize: 12.sp),),
                                          const SizedBox(height: 8,),
                                          packageDetails(title: 'Package Type:  ',value: package,),
                                          const SizedBox(height: 8,),
                                          packageDetails(title: 'Weight:  ',value: '$weight kg',),
                                          const SizedBox(height: 8,),
                                          packageDetails(title: 'Dimensional Weight:  ',value: '$size kg',),
                                          const SizedBox(height: 8,),
                                          packageDetails(title: 'Price:  ',value: 'Rs. $price',),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox16(),
                                  itemDivider(),
                                  const SizedBox16(),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        child: Image.asset('assets/Profile/profileimg.png'),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            // Name
                                            Text(
                                              '$rname',
                                              style: kStyleNormal.copyWith(
                                                  color: const Color(0xff1285E3)),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            // Address
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Color(0xff1B9AFA),
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 8,),
                                                Expanded(
                                                    child: Text(
                                                      '$dest',
                                                      style: kStyleNormal.copyWith(
                                                          color: const Color(0xff292929),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400),
                                                    ))
                                              ],
                                            ),
                                            const SizedBox(height: 4,),

                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  Icons.email,
                                                  color: Color(0xff1B9AFA),
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 8,),
                                                Expanded(
                                                    child: Text(
                                                      '$remail',
                                                      style: kStyleNormal.copyWith(
                                                          color: const Color(0xff292929),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400),
                                                    ))
                                              ],
                                            ),
                                            const SizedBox(height: 4,),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  Icons.phone,
                                                  color: Color(0xff1B9AFA),
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 8,),
                                                Expanded(
                                                    child: Text(
                                                      '$rphone',
                                                      style: kStyleNormal.copyWith(
                                                          color: const Color(0xff292929),
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400),
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox16(),

              // ArrowButton(
              //     text: 'FINISH DELIVERY',
              //     color: const Color(0xff00A6FB),
              //     onPress: ()async{
              //       // ShipmentUpdate update = await NetworkHelper().shipmentUpdate(widget.code, token);
              //       // if(update.data !=  null )
              //       //   // showBackDialog(context)
              //       //   Navigator.push(context, MaterialPageRoute(builder: (context){return DriverHome();}));
              //     },
              //     arrow: 'assets/Profile/buttonarrow.png'),
            ],
          ),
        ),
      ),
    );
  }
}
