import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AdminScreen extends StatefulWidget {
  final Function(Map<String, String>) addProduct;

  AdminScreen({required this.addProduct});

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveProduct() {
    if (_nameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please fill in all fields and select an image.'),
      ));
      return;
    }

    Map<String, String> newProduct = {
      'name': _nameController.text,
      'description': _descriptionController.text,
      'price': _priceController.text,
      'image': _image!.path,
    };

    widget.addProduct(newProduct);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Name'),
            TextField(controller: _nameController),
            SizedBox(height: 10),
            Text('Description'),
            TextField(controller: _descriptionController),
            SizedBox(height: 10),
            Text('Price'),
            TextField(controller: _priceController, keyboardType: TextInputType.number),
            SizedBox(height: 10),
            Text('Product Image'),
            _image == null
                ? IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: _showImageSourceDialog,
            )
                : Column(
              children: [
                Image.file(_image!, width: 100, height: 100),
                TextButton(
                  onPressed: _showImageSourceDialog,
                  child: Text('Change Image'),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _saveProduct,
              child: Text('Save Product'),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// class AdminScreen extends StatefulWidget {
//   final Function(Map<String, String>) addProduct;
//
//   AdminScreen({required this.addProduct});
//
//   @override
//   _AdminScreenState createState() => _AdminScreenState();
// }
//
// class _AdminScreenState extends State<AdminScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> _pickImage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       setState(() {
//         _image = File(image.path);
//       });
//     }
//   }
//
//   void _saveProduct() {
//     if (_nameController.text.isEmpty ||
//         _descriptionController.text.isEmpty ||
//         _priceController.text.isEmpty ||
//         _image == null) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Please fill in all fields and take a photo.'),
//       ));
//       return;
//     }
//
//     Map<String, String> newProduct = {
//       'name': _nameController.text,
//       'description': _descriptionController.text,
//       'price': _priceController.text,
//       'image': _image!.path,
//     };
//
//     widget.addProduct(newProduct);
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Add New Product')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Product Name'),
//             TextField(controller: _nameController),
//             SizedBox(height: 10),
//             Text('Description'),
//             TextField(controller: _descriptionController),
//             SizedBox(height: 10),
//             Text('Price'),
//             TextField(controller: _priceController, keyboardType: TextInputType.number),
//             SizedBox(height: 10),
//             Text('Product Image'),
//             _image == null
//                 ? IconButton(
//               icon: Icon(Icons.camera_alt),
//               onPressed: _pickImage,
//             )
//                 : Image.file(_image!, width: 100, height: 100),
//             Spacer(),
//             ElevatedButton(
//               onPressed: _saveProduct,
//               child: Text('Save Product'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
