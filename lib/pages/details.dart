import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Map<String, dynamic> countryData;

  const Details({super.key, required this.countryData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${countryData['country']}"),
      ),
      backgroundColor: Color(0xff90B2F9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.067),
                child: Card(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const SizedBox(height: 10),
                      ListTile(
                        leading: const Text("Cases"),
                        trailing: Text("${countryData['cases']}"),
                      ),
                      ListTile(
                        leading: const Text("Recovered"),
                        trailing: Text("${countryData['recovered']}"),
                      ),
                      ListTile(
                        leading: const Text("Deaths"),
                        trailing: Text("${countryData['deaths']}"),
                      ),
                      ListTile(
                        leading: const Text("Critical"),
                        trailing: Text("${countryData['critical']}"),
                      ),
                      ListTile(
                        leading: const Text("Today Recovered"),
                        trailing: Text("${countryData['todayRecovered']}"),
                      ),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage(countryData['countryInfo']['flag']),
              )
            ],
          ),
        ],
      ),
    );
  }
}
