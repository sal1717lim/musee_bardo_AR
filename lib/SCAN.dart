import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:bardo_app/Objet3d.dart';
class Scan extends StatefulWidget {
  final String title;
  Scan({@required this.title});
  State<StatefulWidget> createState() => ScanState();
}

class ScanState extends State<Scan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;

  /*void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }*/

  @override
  Widget build(BuildContext context) {
    var ch = 55 * MediaQuery.of(context).size.height / 100;
    var cw = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: h,
      width: w,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
              color: Colors.white,
              image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.white.withOpacity(1), BlendMode.dstATop),
                image: new AssetImage('assets/images/SCAN_bg.png'),
              ),
            ),
          ),
          Center(
              child: Container(
            child: Expanded(
              flex: 5,
              child: SizeChangedLayoutNotifier(
                key: const Key('qr-size-notifier'),
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ),
            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.blueAccent, width: 5)),
            height: 0.7 * h,
            width: 0.7 * w,
          ))
        ],
      ),
    ));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {

        result = scanData;
        print(result.code);
        Navigator.push(context, MaterialPageRoute(builder: (context) => (new Objet3d(title: result.code))));

    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
