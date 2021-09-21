import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/models/dbhelper.dart';
import 'package:untitled/widget/story_tile.dart';
import 'package:untitled/models/story.dart';
import 'package:untitled/models/stories.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stories'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Provider.of<Stories>(context, listen: false).addStory(Story(title: 'Thing', description: 'Blah blaaaaa'));
          setState(() {

          });
          _scrollController.jumpTo(0.0);

        },
      ),
      body: Consumer<Stories>(
        builder: (context, stories, child) {
          return Container(child: ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemCount: stories.stories.length,
                    itemBuilder: (context, index) {
                      return StoryTile(story: stories.stories[index]);
                    }),
          );
        }
      ),
    );
  }
}
