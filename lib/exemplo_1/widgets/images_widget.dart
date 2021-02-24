import 'package:flutter/material.dart';

import 'image_source_sheet.dart';

class ImagesWidget extends FormField<List> {
  ImagesWidget({
    BuildContext context,
    FormFieldSetter<List> onSaved,
    FormFieldValidator<List> validator,
    List initialValue,
    bool autoValidate = false,
  }) : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: AutovalidateMode.always,
            builder: (state) {
              return Column(
                children: [
                  Container(
                    height: 124,
                    padding: EdgeInsets.only(top: 16, bottom: 0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.value.map<Widget>((e) {
                        return Container(
                          height: e is String ? 0 : 100,
                          width: e is String ? 0 : 100,
                          margin: EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onLongPress: () {
                              state.didChange(state.value..remove(e));
                            },
                            child: e is String
                                ? Container()
                                : Image.file(e, fit: BoxFit.cover),
                          ),
                        );
                      }).toList()
                        ..add(GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => ImageSourceSheet(
                                onImageSelected: (image) {
                                  state.didChange(state.value..add(image));
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.black,
                            child: Icon(
                              Icons.camera_enhance,
                              color: Colors.pink,
                            ),
                          ),
                        )),
                    ),
                  ),
                  state.hasError
                      ? Text(state.errorText,
                          style: TextStyle(color: Colors.red))
                      : Container(),
                ],
              );
            });
}
