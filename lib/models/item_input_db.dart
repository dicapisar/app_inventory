class ItemImputDB {
  final int id;
  final bool active;
  final String status;
  final int count;
  final double cost;
  final DateTime creationDate;
  final DateTime updateDate;
  final int recordInputId;
  final int providerId;
  final int creatorId;
  final int updaterId;
  final int itemId;

  ItemImputDB(
    this.id,
    this.active,
    this.status,
    this.count,
    this.cost,
    this.creationDate,
    this.updateDate,
    this.recordInputId,
    this.providerId,
    this.creatorId,
    this.updaterId, this.itemId,
  );
}
