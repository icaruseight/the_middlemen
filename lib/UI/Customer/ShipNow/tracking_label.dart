import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/BottomNavBar/bottom_nav_cus.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/mobile_save_pdf.dart';

class TrackingLabel extends StatefulWidget {
  TrackingLabel(
      {required this.id,
      required this.type,
      required this.weight,
      required this.size,
      required this.package_type,
      required this.rname,
      required this.rphone,
      required this.remail,
      required this.start,
      required this.dest,
      required this.status,
      required this.price,
      required this.payment,
      required this.trackingid,
      required this.deliveryDate});
  final id,
      type,
      weight,
      size,
      package_type,
      rname,
      rphone,
      remail,
      start,
      dest,
      status,
      price,
      payment,
      trackingid,
      deliveryDate;

  @override
  State<TrackingLabel> createState() => _TrackingLabelState();
}

class _TrackingLabelState extends State<TrackingLabel> {
  late String fName = Provider.of<DataProvider>(context, listen: false).fName;
  late String lName = Provider.of<DataProvider>(context, listen: false).lName;
  late String phoneNumber =
      Provider.of<DataProvider>(context, listen: false).phoneNumber;

  @override
  Widget build(BuildContext context) {
    var data = [
      [
        "FROM: $fName $lName\nPhone: $phoneNumber\nPick Up: ${widget.start}\n\nTO: ${widget.rname}\nPhone: ${widget.rphone}\nDrop Off: ${widget.dest}\n ",
      ],
      [
        "SHIP DATE: ${widget.deliveryDate}\nWEIGHT: ${widget.weight} kg\nDIMMENSION: ${widget.size} kg",
      ],
      [
        "TRACKING NUMBER: ${widget.trackingid}"
      ]
    ];
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(
        title: 'Ship Now',
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24),
            child: Column(
              children: [
                Text(
                  'Step 6 of 6 ',
                  style: kStyleTitle,
                ),
                const SizedBox16(),
                Text(
                  'View your Shipping Label',
                  style: kStyleNormal,
                ),
                const SizedBox16(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff3F84FC)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ))),
                        onPressed: () async {
                           await PdfApi.generatePdf(
                              "Tracking Label", data, widget.trackingid);
                        },
                        child: Text(
                          'Show in PDF',
                          style: kStyleButton.copyWith(color: Colors.white),
                        )),
                  ],
                ),
                const SizedBox16(),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: kStyleAppColor,
                      boxShadow: [boxShadowBlue],
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      ShippingDetails(
                          label: 'Shipping ID :', value: '${widget.id}'),
                      itemDivider(),
                      ShippingDetails(label: 'Type :', value: widget.type),
                      itemDivider(),
                      ShippingDetails(
                          label: 'Weight :', value: '${widget.weight} kg'),
                      itemDivider(),
                      ShippingDetails(
                          label: 'Dimensional Weight :',
                          value: '${widget.size} kg'),
                      itemDivider(),
                      ShippingDetails(
                          label: 'Package Type :', value: widget.package_type),
                      itemDivider(),
                      ShippingDetails(
                          label: 'Receiver\'s Name :', value: widget.rname),
                      itemDivider(),
                      ShippingDetails(
                          label: 'Receiver\'s Phone Number :',
                          value: widget.rphone),
                      itemDivider(),
                      ShippingDetails(
                          label: 'Receiver\'s Email :', value: widget.remail),
                      itemDivider(),
                      ShippingDetails(label: 'Start :', value: widget.start),
                      itemDivider(),
                      ShippingDetails(
                          label: 'Destination :', value: widget.dest),
                      itemDivider(),
                      ShippingDetails(label: 'Status :', value: widget.status),
                      itemDivider(),
                      ShippingDetails(
                          label: 'Delivery Date :', value: widget.deliveryDate),
                      itemDivider(),
                      ShippingDetails(
                          label: 'Price :', value: 'Rs. ${widget.price}'),
                      itemDivider(),
                      ShippingDetails(
                          label: 'Payment Method :', value: widget.payment),
                      itemDivider(),
                      ShippingDetails(
                          label: 'Tracking ID :',
                          value: '${widget.trackingid}'),
                    ],
                  ),
                ),
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            NextBtn(() {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return const BottomNavigationCus();
              }));
            }, 'Finish'),
          ],
        ),
      ),
    );
  }
}

class ShippingDetails extends StatelessWidget {
  ShippingDetails({required this.label, required this.value});
  final label;
  final value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            label,
            style: kStyleNormal,
          )),
          Expanded(
              child: Text(
            value,
            style: kStyleNormal,
          )),
        ],
      ),
    );
  }
}
