import 'package:flutter_test/flutter_test.dart';
import 'package:wasteagram/models/post.dart';

void main() {
  test('Created post instance should have appropriate property values', () {
    final date = DateTime.parse('2020-01-01');
    const url = 'FAKE';
    const quantity = 1;
    const latitude = 1.0;
    const longitude = 2.0;

    final post = FoodWastePost(
      date: date,
      imgURL: url,
      leftovers: quantity,
      lat: latitude,
      long: longitude
    );

    expect(post.date, date);
    expect(post.imgURL, url);
    expect(post.leftovers, quantity);
    expect(post.lat, latitude);
    expect(post.long, longitude);
  });

  test('toMap method returns a map', () {
    final date = DateTime.parse('2020-01-01');
    const url = 'FAKE';
    const quantity = 1;
    const latitude = 1.0;
    const longitude = 2.0;

    final post = FoodWastePost(
      date: date,
      imgURL: url,
      leftovers: quantity,
      lat: latitude,
      long: longitude
    );

    expect(post.toMap(), isMap);
  });
}
