import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/pages/add_phone_no_page.dart';
import 'package:update_yro/pages/email_sign_in_page.dart';

import '../services/auth_service.dart';

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({Key? key}) : super(key: key);

  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();

  String? _name;

  String string(String name) {
    if (_name != null) {
      setState(() {
        name = _name!;
      });
    }
    return name;
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      form.reset();
      return true;
    }
    return false;
  }

  //A future asynchronous field that implements authservice to sign in anonymously when
  // user clicks anonymous button
  Future<void> _signInAnonymously() async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      final user = await auth.signInAnonymously();
      if (kDebugMode) {
        print('uid: ${user!.uid}');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _signInwithFacebook() async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      final user = await auth.signInWithFacebook();
      if (kDebugMode) {
        print('uid: ${user!.uid}');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _signinWithEmailandPassword() async {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EmailSignInpage()),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> _signinWithPhonenumber() async {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddPhonenoPage()),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
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
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        width: width,
        child: _buildMessage(context),
      ),
    ];
  }

  Widget _buildMessage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'welcome choose service',
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
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _buildButtons()),
        const SizedBox(
          height: 15,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _buildButtons2()),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          minWidth: 200,
          color: kOrange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(13.0))),
          onPressed: () => _signInAnonymously(),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              'quick order',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        TextButton(
          onPressed: () {}, // _toogleFormType,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              'or continue with',
              style: TextStyle(
                  color: Color.fromARGB(255, 113, 124, 114),
                  fontSize: 15,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MaterialButton(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          onPressed: () {}, //_signInWithGoogle(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Image.asset("assets/images/google-logo.png"),
          ),
        ),
        MaterialButton(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          onPressed: _signinWithEmailandPassword,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Icon(Icons.email),
          ),
        ),
        MaterialButton(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          onPressed: _signinWithPhonenumber,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Icon(Icons.phone),
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
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
          labelText: 'enter name',
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
    ];
  }
}
