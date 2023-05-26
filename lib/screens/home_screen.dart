import 'package:eurisko_exam_nft/API/dio_client.dart';
import 'package:eurisko_exam_nft/widgets/custom_appbar.dart';
import 'package:eurisko_exam_nft/widgets/nft_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<DioClient>(context);
    if (listProvider.nftList.isEmpty) {
      listProvider.getNFTList(pageIndex);
    }
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        pageIndex++;
        listProvider.getNFTList(pageIndex);
      }
    });
    return Scaffold(
        appBar: const CustomAppBar(title: 'NFT Market'),
        body: RefreshIndicator(
          onRefresh: () {
            pageIndex = 1;
            return listProvider.getNFTList(pageIndex);
          },
          child: Center(
              child: listProvider.nftList.isNotEmpty
                  ? ListView.builder(
                      controller: scrollController,
                      itemCount: listProvider.nftList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NFTListTile(
                          id: listProvider.nftList[index]?.id ?? '',
                        );
                      },
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Awaiting result...'),
                          ),
                        ])),
        ));
  }
}
