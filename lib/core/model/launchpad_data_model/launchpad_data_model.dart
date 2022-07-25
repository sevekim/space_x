class LaunchPadData {
  /// String values
  final String? id;
  final String? name;
  final String? full_name;

  LaunchPadData({
    this.id,
    this.name,
    this.full_name,
  });

  factory LaunchPadData.fromDoc(Map<dynamic, dynamic> doc) {
    return LaunchPadData(
      id: doc['id'] ?? 'Unknown',
      name: doc['name'] ?? 0,
      full_name: doc['full_name'],
    );
  }
}
