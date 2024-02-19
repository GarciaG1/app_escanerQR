import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQRCodep extends StatefulWidget {
  const ScanQRCodep({Key? key}) : super(key: key);

  @override
  _ScanQRCodeStatep createState() => _ScanQRCodeStatep();
}

class _ScanQRCodeStatep extends State<ScanQRCodep> {
  String qrResult = 'Para abrir el escaner clic en "Iniciar Escaner"';

  Future<void> scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      String param1 = 'sala1';
      String param2 = '0';

      // Concatenamos los dos parámetros adicionales al resultado del escaneo
      String resultWithParams = '$qrCode?sala=$param1&invitado=$param2';

      setState(() {
        this.qrResult = resultWithParams;
      });
    } on PlatformException {
      setState(() {
        qrResult = 'Fail to read QR Code';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code Scanner')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text('$qrResult', style: TextStyle(color: Colors.black)),
            SizedBox(height: 30),
            ElevatedButton(onPressed: scanQR, child: Text('Iniciar Escaner'))
          ],
        ),
      ),
    );
  }
}
