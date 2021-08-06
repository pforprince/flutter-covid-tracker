import 'dart:ui';

import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldData;

  const WorldWidePanel({Key? key, required this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          StatusPanel(
              title: 'CONFIRMED',
              panelColor: (Colors.red[100])!,
              textColor: Colors.red,
              count: worldData['cases'].toString()),
          StatusPanel(
              title: 'ACTIVE',
              panelColor: (Colors.blue[100])!,
              textColor: Colors.blue,
              count: worldData['active'].toString()),
          StatusPanel(
              title: 'RECOVERED',
              panelColor: (Colors.green[100])!,
              textColor: (Colors.green[900])!,
              count: worldData['recovered'].toString()),
          StatusPanel(
              title: 'DEATHS',
              panelColor: (Colors.grey[400])!,
              textColor: (Colors.grey[800])!,
              count: worldData['deaths'].toString()),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key? key,
      required this.panelColor,
      required this.textColor,
      required this.title,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      color: panelColor,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16, color: textColor, fontWeight: FontWeight.bold),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 16, color: textColor, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
