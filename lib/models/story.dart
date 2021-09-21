class Story {
  int? id;
  String title;
  String description;

  String text;

  Story({required this.title, this.description = '', this.text = '', this.id});

  getWords() {
    var regExp = new RegExp(r"\w+(\'\w+)?");
    return regExp.allMatches(this.text).length;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'text': text,
    };
  }
}