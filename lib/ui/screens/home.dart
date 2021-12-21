import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:kwg/ui/common/button.dart';
import 'package:kwg/ui/common/constants.dart';
import 'package:kwg/ui/common/kwg_theme.dart';
import 'package:kwg/ui/screens/post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight(context) * 0.08,
            ),
            Center(
                child: Image.asset(
              'assets/images/kwglogo.jpg',
              width: 200,
              height: 250,
            )),
            SizedBox(
              height: screenHeight(context) * 0.2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: defaultButton(
                  text: 'View Post',
                  color: WHITE,
                  onPressed: () {
                    Get.to(() => PostPage());
                  }),
            )
          ],
        ),
      ),
    );
  }
}
