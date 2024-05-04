class ModelItem {
  final String id;

  final int likeCount;

  final String firstName;
  final String lastName;
  final String profilePic;
  final String filePath;

  ModelItem({
    required this.id,

    // required this.likedBy,
    required this.likeCount,
    required this.firstName,
    required this.lastName,
    required this.profilePic,
    required this.filePath,
  });

  factory ModelItem.fromJson(Map<String, dynamic> json) {
    return ModelItem(
      likeCount: json['likeCount'],
      filePath: json['filePath'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePic: json['profilePic'],
      id: 'id',
    );
  }
}
