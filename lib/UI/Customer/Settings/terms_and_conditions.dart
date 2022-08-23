import 'package:flutter/material.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Widgets/appbars.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'Terms and Conditions',),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Section 1: Delivery', style: kStyleTitle,),
            const SizedBox16(),
            Text('1.1. Delivery time should be considered an estimate at the time of ordering and may change. The items will be sent to the address you provided when placing your order.',style: kStyleNormal,),
            const SizedBox16(),
            Text('1.2. The delivery cost will not be cancelled or returned by the Middlemen App in the event of a late delivery.',style: kStyleNormal,),
            const SizedBox16(),
            Text('1.3. If you do not accept delivery of goods when they are ready for delivery, or if we are unable to deliver at the indicated time owing to your lack of sufficient instructions or authorizations, these items must be regarded delivered to you, and all risks and obligations associated with them transfer to you. You will be responsible for any secure storage and other fees incurred as a result of our inability to deliver, and you must fully compensate us for those costs.',style: kStyleNormal,),
            const SizedBox16(),
            Text('1.4. You shall guarantee that you are informed at the time of delivery of the items. Where there is a lack of proper access or individuals to receive delivery, we cannot be held liable for any damage, cost, or expense incurred to such products or facilities.',style: kStyleNormal,),
            const SizedBox32(),
            Text('Section 2: Cancellation',style: kStyleTitle,),
            const SizedBox16(),
            Text('2.1. You shall cancel an order if it is still in Processing phase. No cancellations shall be accepted if the driver has already picked up the package and started the delivery.',style: kStyleNormal,),
            const SizedBox16(),
            Text('2.2. In case the driver delivers a wrong order or if your order is misplaced you shall request for refund and cancel your shipment.',style: kStyleNormal,),
            const SizedBox16(),
          ],
        ),
      ),
    );
  }
}
