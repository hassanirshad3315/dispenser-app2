import 'package:flutter/material.dart';
import 'login page.dart';
import 'admin.dart';


List<Map<String, String>> purchaseHistory = [];
List<Map<String, String>> cartItems = [];
class ProductScreen extends StatefulWidget {
  final bool isLoggedIn;
  final bool isAdmin;
  final String userEmail;
  final String userName;
  final VoidCallback onLogout;

  ProductScreen({
    required this.isLoggedIn,
    required this.isAdmin,
    required this.userEmail,
    required this.userName,
    required this.onLogout,
  });
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // Original product list
  final List<Map<String, String>> products = [
    {
      'name': 'Water Pump',
      'description': 'High-quality pump for smooth water flow.',
      'price': '\$25',
      'image': 'assets/images/water_pump.png',
    },
    {
      'name': 'Cooling Fan',
      'description': 'Efficient fan for faster cooling.',
      'price': '\$30',
      'image': 'assets/images/cooling_fan.png',
    },
    {
      'name': 'Filter Cartridge',
      'description': 'Removes impurities for clean water.',
      'price': '\$15',
      'image': 'assets/images/filter_cartridge.png',
    },
    {
      'name': 'Dispenser Tap',
      'description': 'Durable tap for easy water dispensing.',
      'price': '\$10',
      'image': 'assets/images/dispenser_tap.png',
    },
    {
      'name': 'Thermostat',
      'description': 'Maintains optimal cooling temperatures.',
      'price': '\$20',
      'image': 'assets/images/thermostat.png',
    },
    {
      'name': 'Water Pump',
      'description': 'High-quality pump for smooth water flow.',
      'price': '\$25',
      'image': 'assets/images/water_pump.png',
    },
    {
      'name': 'Cooling Fan',
      'description': 'Efficient fan for faster cooling.',
      'price': '\$30',
      'image': 'assets/images/cooling_fan.png',
    },
    {
      'name': 'Filter Cartridge',
      'description': 'Removes impurities for clean water.',
      'price': '\$15',
      'image': 'assets/images/filter_cartridge.png',
    },
    {
      'name': 'Dispenser Tap',
      'description': 'Durable tap for easy water dispensing.',
      'price': '\$10',
      'image': 'assets/images/dispenser_tap.png',
    },
    {
      'name': 'Thermostat',
      'description': 'Maintains optimal cooling temperatures.',
      'price': '\$20',
      'image': 'assets/images/thermostat.png',
    },
  ];

  // Adding a new product

  // Search query and filtered products
  String searchQuery = '';
  List<Map<String, String>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products; // Initialize with all products
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredProducts = products
          .where((product) =>
      product['name']!.toLowerCase().contains(searchQuery) ||
          product['description']!.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 6),
        child: Container(

          decoration: BoxDecoration(
            color: Colors.deepOrange,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8), // Shadow color
                offset: Offset(0, 4), // Shadow offset
                blurRadius: 10, // Shadow blur radius
              ),
            ],
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(SizeConfig.screenWidth, 850.0),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 10), // Add some space before the title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      // Profile Drawer Icon
                      // Profile Drawer Icon
                      Builder( // FIX: Added Builder to provide correct context for Scaffold.of(context)
                        builder: (context) {
                          return IconButton(
                            icon: Icon(Icons.menu, color: Colors.white),
                            onPressed: () {
                              Scaffold.of(context).openDrawer(); // FIX: Corrected context reference for opening the drawer
                            },
                          );
                        },
                      ),
                      SizedBox(width: 8), // Spacing between menu and search bar
                      Expanded(
                        child: TextField(
                          onChanged: updateSearchQuery,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.white70),
                            prefixIcon: Icon(Icons.search, color: Colors.white),
                            filled: true,
                            fillColor: Colors.white24,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 8), // Spacing between search bar and icon
                      IconButton(
                        icon: Icon(Icons.shopping_cart, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),


      drawer: Drawer(
        elevation: 50,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.userName,  // Display the user's name from the widget
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.userEmail,  // Display the user's email from the widget
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text('Login as Admin'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                widget.onLogout(); // Call the logout function passed as a parameter

                // Navigate to ProductScreen as a logged-out user
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(
                      isLoggedIn: false,  // Set isLoggedIn to false for logout
                      isAdmin: false,     // Set isAdmin to false as default
                      onLogout: widget.onLogout, // Pass the onLogout function again
                      userEmail: '',      // Clear email
                      userName: '',       // Clear username
                    ),
                  ),
                      (route) => false, // Remove all previous routes
                );
              },
            ),
            if(widget.isLoggedIn)
            ListTile(
              leading: Icon(Icons.admin_panel_settings),
              title: Text('Admin Panel'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminScreen(
                      addProduct: (product) {
                        setState(() {
                          products.add(product); // Update the local products list
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      body:
      Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            product: product,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Center(
                                child: Image.asset(
                                  product['image']!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              product['name']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              product['price']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              product['description']!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                cartItems.add(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          '${product['name']} added to cart')),
                                );
                              },
                              child: Text('Add to Cart'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

    );
  }
}

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
        child: Text(
          'Your cart is empty!',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            title: Text(item['name']!),
            subtitle: Text(item['price']!),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                setState(() {
                  cartItems.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}

// ProductDetailScreen to show product details
class ProductDetailScreen extends StatelessWidget {
  final Map<String, String> product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              product['description']!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Price: ${product['price']}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigate to ConfirmationScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationScreen(product: product),
                  ),
                );
              },
              child: Text('Buy Now'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ConfirmationScreen for purchase success
class ConfirmationScreen extends StatelessWidget {
  final Map<String, String> product;

  ConfirmationScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Thank you for your purchase!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'You have purchased ${product['name']} for ${product['price']}.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Pop back to ProductScreen by removing only the current screen
                  Navigator.pop(context);
                },
                child: Text('Back to Products'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}