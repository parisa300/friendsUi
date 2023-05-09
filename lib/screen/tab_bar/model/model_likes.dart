
class ModelLikes {
  final String image;
  final String icon;
  final String title;
  final String desc;

  ModelLikes({required this.image,required this.icon,required this.title, required this.desc});
}

class ActionProviderLike {
  List<ModelLikes> getDepositList() {
    return [
      ModelLikes(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',icon: 'assets/image/heart.png'),
      ModelLikes(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',icon: 'assets/image/heart.png'),
      ModelLikes(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',icon: 'assets/image/heart.png'),
      ModelLikes(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',icon: 'assets/image/heart.png'),
      ModelLikes(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',icon: 'assets/image/heart.png'),
      ModelLikes(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',icon: 'assets/image/heart.png'),

    ];
  }
}
