class HistoryModel {
  final String icon;
  final String category;
  final String orderId;
  final String date;
  final String time;
  final int price;
  final String status;

  HistoryModel(
      {required this.icon,
      required this.category,
      required this.orderId,
      required this.date,
      required this.time,
      required this.price,
      required this.status});
}

List<HistoryModel> histories = [
  HistoryModel(
      icon: 'assets/icons/pulsa-and-data.png',
      category: 'Pulsa & Data',
      orderId: '***04d0',
      date: '14 Nov 2022',
      time: '06:30',
      price: 25000,
      status: 'Berhasil'),
  HistoryModel(
      icon: 'assets/icons/pulsa-and-data.png',
      category: 'Pulsa & Data',
      orderId: '***04d0',
      date: '14 Nov 2022',
      time: '06:30',
      price: 25000,
      status: 'Gagal'),
];
