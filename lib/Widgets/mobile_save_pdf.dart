import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> saveAndLauchFile(var bytes,String fileName)async{
  final path = (await getExternalStorageDirectory())?.path;
  final file = File('$path/$fileName');
  await file.writeAsBytes(bytes,flush: true);
  OpenFile.open('$path/$fileName');
}

class PdfApi{
  static Future generatePdf(String name,List<List<dynamic>> data, String trackID) async{
    final pdf = pw.Document();
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a5,
        build: (context) => <pw.Widget>[
          pw.Table.fromTextArray(
            data: data,
            cellStyle: pw.TextStyle(fontSize: 12),
            headerAlignment: pw.Alignment.topCenter,
            headerCount: 0,
          ),
          pw.SizedBox(height: 32),
          pw.Text('Scan To Get Tracking Number:',style: const pw.TextStyle(fontSize: 20)),
          pw.SizedBox(height: 16),
          pw.BarcodeWidget(
            height: 200,
            color: PdfColor.fromHex("#000000"),
            barcode: pw.Barcode.qrCode(),
            data: trackID,
          ),
        ]

    ),);

    final bytes = await pdf.save();
    final path = (await getExternalStorageDirectory())?.path;
    final file = File('$path/$name');
    await file.writeAsBytes(bytes,flush: true);
    OpenFile.open('$path/$name');
    return pdf;

  }

  static Future openFile(File file) async{
    final url = file.path;

    await OpenFile.open(url);
  }
}