import 'package:flutter/material.dart';
import 'package:s3_aws_upload/exemplo_1/s3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomeS3(),
    );
  }
}
