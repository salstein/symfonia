import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:symfonia/models/response_model.dart';
import '../config/size_config.dart';
import '../controllers/response_Controller.dart';
import '../styles.dart';







/// The List tile card for displaying coin information 
/// 
/// 
/// 
/// 
Widget card(
  BuildContext context,
Coin coin
) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
    child: Row(children: [
      Container(
        width: w(60,context),
        height: 90,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
              backgroundColor: white,
              child: Image.network(
                coin.image!,
                fit: BoxFit.contain,
                height: 50,
                width: 50,
              )),
        ),
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          shape: BoxShape.rectangle,
        ),
      ),
      const Spacer(flex: 1),
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(coin.priceChangePercentage24H! > 0 ? "Recieved" : "Sent",
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
          Text(coin.name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          Text(dateFormat(coin.lastUpdated!), style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
      const Spacer(flex: 5),
      Text(
          (coin.priceChangePercentage24H! < 0
              ? ("-\$" + (coin.priceChangePercentage24H! * -1).toStringAsFixed(2))
              : "+\$" + coin.priceChangePercentage24H!.toStringAsFixed(2)),
          style: TextStyle(
              color: coin.priceChangePercentage24H! > 0 ? Colors.green : Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold)),
    ]),
  );
}

///
///
///
///
///
///
///
/// the app bar for the home page of the app.

PreferredSizeWidget appBar() {
  return AppBar(
    title: const Text('History',
        style: TextStyle(
          color: black,
          fontWeight: FontWeight.w800,
          fontSize: 24,
        )),
    backgroundColor: dashBack,
    elevation: 0,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(
          children: const [
            Icon(
              Icons.equalizer,
              color: black,
            ),
            Text("  Sort/Filter",
                style: TextStyle(
                    color: black, fontSize: 15, fontWeight: FontWeight.w600))
          ],
        ),
      ),
    ],
  );
}





///
///
///
///
///
///
///
///
// the body of the home page of the app.

CoinController _coinController = Get.put(CoinController());

Widget appBody() {
  return SizedBox(
    height: Get.height * 0.8,
    child: RefreshIndicator(
      semanticsValue: "Refresh",
                  color: Colors.green,
                  triggerMode: RefreshIndicatorTriggerMode.anywhere,
                  onRefresh: () async {
                    await _coinController.fetchCoin();
                  },
      child: ListView.builder(
        itemCount: _coinController.coinList.length,
        itemBuilder: (context, index) {
          return card(
            context,
            _coinController.coinList[index]
          );
        },
      ),
    ),
  );
}


/// 
/// 
/// 
/// 
/// 
/// 
/// Formatting the date from a DateTime format to a more readable format, Using Jiffy.
/// 
/// 

String dateFormat(DateTime date) {
  return Jiffy(date).format('MMMM do yyyy, h:mm:ss a');
}