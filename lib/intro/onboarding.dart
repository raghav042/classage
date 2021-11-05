import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'userAgreement.dart';
import 'slider_model.dart';
import 'dart:io';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.blue : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        itemBuilder: (context, index) {
          return SliderTile(
            imageAssetPath: slides[index].imagePath,
            title: slides[index].title,
            description: slides[index].description,
          );
        },
        itemCount: slides.length,
      ),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              color: Colors.white,
              height: Platform.isIOS ? 80 : 70,
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          pageController.animateToPage(
                            slides.length - 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear,
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.white,
                                    height: 390,
                                    padding: EdgeInsets.all(20),
                                    child: UserAgreement(),
                                  );
                                });
                          },
                          child: Text(
                            "GET STARTED",
                            style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
                          )),
                      IconButton(
                        onPressed: () {
                          pageController.animateToPage(
                            currentIndex + 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear,
                          );
                        },
                        icon: Icon(
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
              width: double.infinity,
              height: 85,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: ElevatedButton(
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          height: 390,
                          padding: EdgeInsets.all(20),
                          child: UserAgreement(),
                        );
                      });
                },
              )),
    );
  }
}

class SliderTile extends StatelessWidget {
  String imageAssetPath;
  String title;
  String description;

  SliderTile({this.imageAssetPath, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          SizedBox(height: 120),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
              child: Image.asset(imageAssetPath, height: 320)),

          SizedBox(height: 30),

          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
