class ItemDB {
  final int id;
  final bool active;
  final String status;
  final String name;
  final int count;
  final double price;
  final DateTime creationDate;
  final DateTime updateDate;
  final int typeItemId;
  final int brandId;
  final int creatorId;
  final int updaterId;

  ItemDB(
    this.id,
    this.active,
    this.status,
    this.name,
    this.count,
    this.price,
    this.creationDate,
    this.updateDate,
    this.typeItemId,
    this.brandId,
    this.creatorId,
    this.updaterId,
  );
}
