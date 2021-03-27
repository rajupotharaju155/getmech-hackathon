class OrderModel{
  final String orderName;
  final String vehicleName;
  final String vehicleNumber;
  final String orderId;
  final List<Particulars> particularList;
  final int totalCost;
  final double companyCut;
  final DateTime orderDate;
  final bool wasSuccess;
  final String customerId;
  final int vehicleClassNumber;

  OrderModel({
    this.orderName, 
    this.orderId, 
    this.particularList, 
    this.totalCost, 
    this.companyCut,
    this.orderDate, 
    this.wasSuccess,
    this.customerId,
    this.vehicleName, 
    this.vehicleNumber, 
    this.vehicleClassNumber
    });
}

class Particulars{
  final String particularName;
  final int pirce;
  final int quantity;
  final bool isProduct;

  Particulars({
    this.particularName, 
    this.pirce, 
    this.quantity,
    this.isProduct});
}