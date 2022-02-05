import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class Objet3d extends StatefulWidget {
  final String title;
  Objet3d({@required this.title});
  State<StatefulWidget> createState() => Objet3dState(title: title);
}

class Objet3dState extends State<Objet3d> {
  @override
  final String title;
  Objet3dState({@required this.title});
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            height: h,
            width: w,
            color: Colors.white,
            child: Stack(children: [
              Container(
                height: h,
                width: w,
                child: Image(image: AssetImage('assets/images/SCAN_bg.png')),
              ),
              Center(
                  child: Container(
                      height: h - 20,
                      width: w - 20,
                      child: ModelViewer(
                        backgroundColor: Colors.white,
                        src:this.title,

                        alt: "A 3D model of a chair",
                        ar: true,
                        autoRotate: true,
                        cameraControls: true,
                      )))
            ])));
  }
}
