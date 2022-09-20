import 'package:flutter/material.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/widgets/spice_card.dart';

class DataSearch extends SearchDelegate<String> {
  final spices = [
    'pepper',
    'curry',
    'parsley',
    'lavender',
    'cayenne pepper',
    'basil leaves',
    'cummin'
  ];

  final recentspice = ['lavender', 'basil leaves', 'cummin'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return SpiceCard1(
      imageurl: 'assets/images/spice3.jpg',
      price: '200 per kg',
      spice: 'cayyene pepper',
      color: kwhite,
      quantity: '',
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionlist = query.isEmpty
        ? recentspice
        : spices.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: const Icon(Icons.palette),
        title: RichText(
          text: TextSpan(
            text: suggestionlist[index].substring(0, query.length),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionlist[index].substring(query.length),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionlist.length,
    );
  }
}
