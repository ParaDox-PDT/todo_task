class ToDoModelField {
  static const String name = "name";
  static const String description = "description";
  static const String time = "time";
  static const String location = "location";
  static const String priority = "priority";
  static const String id = "id";
  static const String yearMonth = "yearMonth";
  static const String day = "day";

  static const String tableName = "to_do_table";
}

class ToDoModel {
  int? id;
  final String name;
  final String description;
  final String time;
  final String? location;
  final int priority;
  final String yearMonth;
  final String day;

  ToDoModel(
      {required this.yearMonth,
      required this.day,
      required this.name,
      required this.location,
      required this.description,
      required this.priority,
      required this.time,
      this.id});

  factory ToDoModel.fromJson(Map<String, dynamic> json) {
    return ToDoModel(
        id: json["id"] as int? ?? 0,
        name: json["name"] as String? ?? "",
        location: json["location"] as String? ?? "",
        description: json["description"] as String? ?? "",
        priority: json["priority"] as int? ?? 0,
        time: json["time"] as String? ?? "",
        yearMonth: json["yearMonth"] as String? ?? "",
        day: json["day"] as String? ?? "");
  }

  ToDoModel copyWith({
    String? name,
    int? id,
    String? description,
    String? location,
    String? time,
    String? yearMonth,
    String? day,
    int? priority,
  }) {
    return ToDoModel(
        name: name ?? this.name,
        location: location ?? this.location,
        description: description ?? this.description,
        priority: priority ?? this.priority,
        time: time ?? this.time,
        yearMonth:  yearMonth ?? this.yearMonth,
        day:  day ?? this.day);
  }

  Map<String, dynamic> toJson() {
    return {
      ToDoModelField.name: name,
      ToDoModelField.id: id,
      ToDoModelField.yearMonth: yearMonth,
      ToDoModelField.day: day,
      ToDoModelField.description: description,
      ToDoModelField.time: time,
      ToDoModelField.priority: priority,
      ToDoModelField.location: location
    };
  }

  @override
  String toString() {
    return '''
    ${ToDoModelField.name}: $name,
    ${ToDoModelField.id}: $id,
    ${ToDoModelField.description}: $description,
    ${ToDoModelField.yearMonth}: $yearMonth,
    ${ToDoModelField.day}: $day,
    ${ToDoModelField.time}: $time,
    ${ToDoModelField.priority}: $priority,
    ${ToDoModelField.location}: $location
    ''';
  }
}
