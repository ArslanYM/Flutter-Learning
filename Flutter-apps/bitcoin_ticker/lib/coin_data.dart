import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '7613BBC8-A677-4872-AB46-1A2A998AE9FD';

class CoinData {
  CoinData({this.currency});
  final currency;
  Future getCoinData() async {
    String requestURL =
        'https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=$apiKey';
    Uri coinAPIURI = Uri.parse(requestURL);
    http.Response response = await http.get(coinAPIURI);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print('Error while fetching');
      throw 'Problem';
    }
  }
}
