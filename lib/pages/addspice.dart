import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:update_yro/main.dart';
import 'package:update_yro/models/spicemodel.dart';
import 'package:update_yro/pages/homepage.dart';
import 'package:update_yro/services/database_service.dart';

class AddContributionsPage extends ConsumerStatefulWidget {
  const AddContributionsPage({Key? key, this.spicemodel}) : super(key: key);
  final SpiceModel? spicemodel;

  static Future<void> show(BuildContext context, {SpiceModel? model}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddContributionsPage(
          spicemodel: model,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _AddContributionsPageState createState() => _AddContributionsPageState();
}

class _AddContributionsPageState extends ConsumerState<AddContributionsPage> {
  final _formKey = GlobalKey<FormState>();

  String? _spice;

  @override
  void initState() {
    super.initState();
    if (widget.spicemodel != null) {
      _spice = widget.spicemodel!.spice;
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

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      final id = widget.spicemodel?.time ?? documentIdFromCurrentDate();
      final contributor = SpiceModel(
        time: id,
        spice: _spice,
      );
      final firestoreservice = ref.read(database);

      await firestoreservice.setContibutor(contributor);
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
          fullscreenDialog: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(widget.spicemodel == null ? 'New spice' : 'edit spice'),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Save',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: _submit,
          ),
        ],
      ),
      body: _buildContents(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContents() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildForm(),
          ),
        ),
      ),
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
        height: 16,
      ),
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'spice',
        ),
        initialValue: _spice,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'enter your name';
          }
          return null;
        },
        onSaved: (value) => _spice = value,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 8,
      ),
    ];
  }
}
