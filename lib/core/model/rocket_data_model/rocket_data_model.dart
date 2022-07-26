class RocketData {
  /// String values
  final String? id;
  final String? name;
  final String? description;
  final String? wikipedia;
  final List<dynamic>? flickrImages;

  RocketData({
    this.id,
    this.name,
    this.description,
    this.wikipedia,
    this.flickrImages,
  });

  factory RocketData.fromDoc(Map<dynamic, dynamic> doc) {
    return RocketData(
      id: doc['id'] ?? 'Unknown',
      name: doc['name'] ?? 0,
      description: doc['description'] ?? 'Unknown',
      wikipedia: doc['wikipedia'] ?? 'Unknown',
      flickrImages: doc['flickr_images'] ?? [],
    );
  }
}
