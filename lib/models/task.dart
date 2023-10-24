class Task{
 String id;
 String text;
 bool done;
 
  Task({required this.text,required this.id, required this.done});
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'done': done,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      text: json['text'],
      done: json['done'],
    );
  }
}