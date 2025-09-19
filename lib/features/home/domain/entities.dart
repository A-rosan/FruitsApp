class BtmNavBarEntity {
  final String activeImage;
  final String unActiveImage;
  final String name;

  BtmNavBarEntity({
    required this.activeImage,
    required this.unActiveImage,
    required this.name,
  });
  List<BtmNavBarEntity> get btmNavItemsList => [
        BtmNavBarEntity(
          activeImage: "assets/images/fill_home.svg",
          unActiveImage: "assets/images/home.svg",
          name: "الرئيسية",
        ),
        BtmNavBarEntity(
          activeImage: "assets/images/fill_products.svg",
          unActiveImage: "assets/images/products.svg",
          name: "المنتجات",
        ),
        BtmNavBarEntity(
          activeImage: "assets/images/fill_shopping_cart.svg",
          unActiveImage: "assets/images/shopping_cart.svg",
          name: "سلة السوق",
        ),
        BtmNavBarEntity(
          activeImage: "assets/images/fill_user.svg",
          unActiveImage: "assets/images/user.svg",
          name: "حسابي",
        ),
      ];
}
