import 'dart:convert';

import 'package:coviddata/datasource.dart';
import 'package:coviddata/pages/countrypage.dart';
import 'package:coviddata/panels/infopanel.dart';
import 'package:coviddata/panels/mosteffectedcountries.dart';
import 'package:coviddata/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  https://corona.lmao.ninja/v3/covid-19/all

  Map worldData = {};
  fetchWorldWideData() async {
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/all'));
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  List countryData = [];
  fetchCountryData() async {
    http.Response response = await http.get(Uri.parse(
        'https://corona.lmao.ninja/v3/covid-19/countries?sort=cases'));
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchWorldWideData();
    fetchCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid19 Tracker"),
        // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(
                    color: Colors.orange[800],
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'WorldWide',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primaryBlack,
                      ),
                      child: Text(
                        'Regional',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // worldData == null ? CircularProgressIndicator() :
            worldData.isEmpty
                ? CircularProgressIndicator()
                : WorldWidePanel(
                    worldData: worldData,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                'Most Affected Countries',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            countryData.isEmpty
                ? CircularProgressIndicator()
                : MostAffectedPanel(
                    countryData: countryData,
                  ),
            InfoPanel(),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'WE ARE TOGETHER IN THIS FIGHT',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
