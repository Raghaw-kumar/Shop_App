import 'package:flutter/material.dart';
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
      "text": "We help people connect with store \naround United State of America",
      "image": "assets/images/Screenshot 2025-01-17 203812.png",
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/Screenshot 2025-01-17 203812.png",
    },
  ];
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
                itemCount: splashData.length,
                itemBuilder: (context, index) => const SplashContent(
                key: Key('splash_content'),
                image:"assets/images/Screenshot 2025-01-17 203812.png",
                text: "Welcome to Tokoto, Let's shop!",
              ),
                ),
                ),
              
            
             const Expanded(
              flex: 2,
              child: SizedBox(),
            )
          ],
        ),
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
        const Spacer(flex: 2,),
        Text(
          "Tokoto",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: const Color.fromARGB(15, 4, 140, 11),
            fontWeight: FontWeight.bold,
          ),
        ),
       Text(text),
       const Spacer(flex: 2),
       Image.asset(
         image,
       ),
      ],
    );
  }
}
