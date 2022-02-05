import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'GALERIE.dart';
import 'package:flutter/widgets.dart';

class GAL_FS extends StatefulWidget {
  final int index;
  const GAL_FS({@required this.index});

  @override
  _GAL_FSState createState() {
    return _GAL_FSState();
  }
}

class _GAL_FSState extends State<GAL_FS> {
  int courant;
  @override
  void initState() {
    super.initState();
    courant = widget.index;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: Text((courant + 1).toString() + '/' + images.length.toString(), style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Stack(children: <Widget>[
          Container(
              child: PhotoViewGallery.builder(
                itemCount: images.length,
                enableRotation: true,
                scrollPhysics: const BouncingScrollPhysics(),
                gaplessPlayback: true,
                //pageController: widget.pageController,
                onPageChanged: (int index) {
                  setState(() {
                    courant = index;
                  });
                },
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    initialScale: PhotoViewComputedScale.contained,
                    imageProvider: NetworkImage(images[courant]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 3,
                  );
                },
              )),
          Center()
        ]));
  }
}
