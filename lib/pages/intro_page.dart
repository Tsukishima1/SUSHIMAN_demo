import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/button.dart';
import 'package:flutter_application_2/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  // 这一步是必须的，因为我们在 MaterialApp 中使用了 const 构造函数，所以这里也必须使用 const 构造函数

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 25),
              // shopname
              Text(
                "SUSHI MAN",
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 28, color: Colors.white),
              ),

              const SizedBox(height: 25),
              // 这个 SizedBox 是为了让下面的 Row 能够居中

              // icon
              Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset('lib/images/salmon_eggs.png')),

              const SizedBox(height: 25),

              // title
              Text(
                "THE TASTE OF JAPANESE FOOD",
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 44, color: Colors.white),
              ),

              const SizedBox(height: 25),

              // subtitle
              const Text(
                "Feel the taste of the most popular Japanese food from anywhere and anytime",
                style: TextStyle(
                    color: Color.fromARGB(255, 213, 213, 213), height: 2),
              ),

              const SizedBox(height: 25),

              // get started MyButton
              MyButton(
                text: "Get Started",
                onTap: () {
                  Navigator.pushNamed(context, '/menupage');
                },
              )
            ],
          )),
    );
  }
}
