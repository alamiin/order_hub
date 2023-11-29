
import 'dart:io';
import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfSavingService{

  static Future<bool> createAndSavePdf(String pdfData) async {

    try{
      final pdf = pw.Document();
      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Container(
              padding: const pw.EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: pw.Text(pdfData),
            ); // Center
          }));
      // final directory = await getExternalStorageDirectory();
      final directory = await getApplicationDocumentsDirectory();
      int currentUnix = DateTime.now().millisecondsSinceEpoch;
      final file = File("${directory.path}/$currentUnix.pdf");
      await file.writeAsBytes(await pdf.save());
      Uint8List pdfBytes = await file.readAsBytesSync();
      await DocumentFileSavePlus().saveFile(pdfBytes, "invoice_$currentUnix.pdf", "appliation/pdf");
      return true;
    }catch(e){
      return false;
    }

  }

}