import 'package:flutter/material.dart';
import 'arnold_appdataimage.dart';


class DisplayImage extends StatelessWidget {
  final AppDataImage appDataImage;
  const   DisplayImage({super.key, required this.appDataImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
       // borderRadius: BorderRadius.circular(200),
        image: DecorationImage(image: AssetImage(appDataImage.image)),
      ),
    );
  }
}
