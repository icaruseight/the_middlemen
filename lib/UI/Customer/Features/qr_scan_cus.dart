import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/UI/Customer/Tracking/tracking.dart';
import 'package:the_middlemen/UI/Driver/Home/available_orders.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
class QRScannerCus extends StatefulWidget {
  const QRScannerCus({Key? key}) : super(key: key);

  @override
  _QRScannerCusState createState() => _QRScannerCusState();
}

class _QRScannerCusState extends State<QRScannerCus> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async{
    super.reassemble();

    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Scan Tracking Label',),
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(
              top: 10,
              child: buildResult())
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
            if(barcode?.code != null)
              NextBtn(() {
                Navigator.push(context, MaterialPageRoute(builder: (context){return Tracking(track: barcode?.code );}));
              },'Next'),
          ],
        ),
      ),

    );

  }

  Widget buildResult() => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
    ),
    child: Text(
      barcode != null ? 'Result : ${barcode?.code}' : 'Scan a code!',
      maxLines: 3,
    ),
  );

  Widget buildQrView(BuildContext context) => QRView(
    key: qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      borderWidth: 10,
      borderLength: 20,
      borderRadius: 10,
      borderColor: Theme.of(context).accentColor,
      cutOutSize: MediaQuery.of(context).size.width * 0.8,
    ),
  );

  void onQRViewCreated(QRViewController controller){
    setState(() =>
    this.controller = controller);
    controller.scannedDataStream
        .listen((barcode) {setState(() {
      this.barcode = barcode;
    }); });
  }
}
