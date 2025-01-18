import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size.config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let's shop!",
      "image": "assets/images/Screenshot 2025-01-17 203812.png",
    },
    {
      "text": "We help people connect with store \naround United States of America",
      "image": "assets/images/Screenshot 2025-01-13 122913.png",
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/travell.png",
    },
  ];

  int currentPage = 0; // To track the active page
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // Ensure SizeConfig is initialized here
    SizeConfig().init(context);

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            // Upper section taking 3/5 of the space
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal, // Horizontal scroll
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value; // Update the current page
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  key: Key('splash_content_$index'),
                  text: splashData[index]['text'] ?? '',
                  image: splashData[index]['image'] ?? '',
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  const SizedBox(height: 20), // Add spacing between dots and button
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red, // Background color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Rounded corners
                      ),
                    ),
                    onPressed: () {
                      // Add your onPressed action here
                      print("Continue button pressed");
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 6,
      width: currentPage == index ? 12 : 6, // Change width for active dot
      decoration: BoxDecoration(
        color: currentPage == index
            ? Colors.red // Active dot color
            : const Color.fromARGB(255, 230, 230, 230), // Inactive dot color
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    required Key key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(flex: 2),
        Text(
          "Tokoto",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: const Color.fromARGB(255, 241, 8, 8),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        const Spacer(flex: 4),
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
