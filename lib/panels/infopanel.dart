import 'package:coviddata/datasource.dart';
import 'package:coviddata/pages/faq.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FAQPage()));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  color: primaryBlack,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "FAQS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  launch("https://covid19responsefund.org/en/");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  color: primaryBlack,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "DONATE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  launch(
                      "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  color: primaryBlack,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "MYTH BUSTERS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white)
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
