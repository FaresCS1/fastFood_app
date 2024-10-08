List<dynamic> mealsInfo = [
  {
    "type": "Meals",
    "name": "Beef Burger Meal",
    "img": "assets/images/meals/beefburger.png",
    "price": 30,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 30,
  },
  {
    "type": "Meals",
    "name": "Fast Meal",
    "img": "assets/images/meals/fastmeal.png",
    "price": 20,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 20,
  },
  {
    "type": "Meals",
    "name": "shawarma Meal",
    "img": "assets/images/meals/shawarma.png",
    "price": 18,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 18,
  },
];
List<dynamic> burgerInfo = [
  {
    "type": "Burger",
    "name": "Beef Burger",
    "img": "assets/images/burger/beefburger.png",
    "price": 18,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 18,
  },
  {
    "type": "Burger",
    "name": "Chicken Burger",
    "img": "assets/images/burger/chikenburger.png",
    "price": 18,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 18,
  },
  {
    "type": "Burger",
    "name": "Cheese Burger",
    "img": "assets/images/burger/cheesburger.png",
    "price": 20,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 20,
  },
  {
    "type": "Burger",
    "name": "Double Beef Burger",
    "img": "assets/images/burger/doubleBburger.png",
    "price": 23,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 23,
  },
  {
    "type": "Burger",
    "name": "Double Chicken Burger",
    "img": "assets/images/burger/doubleCburger.png",
    "price": 23,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 23,
  },
];
List<dynamic> sandwichInfo = [
  {
    "type": "Sandwich",
    "name": "Classic Hotdog Sandwich",
    "img": "assets/images/sandwich/classic_hotdog.png",
    "price": 10,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 10,
  },
  {
    "type": "Sandwich",
    "name": "King Hotdog Sandwich",
    "img": "assets/images/sandwich/double_hotdog.png",
    "price": 14,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 14,
  },
  {
    "type": "Sandwich",
    "name": "Classic Sandwich",
    "img": "assets/images/sandwich/sandwich.png",
    "price": 7,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 7,
  },
  {
    "type": "Sandwich",
    "name": " Shawarma Sandwich",
    "img": "assets/images/sandwich/shawarma.png",
    "price": 7,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 7,
  },
];
List<dynamic> drinksInfo = [
  {
    "type": "Drinks",
    "name": "Coca cola Soda",
    "img": "assets/images/drinks/drink.png",
    "price": 3,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 3,
  },
  {
    "type": "Drinks",
    "name": "Apple Soda",
    "img": "assets/images/drinks/apple_drink.png",
    "price": 3,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 3,
  },
];
List<dynamic> friesInfo = [
  {
    "type": "Fries",
    "name": "Fries",
    "img": "assets/images/fries/fries.png",
    "price": 5,
    "rate": 4.5,
    "numOfItem": 1,
    "total price": 5,
  },
];

List<dynamic> allFoodInfo = [
  ...mealsInfo,
  ...burgerInfo,
  ...sandwichInfo,
  ...drinksInfo,
  ...friesInfo,
];

List foodsCategory = [
  {"type": "All"},
  {"type": "Meals"},
  {"type": "Burger", "img": "assets/images/burger/chikenburger.png"},
  {"type": "Sandwich", "img": "assets/images/sandwich/shawarma.png"},
  {"type": "Fries", "img": "assets/images/fries/fries.png"},
  {"type": "Drinks", "img": "assets/images/drinks/drink.png"},
];

List offersList = [
  {"img": "assets/images/offer/ads_cover.jpg"},
  {"img": "assets/images/offer/bestOrder.jpg"},
  {"img": "assets/images/offer/spicalMnue.jpg"},
  {"img": "assets/images/offer/offer2.jpg"},
  {"img": "assets/images/offer/hotdogOffer.jpg"}
];
