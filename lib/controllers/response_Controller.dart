


import 'package:get/get.dart';

import '../models/response_model.dart';
import '../services/coinService.dart';

class CoinController  extends GetxController{


  RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchCoin();
    
  }



  List<Coin> coinList = <Coin>[].obs;

  fetchCoin() async {
    isLoading(true);
    final coins = await CoinService.fetchCoin();
    if (coins != null) {
      coinList = coins;
      //print("The List is... ${campaignsList[0].name}]}");
      isLoading(false);
    } else {   print("The List is... ${coinList}");}
  }

}