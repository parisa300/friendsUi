
class SliderModel {

  final String image;

  SliderModel({ required this.image});
}

class SliderProvider {
  List<SliderModel> getDepositList() {
    return [
      SliderModel( image: "assets/image/girl.png"),
      SliderModel(image: "assets/image/girl.png",),
      SliderModel(image: "assets/image/girl.png"),
      SliderModel(image: "assets/image/girl.png"),
      SliderModel(image: "assets/image/girl.png"),
      SliderModel(image: "assets/image/girl.png"),
      SliderModel(image: "assets/image/girl.png"),
      SliderModel(image: "assets/image/girl.png"),
    ];
  }
}