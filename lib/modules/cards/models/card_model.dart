import 'package:uuid/uuid.dart';

class CardSide {
  CardSide({
    required this.text,
    this.imageUrl,
  });

  final String text;
  final String? imageUrl;

  Map<String, dynamic> toJson() => {
    'text': text,
    'imageUrl': imageUrl,
  };

  factory CardSide.fromJson(Map<String, dynamic> json) => CardSide(
    text: json['text'],
    imageUrl: json['imageUrl'],
  );
}

class CardFront extends CardSide {
  CardFront({
    required this.title,
    required super.text,
    super.imageUrl,
  });

  final String title;

  @override
  Map<String, dynamic> toJson() => {
    'title': title,
    ...super.toJson(),
  };

  factory CardFront.fromJson(Map<String, dynamic> json) => CardFront(
    title: json['title'],
    text: json['text'],
    imageUrl: json['imageUrl'],
  );
}

class FlashCard {
  FlashCard({
    String? id,
    required this.front,
    required this.back,
    List<String>? deckIds,
    List<String>? tagIds,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : 
    id = id ?? const Uuid().v4(),
    deckIds = deckIds ?? [],
    tagIds = tagIds ?? [],
    createdAt = createdAt ?? DateTime.now(),
    updatedAt = updatedAt ?? DateTime.now();

  final String id;
  final CardFront front;
  final CardSide back;
  final List<String> deckIds;
  final List<String> tagIds;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
    'id': id,
    'front': front.toJson(),
    'back': back.toJson(),
    'deckIds': deckIds,
    'tagIds': tagIds,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}
