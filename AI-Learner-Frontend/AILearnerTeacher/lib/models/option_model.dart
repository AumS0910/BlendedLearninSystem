class Option {
  final int id;
  final String content;

  Option({required this.id, required this.content});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
    };
  }
}