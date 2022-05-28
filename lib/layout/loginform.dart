// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:update_yro/constants/colors.dart';
//import 'package:lottie/lottie.dart';
import 'package:update_yro/main.dart';

//import 'package:rive/rive.dart';
//import 'package:yro/constants/colors.dart';

enum EmailSignInFormType { signIn, register }

class FinalstatefulForm extends ConsumerStatefulWidget {
  const FinalstatefulForm({Key? key}) : super(key: key);

  @override
  _FinalstatefulFormState createState() => _FinalstatefulFormState();
}

class _FinalstatefulFormState extends ConsumerState<FinalstatefulForm> {
  final _formKey = GlobalKey<FormState>();
  // EmailSignInFormType _formType = EmailSignInFormType.signIn;

  String? _name;
  // String? _password;

  String? phoneNo, smsCode;

  bool codeSent = false;

  /*void _toogleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    final form = _formKey.currentState!;
    form.reset();
  }*/

  //A future asynchronous field that implements authservice to sign in anonymously when
  // user clicks anonymous button
  Future<void> _signInAnonymously() async {
    try {
      final auth = ref.read(authenticate);
      final user = await auth.signInAnonymously();
      print('uid: ${user!.uid}');
    } catch (e) {
      print(e);
    }
  }

//A future asynchronous field that implements authservice to sign in with google when
// user clicks google button
  /* Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final auth = ref.read(authenticate);
      final user = await auth.signInWithGoogle();
      print('uid: ${user!.uid}');
    } catch (e) {
      print(e.toString());
    }
  }*/

//A future asynchronous field that implements authservice to create user or log in with email
//when user clicks email button button
  /* Future<void> _submit(BuildContext context) async {
    try {
      if ((_formType == EmailSignInFormType.signIn) &&
          (_validateAndSaveForm())) {
        print('$_email');
        final auth = ref.read(authenticate);
        await auth.signInWithEmailAndPassword(_email, _password!);
      } else if (_validateAndSaveForm()) {
        print('$_email');
        final auth = ref.read(authenticate);
        await auth.createUserWithEmailAndPassword(_email, _password!);
      }
    } catch (e) {
      print(e.toString());
    }
  }
  
    bool _validateAndSaveForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
 */

  Future<void> _submit(BuildContext context) async {
    try {} catch (e) {
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 16,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          'what is your first name',
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
        height: 30,
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: _buildButtons(context)),
    ]);
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          minWidth: 200,
          color: kOrange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(13.0))),
          onPressed: () => _submit(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              'start orderng',
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
        /*  MaterialButton(
          minWidth: 200,
          color: Colors.yellow[700],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(13.0))),
          onPressed: () => _signInAnonymously(),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              "Sign up anonymously",
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
        MaterialButton(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          onPressed: () => _signInWithGoogle(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // Image.asset("assets/images/google-logo.png"),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Sign Up with google",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontStyle: FontStyle.normal),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),*/
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
        //initialValue: _email,
        onSaved: (value) => _name = value!.trim(),
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: 'enter name',
        ),
        keyboardType: TextInputType.emailAddress,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 16,
      ),
      /* TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'enter your password';
          }
          return null;
        },
        onSaved: (value) => _password = value,
        //initialValue: _password,
        obscureText: true,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.lock_outline_sharp),
          labelText: 'Password',
        ),
        maxLines: 1,
        textAlign: TextAlign.center,
      ),*/
      const SizedBox(
        height: 8,
      ),
    ];
  }
}
