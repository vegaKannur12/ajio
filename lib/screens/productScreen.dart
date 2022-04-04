import 'package:ajioapp/screens/notification.dart';
import 'package:ajioapp/services/firebse_service.dart';
import 'package:ajioapp/services/push_notification.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String notificationTitle = 'No Title';

  String notificationBody = 'No Body';

  String notificationData = 'No Data';

  int current_index = 0;

  @override
  void initState() {
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);

    super.initState();
  }

  _changeData(String msg) => setState(() => notificationData = msg);

  _changeBody(String msg) => setState(() => notificationBody = msg);

  _changeTitle(String msg) => setState(() => notificationTitle = msg);

  @override
  Widget build(BuildContext context) {
    FirebaseService service = FirebaseService();
    Size size = MediaQuery.of(context).size;
    int _selectedIndex = 0;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 61, 77, 3)),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 228, 235, 238),
          title: Text(
            "AJIO",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 61, 77, 3),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  FCM fcm = FCM();
                  fcm.setNotifications();
                },
                icon: Icon(Icons.notifications)),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 191, 196, 201),
              ),
            ),
            ListTile(
              onTap: () {
                service.logOut(context);
              },
              title: Text("Logout"),
            ),
            ListTile(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 235, 238),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: size.height * 0.07,
                width: size.width * 0.55,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {},
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                    // decoration: InputDecoration(
                    //     // fillColor: Colors.white,
                    //     prefixIcon: Icon(Icons.search),
                    //     suffixIcon: IconButton(
                    //       icon: Icon(Icons.clear),
                    //       onPressed: () {},
                    //     ),
                    //     hintText: 'Search...',
                    //     border: InputBorder.none),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: size.height * 0.2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Column(
                    children: [
                      Container(
                        width: size.width * 0.18,
                        height: size.height * 0.02,
                        child: Text(
                          'KIDS',
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 100,
                        child: Image.network(
                            "https://4.imimg.com/data4/VN/JF/MY-34076214/boy-party-wear-dress-500x500.jpg"),
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Column(
                    children: [
                      Container(
                        width: size.width * 0.18,
                        child: Text(
                          'HOME',
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 100,
                        child: Image.network(
                            "https://m.media-amazon.com/images/I/71vDkHrBhTL._SL1500_.jpg"),
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Column(
                    children: [
                      Container(
                        width: size.width * 0.18,
                        child: Text(
                          'FOOTWEAR',
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 100,
                        child: Image.network(
                            "https://m.media-amazon.com/images/I/71D9ImsvEtL._UL1500_.jpg"),
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Column(
                    children: [
                      Container(
                        width: size.width * 0.18,
                        child: Text(
                          'BEAUTY',
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 100,
                        child: Image.network(
                            "https://images.indianexpress.com/2017/11/cosmetics-759.jpg"),
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Column(
                    children: [
                      Container(
                        width: size.width * 0.18,
                        child: Text(
                          'JEWELLERY',
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: Image.network(
                            "https://m.media-amazon.com/images/I/71SoAmDR-2L._UY500_.jpg"),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.2,
              child: Image.network(
                  "https://assets.ajio.com/medias/sys_master/images/images/h90/h5a/13349441208350/21062019-D-SHP-MAINSITEOFFER1-banner-EPICSALE21to27june-50to90per....jpg"),
            ),
            CarouselSlider(
              items: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn5.vectorstock.com/i/1000x1000/07/19/promo-poster-big-sales-discount-announce-shopping-vector-28850719.jpg"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn5.vectorstock.com/i/1000x1000/07/19/promo-poster-big-sales-discount-announce-shopping-vector-28850719.jpg"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn5.vectorstock.com/i/1000x1000/07/19/promo-poster-big-sales-discount-announce-shopping-vector-28850719.jpg"),
                          fit: BoxFit.cover)),
                ),
              ],
              //Slider Container properties
              options: CarouselOptions(
                autoPlay: true,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_index,
        onTap: (value) {},
        type: BottomNavigationBarType.fixed,
        elevation: 2,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
              color: Colors.black,
            ),
            label: 'Stores',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            label: 'Closet',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              color: Colors.black,
            ),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Account',
          ),
        ],
        // unselectedItemColor: Colors.black,
      ),
    );
  }
}
