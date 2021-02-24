import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  final Function(File) onImageSelected;

  ImageSourceSheet({this.onImageSelected});

  final ImagePicker picker = ImagePicker();

  void imageSelected(PickedFile image) async {
    if (image != null) {
      File croppedImage = await ImageCropper.cropImage(sourcePath: image.path);
      onImageSelected(croppedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          FlatButton(
              onPressed: () async {
                final PickedFile file =
                    await picker.getImage(source: ImageSource.camera);
                imageSelected(file);
              },
              child: Text("Câmera")),
          FlatButton(
              onPressed: () async {
                final PickedFile file =
                    await picker.getImage(source: ImageSource.gallery);
                imageSelected(file);
              },
              child: Text("Galeria")),
        ],
      ),
    );
  }
}
