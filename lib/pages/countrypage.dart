import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData = [];
  fetchCountryData() async {
    http.Response response = await http
        .get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries'));
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Country Stats'),
        ),
        body: countryData.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsetsDirectional.all(12),
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: (Colors.grey[100])!, blurRadius: 4),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  countryData[index]['country'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Image.network(
                                  countryData[index]['countryInfo']['flag'],
                                  height: 50,
                                  width: 60,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'CONFIRMED: ' +
                                      countryData[index]['cases'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                Text(
                                  'ACTIVE: ' +
                                      countryData[index]['active'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                                Text(
                                  'RECOVERED: ' +
                                      countryData[index]['cases'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                                Text(
                                  'DEATHS: ' +
                                      countryData[index]['cases'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                },
                itemCount: countryData.isEmpty ? 0 : countryData.length,
              ));
  }
}
