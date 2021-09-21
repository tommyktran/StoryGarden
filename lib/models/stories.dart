import 'package:flutter/cupertino.dart';

import 'story.dart';
import 'dbhelper.dart';

class Stories extends ChangeNotifier{
  List<Story> stories = [
  ];

  Stories() {
    start();
  }

  start() async {
    stories = await DbHelper.getAllStories();
    notifyListeners();
  }

  getStories() async {
    stories = await DbHelper.getAllStories();
    return await DbHelper.getAllStories();
  }

  addStory(Story story) async {
    stories.add(story);
    await DbHelper.insertStory(story);
    notifyListeners();
  }

  deleteStory(int id) async {
    stories.removeWhere((element) => element.id == id);
    await DbHelper.deleteStory(id);
    notifyListeners();
  }

  editStory(Story story) async {
    await DbHelper.updateStory(story);
    await getStories();
    notifyListeners();
  }

}