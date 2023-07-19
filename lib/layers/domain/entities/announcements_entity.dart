class AnnouncementsEntity {
  final int id;
  final String? urlPhoto;
  final String description;
  // final RepresentativeEntity representative;

  AnnouncementsEntity({
    required this.id,
    this.urlPhoto,
    required this.description,
    // required this.representative,
  });
}
