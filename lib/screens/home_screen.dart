import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: Image.asset('assets/logo.png'),
        ),
        actions: const [
          Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Icon(Iconsax.search_normal)),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Icon(Iconsax.heart)),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Icon(Iconsax.shopping_cart)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/home_banner.png'), // or NetworkImage
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 250,
                      color: Colors.black.withOpacity(0.2), // Adjust opacity here
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 100, left: 10),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'LIU.JO',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text(
                                'Shop Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Our Brands',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            width: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage('assets/brand1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Suggested for you',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 300,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage('assets/suggested_1.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left: 10.0,top: 5.0),
                                    child: Text('Product Name',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),),
                                  ),
                                   Padding(
                                    padding:  EdgeInsets.only(left: 10.0,top: 5.0),
                                    child: Text('₹ 75',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
