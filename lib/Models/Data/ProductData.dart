import 'package:crayondcart/Models/ProductsModel.dart';

final List<Products> productsList = [
  Products(
    id: 1,
    name: "Cheese Burst Pizza",
    description: "Delicious pizza with extra cheese and a crispy crust.",
    price: 12.99,
    image: "https://foodish-api.com/images/pizza/pizza80.jpg",
    calories: 320,
    category: "pizza",
    type: "Veg",
    varients: [
      Varients(
        id: "v1",
        productId: "1",
        name: "Medium",
        isActive: true,
        createdAt: "2023-09-22",
        price: 12.99,
      ),
      Varients(
        id: "v2",
        productId: "1",
        name: "Large",
        isActive: true,
        createdAt: "2023-09-22",
        price: 15.99,
      ),
    ],
    status: 1,
    stock: 10,
  ),
  Products(
    id: 2,
    name: "Spicy Chicken Burger",
    description: "Juicy chicken patty with spicy sauce and fresh lettuce.",
    price: 8.49,
    image: "https://foodish-api.com/images/burger/burger54.jpg",
    calories: 450,
    category: "burger",
    type: "Non-Veg",
    stock: 10,
    varients: [
      Varients(
        id: "v1",
        productId: "2",
        name: "Single Patty",
        isActive: true,
        createdAt: "2023-09-23",
        price: 8.49,
      ),
      Varients(
        id: "v2",
        productId: "2",
        name: "Double Patty",
        isActive: true,
        createdAt: "2023-09-23",
        price: 10.99,
      ),
    ],
    status: 1,
  ),
  Products(
    id: 3,
    name: "Fries with Cheese",
    type: "Non-Veg",
    description: "Crispy fries topped with melted cheese and seasonings.",
    price: 4.99,
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdCVpcfDrxbsp0ijdj_NEdjyAYFJBptZbGog&s",
    calories: 220,
    category: "sides",
    stock: 10,
    varients: [
      Varients(
        id: "v1",
        productId: "3",
        name: "Regular",
        isActive: true,
        createdAt: "2023-09-24",
        price: 4.99,
      ),
      Varients(
        id: "v2",
        productId: "3",
        name: "Large",
        isActive: true,
        createdAt: "2023-09-24",
        price: 6.49,
      ),
    ],
    status: 1,
  ),
  Products(
    id: 4,
    name: "Crispy Chicken Nuggets",
    description: "Golden-fried chicken nuggets served with a choice of sauces.",
    price: 5.99,
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9BOW37lpn3mBAuck7rXhUBD78EX-HLp0CsQ&s",
    calories: 300,
    category: "sides",
    type: "Non-Veg",
    stock: 10,
    varients: [
      Varients(
        id: "v1",
        productId: "4",
        name: "6 Pieces",
        isActive: true,
        createdAt: "2023-09-25",
        price: 5.99,
      ),
      Varients(
        id: "v2",
        productId: "4",
        name: "10 Pieces",
        isActive: true,
        createdAt: "2023-09-25",
        price: 7.99,
      ),
      Varients(
        id: "v3",
        productId: "4",
        name: "12 Pieces",
        isActive: true,
        createdAt: "2023-09-25",
        price: 9.99,
      ),
    ],
    status: 1,
  ),
  Products(
    id: 5,
    name: "Veggie Wrap",
    description:
        "Fresh veggies, hummus, and feta cheese wrapped in a soft tortilla.",
    price: 6.49,
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZt8-ioL1fTh-ujlsUHnvSMSiGg79pcY6QtQ&s",
    calories: 250,
    category: "wraps",
    type: "Veg",
    stock: 0,
    varients: [
      Varients(
        id: "v1",
        productId: "5",
        name: "Small",
        isActive: true,
        createdAt: "2023-09-26",
        price: 6.49,
      ),
      Varients(
        id: "v2",
        productId: "5",
        name: "Large",
        isActive: true,
        createdAt: "2023-09-26",
        price: 8.99,
      ),
    ],
    status: 1,
  ),
  Products(
    id: 6,
    name: "Chocolate Milkshake",
    description: "Rich chocolate milkshake topped with whipped cream.",
    price: 3.99,
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiC6PeKCdHMJhYOmcPhM1k7GLgpG6CrTOurw&s",
    calories: 500,
    category: "beverages",
    type: "Veg",
    stock: 10,
    varients: [
      Varients(
        id: "v1",
        productId: "6",
        name: "Regular",
        isActive: true,
        createdAt: "2023-09-27",
        price: 3.99,
      ),
      Varients(
        id: "v2",
        productId: "6",
        name: "Large",
        isActive: true,
        createdAt: "2023-09-27",
        price: 5.49,
      ),
    ],
    status: 3,
  ),
];
