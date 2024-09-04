import 'package:flutter/foundation.dart';
import 'package:gsheets/gsheets.dart';
import 'package:zenfinastro/config.dart';

class GSheetService {
  Worksheet? _sheet;

  static const _credentials = Config.credentials;

  static const _spreadsheetId = Config.spreadsheetID;

  Future loadCredential() async {
    final gsheets = GSheets(_credentials);
    final ss = await gsheets.spreadsheet(_spreadsheetId);
    _sheet = ss.worksheetByTitle('Sheet1');
    debugPrint('Google Sheet Successfully Load');
  }

  Future uploadData(String email, String number, String dob) async {
    await loadCredential();
    await _sheet!.values.appendRow(
      [email, number, dob],
    );
  }
}
