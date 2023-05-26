class NFTItemModel {
  String? id;
  String? contractAddress;
  String? assetPlatformId;
  String? name;
  String? symbol;
  Image? nftImage;
  String? description;
  String? nativeCurrency;
  FloorPrice? floorPrice;
  MarketCap? marketCap;
  Volume24h? volume24h;
  num? floorPriceInUsd24hPercentageChange;
  num? numberOfUniqueAddresses;
  num? numberOfUniqueAddresses24hPercentageChange;
  num? volumeInUsd24hPercentageChange;
  num? totalSupply;
  Links? links;

  NFTItemModel(
      {this.id,
      this.contractAddress,
      this.assetPlatformId,
      this.name,
      this.symbol,
      this.nftImage,
      this.description,
      this.nativeCurrency,
      this.floorPrice,
      this.marketCap,
      this.volume24h,
      this.floorPriceInUsd24hPercentageChange,
      this.numberOfUniqueAddresses,
      this.numberOfUniqueAddresses24hPercentageChange,
      this.volumeInUsd24hPercentageChange,
      this.totalSupply,
      this.links});

  NFTItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractAddress = json['contract_address'];
    assetPlatformId = json['asset_platform_id'];
    name = json['name'];
    symbol = json['symbol'];
    nftImage = json['image'] != null ? Image.fromJson(json['image']) : null;
    description = json['description'];
    nativeCurrency = json['native_currency'];
    floorPrice = json['floor_price'] != null
        ? FloorPrice.fromJson(json['floor_price'])
        : null;
    marketCap = json['market_cap'] != null
        ? MarketCap.fromJson(json['market_cap'])
        : null;
    volume24h = json['volume_24h'] != null
        ? Volume24h.fromJson(json['volume_24h'])
        : null;
    floorPriceInUsd24hPercentageChange =
        json['floor_price_in_usd_24h_percentage_change'];
    numberOfUniqueAddresses = json['number_of_unique_addresses'];
    numberOfUniqueAddresses24hPercentageChange =
        json['number_of_unique_addresses_24h_percentage_change'];
    volumeInUsd24hPercentageChange =
        json['volume_in_usd_24h_percentage_change'];
    totalSupply = json['total_supply'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contract_address'] = contractAddress;
    data['asset_platform_id'] = assetPlatformId;
    data['name'] = name;
    data['symbol'] = symbol;
    if (nftImage != null) {
      data['image'] = nftImage!.toJson();
    }
    data['description'] = description;
    data['native_currency'] = nativeCurrency;
    if (floorPrice != null) {
      data['floor_price'] = floorPrice!.toJson();
    }
    if (marketCap != null) {
      data['market_cap'] = marketCap!.toJson();
    }
    if (volume24h != null) {
      data['volume_24h'] = volume24h!.toJson();
    }
    data['floor_price_in_usd_24h_percentage_change'] =
        floorPriceInUsd24hPercentageChange;
    data['number_of_unique_addresses'] = numberOfUniqueAddresses;
    data['number_of_unique_addresses_24h_percentage_change'] =
        numberOfUniqueAddresses24hPercentageChange;
    data['volume_in_usd_24h_percentage_change'] =
        volumeInUsd24hPercentageChange;
    data['total_supply'] = totalSupply;
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}

class Image {
  String? small;
  String? large;

  Image({this.small, this.large});

  Image.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['large'] = large;
    return data;
  }
}

class FloorPrice {
  num? nativeCurrency;
  num? usd;

  FloorPrice({this.nativeCurrency, this.usd});

  FloorPrice.fromJson(Map<String, dynamic> json) {
    nativeCurrency = json['native_currency'];
    usd = json['usd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['native_currency'] = nativeCurrency;
    data['usd'] = usd;
    return data;
  }
}

class MarketCap {
  num? nativeCurrency;
  num? usd;

  MarketCap({this.nativeCurrency, this.usd});

  MarketCap.fromJson(Map<String, dynamic> json) {
    nativeCurrency = json['native_currency'];
    usd = json['usd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['native_currency'] = nativeCurrency;
    data['usd'] = usd;
    return data;
  }
}

class Volume24h {
  num? nativeCurrency;
  num? usd;

  Volume24h({this.nativeCurrency, this.usd});

  Volume24h.fromJson(Map<String, dynamic> json) {
    nativeCurrency = json['native_currency'];
    usd = json['usd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['native_currency'] = nativeCurrency;
    data['usd'] = usd;
    return data;
  }
}

class Links {
  String? homepage;
  String? twitter;
  String? discord;

  Links({this.homepage, this.twitter, this.discord});

  Links.fromJson(Map<String, dynamic> json) {
    homepage = json['homepage'];
    twitter = json['twitter'];
    discord = json['discord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['homepage'] = homepage;
    data['twitter'] = twitter;
    data['discord'] = discord;
    return data;
  }
}
