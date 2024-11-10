class Planet {
  final String name;
  final String description;
  final String imagePath;

  Planet({
    required this.name,
    required this.description,
    required this.imagePath, required Map<String, String> otherCharacteristics, required String imageGifPath, required String imageJpgPath,
  });

  get otherCharacteristics => null;

  get imageGifPath => null;

  get imageJpgPath => null;
}
