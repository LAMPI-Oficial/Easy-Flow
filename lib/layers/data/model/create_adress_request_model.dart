class CreateAdressRequestModel {
  String complement;
  String municipality;
  String neighborhood;
  String number;
  String personId;
  String stateEnum;
  String street;

  CreateAdressRequestModel(
      {required this.complement,
      required this.municipality,
      required this.neighborhood,
      required this.number,
      required this.personId,
      required this.stateEnum,
      required this.street});

  Map toMap() {
    return {
      "complement": complement,
      "municipality": municipality,
      "neighborhood": neighborhood,
      "number": number,
      "person_id": int.parse(personId),
      "stateEnum": stateEnum,
      "street": street
    };
  }
}
