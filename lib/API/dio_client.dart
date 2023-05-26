import 'package:dio/dio.dart';
import 'package:eurisko_exam_nft/models/nft_list_model.dart';
import 'package:flutter/foundation.dart';

import '../models/nft_item_model.dart';

class DioClient with ChangeNotifier {
  final Dio _dio = Dio();
  List<NFTListModel?> nftList = [];

  final _baseUrl = 'https://api.coingecko.com/api/v3';

  Future<void> getNFTList(int pageNumber) async {
    Response response =
        await _dio.get('$_baseUrl/nfts/list?per_page=5&page=$pageNumber');

    if (kDebugMode) {
      print('List Info: $response');
    }

    List<dynamic> jsonData = response.data;

    List<NFTListModel?> nftListModel =
        jsonData.map((json) => NFTListModel.fromJson(json)).toList();

    if (pageNumber == 1) {
      nftList = nftListModel;
      notifyListeners();
    } else {
      nftList.addAll(nftListModel);
      notifyListeners();
    }
  }

  Future<NFTItemModel?> getNFTItem(String id) async {
    Response response = await _dio.get('$_baseUrl/nfts/$id');

    if (kDebugMode) {
      print('Item Info: $response');
    }

    NFTItemModel item = NFTItemModel.fromJson(response.data);

    return item;
  }
}
