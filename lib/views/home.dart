import 'package:damco/controllers/controller_home.dart';
import 'package:damco/views/widget_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _homeController = HomeController();

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: textEditingController,
                        decoration:
                            const InputDecoration(hintText: "Color Serach"),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: () {
                              _homeController
                                  .serachColors(textEditingController.text);
                            },
                            child: const Text("Serach"))),
                  ],
                )),
            Expanded(
                flex: 9,
                child: Obx(() => GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: _homeController.colorModel.value.length,
                      itemBuilder: (context, index) {
                        return ItemWidget(
                          colorModel: _homeController.colorModel[index],
                        );
                      },
                    )))
          ],
        ),
      ),
    );
  }
}
