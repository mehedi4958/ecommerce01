class Clothes {
  Clothes(
    this.productName,
    this.price,
    this.imageUrl,
  );

  String? productName;
  String? price;
  String? imageUrl;

  static List<Clothes> generateClothes() {
    return [
      Clothes(
        'Gucci oversize',
        '\$70.99',
        'assets/images/arrival1.png',
      ),
      Clothes(
        'T-Shirt oversize',
        '\$80.99',
        'assets/images/arrival2.png',
      ),
      Clothes(
        'Gucci oversize',
        '\$70.99',
        'assets/images/arrival1.png',
      ),
    ];
  }
}
