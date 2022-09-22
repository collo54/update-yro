import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/pages/delivery_details_page.dart';
import 'package:update_yro/widgets/empty_cart.dart';
import 'package:update_yro/widgets/order_item1.dart';

import '../models/checkout_product.dart';
import '../services/database_service.dart';

class OrderListLayout extends StatefulWidget {
  const OrderListLayout({Key? key}) : super(key: key);

  @override
  State<OrderListLayout> createState() => _OrderListLayoutState();
}

class _OrderListLayoutState extends State<OrderListLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width / 2, context),
          );
        } else {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width, context),
          );
        }
      },
    );
  }

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Container(
        // color: Colors.white70,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        width: width, //height: 680,
        child: const OrderListStream(), //OrderList(),
      ),
      Container(
        color: klightwhite,
        width: width,
        height: 166,
        child: const CheckoutStream(),
      ),
    ];
  }
}

class CheckoutTotal extends StatelessWidget {
  const CheckoutTotal({
    Key? key,
    this.total,
  }) : super(key: key);
  final String? total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              Text(
                'Total',
                style: GoogleFonts.acme(
                  height: 1.14,
                  textStyle: const TextStyle(
                    color: ktextorder,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Text(
                'KES $total',
                style: GoogleFonts.acme(
                  height: 1.3,
                  textStyle: const TextStyle(
                    color: kwelcomejim,
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        MaterialButton(
          color: kOrange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9.0))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DeliveryDetailsPage()),
            );
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              'Checkout',
              style: GoogleFonts.acme(
                height: 1.5,
                textStyle: const TextStyle(
                  color: kwhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //use orderitem1 instead!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        OrderItem1(
            price: '200 KES PER 200grams',
            spice: 'cayenne pepper',
            imageurl: 'assets/images/spice3.jpg',
            // color: klightlavender,
            quantity: '4 KG'),
        OrderItem1(
          price: '150 KES PER KG',
          spice: ' pepper',
          imageurl: 'assets/images/spice3.jpg',
          // color: klightlavender,
          quantity: '1 kg',
        ),
        OrderItem1(
          price: '150 KES PER KG',
          spice: ' lavender',
          imageurl: 'assets/images/spice3.jpg',
          // color: klightcayyene,
          quantity: '3 kg',
        ),
      ],
    );
  }
}

class OrderListItems extends StatelessWidget {
  const OrderListItems({
    Key? key,
    required this.children,
  }) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class OrderListStream extends StatelessWidget {
  const OrderListStream({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final databaseservice =
        Provider.of<Databaseservice>(context, listen: false);
    return StreamBuilder<List<CheckoutItem>>(
      stream: databaseservice.checkoutItemsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final productdata = snapshot.data;
          if (productdata!.isNotEmpty) {
            final children = productdata
                .map(
                  (product) => GestureDetector(
                    onTap: () async {},
                    child: Card(
                      elevation: 10,
                      shadowColor: klabeltext,
                      child: OrderItem1(
                        imageurl: product.downloadUrl,
                        // color: kwhite,
                        spice: product.productname!,
                        price: 'kes ${product.price!.toString()}',
                        quantity: product.quantity! > 999
                            ? '${product.quantity! / 1000}kg'
                            : '${product.quantity!.toString()}grams',
                        callback: () async {
                          await databaseservice.deleteContibutor(product);
                          /* final userId = user.uid;
                          final id = documentIdFromCurrentDate();
                          final time = DateTime.now().toIso8601String();
                          final item = CheckoutItem(
                            downloadUrl: product.downloadUrl,
                            timeStamp: time,
                            quantity: product.quantity,
                            price: product.price!,
                            productname: product.productname!,
                            id: id,
                            userId: userId,
                          );
                          final firestoreservice = Provider.of<Databaseservice>(
                              context,
                              listen: false);
                          await firestoreservice.setCheckoutItem(item);
                          */
                        },
                      ),
                    ),
                  ),
                )
                .toList();
            return OrderListItems(
              children: children,
            );
          }
          return const EmptyDataCart();
        }
        if (snapshot.hasError) {
          return const Center(child: Text('error occurred'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class CheckoutStream extends StatelessWidget {
  const CheckoutStream({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final databaseservice =
        Provider.of<Databaseservice>(context, listen: false);
    return StreamBuilder<List<CheckoutItem>>(
      stream: databaseservice.checkoutItemsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final productdata = snapshot.data;
          if (productdata!.isNotEmpty) {
            final List<double> total = productdata
                .map(
                  (product) => product.price!,
                )
                .toList();

            double _sumall(List<double> arr) {
              double _sum = 0;
              for (final item in arr) {
                _sum += item;
              }
              return _sum;
            }

            return CheckoutTotal(
              total: _sumall(total).toString(),
            );
          }
          return const CheckoutTotal(
            total: '0',
          );
        }
        if (snapshot.hasError) {
          return const Center(child: Text('error occurred'));
        }
        return const Center(child: LinearProgressIndicator());
      },
    );
  }
}
