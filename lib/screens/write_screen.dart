import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/models/story.dart';

class WriteScreen extends StatelessWidget {
  // const WriteScreen({Key? key}) : super(key: key);

  Story story;
  WriteScreen({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Writing'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: TextFormField(
          initialValue: story.text,
          onChanged: (text) { story.text = text;},
          maxLines: 99999,
          keyboardType: TextInputType.multiline,
          style: bodyTextStyle,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20.0),
          ),
          autofocus: true,
        ) );
  }
}
