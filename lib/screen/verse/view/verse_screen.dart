import 'package:departur_app/main.dart';
import 'package:departur_app/screen/slock/provider/slock_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerseScreen extends StatefulWidget {
  const VerseScreen({super.key});

  @override
  State<VerseScreen> createState() => _VerseScreenState();
}

class _VerseScreenState extends State<VerseScreen> {
  late SlockProvider providerR;
  late SlockProvider providerW;

  @override
  void initState() {
    super.initState();
    context.read<SlockProvider>().getSlock();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<SlockProvider>();
    providerW = context.watch<SlockProvider>();
    int ind = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Verse Detail",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange.shade200,
        leading: IconButton(
          onPressed: () {
            providerR.stop();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              providerR.speak(providerW.dataList[ind].text!);
            },
            icon: const Icon(Icons.volume_up_rounded),
          ),
        ],
      ),
      body: PageView.builder(
        itemCount: providerW.dataList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Card(
              color: const Color(0xFFFEE9D3),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Verse ${index + 1}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${providerW.dataList[index].text}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3C3C3C),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Divider(
                      color: Colors.orange.shade400,
                      thickness: 1.5,
                      indent: 40,
                      endIndent: 40,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${providerW.dataList[index].transliteration}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF5A5A5A),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
