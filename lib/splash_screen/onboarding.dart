import 'package:flutter/material.dart';
import 'login_page.dart';
import 'slider_model.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController(initialPage: 0);
  late List<SliderModel> slides;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    slides = <SliderModel>[
      SliderModel('Welcome to Classage', 'assets/eduon.jpg',
          'An online virtual classroom platform for teachers and students'),
      SliderModel('Video conference', 'assets/onlinelearning.png',
          'get the real classroom feel with video conferencing and many more features'),
      SliderModel('chat and share notes', 'assets/girlstudy.jpg',
          'chat with your teachers or classmates no need to open another app')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        itemCount: slides.length,
        itemBuilder: (context, index) {
          return SliderTile(
            title: slides[index].title,
            imageAssetPath: slides[index].imagePath,
            description: slides[index].description,
          );
        },
      ),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              color: Colors.white,
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          pageController.animateToPage(
                            currentIndex - 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.linear,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          buildBottomModalSheet();
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          pageController.animateToPage(
                            currentIndex + 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.linear,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Container(
              height: 65,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
              child: ElevatedButton(
                onPressed: () {
                  buildBottomModalSheet();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  buildBottomModalSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          alignment: Alignment.center,
          //width: MediaQuery.of(context).size.width,
          //color: Colors.white,
          height: 400,
          padding: const EdgeInsets.all(20),
          child: const LoginPage(),
        );
      },
    );
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: isCurrentPage ? 12.0 : 8.0,
      width: isCurrentPage ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.blue : Colors.grey[400],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class SliderTile extends StatelessWidget {
  const SliderTile(
      {Key? key, required this.imageAssetPath,
      required this.title,
      required this.description}) : super(key: key);

  final String imageAssetPath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 120),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 30),
          ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(imageAssetPath, height: 320)),
          const SizedBox(height: 30),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
