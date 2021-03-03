class Space {
  final int id;
  final String name;
  final String city;
  final String country;
  final int price;
  final String imageUrl;
  final int ratting;
  final String address;
  final String phone;
  final String mapUrl;
  final List photos;
  final int numberOfKitchens;
  final int numberOfbedrooms;
  final int numberOfCupboards;

  Space(
      {this.id,
      this.name,
      this.city,
      this.country,
      this.price,
      this.imageUrl,
      this.ratting,
      this.address,
      this.phone,
      this.mapUrl,
      this.photos,
      this.numberOfKitchens,
      this.numberOfbedrooms,
      this.numberOfCupboards});

  factory Space.fromJson(json) {
    return Space(
        id: json['id'],
        name: json['name'],
        city: json['city'],
        country: json['country'],
        price: json['price'],
        imageUrl: json['image_url'],
        ratting: json['rating'],
        address: json['address'],
        phone: json['phone'],
        mapUrl: json['map_url'],
        photos: json['photos'],
        numberOfKitchens: json['number_of_kitchens'],
        numberOfbedrooms: json['number_of_bedrooms'],
        numberOfCupboards: json['number_of_cupboards']);
  }
}
