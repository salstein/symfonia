


import 'package:get/get.dart';

import '../models/response_model.dart';
import '../services/coinService.dart';

class CoinController  extends GetxController with StateMixin{


  RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchCoin();
    
  }



  List<Coin> coinList = <Coin>[].obs;

  fetchCoin() async {
    
    change(null, status: RxStatus.loading());
  
    final coins = await CoinService.fetchCoin();
    if (coins != null) {
      change(coins, status: RxStatus.success());
      coinList = coins;
   
    } else { 
      change(null, status: RxStatus.error()); 
      
    }
  }

}