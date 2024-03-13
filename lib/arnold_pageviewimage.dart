import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'arnold_appdataimage.dart';
import 'arnold_displayimage.dart';
import 'arnold_indicator_image.dart';
import 'package:share_plus/share_plus.dart';


class PageViewImage extends StatefulWidget {
  const PageViewImage({super.key});

  @override
  State<PageViewImage> createState() => _PageViewImageState();
}

class _PageViewImageState extends State<PageViewImage> {
  @override
  var _selectedIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Arnold Quotes Image',
          style: TextStyle(color: Colors.black,fontFamily: 'Riot'),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) =>
                [PopupMenuItem(value: 1, child: Text("Share"))],
            elevation: 2,
            onSelected: (value) {
              if (value == 1) {
                _shareInfo();
              }
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 450,
            width: 600,
            child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                itemCount: appDataImage.length,
                itemBuilder: (context, index) {
                  return DisplayImage(appDataImage: appDataImage[index]);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    appDataImage.length,
                    (index) => Indicator(
                        isActive: _selectedIndex == index ? true : false))
              ],
            ),
          )
        ],
      ),
    );
  }

  _shareInfo() async {
    print('-------------> Share');
    print(appDataImage[_selectedIndex].image);

    ByteData imagebyte =
        await rootBundle.load(appDataImage[_selectedIndex].image);

    final temp = await getTemporaryDirectory();

    print('Directory: $temp');

    final path = '${temp.path}/Arnold Quotes (1).png';

    print('Image Path: $path');

    File(path).writeAsBytesSync(imagebyte.buffer.asUint8List());

    await Share.shareFiles([path], text: '');
  }
}

