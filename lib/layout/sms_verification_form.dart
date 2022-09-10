import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:update_yro/constants/colors.dart';

import '../services/auth_service.dart';

class SmsVerificationForm extends StatefulWidget {
  const SmsVerificationForm({Key? key, required this.phone}) : super(key: key);
  final String phone;

  @override
  _SmsVerificationFormState createState() => _SmsVerificationFormState();
}

class _SmsVerificationFormState extends State<SmsVerificationForm> {
  final _formKey = GlobalKey<FormState>();
  ConfirmationResult? _result;

  String? _code;

  /*String string(String name) {
    if (_name != null) {
      setState(() {
        name = _name!;
      });
    }
    return name;
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _submit();
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
  Future<void> _signInAnonymously(ConfirmationResult result) async {
    if (_validateAndSaveForm()) {
      if (kDebugMode) {
        print(widget.phone);
      }
      setState(() {
        result = _result!;
      });

      try {
        final auth = Provider.of<AuthService>(context, listen: false);
        final userphone = await result.confirm(_code!);
        auth.userFromFirebase2(userphone.user);
        if (kDebugMode) {
          print('uid :${userphone.user!.uid}');
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  Future<void> _submit() async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      final user = await auth.signInWithPhoneNumber2(widget.phone);
      setState(() {
        _result = user;
      });
      print(widget.phone);
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
    //_signInAnonymously();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'SMS OTP',
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          minWidth: 200,
          color: kOrange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(13.0))),
          onPressed: () => _signInAnonymously(_result!),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              'input otp ',
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
            return 'enter sent otp';
          }
          return null;
        },
        //initialValue: _name,
        onSaved: (value) => _code = value,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          fillColor: ktextfill,
          filled: true,
          labelText: 'enter sms otp',
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
