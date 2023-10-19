class CategoryModel {
  final String image;
  final String productName;

  CategoryModel({required this.image, required this.productName});
}

List<CategoryModel> myFavorite = [
  CategoryModel(image: 'assets/icons/wifi.png', productName: 'Internet & TV Kabel'),
  CategoryModel(image: 'assets/icons/pulsa-and-data.png', productName: 'Pulsa & Data'),
  CategoryModel(image: 'assets/icons/uang-elektronik.png', productName: 'Uang Elektronik'),
];
List<CategoryModel> daily = [
  CategoryModel(image: 'assets/icons/pulsa-and-data.png', productName: 'Pulsa & Data'),
  CategoryModel(image: 'assets/icons/uang-elektronik.png', productName: 'Uang Elektronik'),

];
List<CategoryModel> bills = [
  CategoryModel(image: 'assets/icons/air.png', productName: 'Air'),
  CategoryModel(image: 'assets/icons/wifi.png', productName: 'Listrik PLN'),
  CategoryModel(image: 'assets/icons/wifi.png', productName: 'Internet & TV Kabel'),
  CategoryModel(image: 'assets/icons/pendidikan.png', productName: 'Pendidikan'),
  CategoryModel(image: 'assets/icons/pulsa-and-data.png', productName: 'Pasca Bayar'),
];
List<CategoryModel> entertainment = [
  CategoryModel(image: 'assets/icons/games.png', productName: 'Games'),
];