import 'dart:typed_data';

import 'package:e_commerce_01/constants.dart';
import 'package:e_commerce_01/controllers/auth_controller.dart';
import 'package:e_commerce_01/views/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthController _authController = AuthController();

  Uint8List? _image;
  bool _isLoading = false;

  selectImage() async {
    Uint8List image = await _authController.pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String result = await _authController.signUpUser(
      _fullNameController.text,
      _userNameController.text,
      _emailController.text,
      _passwordController.text,
      _image,
    );

    setState(() {
      _isLoading = false;
    });

    if (result != 'success') {
      return showSnackBar(context, result);
    } else {
      _fullNameController.clear();
      _userNameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _image!.clear();
      return showSnackBar(
          context, 'Congratulations! Your account has been created.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  _image == null
                      ? const CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.blue,
                          backgroundImage: NetworkImage(
                              'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                        )
                      : CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.blue,
                          backgroundImage: MemoryImage(_image!),
                        ),
                  Positioned(
                    right: 5,
                    bottom: 10,
                    child: InkWell(
                      onTap: selectImage,
                      child: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Enter your full name',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Enter a username',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                  color: buttonColor,
                ),
                child: Center(
                  child: InkWell(
                    onTap: signUpUser,
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: buttonTextColor),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
