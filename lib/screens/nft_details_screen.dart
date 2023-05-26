import 'package:eurisko_exam_nft/models/nft_item_model.dart' as nftModel;
import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';

class NFTDetailsScreen extends StatelessWidget {
  static const String routeName = '/NFTDetails';
  const NFTDetailsScreen({super.key, required this.data});
  final nftModel.NFTItemModel? data;

  static Route route(nftModel.NFTItemModel? data) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => NFTDetailsScreen(
              data: data,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: data?.name ?? 'Details'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                data?.name ?? '',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Image.network(
              data?.nftImage?.large ??
                  data?.nftImage?.small ??
                  'https://craftsnippets.com/articles_images/placeholder/placeholder.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                data?.description ?? '',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Price: ${data?.floorPrice?.usd ?? '0'} USD',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
