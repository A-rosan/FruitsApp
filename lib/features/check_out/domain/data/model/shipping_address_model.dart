import '../../address_entity.dart';

class AddressModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? floor;
  String? phone;

  AddressModel({
    this.name,
    this.email,
    this.address,
    this.city,
    this.floor,
    this.phone,
  });

  factory AddressModel.fromEntity(AddressEntity entity) {
    return AddressModel(
      name: entity.name,
      email: entity.email,
      address: entity.address,
      city: entity.city,
      floor: entity.floor,
      phone: entity.phone,
    );
  }
  toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'floor': floor,
      'phone': phone,
    };
  }
}
