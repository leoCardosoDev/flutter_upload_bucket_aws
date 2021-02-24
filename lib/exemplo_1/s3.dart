import 'dart:io';

import 'package:flutter/material.dart';

import 'package:aws_s3_upload/aws_s3_upload.dart';

import 'validators/images_validators.dart';
import 'widgets/images_widget.dart';

class MyHomeS3 extends StatefulWidget {
  MyHomeS3({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomeS3State createState() => _MyHomeS3State();
}

class _MyHomeS3State extends State<MyHomeS3> with ImagesValidator {
  void _incrementCounter() {
    AwsS3.uploadFile(
        accessKey: "AKxxxxxxxxxxxxxxxxx",
        secretKey: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        file: File("path_to_file"),
        destDir: "uploads/9926",
        bucket: "xxxxxx",
        region: "us-east-1");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste Daniel Cliofi"),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            Text('Imagens'),
            ImagesWidget(
              context: context,
              initialValue: [''],
              onSaved: (l) {},
              validator: validateImages,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Save',
        child: Icon(Icons.save),
      ),
    );
  }
}
