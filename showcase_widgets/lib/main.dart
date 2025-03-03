import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: (context) {
        return MaterialApp(
          title: 'Showcase / Highlight Widgets',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: StartShowCaseTutorial(),
        );
      },
    );
  }
}

class StartShowCaseTutorial extends StatefulWidget {
  const StartShowCaseTutorial({super.key});

  @override
  State<StartShowCaseTutorial> createState() => _StartShowCaseTutorialState();
}

class _StartShowCaseTutorialState extends State<StartShowCaseTutorial> {
  final GlobalKey _menuButton = GlobalKey();
  final GlobalKey _searchBox = GlobalKey();
  final GlobalKey _profileButton = GlobalKey();
  final GlobalKey _restaurant = GlobalKey();
  final GlobalKey _restaurantStatus = GlobalKey();
  final GlobalKey _restaurantFavourite = GlobalKey();
  final GlobalKey _playButton = GlobalKey();
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
        onPressed: () {
          ShowCaseWidget.of(context).startShowCase([
            _menuButton,
            _searchBox,
            _profileButton,
            _restaurant,
            _restaurantStatus,
            _restaurantFavourite,
            _playButton
          ]);
        },
        backgroundColor: Colors.pink,
        child: ShowCaseTemplate(
          isFinished: true,
          globalKey: _playButton,
          height: 100,
          width: size.width * 0.5,
          shape: RoundedRectangleBorder(),
          isTitleRequired: false,
          description:
              "Click here to start Showcase/Highlight Widgets Tutorial",
          currentShowCase: "7",
          child: Icon(
            Icons.play_arrow,
            size: 30,
            color: Colors.white,
          ),
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
              // Header: menu, search box, profile icon
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
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
                          ShowCaseTemplate(
                            globalKey: _menuButton,
                            height: 100,
                            width: size.width * 0.5,
                            shape: CircleBorder(),
                            title: "Menu Button",
                            description:
                                "Click on menu button to see detail of all the food items",
                            currentShowCase: "1",
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Icon(
                                Icons.menu,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ShowCaseTemplate(
                              globalKey: _searchBox,
                              height: 100,
                              width: size.width * 0.5,
                              shape: RoundedRectangleBorder(),
                              isTitleRequired: false,
                              description:
                                  "Search here your favourite restaurant",
                              currentShowCase: "2",
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 30,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Search Restaurant",
                                          hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black45,
                                          ),
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.search,
                                    color: Colors.black45,
                                  ),
                                ],
                              ),
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
                    child: ShowCaseTemplate(
                      globalKey: _profileButton,
                      height: 100,
                      width: size.width * 0.5,
                      shape: CircleBorder(),
                      isTitleRequired: true,
                      title: "Profile Button",
                      description:
                          "See your profile info or edit it by clicking here",
                      currentShowCase: "3",
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
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
              const SizedBox(height: 10),
              // Restaurant list
              Expanded(
                child: ListView.builder(
                  itemCount: restaurants.length,
                  padding: const EdgeInsets.only(bottom: 90),
                  itemBuilder: (context, index) {
                    Restaurant restaurant = restaurants[index];
                    return index == 0
                        ? ShowCaseTemplate(
                            globalKey: _restaurant,
                            height: 100,
                            width: size.width * 0.5,
                            shape: RoundedRectangleBorder(),
                            isTitleRequired: false,
                            description:
                                "Here is list of individual restaurant near to you. Make sure your location is accorate.",
                            currentShowCase: "4",
                            child: _buildRestaurantTile(restaurant, index),
                          )
                        : _buildRestaurantTile(restaurant, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantTile(Restaurant restaurant, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
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
                width: 2,
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
              ],
            ),
          ),
          const SizedBox(width: 15),
          Column(
            children: [
              index == 0
                  ? ShowCaseTemplate(
                      globalKey: _restaurantStatus,
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.5,
                      shape: RoundedRectangleBorder(),
                      isTitleRequired: false,
                      description:
                          "It will show real status of restaurant opening, you will see open or close here.",
                      currentShowCase: "5",
                      child: Text(
                        restaurant.isOpen ? "Open" : "Closed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: restaurant.isOpen ? Colors.green : Colors.red,
                        ),
                      ),
                    )
                  : Text(
                      restaurant.isOpen ? "Open" : "Closed",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: restaurant.isOpen ? Colors.green : Colors.red,
                      ),
                    ),
              const SizedBox(height: 10),
              index == 0
                  ? ShowCaseTemplate(
                      globalKey: _restaurantFavourite,
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.5,
                      shape: CircleBorder(),
                      title: "Favourite",
                      description:
                          "Restaurant info will save after favourite if",
                      currentShowCase: "6",
                      child: Icon(
                        restaurant.isFavourite
                            ? Icons.star
                            : Icons.star_outline_outlined,
                        color: restaurant.isFavourite
                            ? const Color(0xffFBC800)
                            : Colors.grey,
                        size: 22,
                      ),
                    )
                  : Icon(
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
  }
}

class ShowCaseTemplate extends StatelessWidget {
  final GlobalKey globalKey;
  final String title;
  final String description;
  final String currentShowCase;
  final double height;
  final double width;
  final Widget child;
  final ShapeBorder shape;
  final bool isTitleRequired;
  final bool isFinished;
  const ShowCaseTemplate({
    super.key,
    required this.globalKey,
    this.title = "Title",
    this.description = "Description",
    required this.height,
    required this.width,
    required this.child,
    required this.shape,
    this.isTitleRequired = true,
    required this.currentShowCase,
    this.isFinished = false,
  });

  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
      key: globalKey,
      height: height,
      width: width,
      targetShapeBorder: shape,
      container: Column(
        children: [
          Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                .copyWith(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.pink,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "$currentShowCase of 7",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                isTitleRequired
                    ? Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : SizedBox.shrink(),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!isFinished)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    ShowCaseWidget.of(context).dismiss();
                  },
                  child: Text("Skip"),
                ),
              if (!isFinished)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: () {
                    ShowCaseWidget.of(context).next();
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              if (isFinished)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    ShowCaseWidget.of(context).dismiss();
                  },
                  child: Text(
                    "Finish Tutorial",
                  ),
                ),
            ],
          ),
        ],
      ),
      child: child,
    );
  }
}

// Model
class Restaurant {
  String imageUrl;
  String name;
  String description;
  bool isOpen;
  bool isFavourite;

  Restaurant(this.imageUrl, this.name, this.description, this.isOpen,
      this.isFavourite);
}
