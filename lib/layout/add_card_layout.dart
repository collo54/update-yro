import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../pages/homepage.dart';
import '../pages/order_complete_page.dart';

class AddCardLayout extends StatefulWidget {
  const AddCardLayout({Key? key}) : super(key: key);

  @override
  State<AddCardLayout> createState() => _AddCardLayoutState();
}

class _AddCardLayoutState extends State<AddCardLayout> {
  final _formKey = GlobalKey<FormState>();

  late final String? _name;

  //A future asynchronous field that implements authservice to sign in anonymously when
  // user clicks anonymous button
  Future<void> _signInAnonymously() async {
    try {
      //  final auth = ref.read(authenticate);
      // final user = await auth.signInAnonymously();
      // print('uid: ${user!.uid}');
    } catch (e) {
      print(e);
    }
  }

  Future<void> _submit() async {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      print(e.toString());
    }
  }

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
        width: width,
        child: _buildMessage(context),
      ),
    ];
  }

  Widget _buildMessage(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 16,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          "Card holder's name",
          style: GoogleFonts.acme(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 37, 37, 37),
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: _buildForm()),
      const SizedBox(
        height: 30,
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: _buildButtons()),
      const SizedBox(
        height: 30,
      ),
    ]);
  }

  Widget _buildButtons() {
    return Align(
      alignment: Alignment.center,
      child: MaterialButton(
        minWidth: 200,
        color: klightorange1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9.0))),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OrderCompletePage()),
          );
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0),
          child: Text(
            'Complete order',
            style: TextStyle(
                color: kOrange, fontSize: 14, fontStyle: FontStyle.normal),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      const SizedBox(
        height: 8,
      ),
      TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'enter your name';
          }
          return null;
        },
        //initialValue: _name,
        onSaved: (value) => _name = value,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          fillColor: ktextfill,
          filled: true,
          labelText: 'Munene Brian',
          labelStyle: const TextStyle(color: klabeltext),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusColor: const Color.fromRGBO(243, 242, 242, 1),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          hintStyle: const TextStyle(color: klabeltext),
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        'Card number',
        style: GoogleFonts.acme(
          textStyle: const TextStyle(
            color: Color.fromARGB(255, 37, 37, 37),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'enter card number';
          }
          return null;
        },
        //initialValue: _name,
        onSaved: (value) => _name = value,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          fillColor: ktextfill,
          filled: true,
          labelText: 'xxxxxxxxxxxxx',
          labelStyle: const TextStyle(color: klabeltext),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusColor: const Color.fromRGBO(243, 242, 242, 1),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          hintStyle: const TextStyle(color: klabeltext),
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Date',
                  style: GoogleFonts.acme(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 37, 37, 37),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter date';
                    }
                    return null;
                  },
                  //initialValue: _name,
                  onSaved: (value) => _name = value,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    fillColor: ktextfill,
                    filled: true,
                    labelText: 'MM/YY',
                    labelStyle: const TextStyle(color: klabeltext),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    focusColor: const Color.fromRGBO(243, 242, 242, 1),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintStyle: const TextStyle(color: klabeltext),
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'CVV',
                  style: GoogleFonts.acme(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 37, 37, 37),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter date';
                    }
                    return null;
                  },
                  //initialValue: _name,
                  onSaved: (value) => _name = value,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    fillColor: ktextfill,
                    filled: true,
                    labelText: 'MM/YY',
                    labelStyle: const TextStyle(color: klabeltext),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    focusColor: const Color.fromRGBO(243, 242, 242, 1),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintStyle: const TextStyle(color: klabeltext),
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    ];
  }
}
