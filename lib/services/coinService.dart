import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:symfonia/models/response_model.dart';





class CoinService {
  static var client = http.Client();

  static Future<List<Coin>?> fetchCoin() async {
    var res = await client.get(
      Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"),
     
    );
    if (res.statusCode == 200) {
      var jsonData = json.decode(res.body);
      Iterable l = jsonData;
      List<Coin> coin = List<Coin>.from(
          l.map((model) => Coin.fromJson(model)));
     
      return coin;
    } else {
      return null;
    }
  }
}
