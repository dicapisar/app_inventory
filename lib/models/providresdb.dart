class ProvidersDB {
  final int id;
  final bool active;
  final String name;
  final String address;
  final String documentNumber;
  final String email;
  final String phoneNumber;
  final DateTime creationDate;
  final DateTime updateDate;
  final int creatorId;
  final int updaterId;

  ProvidersDB(
    this.id,
    this.active,
    this.name,
    this.address,
    this.documentNumber,
    this.email,
    this.phoneNumber,
    this.creationDate,
    this.updateDate,
    this.creatorId,
    this.updaterId,
  );
}
