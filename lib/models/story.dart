class Story {
  int? id;
  String title;
  String description;

  String text;

  Story({required this.title, this.description = '', this.text = ''});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'text': text,
    };
  }
}