import 'package:flutter/material.dart';
import 'package:shop_application/core/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../auth_feature/presentation/pages/login_screen.dart';
import '../core/utiles/contants.dart';

class BoardingModel {
  final String image;
  final String textTitle;
  final String textBody;

  BoardingModel(
      {required this.image, required this.textTitle, required this.textBody});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool isLast = false;
  var bordController = PageController();
  List<BoardingModel> model = [
    BoardingModel(
        image: 'images/na_january_12.jpg',
        textTitle: 'Welcome to shop',
        textBody: 'The world\'s largest shopping and travel community'),
    BoardingModel(
        image: 'images/na_january_32.jpg',
        textTitle: 'Shop from home',
        textBody: 'get any product from home'),
    BoardingModel(
        image: 'images/10966.jpg',
        textTitle: 'Travel for less',
        textBody:
            'Make money every time ypu travel, by delivering products to locals along the way '),
  ];

  void submit() {
    CacheHelper.setData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
             submit();
            },
            child: const Text(
              'SKIP',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: bordController,
                onPageChanged: (int index) {
                  if (index == model.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(model[index]),
                itemCount: model.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: bordController,
                  count: model.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    spacing: 5,
                    dotWidth: 10,
                    dotHeight: 10,
                    expansionFactor: 4,
                    activeDotColor: defaultColor,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      bordController.nextPage(
                        duration: const Duration(microseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image),
            ),
          ),
          Text(
            model.textTitle,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            model.textBody,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      );
}
