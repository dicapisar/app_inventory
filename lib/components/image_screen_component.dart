import 'package:flutter/material.dart';

class ImageScreenComponent extends StatelessWidget {
  final String pahtImage;
  final double? percentageWidth;

  const ImageScreenComponent({
    Key? key,
    required this.pahtImage,
    this.percentageWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Image(
      image: AssetImage(pahtImage),
      fit: BoxFit.contain,
      width: width * (percentageWidth ?? 0.5),
    );
  }
}
