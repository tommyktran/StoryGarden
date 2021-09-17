import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class DBhelper {

  DBhelper();

  start() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'stories.db');

    print(path);
  }

  fillSamples() async {

  }

}