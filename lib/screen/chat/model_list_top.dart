

class ModelListTop{
  String title;
  String image;

  ModelListTop( {required this.image,required this.title});
}
class ModelListProvider{

  List<ModelListTop> getDepositList() {
    return [
      ModelListTop(image: 'assets/image/girl2.png', title: "azale"),
      ModelListTop(image: 'assets/image/image_list.png', title: "azale"),
      ModelListTop(image: 'assets/image/girl2.png', title: "azale"),
      ModelListTop(image: 'assets/image/image_list.png', title: "azale"),
      ModelListTop(image: 'assets/image/girl2.png', title: "azale"),
      ModelListTop(image: 'assets/image/image_list.png', title: "azale"),

    ];
  }
}