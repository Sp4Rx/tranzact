import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:tranzact/cubits/home/home_cubit.dart';
import 'package:tranzact/generated/assets.dart';
import 'package:tranzact/ui/commons/molecules/cta_card.dart';
import 'package:tranzact/ui/commons/molecules/transaction_summary.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  late final HomeCubit _homeCubit;
  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    _homeCubit = HomeCubit()..loadHomeScreenData();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    _homeCubit.close();
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: BlocProvider(
          create: (BuildContext context) => _homeCubit,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const CircularProgressIndicator();
              } else if (state is HomeLoaded) {
                final transactionData = state.data[0].data;
                return Column(
                  children: [
                    TransactionSummary(
                        onDownLoadPressed: () => context
                            .read<HomeCubit>()
                            .downloadFile(transactionData.fileUrl),
                        itemCount: transactionData.itemCount.toString(),
                        totalAmount: transactionData.totalAmount),
                    const SizedBox(
                      height: 24,
                    ),
                    const CtaCard(
                      image: Assets.svgTeam,
                      title: 'My Team Members',
                      subTitle: 'Add Team Member',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const CtaCard(
                      image: Assets.svgConfused,
                      title: 'Still have Doubts?',
                      subTitle: 'View All FAQs',
                    ),
                  ],
                );
              } else {
                return const Text('GG!! don\'t know what to do');
              }
            },
          ),
        ),
      ),
    );
  }
}
