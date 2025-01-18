import 'package:flutter/material.dart';

// The `Details` class is a blueprint for creating a widget. (Class Declaration - OOP Concept)
class Details extends StatelessWidget {
  // Property to hold country data, encapsulating the data passed to this widget. (Encapsulation - OOP Concept)
  final Map<String, dynamic> countryData;

  // Constructor to initialize the `Details` object with required `countryData`. (Encapsulation & Constructor - OOP Concept)
  const Details({super.key, required this.countryData});

  @override
  Widget build(BuildContext context) {
    // The `build` method is overriding the abstract method in `StatelessWidget`. (Polymorphism - OOP Concept)
    return Scaffold(
      appBar: AppBar(
        // Composition: Using `AppBar` object to define the UI structure. (Composition - OOP Concept)
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
                  // Composition: Using a `Card` object to structure part of the UI. (Composition - OOP Concept)
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const SizedBox(height: 10),
                      ListTile(
                        // Composition: Using `ListTile` objects to represent rows of data. (Composition - OOP Concept)
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
              // Composition: Using `CircleAvatar` object to display the flag. (Composition - OOP Concept)
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
