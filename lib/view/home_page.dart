import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:symfonia/controllers/response_Controller.dart';
import 'package:symfonia/styles.dart';
import 'package:symfonia/view/widgets.dart';


class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Obx(()=>
   Scaffold(
        backgroundColor: dashBack,
        appBar :appBar(),
        body:  CoinController().isLoading.value? SizedBox(child:Center(child:Column(children : const [CircularProgressIndicator(color:Colors.green), ],),)) :appBody()
      ),
    );
  }
}