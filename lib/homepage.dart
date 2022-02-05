import 'package:flutter/material.dart';
import 'scan.dart';
import 'CATALOGUE.dart';
import 'GALERIE.dart';
import 'Objet3d.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({@required this.title});

  @override
  Widget build(BuildContext context) {
    var ch = 55 * MediaQuery.of(context).size.height / 100;
    var cw = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(children: [
          Container(
            height: ch,
            width: cw,
            child: Stack(children: [
              Image(image: AssetImage('assets/images/homepage_bande.png')),
              Positioned(
                bottom: -0.0 * ch,
                right: 0.2 * cw,
                child: Text(
                  '  BARDO \nMUSEUM',
                  style: TextStyle(color: Colors.white, fontSize: cw * 0.15),
                ),
              ),
              Positioned(
                top: 0.05 * ch,
                right: 0.02 * cw,
                child: IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      print('dela3');
                    }),
              )
            ]),
          ),
          Center(child: Text('Bienvenue sur la plateforme virtuelle du musée du Bardo, bonne visite! =)', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 24))),
          Spacer(),
          Container(
              width: w,
              height: 0.15 * h,
              //color: Colors.green,
              child: Row(children: [
                Column(children: [
                  Spacer(),
                  Container(
                      height: 0.1 * h,
                      width: w / 3,
                      child: FlatButton(
                          onPressed: () {
                            print("Rania djemaa");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (new GALERIE(
                                      title: 'GALERIE',
                                      //nombre de colonnes dans la galerie
                                      columns: 2,
                                    ))));
                          },
                          child: Image(image: AssetImage('assets/images/icon_galerie.png'))))
                ]),
                Column(children: [
                  Container(
                      height: 0.1 * h,
                      width: w / 3,
                      child: FlatButton(
                          onPressed: () {
                            print("Scan");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => (new Scan())));
                          },
                          child: Image(image: AssetImage('assets/images/icon_AR.png')))),
                  Spacer()
                ]),
                Column(children: [
                  Spacer(),
                  Container(
                      height: 0.1 * h,
                      width: w / 3,
                      child: FlatButton(
                          onPressed: () {
                            print("Catalogue");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => (new Catalogue(title: "Catalogue"))));
              
                          },
                          child: Image(image: AssetImage('assets/images/icon_catalogue.png'))))
                ])
              ])),
          SizedBox(height: 0.03 * h)
          /*
     

     
     
     
     
         
     
     */
        ]));
  }
}
