import 'story.dart';


class Stories {
  List<Story> stories = [
    Story(title: 'Story', description: 'A story about things.'),
    Story(title: 'Story', description: 'A story about things.'),
    Story(title: 'Story', description: 'A story about things.')
  ];
  int? id;

  Stories();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stories': stories
    };
  }

}