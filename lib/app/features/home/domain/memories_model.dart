class MemoriesModel {
  String uid;
  String description;
  int imageCount;
  List<String> imageUrls;
  DateTime createdAt;

  MemoriesModel({
    required this.uid,
    required this.description,
    required this.imageCount,
    required this.imageUrls,
    required this.createdAt,
  });
}
