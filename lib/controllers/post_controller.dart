import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:kwg/services/ApiUtils.dart';
import 'package:kwg/ui/common/snackbar.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var posttList = [].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiUtils.fetchPost();
      if (posts != null) {
        posttList.assignAll(posts);
      } else {
        CustomSnackbar.showErrorSnackbar('Error', 'Unable to load posts');
        Get.back();
      }
    } finally {
      isLoading(false);
    }
  }
}
