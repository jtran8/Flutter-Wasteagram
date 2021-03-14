class FoodWastePost {
  String imgURL;
  int leftovers;
  double lat;
  double long;
  DateTime date;

  FoodWastePost({this.imgURL, this.leftovers, this.lat, this.long, this.date});

  Map<String, dynamic> toJson() => {
    'date': this.date,
    'imgURL': this.imgURL,
    'lat': this.lat,
    'long': this.long,
    'leftovers': this.leftovers,
  };
}
