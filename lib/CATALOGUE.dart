import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';
import 'description.dart';
class Catalogue extends StatelessWidget {
  final String title;

  const Catalogue({@required this.title});
  myContainer(context,{path,title,desc}){
    return FlatButton(
      child: Container(
          height: MediaQuery.of(context).size.height/5,
          width: MediaQuery.of(context).size.width/3,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,

          ),
          child: Column(children: [
            Text(title, textAlign: TextAlign.center,style: TextStyle(fontSize: 10)),
            new Container(
              height: MediaQuery.of(context).size.height/5-20,
              width: MediaQuery.of(context).size.width/3-50,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,

              ),
              child: ModelViewer(
                backgroundColor: Colors.white,
                src: path,
                alt: "A 3D model of a chair",
                ar: false,
                autoRotate: false,
                cameraControls: false,
              ),
            ),
          ])),
      onPressed: () => {
      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => (new Desc(
      title: title,
      desc: desc,
      path: path,
      //nombre de colonnes dans la galerie

      ))))
      },
    );
  }
  createGrid(context,{List elements}){
    List<Widget> enfants=[];
    if ((elements.length % 2)==0){
      for (var i=0;i<elements.length;i=i+2){
        List<Widget> rowenfants=[];
        rowenfants.add(Spacer());
        rowenfants.add(myContainer(context,path:elements[i][0],title:elements[i][1] ,desc: elements[i][2]));
        rowenfants.add(Spacer());
        rowenfants.add(myContainer(context,path:elements[i+1][0],title:elements[i+1][1] ,desc: elements[i+1][2]));
        rowenfants.add(Spacer());
        enfants.add(Row(children: rowenfants));
        enfants.add(SizedBox(height: 25,));
      }
    }else{
      if(elements.length>2)
      for (var i=0;i<elements.length-1;i=i+2){
        enfants.add(SizedBox(height: 25,));
        List<Widget> rowenfants=[];
        rowenfants.add(Spacer());
        rowenfants.add(myContainer(context,path:elements[i][0],title:elements[i][1],desc: elements[i][2] ));
        rowenfants.add(Spacer());
        rowenfants.add(myContainer(context,path:elements[i+1][0],title:elements[i+1][1] ,desc: elements[i+1][2]));
        rowenfants.add(Spacer());
        enfants.add(Row(children:rowenfants));

      }
      enfants.add(SizedBox(height: 25,));
      List<Widget> rowenfants=[];
      rowenfants.add(Spacer());
      rowenfants.add(myContainer(context,path:elements.last[0],title:elements.last[1],desc: elements.last[2] ));
      rowenfants.add(Spacer());
      enfants.add(Row(children:rowenfants));




    }
    return enfants;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // The title text which will be shown on the action bar
            title: Text(title, style: TextStyle(fontSize: 40)),
            backgroundColor: Color(0xFF85B0D4),
            centerTitle: true,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => {
                        print("RAJOUTER FONCTIONS MENU")
                      })
            ]),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: createGrid(context,elements:[["https://raw.githubusercontent.com/bardo2022/glb/main/fontaine2.glb","Fontaine","fontaine du jardin du musee"],
            ["https://raw.githubusercontent.com/bardo2022/glb/main/VASE%20FINAL.glb","vase en or","vase en or ancien"],
            ["https://raw.githubusercontent.com/bardo2022/glb/main/bowl.glb","djefna ancienne","djefna ancienne de l'epoque"],
            ["https://raw.githubusercontent.com/bardo2022/glb/main/petit_coffre.glb","coffre","petit coffre ancien de l'epoque"],
            ["https://raw.githubusercontent.com/bardo2022/glb/main/truc%20à%20café.glb","ustensiles café","ustensiles pour le café ancien"],
            ["https://raw.githubusercontent.com/bardo2022/glb/main/canape.glb","canapé ancien","canapé ancien de l'epoque ottomane"],
            ["https://raw.githubusercontent.com/bardo2022/glb/main/mirrorTable.glb","coiffeuse ancienne","coiffeuse ancienne"],
            ["https://raw.githubusercontent.com/bardo2022/glb/main/nightmarechandler.glb","chandelier ancien","chandelier ancien cuivre"],
            ["https://raw.githubusercontent.com/bardo2022/glb/main/table.glb","table","table ancienne"],
          ["https://raw.githubusercontent.com/bardo2022/glb/main/batiment1.glb","batiment1","batiment gauche du musee bardo"],
            ["https://raw.githubusercontent.com/bardo2022/glb/main/chaise.glb","chaise","chaise presente dans le jardin du musee bardeau"],
            ["https://raw.githubusercontent.com/bardo2022/glb/main/batiment2.glb","batiment 2","batiment droit du musee bardo"],

              ]
           ),
        )));
  }
}
