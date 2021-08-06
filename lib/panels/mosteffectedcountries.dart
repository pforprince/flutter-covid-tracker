import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key? key, required this.countryData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(6),
            child: Row(
              children: [
                Image.network(
                  countryData[index]['countryInfo']['flag'],
                  height: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  countryData[index]['country'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  countryData[index]['deaths'].toString(),
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
