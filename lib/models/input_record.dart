class InputRecord {
  final int id;
  final bool active;
  final String status;
  final String reason;
  final DateTime creationDate;
  final DateTime updateDate;
  final int creatorId;
  final int updaterId;

  InputRecord(
    this.id,
    this.active,
    this.status,
    this.reason,
    this.creationDate,
    this.updateDate,
    this.creatorId,
    this.updaterId,
  );
}
