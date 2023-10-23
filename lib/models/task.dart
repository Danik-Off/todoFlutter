class Task{
 int id;
 late String text;
 late bool done;
 
  Task({required this.text,required this.id, required this.done});
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'done': done,
    };
  }

  // Фабричный метод для создания объекта Task из JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      text: json['text'],
      done: json['done'],
    );
  }
}