class ItemOutputDB {
  final int id;
  final bool active;
  final String status;
  final int count;
  final DateTime creationDate;
  final DateTime updateDate;
  final int recordOutputId;
  final int creatorId;
  final int updaterId;
  final int itemId;

  ItemOutputDB(
    this.id,
    this.active,
    this.status,
    this.count,
    this.creationDate,
    this.updateDate,
    this.creatorId,
    this.updaterId,
    this.itemId, 
    this.recordOutputId,
  );
}
