import 'package:app_inventory/models/input_record.dart';

class Constant {
  List<InputRecord> getDataInputItems() {
    InputRecord inputRecordOne = InputRecord(
      1,
      true,
      'Abierto',
      'En ingreso',
      DateTime.now(),
      DateTime.now(),
      1,
      1,
    );
    InputRecord inputRecordTwo = InputRecord(
      2,
      true,
      'Abierto',
      'En ingreso',
      DateTime.now(),
      DateTime.now(),
      1,
      1,
    );
    InputRecord inputRecordThree = InputRecord(
      3,
      true,
      'Abierto',
      'En ingreso',
      DateTime.now(),
      DateTime.now(),
      1,
      1,
    );
    InputRecord inputRecordFour = InputRecord(
      4,
      true,
      'Abierto',
      'En ingreso',
      DateTime.now(),
      DateTime.now(),
      1,
      1,
    );
    InputRecord inputRecordFive = InputRecord(
      5,
      true,
      'Abierto',
      'En ingreso',
      DateTime.now(),
      DateTime.now(),
      1,
      1,
    );
    InputRecord inputRecordSix = InputRecord(
      6,
      true,
      'Abierto',
      'En ingreso',
      DateTime.now(),
      DateTime.now(),
      1,
      1,
    );

    List<InputRecord> list = List<InputRecord>.of(<InputRecord>[
      inputRecordOne,
      inputRecordTwo,
      inputRecordThree,
      inputRecordFour,
      inputRecordFive,
      inputRecordSix,
    ]);

    return list;
  }

  List<InputRecord> getDataPutputItems() {
    InputRecord inputRecordOne = InputRecord(
      1,
      true,
      'Abierto',
      'En ingreso',
      DateTime.now(),
      DateTime.now(),
      1,
      1,
    );
    InputRecord inputRecordTwo = InputRecord(
      2,
      true,
      'Abierto',
      'En ingreso',
      DateTime.now(),
      DateTime.now(),
      1,
      1,
    );
    InputRecord inputRecordThree = InputRecord(
      3,
      true,
      'Abierto',
      'En ingreso',
      DateTime.now(),
      DateTime.now(),
      1,
      1,
    );
    InputRecord inputRecordFour = InputRecord(
      4,
      true,
      'Abierto',
      'En ingreso',
      DateTime.now(),
      DateTime.now(),
      1,
      1,
    );
    InputRecord inputRecordFive = InputRecord(
      5,
      true,
      'Abierto',
      'En ingreso',
      DateTime.now(),
      DateTime.now(),
      1,
      1,
    );
    InputRecord inputRecordSix = InputRecord(
      6,
      true,
      'Abierto',
      'En ingreso',
      DateTime.now(),
      DateTime.now(),
      1,
      1,
    );

    List<InputRecord> list = List<InputRecord>.of(<InputRecord>[
      inputRecordOne,
      inputRecordTwo,
      inputRecordThree,
      inputRecordFour,
      inputRecordFive,
      inputRecordSix,
    ]);

    return list;
  }
}
