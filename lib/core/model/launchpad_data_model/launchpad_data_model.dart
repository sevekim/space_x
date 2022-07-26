class LaunchPadData {
  /// String values
  final String? id;
  final String? name;
  final String? full_name;
  final String? locality;
  final int? launchAttempts;
  final int? launchSuccesses;
  final String? status;
  final String? details;
  final Map<String, dynamic>? images;

  LaunchPadData({
    this.id,
    this.name,
    this.full_name,
    this.details,
    this.images,
    this.launchAttempts,
    this.launchSuccesses,
    this.locality,
    this.status,
  });

  factory LaunchPadData.fromDoc(Map<dynamic, dynamic> doc) {
    return LaunchPadData(
      id: doc['id'] ?? 'Unknown',
      name: doc['name'] ?? 0,
      full_name: doc['full_name'],
      details: doc['details'],
      images: doc['images'],
      launchAttempts: doc['launch_attempts'],
      launchSuccesses: doc['launch_successes'],
      locality: doc['locality'],
      status: doc['status'],
    );
  }
}
