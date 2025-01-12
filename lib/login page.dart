import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'product_screen.dart'; // Replace with your actual ProductScreen import
import 'forgot_password_screen.dart'; // Replace with your ForgotPasswordScreen import
import 'sign_up_screen.dart'; // Replace with your SignUpScreen import


class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Center(
                  child: Image.asset(
                    'assets/images/logoremovebgpreview.png', // Replace with your logo asset
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: 40),

                // Email TextField
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 20),

                // Password TextField
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 20),

                // Login Button
                ElevatedButton(
                  onPressed: () async {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    if (email.isNotEmpty && password.isNotEmpty) {
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        // Navigate to ProductScreen upon successful login
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ProductScreen(
                            isLoggedIn: true,
                            isAdmin: email.contains('admin'),
                            onLogout: () {
                              // Define logout behavior here
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                                    (route) => false, // Remove all previous routes
                              );
                            },// Admin check based on email domain
                            userEmail: email,
                            userName: email.split('@')[0], // Use part of the email as the username
                            )),

                        );
                      } catch (e) {
                        // Display error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error: ${e.toString()}'),
                          ),
                        );
                      }
                    } else {
                      // Show error message if fields are empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please enter both email and password'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 20),

                // Forgot Password
                TextButton(
                  onPressed: () {
                    // Navigate to ForgotPasswordScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Text('Forgot Password?'),
                ),
                Divider(height: 40, thickness: 1),

                // Sign Up Button
                TextButton(
                  onPressed: () {
                    // Navigate to SignUpScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text(
                    'Don’t have an account? Sign Up',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Global cart list
// List<Map<String, String>> purchaseHistory = [];
// List<Map<String, String>> cartItems = [];
// class ProductScreen extends StatefulWidget {
//   @override
//   _ProductScreenState createState() => _ProductScreenState();
// }
//
// class _ProductScreenState extends State<ProductScreen> {
//   // Original product list
//   final List<Map<String, String>> products = [
//     {
//       'name': 'Water Pump',
//       'description': 'High-quality pump for smooth water flow.',
//       'price': '\$25',
//       'image': 'assets/images/water_pump.png',
//     },
//     {
//       'name': 'Cooling Fan',
//       'description': 'Efficient fan for faster cooling.',
//       'price': '\$30',
//       'image': 'assets/images/cooling_fan.png',
//     },
//     {
//       'name': 'Filter Cartridge',
//       'description': 'Removes impurities for clean water.',
//       'price': '\$15',
//       'image': 'assets/images/filter_cartridge.png',
//     },
//     {
//       'name': 'Dispenser Tap',
//       'description': 'Durable tap for easy water dispensing.',
//       'price': '\$10',
//       'image': 'assets/images/dispenser_tap.png',
//     },
//     {
//       'name': 'Thermostat',
//       'description': 'Maintains optimal cooling temperatures.',
//       'price': '\$20',
//       'image': 'assets/images/thermostat.png',
//     },
//     {
//       'name': 'Water Pump',
//       'description': 'High-quality pump for smooth water flow.',
//       'price': '\$25',
//       'image': 'assets/images/water_pump.png',
//     },
//     {
//       'name': 'Cooling Fan',
//       'description': 'Efficient fan for faster cooling.',
//       'price': '\$30',
//       'image': 'assets/images/cooling_fan.png',
//     },
//     {
//       'name': 'Filter Cartridge',
//       'description': 'Removes impurities for clean water.',
//       'price': '\$15',
//       'image': 'assets/images/filter_cartridge.png',
//     },
//     {
//       'name': 'Dispenser Tap',
//       'description': 'Durable tap for easy water dispensing.',
//       'price': '\$10',
//       'image': 'assets/images/dispenser_tap.png',
//     },
//     {
//       'name': 'Thermostat',
//       'description': 'Maintains optimal cooling temperatures.',
//       'price': '\$20',
//       'image': 'assets/images/thermostat.png',
//     },
//   ];
//
//   // Search query and filtered products
//   String searchQuery = '';
//   List<Map<String, String>> filteredProducts = [];
//
//   @override
//   void initState() {
//     super.initState();
//     filteredProducts = products; // Initialize with all products
//   }
//
//   void updateSearchQuery(String query) {
//     setState(() {
//       searchQuery = query.toLowerCase();
//       filteredProducts = products
//           .where((product) =>
//       product['name']!.toLowerCase().contains(searchQuery) ||
//           product['description']!.toLowerCase().contains(searchQuery))
//           .toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 6),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.deepOrange,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.8), // Shadow color
//                 offset: Offset(0, 4), // Shadow offset
//                 blurRadius: 10, // Shadow blur radius
//               ),
//             ],
//             borderRadius: BorderRadius.vertical(
//               bottom: Radius.elliptical(SizeConfig.screenWidth, 850.0),
//             ),
//           ),
//           child: SafeArea(
//             child: Column(
//               children: [
//                 SizedBox(height: 10), // Add some space before the title
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: Row(
//                     children: [
//                       // Profile Drawer Icon
//                       // Profile Drawer Icon
//                       Builder( // FIX: Added Builder to provide correct context for Scaffold.of(context)
//                         builder: (context) {
//                           return IconButton(
//                             icon: Icon(Icons.menu, color: Colors.white),
//                             onPressed: () {
//                               Scaffold.of(context).openDrawer(); // FIX: Corrected context reference for opening the drawer
//                             },
//                           );
//                         },
//                       ),
//                       SizedBox(width: 8), // Spacing between menu and search bar
//                       Expanded(
//                         child: TextField(
//                           onChanged: updateSearchQuery,
//                           decoration: InputDecoration(
//                             hintText: 'Search',
//                             hintStyle: TextStyle(color: Colors.white70),
//                             prefixIcon: Icon(Icons.search, color: Colors.white),
//                             filled: true,
//                             fillColor: Colors.white24,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       SizedBox(width: 8), // Spacing between search bar and icon
//                       IconButton(
//                         icon: Icon(Icons.shopping_cart, color: Colors.white),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CartScreen()),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//
//
//       drawer: Drawer(
//         elevation: 50,
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.deepOrange,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundImage: AssetImage('assets/images/profile.png'),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'John Doe',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'john.doe@example.com',
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Home'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('Logout'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//
//
//       body: Column(
//         children: [
//           // Padding(
//           //   padding: const EdgeInsets.all(16.0),
//           // ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 16.0,
//                   mainAxisSpacing: 16.0,
//                   childAspectRatio: 3 / 4,
//                 ),
//                 itemCount: filteredProducts.length,
//                 itemBuilder: (context, index) {
//                   final product = filteredProducts[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ProductDetailScreen(
//                             product: product,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       elevation: 4,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               child: Center(
//                                 child: Image.asset(
//                                   product['image']!,
//                                   fit: BoxFit.contain,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               product['name']!,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               product['price']!,
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.green,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               product['description']!,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             ElevatedButton(
//                               onPressed: () {
//                                 cartItems.add(product);
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                       content: Text(
//                                           '${product['name']} added to cart')),
//                                 );
//                               },
//                               child: Text('Add to Cart'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class SizeConfig {
//   static late double screenWidth;
//   static late double screenHeight;
//   static void init(BuildContext context) {
//     screenWidth = MediaQuery.of(context).size.width;
//     screenHeight = MediaQuery.of(context).size.height;
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Update user details in the database
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Profile updated successfully!')),
//                 );
//               },
//               child: Text('Save Changes'),
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// CartScreen to show cart items
// class CartScreen extends StatefulWidget {
//   @override
//   _CartScreenState createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Cart'),
//       ),
//       body: cartItems.isEmpty
//           ? Center(
//         child: Text(
//           'Your cart is empty!',
//           style: TextStyle(fontSize: 18),
//         ),
//       )
//           : ListView.builder(
//         itemCount: cartItems.length,
//         itemBuilder: (context, index) {
//           final item = cartItems[index];
//           return ListTile(
//             title: Text(item['name']!),
//             subtitle: Text(item['price']!),
//             trailing: IconButton(
//               icon: Icon(Icons.remove_circle),
//               onPressed: () {
//                 setState(() {
//                   cartItems.removeAt(index);
//                 });
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
// // ProductDetailScreen to show product details
// class ProductDetailScreen extends StatelessWidget {
//   final Map<String, String> product;
//
//   ProductDetailScreen({required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product['name']!),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               product['name']!,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               product['description']!,
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Price: ${product['price']}',
//               style: TextStyle(fontSize: 18, color: Colors.green),
//             ),
//             Spacer(),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to ConfirmationScreen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ConfirmationScreen(product: product),
//                   ),
//                 );
//               },
//               child: Text('Buy Now'),
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // ConfirmationScreen for purchase success
// class ConfirmationScreen extends StatelessWidget {
//   final Map<String, String> product;
//
//   ConfirmationScreen({required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Confirmation'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.check_circle,
//                 color: Colors.green,
//                 size: 100,
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Thank you for your purchase!',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'You have purchased ${product['name']} for ${product['price']}.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 40),
//               ElevatedButton(
//                 onPressed: () {
//                   // Pop back to ProductScreen by removing only the current screen
//                   Navigator.pop(context);
//                 },
//                 child: Text('Back to Products'),
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 16.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// Example of ForgotPasswordScreen
// class ForgotPasswordScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Forgot Password'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Enter your email to reset your password.',
//                 style: TextStyle(fontSize: 20),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   prefixIcon: Icon(Icons.email),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (emailController.text.isNotEmpty) {
//                     // Simulate password reset request
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Password reset link sent to ${emailController.text}')),
//                     );
//                     Navigator.pop(context); // Navigate back to LoginPage
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Please enter a valid email')),
//                     );
//                   }
//                 },
//                 child: Text('Send Reset Link'),
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 16.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// Example of SignUpScreen



// class SignUpScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   'Create a new account',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 20),
//
//                 // Email TextField
//                 TextField(
//                   controller: emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     prefixIcon: Icon(Icons.email),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//
//                 // Password TextField
//                 TextField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     prefixIcon: Icon(Icons.lock),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//
//                 // Confirm Password TextField
//                 TextField(
//                   controller: confirmPasswordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Confirm Password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     prefixIcon: Icon(Icons.lock),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//
//                 // Sign Up Button
//                 ElevatedButton(
//                   onPressed: () async {
//                     String email = emailController.text.trim();
//                     String password = passwordController.text.trim();
//                     String confirmPassword = confirmPasswordController.text.trim();
//
//                     if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Please fill in all fields')),
//                       );
//                       return;
//                     }
//
//                     if (password != confirmPassword) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Passwords do not match')),
//                       );
//                       return;
//                     }
//
//                     try {
//                       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//                         email: email,
//                         password: password,
//                       );
//
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Account created successfully!')),
//                       );
//
//                       Navigator.pop(context); // Navigate back to LoginPage
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Error: ${e.toString()}')),
//                       );
//                     }
//                   },
//                   child: Text('Sign Up'),
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(vertical: 16.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
