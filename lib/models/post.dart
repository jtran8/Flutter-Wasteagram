class FoodWastePost {
  String imgURL;
  int leftovers;
  double lat;
  double long;
  DateTime date;

  FoodWastePost({this.imgURL, this.leftovers, this.lat, this.long, this.date});

  Map<String, dynamic> toJson() => {
    'imgURL': this.imgURL,
    'leftovers': this.leftovers,
    'lat': this.lat,
    'long': this.long,
    'date': this.date,
  };
}
