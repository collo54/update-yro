import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/models/checkout_product.dart';

import '../services/database_service.dart';

class AddSpiceForm extends StatefulWidget {
  const AddSpiceForm({Key? key, this.product}) : super(key: key);
  final CheckoutItem? product;

  @override
  State<AddSpiceForm> createState() => _AddSpiceFormState();
}

class _AddSpiceFormState extends State<AddSpiceForm> {
  final _formKey = GlobalKey<FormState>();
  PlatformFile? _pickedFile;
  UploadTask? uploadTask;
  double? _price;
  double? _quantity;
  String? _item;
  String? _description;
  String? _downloadurl;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _item = widget.product!.productname;
      // _message = widget.messager.message;
    }
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

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      //final timeStamp = DateTime.now().millisecondsSinceEpoch;
      final id = widget.product?.id ?? documentIdFromCurrentDate();
      final time = DateTime.now().toIso8601String();
      final item = CheckoutItem(
        id: id,
        quantity: _quantity,
        description: _description,
        downloadUrl: _downloadurl,
        price: _price,
        productname: _item,
        timeStamp: time,
        userId: userId,
      );
      final firestoreservice =
          Provider.of<Databaseservice>(context, listen: false);
      if (item.downloadUrl != null) {
        await firestoreservice.setProductAll(item);
        //alertDialogesucess2();
        alertDialogesucess();
      } else {
        alertDialogefailure();
      }
    }
  }

  /* Future<void> _addImage(BuildContext context) async {
    // Navigator.of(context).pop();
    final imagePicker = Provider.of<ImagePickerService>(context, listen: false);
    final file = await imagePicker.pickImage(source: ImageSource.gallery);
    final storage = Provider.of<FirebaseStorageService>(context, listen: false);
    final downloadUrl = await storage.uploadAvatar(file: file);
    _downloadurl = downloadUrl;
    if (kDebugMode) {
      print(_downloadurl);
    }
  }*/

  Future<void> _pickfile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles();

    setState(() {
      _pickedFile = result?.files.first;
    });
  }

  Future<void> _addImage(BuildContext context) async {
    if (kIsWeb) {
      final bytes = _pickedFile!.bytes;
      final path = _pickedFile!.name;
      Reference ref = FirebaseStorage.instance.ref('uploads/$path');
      setState(() {
        uploadTask = ref.putData(bytes!);
      });

      final snapshot = await uploadTask!.snapshot;
      final url = await snapshot.ref.getDownloadURL();

      setState(() {
        _downloadurl = url;
      });
    } else {
      //write a code for android or ios
    }

    if (kDebugMode) {
      print(_downloadurl);
    }
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

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: const BoxDecoration(
          color: kwhite,
        ),
        width: width,
        // height: 900,
        child: _buildMessage(context),
      ),
    ];
  }

  Widget _buildMessage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        TextButton(
          onPressed: () => _gobackPage(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              '< back to products',
              // style: tdeliverytext,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const SizedBox(
          height: 5,
        ),
        if (uploadTask != null) buildProgress(),
        const SizedBox(
          height: 10,
        ),
        if (_pickedFile != null)
          Text(
            _pickedFile!.name,
            style: GoogleFonts.ptMono(
              textStyle: const TextStyle(
                color: ktextorder,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            // style: tcapacityother,
          ),
        const SizedBox(
          height: 15,
        ),
        Card(
          color: kwhite,
          child: _buildForm(),
        ),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(''
              // style: theadlinetext,
              ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildAddCartButton(context),
        ),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.3),
      ],
    );
  }

  _buildAddCartButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          color: kOrange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0))),
          onPressed: () {
            _pickfile(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              "pick spice image",
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  height: 1.2,
                  color: kwhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        MaterialButton(
          color: kOrange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0))),
          onPressed: () {
            _addImage(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              "upload product image",
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  height: 1.2,
                  color: kwhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        MaterialButton(
          color: kpurplelight,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0))),
          onPressed: () {
            _submit();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              "add product",
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  height: 1.2,
                  color: kwhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
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
      const SizedBox(
        height: 30,
      ),
      Text(
        'Spice',
        style: GoogleFonts.ptMono(
          textStyle: const TextStyle(
            color: ktextorder,
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
            return 'enter spice name';
          }
          return null;
        },
        //initialValue: _name,
        onSaved: (value) => _item = value,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          fillColor: kwhite,
          filled: true,
          labelText: 'Spice',
          labelStyle: const TextStyle(color: ktextorder),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kwhite),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusColor: const Color.fromRGBO(243, 242, 242, 1),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 1.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 1.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          hintStyle: const TextStyle(color: ktextorder),
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        'Spice price',
        style: GoogleFonts.ptMono(
          textStyle: const TextStyle(
            color: ktextorder,
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
            return 'Spice price';
          }
          return null;
        },
        //initialValue: _name,
        keyboardType: const TextInputType.numberWithOptions(
          signed: false,
          decimal: true,
        ),
        onSaved: (value) => _price = double.parse(value!),
        style: const TextStyle(fontWeight: FontWeight.w600),

        decoration: InputDecoration(
          fillColor: kwhite,
          filled: true,
          labelText: 'Spice price',
          labelStyle: const TextStyle(color: ktextorder),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kwhite),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusColor: const Color.fromRGBO(243, 242, 242, 1),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 1.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          hintStyle: const TextStyle(color: ktextorder),
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        'Spice quantity in grams',
        style: GoogleFonts.ptMono(
          textStyle: const TextStyle(
            color: ktextorder,
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
            return 'Spice quantity';
          }
          return null;
        },
        //initialValue: _name,
        keyboardType: const TextInputType.numberWithOptions(
          signed: false,
          decimal: true,
        ),
        onSaved: (value) => _quantity = double.parse(value!),
        style: const TextStyle(fontWeight: FontWeight.w600),

        decoration: InputDecoration(
          fillColor: kwhite,
          filled: true,
          labelText: 'Spice quantity',
          labelStyle: const TextStyle(color: ktextorder),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kwhite),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusColor: const Color.fromRGBO(243, 242, 242, 1),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 1.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          hintStyle: const TextStyle(color: ktextorder),
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        'Spice description',
        style: GoogleFonts.ptMono(
          textStyle: const TextStyle(
            color: ktextorder,
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
            return 'Spice description';
          }
          return null;
        },
        //initialValue: _name,

        onSaved: (value) => _description = value,
        style: const TextStyle(fontWeight: FontWeight.w600),

        decoration: InputDecoration(
          fillColor: kwhite,
          filled: true,
          labelText: 'Spice descrption',
          labelStyle: const TextStyle(color: ktextorder),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: kwhite),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusColor: const Color.fromRGBO(243, 242, 242, 1),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 1.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(243, 242, 242, 1), width: 2.0),
            borderRadius: BorderRadius.circular(9.0),
          ),
          hintStyle: const TextStyle(color: ktextorder),
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    ];
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask!.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          double progress = data!.bytesTransferred / data.totalBytes;
          return SizedBox(
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: ktextorder,
                  color: kOrange,
                ),
                Center(
                  child: Text(
                    '${(100 * progress).roundToDouble()}%',
                    style: GoogleFonts.ptMono(
                      textStyle: const TextStyle(
                        color: ktextorder,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    // style: tprogress,
                  ),
                )
              ],
            ),
          );
        }
        return Text(
          'retry',
          style: GoogleFonts.ptMono(
            textStyle: const TextStyle(
              color: ktextorder,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          // style: tcheckoutprice,
        );
      });

  void _gobackPage(BuildContext context) {
    Navigator.of(context).pop(context);
  }

  Future<Widget> alertDialogefailure() async {
    final alertfailure = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const CircleAvatar(
            backgroundColor: Colors.red,
            radius: 20,
            child: Icon(
              CupertinoIcons.multiply,
              // Icons.cancel,
              color: Colors.white,
              size: 30,
            ),
          ),
          /*Text(
            'Upload incomplete',
            style: GoogleFonts.robotoSlab(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 37, 37, 37),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),*/
          content: Text(
            'product has not been added try again',
            style: GoogleFonts.robotoMono(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 37, 37, 37),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      },
    );
    return alertfailure;
  }

  Future<Widget> alertDialogesucess() async {
    final alertsucess = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const CircleAvatar(
            backgroundColor: Colors.green,
            radius: 20,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 30,
            ),
          ),
          /*Text(
            'Upload incomplete',
            style: GoogleFonts.robotoSlab(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 37, 37, 37),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),*/
          content: Text(
            'product has been added successfully',
            style: GoogleFonts.robotoMono(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 37, 37, 37),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      },
    );
    return alertsucess;
  }

  Widget alertDialogesucess2() {
    final alertsucess = SafeArea(
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: const CircleAvatar(
          backgroundColor: Colors.green,
          radius: 20,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 30,
          ),
        ),
        /*Text(
            'Upload incomplete',
            style: GoogleFonts.robotoSlab(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 37, 37, 37),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),*/
        content: Text(
          'product has been added successfully',
          style: GoogleFonts.robotoMono(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 37, 37, 37),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );

    return alertsucess;
  }
}
