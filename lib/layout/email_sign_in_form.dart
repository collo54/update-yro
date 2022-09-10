import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:update_yro/constants/colors.dart';

import '../services/auth_service.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget {
  const EmailSignInForm({Key? key}) : super(key: key);

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final _formKey = GlobalKey<FormState>();
  EmailSignInFormType _formType = EmailSignInFormType.signIn;
  late String _email;
  late String _password;

  void _toogleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    final form = _formKey.currentState!;
    form.reset();
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

  Future<void> _signInwithEmail() async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      final user = await auth.signInWithEmailAndPassword(_email, _password);
      if (kDebugMode) {
        print('uid: ${user!.uid}');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _submit() async {
    try {
      if ((_formType == EmailSignInFormType.signIn) &&
          (_validateAndSaveForm())) {
        _signInwithEmail();
      } else if (_validateAndSaveForm()) {
        final auth = Provider.of<AuthService>(context, listen: false);
        await auth.createUserWithEmailAndPassword(_email, _password);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  /* Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      try {
        _signInwithEmailandPassword();
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
  }*/

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
            'Email',
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
            child: _buildForm()),
        const SizedBox(
          height: 15,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _buildButtons()),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget _buildButtons() {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          minWidth: 200,
          color: kOrange,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          onPressed: () => _submit(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              primaryText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: _toogleFormType,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              secondaryText,
              style: const TextStyle(
                  color: Color.fromARGB(255, 113, 124, 114),
                  fontSize: 15,
                  fontStyle: FontStyle.normal),
            ),
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
            return 'enter your email';
          }
          return null;
        },
        //initialValue: _name,
        onSaved: (value) => _email = value!,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          fillColor: ktextfill,
          filled: true,
          labelText: 'email',
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
        height: 10,
      ),
      TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'enter your password';
          }
          return null;
        },
        //initialValue: _name,
        onSaved: (value) => _password = value!,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          fillColor: ktextfill,
          filled: true,
          labelText: '*******',
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
