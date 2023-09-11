void main() {
  var restaurants = [
    {
      'name': 'Pizza Mario',
      'cuisine': 'Italian',
      'ratings': [4.0, 3.5, 4.5],
    },
    {
      'name': 'Chez Anne',
      'cuisine': 'French',
      'ratings': [5.0, 4.5, 4.0],
    },
    {
      'name': 'Navaratna',
      'cuisine': 'Indian',
      'ratings': [4.0, 4.5, 4.0],
    },
  ];
  restaurants = restaurants.map((e) {
    double sum = 0.0;
    (e['ratings'] as List).forEach((element) => sum += element);
    e['avg_rating'] = sum / (e['ratings'] as List).length;
    return e;
  }).toList();
  print(restaurants);
}
