import 'package:flutter/material.dart';
import 'dart:io'; //file type
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  Future<void> _takePicture() async {
    // final imageFile =
    //     await ImagePicker.pickImage(maxWidth: 600, source: ImageSource.camera);
    ImagePicker img = ImagePicker();
    final x = img.getImage(source: ImageSource.camera, maxWidth: 600);
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage == null
              ? Text(
                  'No Image Selected',
                  textAlign: TextAlign.center,
                )
              : Image.file(_storedImage,
                  fit: BoxFit.cover, width: double.infinity),
          alignment: Alignment.center,
        ),
        SizedBox(height: 10),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('take picture'),
            textColor: Theme.of(context).primaryColor,
            onPressed: () {
              print('pressed');
              return _takePicture();
            },
          ),
        )
      ],
    );
  }
}
