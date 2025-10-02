class BtmNavBarItemess {
  final String activeImage;
  final String unActiveImage;
  final String name;

  BtmNavBarItemess({
    required this.activeImage,
    required this.unActiveImage,
    required this.name,
  });
  List<BtmNavBarItemess> get btmNavItemsList => [
        BtmNavBarItemess(
          activeImage: "assets/images/fill_home.svg",
          unActiveImage: "assets/images/home.svg",
          name: "الرئيسية",
        ),
        BtmNavBarItemess(
          activeImage: "assets/images/fill_products.svg",
          unActiveImage: "assets/images/products.svg",
          name: "المنتجات",
        ),
        BtmNavBarItemess(
          activeImage: "assets/images/fill_shopping_cart.svg",
          unActiveImage: "assets/images/shopping_cart.svg",
          name: "سلة السوق",
        ),
        BtmNavBarItemess(
          activeImage: "assets/images/fill_user.svg",
          unActiveImage: "assets/images/user.svg",
          name: "حسابي",
        ),
      ];
}
