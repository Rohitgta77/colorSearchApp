import 'package:damco/models/model_color.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final ColorModel colorModel;
  const ItemWidget({Key? key, required this.colorModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(children: [
        Expanded(
            flex: 7,
            child: Stack(children: [
              Container(
                constraints: const BoxConstraints.expand(),
                child:
                    Image.network(colorModel.imageUrl ?? "", fit: BoxFit.fill),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: FavoriteButton(
                  iconSize: 35,
                  valueChanged: (_) {},
                ),
              ),
            ])),
        Expanded(
            flex: 3,
            child: Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title - ${colorModel.title}",
                        overflow: TextOverflow.ellipsis),
                    Text("Hex - ${colorModel.hex}",
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ))
      ]),
    );
  }
}
