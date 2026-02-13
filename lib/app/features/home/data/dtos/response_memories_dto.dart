import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:memories_app/app/features/home/domain/memories_model.dart';

class ResponseMemoriesDto {
  String? uid;
  String? description;
  int? imageCount;
  List<String>? imageUrls;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  ResponseMemoriesDto({
    this.uid,
    this.description,
    this.imageCount,
    this.imageUrls,
    this.createdAt,
    this.updatedAt,
  });

  factory ResponseMemoriesDto.fromJson(Map<String, dynamic> json) =>
      ResponseMemoriesDto(
        uid: json["uid"],
        description: json["description"],
        imageCount: json["imageCount"],
        imageUrls: List<String>.from(json["imageUrls"] ?? []),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'description': description,
    'imageCount': imageCount,
    'imageUrls': imageUrls,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };

  MemoriesModel toModel() {
    return MemoriesModel(
      uid: uid ?? "",
      description: description ?? "",
      imageCount: imageCount ?? 0,
      imageUrls: imageUrls ?? [],
      createdAt: createdAt?.toDate() ?? DateTime.now(),
    );
  }
}
