class ModelFavorite {
  final String image;
  final String icon;
  final String title;
  final String desc;

  ModelFavorite({required this.image,required this.icon,required this.title, required this.desc});
}

class ActionProvider {
  List<ModelFavorite> getDepositList() {
    return [
      ModelFavorite(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',icon: 'assets/image/star.png'),
      ModelFavorite(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',icon: 'assets/image/star.png'),
      ModelFavorite(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',icon: 'assets/image/star.png'),
      ModelFavorite(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',icon: 'assets/image/star.png'),
      ModelFavorite(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',icon: 'assets/image/star.png'),
      ModelFavorite(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',icon: 'assets/image/star.png'),

    ];
  }
}
