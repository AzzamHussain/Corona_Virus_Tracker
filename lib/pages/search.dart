import 'package:coronavirus/pages/details.dart';
import 'package:coronavirus/utilities/stats.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FocusNode _focusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Stats stats = Stats();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff90B2F9),
      ),
      backgroundColor: Color(0xff90B2F9),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                _focusNode.unfocus();
              },
              child: TextField(
                style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController,
                decoration: InputDecoration(
                    suffixIcon: searchController.text.isEmpty
                        ? const SizedBox()
                        : TextButton(
                            onPressed: () {
                              searchController.clear();
                              setState(() {});
                            },
                            child: const Icon(Icons.clear)),
                    hintStyle: const TextStyle(color: Colors.black),
                    hintText: " country ",
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)))),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: stats.getCountryStats(),
                    builder: ((context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: ((context, index) {
                              String name = snapshot.data[index]['country'];

                              if (searchController.text.isEmpty) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) => Details(
                                                    countryData: snapshot
                                                        .data[index]))));
                                      },
                                      child: ListTile(
                                        leading: Image(
                                            width: 50,
                                            height: 50,
                                            image: NetworkImage(
                                                snapshot.data[index]
                                                    ['countryInfo']['flag'])),
                                        title: Text(
                                            "${snapshot.data[index]['country']}"),
                                        subtitle: Text(
                                            "${snapshot.data[index]['cases']}"),
                                      ),
                                    ),
                                  ],
                                );
                              } else if (name.toLowerCase().contains(
                                  searchController.text.toLowerCase())) {
                                return Column(children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) => Details(
                                                  countryData:
                                                      snapshot.data[index]))));
                                    },
                                    child: ListTile(
                                      leading: Image(
                                          width: 50,
                                          height: 50,
                                          image: NetworkImage(
                                              snapshot.data[index]
                                                  ['countryInfo']['flag'])),
                                      title: Text(
                                          "${snapshot.data[index]['country']}"),
                                      subtitle: Text(
                                          "${snapshot.data[index]['cases']}"),
                                    ),
                                  ),
                                ]);
                              } else {
                                return Container();
                              }
                            }));
                      }
                    })))
          ],
        ),
      ),
    );
  }
}
