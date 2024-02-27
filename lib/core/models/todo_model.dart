import 'dart:convert';

class TodoModel {
  String title;
  bool isChecked;
  TodoModel({
    required this.title,
    required this.isChecked,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isChecked': isChecked == true ? 1 : 0,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      title: map['title'] as String,
      isChecked: map['isChecked'] == 1 ? true : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class TodoEntity extends TodoModel {
  TodoEntity({
    required super.title,
    required super.isChecked,
    required this.id,
  });
  String id;

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isChecked': isChecked == true ? 1 : 0,
    };
  }

  @override
  factory TodoEntity.fromMap(Map<String, dynamic> map) {
    return TodoEntity(
      title: map['title'] as String,
      isChecked: map['isChecked'] == 1 ? true : false,
      id: map['id'].toString(),
    );
  }
}
