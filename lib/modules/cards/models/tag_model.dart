import 'package:uuid/uuid.dart';

class Tag {
  Tag({
    String? id,
    required this.name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : 
    id = id ?? const Uuid().v4(),
    createdAt = createdAt ?? DateTime.now();
  
  final String id;
  final String name;
  final DateTime createdAt;


  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'createdAt': createdAt.toIso8601String(),
  };

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json['id'],
    name: json['name'],
    createdAt: DateTime.parse(json['createdAt']),
  );
}
