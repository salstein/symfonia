import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:symfonia/controllers/response_Controller.dart';
import 'package:symfonia/styles.dart';
import 'package:symfonia/view/loading_page.dart';
import 'package:symfonia/view/widgets.dart';


CoinController coinController = Get.put(CoinController());
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: dashBack, appBar: appBar(), body:coinController.obx((state){return appBody();

        }, onLoading:const Loading()) );
  }
}
