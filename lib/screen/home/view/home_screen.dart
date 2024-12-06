import 'package:departur_app/routes/routes.dart';
import 'package:departur_app/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider providerR;
  late HomeProvider providerW;
  bool isGridView = false;

  @override
  void initState() {
    context.read<HomeProvider>().getChap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "श्रीमद् भागवत गीता",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange.shade200,
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "Hindi",
                child: Text("हिंदी"),
              ),
              const PopupMenuItem(
                value: "English",
                child: Text("English"),
              ),
              const PopupMenuItem(
                value: "Sanskrit",
                child: Text("संस्कृत"),
              ),
            ],
          ),
        ],
      ),
      body: isGridView
          ? GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 3 / 4,
              ),
              itemCount: providerW.chList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.slockPage,
                    arguments: index,
                  );
                },
                child: Card(
                  color: const Color(0xFFFEE9D3),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "${providerW.chList[index].img}"),
                                fit: BoxFit
                                    .cover, // Ensures the image scales well
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${providerW.chList[index].name}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2B2B2B),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "अध्याय ${providerW.chList[index].chapter_number}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF4B4B4B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemCount: providerW.chList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.slockPage,
                    arguments: index,
                  );
                },
                child: Card(
                  color: const Color(0xFFFEE9D3),
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        "${providerW.chList[index].img}",
                      ),
                      backgroundColor: Colors.grey.shade200,
                    ),
                    title: Text(
                      "${providerW.chList[index].name}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3C3C3C),
                      ),
                    ),
                    subtitle: Text(
                      "अध्याय ${providerW.chList[index].id}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF5A5A5A),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
