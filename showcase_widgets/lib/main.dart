import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StartShowCaseTutorial(),
    );
  }
}

class StartShowCaseTutorial extends StatefulWidget {
  const StartShowCaseTutorial({super.key});

  @override
  State<StartShowCaseTutorial> createState() => _StartShowCaseTutorialState();
}

class _StartShowCaseTutorialState extends State<StartShowCaseTutorial> {
  List<Restaurant> restaurants = [
    Restaurant(
        "assets/images/restaurant1.jpeg",
        "Spice Haven",
        "A vibrant eatery offering a fusion of traditional and modern flavors, specializing in spicy South Asian and Middle Eastern dishes.",
        true,
        false),
    Restaurant(
        "assets/images/restaurant2.jpeg",
        "Ocean Bites",
        "A seafood lover’s paradise with freshly caught fish, sushi, and grilled delights, all served with a view of the ocean.",
        false,
        false),
    Restaurant(
        "assets/images/restaurant3.jpeg",
        "The Rustic Fork",
        "A cozy, countryside-style restaurant featuring homemade comfort food, from wood-fired pizzas to slow-cooked BBQ ribs.",
        true,
        true),
    Restaurant(
        "assets/images/restaurant4.jpeg",
        "Skyline Bistro",
        "A rooftop dining experience offering gourmet international cuisine with breathtaking city views.",
        true,
        false),
    Restaurant(
        "assets/images/restaurant5.jpeg",
        " Zen Garden Café ",
        "A peaceful escape serving organic teas, healthy bowls, and plant-based delicacies in a tranquil, garden-like setting.",
        true,
        false),
    Restaurant(
        "assets/images/restaurant6.jpeg",
        "Grill & Chill Steakhouse",
        "A premium steakhouse known for its juicy grilled meats, signature sauces, and a warm, inviting atmosphere.",
        false,
        false),
    Restaurant(
        "assets/images/restaurant7.jpeg",
        "Mystic Tandoor",
        "An authentic Indian restaurant with a variety of tandoori dishes, flavorful curries, and aromatic biryanis.",
        true,
        true),
    Restaurant(
        "assets/images/restaurant8.jpeg",
        "Grill & Chill Steakhouse",
        "A premium steakhouse known for its juicy grilled meats, signature sauces, and a warm, inviting atmosphere.",
        false,
        false),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.play_arrow,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.pink.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.pink.withValues(alpha: 0.2),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.menu,
                            color: Colors.pink,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Search Restaurant",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                  ),
                                ),
                                Icon(
                                  Icons.search,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Popular Restaurants",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: restaurants.length,
                  padding: const EdgeInsets.only(bottom: 90),
                  itemBuilder: (context, index) {
                    Restaurant restaurant = restaurants[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.pink,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                restaurant.imageUrl,
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  restaurant.name,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  restaurant.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Row(
                                //       children: [
                                //         Icon(
                                //           Icons.reviews,
                                //           color: Colors.grey,
                                //         ),
                                //         const SizedBox(width: 10),
                                //         Text(restaurant.reviews),
                                //       ],
                                //     ),
                                //     Row(
                                //       children: [
                                //         Icon(
                                //           Icons.comment,
                                //           color: Colors.grey,
                                //         ),
                                //         const SizedBox(width: 10),
                                //         Text(restaurant.comments),
                                //       ],
                                //     ),
                                //     Row(
                                //       children: [
                                //         Icon(
                                //           Icons.thumb_up,
                                //           color: Colors.grey,
                                //         ),
                                //         const SizedBox(width: 10),
                                //         Text(restaurant.suggestion),
                                //       ],
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            children: [
                              Text(
                                "Open",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: restaurant.isOpen
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Icon(
                                restaurant.isFavourite
                                    ? Icons.star
                                    : Icons.star_outline_outlined,
                                color: restaurant.isFavourite
                                    ? const Color(0xffFBC800)
                                    : Colors.grey,
                                size: 22,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Restaurant {
  String imageUrl;
  String name;
  String description;
  bool isOpen;
  bool isFavourite;

  Restaurant(this.imageUrl, this.name, this.description, this.isOpen,
      this.isFavourite);
}
