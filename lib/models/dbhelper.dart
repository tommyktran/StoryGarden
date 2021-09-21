import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/models/story.dart';
import 'package:provider/provider.dart';

const kTableStories = 'stories';

class DbHelper {
  static Database? _db;

  static start() async {
    _getDb();
  }

  static Future<Database> _getDb() async {
    print("b");
    if (_db == null) {
      _db = await openDatabase(
        join(await getDatabasesPath(), 'stories.db'),
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE stories(id INTEGER PRIMARY KEY, title TEXT, description TEXT, text TEXT)'
          );

          // Soooo trying to have a default breaks things
          // if (await getLength() == 0) {
          //   insertStory(Story(title: 'Story', description: 'A story about things.'));
          //   insertStory(Story(title: 'Blah', description: 'A story about things.'));
          //   insertStory(Story(title: 'qqqqq', description: 'A story about things.'));
          // }
        },
      );
      print('database stories.db is opened');
    }
    return _db!;
  }

  static Future<Story> insertStory(Story story) async {
    Database db = await _getDb();
    story.id = await db.insert(kTableStories, story.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return story;
  }

  static Future<int> deleteStory(int id) async {
    Database db = await _getDb();
    return await db.delete(kTableStories, where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> updateStory(Story story) async {
    Database db = await _getDb();
    return await db.update(kTableStories, story.toMap(),
        where: 'id = ?', whereArgs: [story.id]);
  }

  static Future<List<Story>> getAllStories() async {
    print("hi");
    Database db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(kTableStories);
    print('Read ${maps.length} stories from the database');
    return List.generate(
        maps.length,
            (i) => Story(
            id: maps[i]['id'],
            title: maps[i]['title'],
            description: maps[i]['description'],
            text: maps[i]['text']
        ));
  }

  static Future<int> getLength() async {
    Database db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(kTableStories);
    return maps.length;
  }


}
