import 'package:eurisko_exam_nft/API/dio_client.dart';
import 'package:eurisko_exam_nft/screens/screens.dart';
import 'package:flutter/material.dart';

import 'custom_shimmer_widget.dart';

class NFTListTile extends StatefulWidget {
  final String id;
  const NFTListTile({super.key, required this.id});

  @override
  State<NFTListTile> createState() => _NFTListTileState();
}

class _NFTListTileState extends State<NFTListTile> {
  @override
  Widget build(BuildContext context) {
    DioClient dioClient = DioClient();
    return FutureBuilder(
      builder: (context, snapshot) {
        return FutureBuilder(
          future: dioClient.getNFTItem(widget.id),
          builder: (context, snapshot) {
            var nft = snapshot.data;
            if (snapshot.hasData) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(NFTDetailsScreen.routeName, arguments: nft);
                  },
                  child: Container(
                    height: 200,
                    child: ListTile(
                      leading: Image.network(
                          nft?.nftImage?.small ??
                              'https://craftsnippets.com/articles_images/placeholder/placeholder.jpg',
                          height: 100),
                      title: Text(nft?.name ?? ''),
                      subtitle: nft?.floorPrice?.usd != null
                          ? Text('Price: ${nft?.floorPrice?.usd} USD')
                          : const SizedBox(),
                    ),
                  ));
            } else {
              return ListTile(
                leading:
                    const CustomShimmerWidget.circular(height: 64, width: 64),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomShimmerWidget.rectangular(
                    height: 16,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
                subtitle: const CustomShimmerWidget.rectangular(height: 14),
              );
            }
          },
        );
      },
    );
  }
}
