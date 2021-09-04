import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? _image;
  ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Welcome to Lucidation.',
              style: Theme.of(context).textTheme.headline5),
          if (_image != null) Container(child: Image.file(File(_image!.path))),
          SizedBox(height: 20),
          ElevatedButton(
              child: Text('Select an image'),
              onPressed: () => {
                    setState(() async => {
                          _image = await _picker.pickImage(
                              source: ImageSource.gallery)
                        })
                  })
        ]),
      ),
    );
  }
}
