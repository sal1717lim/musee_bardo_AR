import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'GALERIE_FULL_SCREEN.dart';

//Mettre les images choisies ou bien les liens à ces dernieres ici
final List<String> images = [
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1044.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1046.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1049.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1051.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1052.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1055.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1056.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1062.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1064.jpg",

  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1065.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1066.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1068.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1069.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1070.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1071.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1073.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1079.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1080.jpg",

  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1082.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1083.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1087.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1088.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1091.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1092.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1095.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1096.jpg",
  "https://raw.githubusercontent.com/bardo2022/glb/main/photo/_CLY1097.jpg",

];

class GALERIE extends StatelessWidget {
  final String title;
  final int columns;

  const GALERIE({@required this.title, @required this.columns});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
          backgroundColor: const Color(0xFF85B0D4),
          title: Text(title, style: TextStyle(fontSize: 40)),
          centerTitle: true,
          elevation: 0,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => {
                  print("RAJOUTER FONCTIONS MENU")
                })
          ]),
      body: Container(
        margin: EdgeInsets.all(12),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: this.columns,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          itemCount: images.length,
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          itemBuilder: (context, index) {
            return ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF85B0D4)),
                elevation: MaterialStateProperty.all<double>(0),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(0)),
              ),
              child: Container(
                decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(15))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: new Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GAL_FS(index: index)));
              },
            );
          },
        ),
      ),
    );
  }
}
