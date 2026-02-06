class Answer {
  final String content;

  Answer({required this.content});

  Map<String, dynamic> toJson() {
    return {
      'content': content,
    };
  }
}

