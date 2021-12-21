import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kwg/controllers/post_controller.dart';
import 'package:kwg/ui/common/constants.dart';
import 'package:kwg/ui/common/kwg_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class PostPage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        backgroundColor: PRIMARY_COLOR,
        actions: [
          IconButton(
              onPressed: () {
                const url = 'https://www.kwgsoftworks.com/';
                launchURL(url);
              },
              icon: Icon(Icons.link))
        ],
      ),
      body: Obx(() {
        if (postController.isLoading.value)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
                itemCount: postController.posttList.length.clamp(25, 100),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8,
                    color: WHITE,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 20, 40, 0),
                          child: Text(
                            StringUtils.capitalize(
                                postController.posttList[index].name),
                            style: headerStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            postController.posttList[index].email,
                            style: TextStyle(
                                color: PRIMARY_COLOR, fontFamily: "Poppins"),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context) * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 10, 20),
                          child: Text(
                            postController.posttList[index].body,
                            style: TextStyle(fontFamily: "Poppins"),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          );
      }),
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
