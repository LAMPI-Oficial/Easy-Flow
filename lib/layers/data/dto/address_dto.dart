import 'package:easyflow/layers/domain/entities/address_entity.dart';

class AddressDto extends AddressEntity {
  AddressDto({
    required String cep,
    required String city,
    required String state,
    required String district,
    required String street,
    required String number,
    required String complement,
    
  }) : super(
         cep: cep,
         city: city,
         state: state,
         district: district,
         street: street,
         number: number,
         complement: complement,
        );

   Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'state': state,
      'city': city,
      'district': district,
      'street': street,
      'number': number,
      'complement': complement,
    };
  }

  static AddressDto fromMap(Map map) {
    return AddressDto(
      cep: map['cep'],
      state: map['state'],
      city: map['city'],
      district: map['district'],
      street: map['street'],
      number: map['number'],
      complement: map['complement'],
    );
  }
}
