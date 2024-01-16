class HotelModel {
  int id;
  String name;
  String address;
  int minimalPrice;
  String priceForIt;
  int rating;
  String ratingName;
  List<String> imageUrls;
  HotelDetails aboutTheHotel;

  HotelModel({
    required this.id,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  factory HotelModel.fromJson(Map<String, dynamic>? json) {
    if(json==null) return HotelModel.empty();
    return HotelModel(
      id: json['id'],
      name: json['name'],
      address: json['adress'],
      minimalPrice: json['minimal_price'],
      priceForIt: json['price_for_it'],
      rating: json['rating'],
      ratingName: json['rating_name'],
      imageUrls: List<String>.from(json['image_urls']),
      aboutTheHotel: HotelDetails.fromJson(json['about_the_hotel']),
    );
  }
  
  factory HotelModel.empty() {
        return HotelModel(
      id: 0,
      name: "",
      address: "",
      minimalPrice: 0,
      priceForIt: "",
      rating: 0,
      ratingName: "",
      imageUrls: [],
      aboutTheHotel: HotelDetails.empty(),
    );
  }
}

class HotelDetails {
  String description;
  List<String> peculiarities;

  HotelDetails({
    required this.description,
    required this.peculiarities,
  });

  factory HotelDetails.fromJson(Map<String, dynamic> json) {
    return HotelDetails(
      description: json['description'],
      peculiarities: List<String>.from(json['peculiarities']),
    );
  }
  
  factory HotelDetails.empty() {
        return HotelDetails(
      description: "",
      peculiarities: [],
    );
  }
}