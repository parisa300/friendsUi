import 'package:flutter/material.dart';
import 'package:friends/screen/list_slider.dart';
import 'package:friends/utils/content.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  List<String> _names = [
    "Raha",
    "Parisa",
    "Arian",
    "Sahar",
    "Yasaman",
    "freydon",
    "Hasti",
    "Sara"
  ];
  List<String> _image = [
    "assets/image/girl.png",
    "assets/image/girl.png",
    "assets/image/girl.png",
    "assets/image/girl.png",
    "assets/image/girl.png",
    "assets/image/girl.png",
  ];
  var list = SliderProvider().getDepositList();

  @override
  void initState() {
    for (int i = 0; i < _image.length; i++) {
      _swipeItems.add(SwipeItem(
          content: _image[i],
          likeAction: () {},
          nopeAction: () {},
          superlikeAction: () {},
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[Padding(  padding: const EdgeInsets.all(8.0),
            child: SizedBox(width: 400,height: 500,
              child: Stack(children: [

                Positioned(child: cardView()),
                Positioned(
                  bottom: 0,
                  right: 70,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/image/star.png'),
                      ),
                    ),
                  ), //CircularAvatar
                ),
                Positioned(
                  bottom: 0,
                  right: 130,
                  child: SizedBox(
                    height: 65,
                    width: 65,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/image/delete.png'),
                      ),
                    ),
                  ), //CircularAvatar
                ),
                Positioned(
                  bottom: 0,
                  right: 200,
                  child: SizedBox(
                    height: 65,
                    width: 65,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/image/heart.png'),
                      ),
                    ),
                  ), //CircularAvatar
                ),
                Positioned(
                  bottom: 0,
                  left: 70,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/image/heart.png'),
                      ),
                    ),
                  ), //CircularAvatar
                ),





              ]),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(right: 56.0),
              child: _nameCard(3),
            )]
        ),

        );
  }

  Widget cardView() {
    return Center(
      child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.5 - 100,
          width: MediaQuery.of(context).size.width / 1.3 - 10,
          child: SwipeCards(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    _image[index],
                    fit: BoxFit.fill,
                  ));
            },
            onStackFinished: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Stack Finished"),
                duration: Duration(milliseconds: 500),
              ));
            },
            matchEngine: _matchEngine,
          )),
    );
  }

  Widget _nameCard(int index) {
    return Row(

      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 56.0),
            child: Column(
              children: [
                Row(children: [
                  Text(
                    _names[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Image.asset('assets/image/checked.png')
                ]

                ),
                const SizedBox(height: 8,),
                const Padding(
                  padding:  EdgeInsets.only(right: 120),
                  child: Text('Student'),
                )
              ],
            ),
          ),
        ),
        Expanded(

          child: Container(padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(36))),
            child: const Text('24 km'),
          ),
        ),
      ],
    );
  }
}
