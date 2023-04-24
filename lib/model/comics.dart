class Comics {
  int id;
  String title;
  String description;

  Comics({
    required this.id,
    required this.title,
    required this.description
  });

  factory Comics.fromJson(Map<String, dynamic> json) {
    return Comics(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String);
  }
}