class ModelChat {
  final String image;
  final String time;
  final String badge;
  final String title;
  final String desc;

  ModelChat({required this.image,required this.time,required this.title, required this.desc,required this.badge});
}

class ActionProvider {
  List<ModelChat> getDepositList() {
    return [
      ModelChat(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',time: '20:00',badge: '3'),
      ModelChat(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',time: '20:00',badge: '2'),
      ModelChat(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',time: '22:00',badge: '1'),
      ModelChat(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',time: '20:00',badge: '4'),
      ModelChat(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',time: '20:00',badge: '6'),
      ModelChat(image: 'assets/image/image_list.png', title: "azale",desc: 'hello everyTing',time: '20:00',badge: '3'),

    ];
  }
}
