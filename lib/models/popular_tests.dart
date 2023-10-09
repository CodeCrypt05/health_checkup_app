class PopularLabTests {
  final String title;
  final int discountPrice;
  final int price;

  const PopularLabTests({
    required this.title,
    required this.discountPrice,
    required this.price,
  });

  PopularLabTests.fromMap(Map<dynamic, dynamic> res)
      : title = res['title'],
        discountPrice = res['discountPrice'],
        price = res['price'];

  Map<String, Object?> toMap() {
    return {
      'title': title,
      'discountPrice': discountPrice,
      'price': price,
    };
  }
}
