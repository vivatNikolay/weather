import 'package:flutter/material.dart';

import '../models/city.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<City> _cities = [
    City(name: 'Minsk', lat: 53.9, lon: 27.5667),
    City(name: 'Warsaw', lat: 52.23, lon: 21.0111),
    City(name: 'London', lat: 42.9836, lon: -81.2497),
    City(name: 'Berlin', lat: 52.52, lon: 13.4050),
    City(name: 'Tokyo', lat: 35.6897, lon: 139.6922),
    City(name: 'Seoul', lat: 37.56, lon: 126.99),
  ];

  CustomSearchDelegate()
      : super(
          searchFieldLabel: 'Search city',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) => buildBody(context);

  @override
  Widget buildSuggestions(BuildContext context) => buildBody(context);

  Widget buildBody(BuildContext context) {
    List<City> matchQuery = [];
    for (City city in _cities) {
      if (city.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        City city = matchQuery[index];
        return ListTile(
          title: Text(city.name),
          onTap: () {
            close(context, city);
          },
        );
      },
    );
  }
}
