

class ItemModelBestPic{
  final String image;

  ItemModelBestPic({ required this.image});
}

class ItemProvider {
  List<ItemModelBestPic> getDepositList() {
    return [
      ItemModelBestPic( image: "assets/image/list_item1.png"),
      ItemModelBestPic(image: "assets/image/list_item1.png",),
      ItemModelBestPic(image: "assets/image/list_item1.png"),
      ItemModelBestPic(image: "assets/image/list_item1.png"),

    ];
  }
}