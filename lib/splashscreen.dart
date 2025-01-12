import 'package:cooler/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'product_screen.dart';
import 'login page.dart';
class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the video player
    _controller = VideoPlayerController.asset('assets/videos/e8dc3260-bdf3-48fb-82cc-11464555baad.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });

    // Navigate to the next page after 8 seconds
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductScreen( isLoggedIn: false,  // Default to false as no login yet
          isAdmin: false,     // Default to false
          onLogout: () {
            // Handle logout (if needed, for now, just navigate to login)
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false, // Clear all previous routes
            );
          },
          userEmail: '',      // No email yet
          userName: '', )),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Video background
          SizedBox.expand(
            child: _controller.value.isInitialized
                ? FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            )
                : Container(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
