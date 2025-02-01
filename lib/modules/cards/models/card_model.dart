import 'package:uuid/uuid.dart';

class CardSide {
  final String text;
  final String? imageUrl;

  CardSide({
    required this.text,
    this.imageUrl,
  });

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
  final String title;

  CardFront({
    required this.title,
    required super.text,
    super.imageUrl,
  });

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
  final String id;
  final CardFront front;
  final CardSide back;
  final List<String> deckIds;
  final List<String> tagIds;
  final DateTime createdAt;
  final DateTime updatedAt;

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
