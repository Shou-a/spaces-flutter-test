import 'dart:convert';
import 'dart:io';

import 'package:base_project/core/theme/colors.dart';
import 'package:base_project/core/widgets/custom_toaster.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/theme.dart';
import '../../../core/utils/lang_const.dart';
import '../../../core/widgets/cus_text_field.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_widget.dart';
import '../../../core/widgets/theme_app_bar.dart';
import '../models/character.dart';
import '../providers/character_provider.dart';
import 'package:image_picker/image_picker.dart';

class CharacterForm extends StatefulWidget {
  Character? data;
  CharacterForm({super.key, this.data});

  @override
  State<CharacterForm> createState() => _CharacterFormState();
}

class _CharacterFormState extends State<CharacterForm> {
  late CharacterProvider myExampleProvider;
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  late FocusNode nameFocusNode;

  TextEditingController statusController = TextEditingController();
  late FocusNode statusFocusNode;

  TextEditingController speciesController = TextEditingController();
  late FocusNode speciesFocusNode;

  TextEditingController genderController = TextEditingController();
  late FocusNode genderFocusNode;

  File? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    myExampleProvider = Provider.of<CharacterProvider>(context, listen: false);
    nameFocusNode = FocusNode();
    statusFocusNode = FocusNode();
    speciesFocusNode = FocusNode();
    genderFocusNode = FocusNode();

    nameController.text = widget.data?.name ?? "";
    statusController.text = widget.data?.status ?? "";
    speciesController.text = widget.data?.species ?? "";
    genderController.text = widget.data?.gender ?? "";

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    statusController.dispose();
    speciesController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myExampleProvider = Provider.of<CharacterProvider>(context);

    return Scaffold(
      appBar: ThemeAppBar(
        title: widget.data != null ? "Edit Character" : "Add Character",
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                        padding: const EdgeInsets.all(Amount.screenMargin),
                        child: Form(
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: widget.data?.avatar == null
                                        ? _showImageSourceDialog
                                        : null,
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF56636C),
                                        borderRadius: BorderRadius.circular(50),
                                        image: widget.data?.avatar != null
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                    widget.data?.avatar ?? ""),
                                                fit: BoxFit.cover,
                                              )
                                            : _image != null
                                                ? DecorationImage(
                                                    image: FileImage(_image!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : null,
                                      ),
                                      child: widget.data?.avatar == null &&
                                              _image == null
                                          ? const Icon(
                                              Icons.add,
                                              size: 48,
                                              color: AppColors.white,
                                            )
                                          : null,
                                    ),
                                  ),
                                  const HeightBox(20),
                                  Text(
                                      widget.data != null
                                          ? "Update Avatar"
                                          : "Upload Avatar",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1)),
                                  const HeightBox(20),
                                  CusTextField(
                                    isValidator: true,
                                    hintText: "Name",
                                    focusNode: nameFocusNode,
                                    controller: nameController,
                                    textInputType: TextInputType.name,
                                    readOnly: false,
                                    labelText: LangConst.firstName,
                                    validatorMessage: "Please enter Name",
                                    nextNode: statusFocusNode,
                                  ),
                                  const HeightBox(15),
                                  CusTextField(
                                    isValidator: true,
                                    hintText: "Status",
                                    focusNode: statusFocusNode,
                                    controller: statusController,
                                    textInputType: TextInputType.text,
                                    readOnly: false,
                                    labelText: "Status",
                                    validatorMessage: "Please enter Status",
                                    nextNode: speciesFocusNode,
                                  ),
                                  const HeightBox(15),
                                  CusTextField(
                                    isValidator: true,
                                    hintText: "Species",
                                    focusNode: speciesFocusNode,
                                    controller: speciesController,
                                    textInputType: TextInputType.text,
                                    readOnly: false,
                                    labelText: "Species",
                                    validatorMessage: "Please enter Species",
                                    nextNode: genderFocusNode,
                                  ),
                                  const HeightBox(15),
                                  CusTextField(
                                    isValidator: true,
                                    hintText: "Gender",
                                    focusNode: genderFocusNode,
                                    controller: genderController,
                                    textInputType: TextInputType.text,
                                    readOnly: false,
                                    labelText: "Gender",
                                    validatorMessage: "Please enter Gender",
                                  ),
                                  const HeightBox(15),
                                ]))),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: CustomButton(
                
                text: widget.data == null ? "Save" : "Update",
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                onTap: () async {
                  Character reqBody = Character(
                    id: widget.data?.id,
                    name: nameController.text,
                    status: statusController.text,
                    species: speciesController.text,
                    gender: genderController.text,
                    avatar: widget.data?.avatar,
                  );
                  (widget.data == null
                          ? myExampleProvider.addItem(reqBody, context)
                          : myExampleProvider.updateItem(reqBody, context))
                      .then(
                    (value) {
                      CusFlutterToast.showToast(
                              "${widget.data == null ? "Save" : "Update"} Successfully")
                          .then((value) {});
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  Future<void> _showImageSourceDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          title: Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.photo_album),
                title: Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<String?> convertFileToBase64(File file) async {
    try {
      final bytes = await file.readAsBytes();
      final base64String = base64Encode(bytes);
      print(base64String);
      return base64String;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
