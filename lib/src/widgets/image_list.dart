import 'package:flutter/material.dart';

import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
      },
      itemCount: images.length,
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Image.network(image.url),
          Padding(
            padding: EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
            child: Text(image.title),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black12,
      )),
    );
  }
}
