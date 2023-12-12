import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';

class Img extends StatelessWidget {
  late String base64;

  Img({super.key, required this.base64});
  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: imageFromBase64String(base64),
    );
  }
}
