import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/pages/order_complete_page.dart';

import '../models/checkout_product.dart';
import '../pages/add_cart_page.dart';
import '../services/database_service.dart';

class DataSearch2 extends SearchDelegate<String> {
  final spices = [
    'pepper',
    'curry',
    'parsley',
    'lavender',
    'cayenne pepper',
    'basil leaves',
    'cummin'
  ];

  final recentspice = ['curry', 'cummin'];

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
    final databaseservice =
        Provider.of<Databaseservice>(context, listen: false);
    return StreamBuilder<List<CheckoutItem>>(
      stream: databaseservice.productItemStreamAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final productdata = snapshot.data;
          if (productdata!.isNotEmpty) {
            final children = productdata.map((product) => [
                  product.productname,
                  product.description,
                  product.downloadUrl,
                  product.price,
                  product.quantity,
                ]);

            final suggestionlist1 =
                children.where((element) => element.contains(query)).toList();

            return ListView(
                children: suggestionlist1
                    .map(
                      (e) => SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: AddCartPage(
                            color1: kwhite,
                            color: kwhite,
                            quantity:
                                double.tryParse(e.elementAt(4).toString()),
                            urldownload: e.elementAt(2).toString(),
                            description: e.elementAt(1).toString(),
                            price: double.tryParse(e.elementAt(3).toString()),
                            spicename: e.elementAt(0).toString(),
                          ),
                        ),
                      ), /*ListTile(
                        leading: const Icon(Icons.shopping_basket),
                        onTap: () {
                          // query = e.first.toString();

                          close(context, e.first.toString());
                        },
                        title: RichText(
                          text: TextSpan(
                            text: e.first.toString().substring(0, query.length),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text:
                                    e.first.toString().substring(query.length),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),*/
                    )
                    .toList());
          }
          return const Text('no spices');
        }
        if (snapshot.hasError) {
          return const Center(child: Text('error try again'));
        }
        return const Center(child: LinearProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final databaseservice =
        Provider.of<Databaseservice>(context, listen: false);

    return StreamBuilder<List<CheckoutItem>>(
      stream: databaseservice.productItemStreamAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final productdata = snapshot.data;
          if (productdata!.isNotEmpty) {
            final children = productdata.map((product) => product.productname);

            final suggestionlist1 = query.isEmpty
                ? children.where((element) => element!.contains(query)).toList()
                : children
                    .where((element) => element!.contains(query))
                    .toList();
            return ListView(
                children: suggestionlist1
                    .map(
                      (e) => ListTile(
                        onTap: () {
                          //close(context, e!);
                          query = e!;
                          showResults(context);
                        },
                        title: RichText(
                          text: TextSpan(
                            text: e!.substring(0, query.length),
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: e.substring(query.length),
                                style:
                                    const TextStyle(color: Colors.blueAccent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList());
          }
          return const Text('no spices');
        }
        if (snapshot.hasError) {
          return const Center(child: Text('error try again'));
        }
        return const Center(child: LinearProgressIndicator());
      },
    );
  }
}
