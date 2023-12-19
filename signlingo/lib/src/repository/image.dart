import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class Img extends StatelessWidget {
  late String url;
  Img({super.key, required this.url});

  String? getBase64String() {
    Uri dataUri = Uri.dataFromString(url);
    return dataUri.data?.contentAsString();
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  String dataFromBase64String(String dataUrl) {
    return dataUrl.replaceAll(RegExp('data:[^;]+;base64,'), '');
  }

  Future<Uint8List> scaleImage(Uint8List decodeString) async {
    return await FlutterImageCompress.compressWithList(
      decodeString,
      // minHeight: 250,
      // maxWidth: 100
    );
  }

  Image getImage() {
    print(getBase64String()!);
    return imageFromBase64String(getBase64String()!);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image(
      image: MemoryImage(base64Decode(dataFromBase64String(url))),
      height: 250,
      width: 150,
      // fit: BoxFit.cover,
    );
  }
}
