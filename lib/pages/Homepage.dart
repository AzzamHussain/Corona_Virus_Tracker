import 'package:coronavirus/pages/search.dart';
import 'package:coronavirus/pages/splashScreen.dart';
import 'package:coronavirus/utilities/stats.dart';
import 'package:flutter/material.dart';
//import 'package:coronavirus/utilities/Api_url.dart';
//import 'package:coronavirus/pages/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> Data = {};
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Stats stats = Stats();
    return Scaffold(
      backgroundColor: Color(0xff90B2F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: FutureBuilder(
            future: stats.getWorldStats(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Cases Reported in the World",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text("Total Cases"),
                              trailing: Text('${snapshot.data['cases']}'),
                            ),
                            ListTile(
                              title: const Text("Deaths"),
                              trailing: Text('${snapshot.data['deaths']}'),
                            ),
                            ListTile(
                              title: const Text("Recovered"),
                              trailing: Text('${snapshot.data['recovered']}'),
                            ),
                            ListTile(
                              title: const Text("Active"),
                              trailing: Text('${snapshot.data['active']}'),
                            ),
                            ListTile(
                              title: const Text("Critical"),
                              trailing: Text('${snapshot.data['critical']}'),
                            ),
                            ListTile(
                              title: const Text("Today Deaths"),
                              trailing: Text('${snapshot.data['todayDeaths']}'),
                            ),
                            ListTile(
                              title: const Text("Today Recovered"),
                              trailing:
                                  Text('${snapshot.data['todayRecovered']}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Search()));
                        },
                        child: const Text(
                          "countries",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const GetStarted();
              }
            },
          ),
        ),
      ),
    );
  }
}
