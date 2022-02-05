import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';
class Desc extends StatelessWidget {
  final String title;
  final String desc;
  final String path;
  const Desc({@required this.title,this.desc,this.path});

  @override
  Widget build(BuildContext context) {
    var salim = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xff86b1d5),

        appBar: AppBar(actions: [Container(width: 10,)],
          // The title text which will be shown on the action bar
          backgroundColor: Color(0xff86b1d5),
          title: Center(child: Text("Description",
                  textAlign: TextAlign.center,
                  style: TextStyle(

                  ))),
          elevation: 0,
        ),
        body: Center(
            child: Column(children: [
              SizedBox(height: 0.10 * salim),
              Container(child: ModelViewer(

                src: path,
                ar: true,
                cameraControls: false,
                autoRotate: true,
                autoRotateDelay: 10,

              ),height: 200,width: MediaQuery.of(context).size.width*0.9,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              ),

              Text(this.title, style: TextStyle(fontSize: salim * 0.05)),
              SizedBox(height: 0.05 * salim),
              Container(
                  child: Row(children: [
                    Spacer(),
                    Text("Description:", style: TextStyle(fontSize: salim * 0.04, color: Colors.white)),
                    Spacer()
                  ])),
              SizedBox(height: 0.05 * salim),
              Container(
                  child: Row(children: [
                    Spacer(),
                    Text(this.desc, style: TextStyle(fontSize: salim * 0.02, color: Colors.white)),
                    Spacer()
                  ])),
              SizedBox(height: 0.1 * salim),
              Icon(
                Icons.arrow_downward,
                color: Colors.white,
                size: 60.0,
              ),
              Spacer()
            ])));
  }
}
