import 'package:departur_app/routes/routes.dart';
import 'package:departur_app/screen/home/provider/home_provider.dart';
import 'package:departur_app/screen/slock/provider/slock_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlockScreen extends StatefulWidget {
  const SlockScreen({super.key});

  @override
  State<SlockScreen> createState() => _SlockScreenState();
}

class _SlockScreenState extends State<SlockScreen> {
  late SlockProvider providerR;
  late SlockProvider providerW;

  @override
  void initState() {
    context.read<SlockProvider>().getSlock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<SlockProvider>();
    providerW = context.watch<SlockProvider>();
    int ind = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "श्लोक",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange.shade200,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            )),
      ),
      body: ListView.builder(
        itemCount: context.read<HomeProvider>().chList[ind].verses_count,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.versePage, arguments: index);
            },
            child: Card(
              color: const Color(0xFFFEE9D3),
              child: ListTile(
                title: Text(" ${providerR.dataList[index].title}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
