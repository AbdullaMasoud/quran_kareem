import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:musilm_app/core/utils/assets_manager.dart';
import 'package:musilm_app/features/azkar_details/data/models/azkar.dart';

abstract class GetAzkarLocalDataSource {
  Future<List<AzkarDataModel>> getazkar();
}

class GetAzkarLocalDataSourceImpl implements GetAzkarLocalDataSource {
  @override
  Future<List<AzkarDataModel>> getazkar() async {
    final jsonResponse = await rootBundle.loadString(AssetsManager.azkarJson);
    var response = jsonDecode(jsonResponse) as List;
    return response.map((res) => AzkarDataModel.fromJson(res)).toList();
    // var ss = AzkarDataModel.fromJson(response);
    // print(response.runtimeType);
    // var ss = (response).map((res) => AzkarDataModel.fromJson(res));
    // print(ss.runtimeType);
    // return ss;
    // return AzkarDataModel.fromJson(response) as List<AzkarDataModel>;
  }
}
