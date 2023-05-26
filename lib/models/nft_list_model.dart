class NFTListModel {
  String? id;
  String? contractAddress;
  String? name;
  String? assetPlatformId;
  String? symbol;

  NFTListModel(
      {this.id,
      this.contractAddress,
      this.name,
      this.assetPlatformId,
      this.symbol});

  NFTListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractAddress = json['contract_address'];
    name = json['name'];
    assetPlatformId = json['asset_platform_id'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contract_address'] = contractAddress;
    data['name'] = name;
    data['asset_platform_id'] = assetPlatformId;
    data['symbol'] = symbol;
    return data;
  }
}
