import '../models/product.dart';

/* ---------------------- COOKIE ---------------------- */
final cookies = <Product>[
  Product(
    id: 'cookie-original',
    name: 'Original',
    imageUrl: 'assets/images/cookie-original.png',
    price: 10000,
  ),
  Product(
    id: 'cookie-red-velvet',
    name: 'Red Velvet',
    imageUrl: 'assets/images/cookie-red-velvet.png',
    price: 15000,
  ),
  Product(
    id: 'cookie-double-choco',
    name: 'Double Choco',
    imageUrl: 'assets/images/cookie-double-choco.png',
    price: 10000,
  ),
  Product(
    id: 'cookie-karamel',
    name: 'Karamel',
    imageUrl: 'assets/images/cookie-karamel.png',
    price: 10000,
  ),
  Product(
    id: 'cookie-oreo',
    name: 'Oreo',
    imageUrl: 'assets/images/cookie-oreo.png',
    price: 10000,
  ),
  Product(
    id: 'cookie-strawberry',
    name: 'Strawberry',
    imageUrl: 'assets/images/cookie-strawberry.png',
    price: 10000,
  ),
  Product(
    id: 'cookie-vanilla',
    name: 'Vanilla',
    imageUrl: 'assets/images/cookie-vanilla.png',
    price: 10000,
  ),
  Product(
    id: 'cookie-keju',
    name: 'Keju',
    imageUrl: 'assets/images/cookie-keju.png',
    price: 10000,
  ),
  Product(
    id: 'cookie-marshmallow',
    name: 'Marshmallow',
    imageUrl: 'assets/images/cookie-marshmallow.png',
    price: 10000,
  ),
  Product(
    id: 'cookie-lotus',
    name: 'Lotus',
    imageUrl: 'assets/images/cookie-lotus.png',
    price: 10000,
  ),
];

/* ---------------------- CAKE ------------------------ */
final cakes = <Product>[
  Product(
    id: 'cake-coklat',
    name: 'Coklat',
    imageUrl: 'assets/images/cake-coklat.png',
    price: 10000,
  ),
  Product(
    id: 'cake-strawberry-short',
    name: 'Strawberry Shortcake',
    imageUrl: 'assets/images/cake-strawberry-short.png',
    price: 10000,
  ),
  Product(
    id: 'cake-tiramisu-slice',
    name: 'Tiramisu Slice',
    imageUrl: 'assets/images/cake-tiramisu-slice.png',
    price: 10000,
  ),
  Product(
    id: 'cake-cheese-slice',
    name: 'Cheese Slice',
    imageUrl: 'assets/images/cake-cheese-slice.png',
    price: 10000,
  ),
  Product(
    id: 'cake-blueberry',
    name: 'Blueberry',
    imageUrl: 'assets/images/cake-blueberry.png',
    price: 10000,
  ),
  Product(
    id: 'cake-pandan',
    name: 'Pandan',
    imageUrl: 'assets/images/cake-pandan.png',
    price: 10000,
  ),
];

/* --------------------- CUPCAKE ---------------------- */
final cupcakes = <Product>[
  Product(
    id: 'cupcake-coklat',
    name: 'Coklat',
    imageUrl: 'assets/images/cupcake-coklat.png',
    price: 10000,
  ),
  Product(
    id: 'cupcake-strawberry',
    name: 'Strawberry',
    imageUrl: 'assets/images/cupcake-strawberry.png',
    price: 10000,
  ),
  Product(
    id: 'cupcake-karamel',
    name: 'Original',
    imageUrl: 'assets/images/cupcake-karamel.png',
    price: 10000,
  ),
  Product(
    id: 'cupcake-berry',
    name: 'Berry',
    imageUrl: 'assets/images/cupcake-berry.png',
    price: 10000,
  ),
];

/* ------------------ GABUNG SEMUA -------------------- */
final allProducts = <Product>[
  ...cookies,
  ...cakes,
  ...cupcakes,
];
