import 'package:flutter/material.dart';

void main() {
  runApp(FoodiesApp());
}

class FoodiesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodies',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Foodies',
          style: TextStyle(
            fontFamily: 'Samantha',
            fontSize: 50,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Handle profile button
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                foodCard('Burger', 'More than 15% Off', 'assets/images/burger.jpg'),
                foodCard('Cheese Chilly', 'More than 40% Off', 'assets/images/cheesechilly.jpg'),
                foodCard('Noodles', 'More than 20% Off', 'assets/images/noodles.jpg'),
                foodCard('Pizza', 'More than 30% Off', 'assets/images/pizza.jpg'),
              ],
            ),
          ),
          foodListItem('The Hawkers', 'Burgers | Chinese | Fast Food | Italian | Juice', 'assets/images/hawkers.jpg', 20),
          foodListItem('Flipping Noodles', 'Burgers | Chinese | Fast Food | Italian | Juice', 'assets/images/flipping.jpg', 50),
          foodListItem('Pizza Hut', 'Pizza | Chinese | Fast Food | Italian | Juice', 'assets/images/pizzahut.jpg', 20),
          foodListItem('Blue Lily', 'Chinese | Fast Food | Italian | Juice', 'assets/images/bluehill.jpg', 30),
        ],
      ),
    );
  }

  Widget foodCard(String title, String subtitle, String imageUrl) {
    return Container(
      width: 250,
      margin: EdgeInsets.all(8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 6.0,
                          color: Colors.black,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      shadows: [
                        Shadow(
                          blurRadius: 6.0,
                          color: Colors.black,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodListItem(String title, String subtitle, String imageUrl, int minOrder) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.red, width: 2),
        ),
        shadowColor: Colors.black54,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  bottomLeft: Radius.circular(13),
                ),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Min Order: \$${minOrder}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
