import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/screens/write_screen.dart';
import 'package:untitled/models/story.dart';

class StoryTile extends StatelessWidget {

  Story story;
  StoryTile({required this.story});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => WriteScreen(story: story)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints(minHeight: 100.0),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 1.0,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(story.title, style: bodyTextStyle),
            Text(story.description, style: subtitleTextStyle),
          ],
        ),
      ),
    );
  }
}
