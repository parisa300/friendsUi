import 'package:flutter/material.dart';
import 'package:friends/resource/app_color.dart';
import 'package:friends/screen/item_model_best_pic.dart';
import 'package:friends/screen/list_horizontal_screen.dart';
import 'package:friends/widget/custom_btn_about.dart';

class ProfileUserScreen extends StatefulWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  late PageController _pageController;
  bool isCloseFocus = true;
  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg",
  ];

  int activePage = 1;
  void showToast() {
    setState(() {
      isCloseFocus = !isCloseFocus;
    });
  }
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    _slider(),
                    _contnair_Bottom(),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _slider() {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(images, pagePosition, active);
              }),
        ),
        Positioned(
          top: 150,
          right: 100,
          left: 100,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(images.length, activePage)),
        ),
      ],
    );
  }

  AnimatedContainer slider(images, pagePosition, active) {
    double margin = active ? 10 : 20;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(images[pagePosition]))),
    );
  }

  imageAnimation(PageController animation, images, pagePosition) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, widget) {
        print(pagePosition);

        return SizedBox(
          width: 200,
          height: 200,
          child: widget,
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Image.network(images[pagePosition]),
      ),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  Widget _contnair_Bottom() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(32), topLeft: Radius.circular(32)),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Jenny Wilson,25',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Row(
                          children: [
                            const Text('Model'),
                            const SizedBox(width: 16),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16))),
                              child: const Text(
                                'Sagitarius',
                                style: TextStyle(
                                  color: AppColors.colorApp,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.colorApp, width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                      ),
                      child: const Text(
                        '3 km',
                        style: TextStyle(color: AppColors.colorApp),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            _listBestPhoto(),
            SizedBox(height: 8),
            _about(),
            _detailAbout(),
            //  _interest()
          ],
        ),
      ),
    );
  }

  Widget _listBestPhoto() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Your Best Photos',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildList(),
        ),
      ],
    );
  }

  Widget _buildList() {
    var list = ItemProvider().getDepositList();
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListHorizontalScreen(
            item: list[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 16);
        },
      ),
    );
  }

  Widget _about() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children:   [
          const Expanded(
              child: Text(
            'About',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          )),
          InkWell(
            onTap: showToast,
            child:  SizedBox(
              height: 50,
              width: 50,
              child: Expanded(
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.colorApp,
                  foregroundColor: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: isCloseFocus ? const Icon(Icons.add) : const Icon(Icons.close),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailAbout() {
    return Visibility(
      visible: isCloseFocus,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: const TextSpan(
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                      ' Volutpat massa diam vitae ut a. Placerat orci sed lacus, nullam posuere mi,'
                      ' porttitor hac tellus. Amet phasellus elit sit quam risus felis duis in id. ',
                  style: TextStyle(color: Colors.black)),
            ),
          ),
          const SizedBox(height: 8),
          _interest(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _interest() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomBtnAbout(
          title: 'Dancing',
          onPressed: () {},
          icons: 'assets/image/dance.png',
          color: AppColors.colorApp,
        ),
        SizedBox(width: 8),
        CustomBtnAbout(
          title: 'Gym & Fitness',
          onPressed: () {},
          icons: 'assets/image/gym.png',
          color: AppColors.colorApp,
        ),
        SizedBox(
          width: 8,
        ),
        CustomBtnAbout(
          title: 'Food',
          onPressed: () {},
          icons: 'assets/image/food.png',
          color: AppColors.colorApp,
        )
      ],
    );
  }
}
