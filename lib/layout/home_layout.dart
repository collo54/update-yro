import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/custom/environment.dart';
import 'package:update_yro/layout/add_spice_form.dart';
import 'package:update_yro/models/checkout_product.dart';
import 'package:update_yro/models/usermodel.dart';
import 'package:update_yro/pages/add_cart_page.dart';
import 'package:update_yro/services/database_service.dart';
import 'package:update_yro/widgets/spice_card.dart';
import 'package:provider/provider.dart';
import '../custom/spice_data_search.dart';
import '../pages/order_list_page.dart';
import '../widgets/empty_data.dart';
import '../widgets/spice_card2.dart';
import '../widgets/spice_card3.dart';

class Homecontent extends StatefulWidget {
  const Homecontent({
    Key? key,
  }) : super(key: key);

  @override
  State<Homecontent> createState() => _HomecontentState();
}

class _HomecontentState extends State<Homecontent> {
  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: _buildTop(context),
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width, context),
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

  Widget _buildTop(BuildContext context) {
    final userdata = Provider.of<Userre>(context, listen: false);
    final admin = Provider.of<EnvironmentConfig>(context, listen: false);
    final databaseservice =
        Provider.of<Databaseservice>(context, listen: false);
    final String? uid = userdata.uid;
    final String? adminId = admin.adminId;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopWidgetName(name: userdata),
        const SizedBox(
          height: 10,
        ),
        const SearchSpicewidget(),
        const SizedBox(
          height: 10,
        ),
        ChipsStream(databaseservice: databaseservice, user: userdata),
        //const HorizontalSpiceWidget(),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RecommendedString(),
            if (uid == adminId) const AdminAddspiceIcon(),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        SpicesReccomendedStream(
            databaseservice: databaseservice, user: userdata),
        //const RecommendedSpices(),
        const SizedBox(
          width: 10,
        ),
        const HottestString(),
        const SizedBox(
          width: 10,
        ),
        const HottestSpices(),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class SpicesReccomendedStream extends StatelessWidget {
  const SpicesReccomendedStream({
    Key? key,
    required this.databaseservice,
    required this.user,
  }) : super(key: key);

  final Databaseservice databaseservice;
  final Userre user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CheckoutItem>>(
      stream: databaseservice.productItemStreamAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final productdata = snapshot.data;
          if (productdata!.isNotEmpty) {
            final children = productdata
                .map(
                  (product) => GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCartPage(
                            color1: kOrange,
                            color: kOrange,
                            quantity: product.quantity,
                            urldownload: product.downloadUrl,
                            description: product.description,
                            price: product.price,
                            spicename: product.productname,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 10,
                      shadowColor: klabeltext,
                      child: SpiceCard3(
                        imageurl: product.downloadUrl,
                        color: kwhite,
                        spice: product.productname!,
                        price: product.price!.toString(),
                        quantity: product.quantity!.toString(),
                        callback: () async {
                          final userId = user.uid;

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
                        },
                      ),
                    ),
                  ),
                )
                .toList();
            return RecommendedSpicesStream(
              children: children,
            );
          }
          return const EmptyData2();
        }
        if (snapshot.hasError) {
          return const Center(child: Text('error occurred'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ChipsStream extends StatelessWidget {
  const ChipsStream({
    Key? key,
    required this.databaseservice,
    required this.user,
  }) : super(key: key);

  final Databaseservice databaseservice;
  final Userre user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CheckoutItem>>(
      stream: databaseservice.productItemStreamAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final productdata = snapshot.data;
          if (productdata!.isNotEmpty) {
            final children = productdata
                .map(
                  (product) => GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCartPage(
                            color1: kOrange,
                            color: kOrange,
                            quantity: product.quantity,
                            urldownload: product.downloadUrl,
                            description: product.description,
                            price: product.price,
                            spicename: product.productname,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Chip(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(10),
                        label: Text(
                          product.productname!,
                          style: GoogleFonts.acme(
                            height: 1.14,
                            textStyle: const TextStyle(
                              color: kframe60,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList();
            return HorizontalSpiceWidgetStream(
              children: children,
            );
          }
          return const SizedBox(
            height: 40,
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

class HottestSpices extends StatelessWidget {
  const HottestSpices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      child: Container(
        height: 153,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Card(
              elevation: 10,
              child: SpiceCard2(
                imageurl: 'assets/images/spice3.jpg',
                price: '200',
                spice: 'curry',
                quantity: '200',
              ),
              shadowColor: klabeltext,
            ),
            const SizedBox(
              width: 8,
            ),
            Card(
              elevation: 10,
              child: SpiceCard2(
                quantity: '100',
                imageurl: 'assets/images/spice3.jpg',
                price: '100 ',
                spice: 'lavender',
              ),
              shadowColor: klabeltext,
            ),
            const SizedBox(
              width: 8,
            ),
            Card(
              elevation: 10,
              child: SpiceCard2(
                imageurl: 'assets/images/spice3.jpg',
                price: '150',
                spice: 'pepper',
                quantity: '100',
              ),
              shadowColor: klabeltext,
            ),
          ],
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
    );
  }
}

class HottestString extends StatelessWidget {
  const HottestString({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2, top: 30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hottest',
              style: GoogleFonts.acme(
                height: 1.9,
                textStyle: const TextStyle(
                  color: kwelcomejim,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'popular',
              style: GoogleFonts.acme(
                height: 1.9,
                textStyle: const TextStyle(
                  color: kpopular,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
    );
  }
}

class RecommendedSpices extends StatelessWidget {
  const RecommendedSpices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      child: Container(
        height: 190,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 10,
                child: SpiceCard1(
                  imageurl: 'assets/images/spice3.jpg',
                  price: '200 ',
                  spice: 'cayyene pepper',
                  color: kwhite,
                  quantity: 'kg',
                ),
                shadowColor: klabeltext,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Card(
              elevation: 10,
              child: SpiceCard4(
                imageurl: 'assets/images/spice3.jpg',
                price: '150 ',
                spice: 'Basil leaves',
                color: kwhite,
                quantity: 'gram',
              ),
              shadowColor: klabeltext,
            ),
            const SizedBox(
              width: 8,
            ),
            Card(
              elevation: 10,
              child: SpiceCard1(
                imageurl: 'assets/images/spice3.jpg',
                price: '200 per kg',
                spice: 'curry',
                color: kwhite,
                quantity: '',
              ),
              shadowColor: klabeltext,
            ),
            const SizedBox(
              width: 8,
            ),
            Card(
              elevation: 10,
              child: SpiceCard1(
                imageurl: 'assets/images/spice3.jpg',
                price: '200 per kg',
                spice: 'lavender',
                color: kwhite,
                quantity: '',
              ),
              shadowColor: klabeltext,
            ),
            const SizedBox(
              width: 8,
            ),
            Card(
              elevation: 10,
              child: SpiceCard1(
                imageurl: 'assets/images/spice3.jpg',
                price: '200 per kg',
                spice: 'pepper',
                color: kwhite,
                quantity: '',
              ),
              shadowColor: klabeltext,
            ),
          ],
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
    );
  }
}

class RecommendedSpicesStream extends StatelessWidget {
  const RecommendedSpicesStream({
    required this.children,
    Key? key,
  }) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      child: Container(
        height: 190,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: children,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
    );
  }
}

class RecommendedString extends StatelessWidget {
  const RecommendedString({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended spices',
              style: GoogleFonts.acme(
                height: 1.6,
                textStyle: const TextStyle(
                  color: kwelcomejim,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              width: 60,
              child: Divider(
                height: 13,
                thickness: 3,
                indent: 0,
                endIndent: 0,
                color: kOrange,
              ),
            ),
          ],
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
    );
  }
}

class AdminAddspiceIcon extends StatelessWidget {
  const AdminAddspiceIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (() {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) => SingleChildScrollView(
              child: Column(
                children: [
                  const AddSpiceForm(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                ],
              ),
            ),
          ),
        );
      }),
      icon: const Icon(Icons.add),
    );
  }
}

class HorizontalSpiceWidget extends StatelessWidget {
  const HorizontalSpiceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Chip(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
              label: Text(
                'basil',
                style: GoogleFonts.acme(
                  height: 1.14,
                  textStyle: const TextStyle(
                    color: kframe60,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Chip(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
              label: Text(
                'curry',
                style: GoogleFonts.acme(
                  height: 1.14,
                  textStyle: const TextStyle(
                    color: kframe60,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Chip(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
              label: Text(
                'pepper',
                style: GoogleFonts.acme(
                  height: 1.14,
                  textStyle: const TextStyle(
                    color: kframe60,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Chip(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
              label: Text(
                'lavender',
                style: GoogleFonts.acme(
                  height: 1.14,
                  textStyle: const TextStyle(
                    color: kframe60,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Chip(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
              label: Text(
                'chives',
                style: GoogleFonts.acme(
                  height: 1.14,
                  textStyle: const TextStyle(
                    color: kframe60,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Chip(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
              label: Text(
                'cayanne pepper',
                style: GoogleFonts.acme(
                  height: 1.14,
                  textStyle: const TextStyle(
                    color: kframe60,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        decoration: const BoxDecoration(
          color: kframe63,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(1),
            topRight: Radius.circular(1),
            bottomLeft: Radius.circular(1),
            bottomRight: Radius.circular(1),
          ),
        ),
      ),
    );
  }
}

class HorizontalSpiceWidgetStream extends StatelessWidget {
  const HorizontalSpiceWidgetStream({
    required this.children,
    Key? key,
  }) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: children,
        ),
        decoration: const BoxDecoration(
          color: kframe63,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(1),
            topRight: Radius.circular(1),
            bottomLeft: Radius.circular(1),
            bottomRight: Radius.circular(1),
          ),
        ),
      ),
    );
  }
}

class SearchSpicewidget extends StatelessWidget {
  const SearchSpicewidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: GestureDetector(
        onTap: () {
          showSearch(context: context, delegate: DataSearch2());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'search for spices',
                style: GoogleFonts.acme(
                  height: 1.3,
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 145, 146, 146),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(Icons.search),
            ],
          ),
          decoration: const BoxDecoration(
            color: ktextfill,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}

class TopWidgetName extends StatelessWidget {
  const TopWidgetName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final Userre name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  child: const Icon(Icons.menu),
                  onTap: () {},
                ),
                const SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Welcome, ',
                      style: GoogleFonts.acme(
                        height: 1.7,
                        textStyle: const TextStyle(
                          color: kwelcomejim,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Text(
                      name.displayName ?? '',
                      style: GoogleFonts.acme(
                        height: 1.7,
                        textStyle: const TextStyle(
                          color: kwelcomejim,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Card(
              shape: const CircleBorder(),
              shadowColor: klabeltext,
              elevation: 10,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon:
                      const Icon(Icons.shopping_basket_rounded, color: kOrange),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderListPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(1),
            topRight: Radius.circular(1),
            bottomLeft: Radius.circular(1),
            bottomRight: Radius.circular(1),
          ),
        ),
      ),
    );
  }
}
