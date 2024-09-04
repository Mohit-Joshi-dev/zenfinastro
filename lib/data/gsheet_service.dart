import 'package:flutter/foundation.dart';
import 'package:gsheets/gsheets.dart';

class GSheetService {
  Worksheet? _sheet;

  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "zenfinastro",
  "private_key_id": "0e4d2fc80ff73d5fbbe6c6159760abbc9d226ee6",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDXbPmyAOUBnzle\nr2DXEKwhcmGVcfJNZAI3N6AqB2WvKNgkxcdItl34sFSOnW+gB1ELAed8vCJCWZQm\nIvrSEPUeUfFFvDPPEkVlBaQ0H4FruBG7M46ntnto7E65qWo5+LY35mE7EMx2HuYr\nZrqNw++FM55b+TBMF3rPTJHd2/i82adAwqRAV5aURsT00tdaCgbi8Doxo8fZ7y4r\ni3w7ycCKXLHYpn3+eZu7MuBYK1aFjoAm7tjXrYWgZc4rzo+5tYjbHYxHZQdD/mKc\nXoF3TbZWS0rcIz9hbjGw0rPXuDXSs/RqUaGbFNes9RDZHLa7XWHdJq0rIjyYurUW\nUIfGpq9NAgMBAAECggEALgYstIBnbLjJR3bdkCUSOVUYDxcYhrs6k/Rw5fnNmiX2\nQ6jzgg/gNLzrW8q76esWP+1IuQfyo81CjwFDJ/USgUdNbjIeuXs0Uzho0+/1NP/O\n3flOXXtpk0mFKjpNJRSDTZ8NH9Lfc873KseYTKhTOFiGWSz8Sg1sIfTAZy9TTXko\nXms4gmOjF/agf09jTTNSy1Wnqm7mOFBeRXCKMTJjgGcBIe5pNAqJQxnniuM3KaTi\nwbO5QXVL1m9qE3DbUGUupeQIxK01qdKQKXsPrdad3F2ocDjdDRiYhKuCJmDaJ4Bz\nLNmrsCThDFqzd0r4cpscL2quAUrfeyPoD1AMWYm5gQKBgQDtRvj+iM/HVDDLVkDm\nlepx7A6cdY8vQaOME4O0XcgxOwP3Gf5wbO/3nofanCGxD1Q1j/aOGIUlhuO9Ubgf\nnc2DSFWglY2rJbo+L4hmaatTBbaRbYaoQUNPPLPoX9sal5Mg3fpr3XXkVQ0+kpdl\nxv5MgbowEL1fO+KKe6tpdz0njQKBgQDobJlQxxiwu6AJU4kgLJzcvlb4bf1FuEpX\ntb2JgZIy72Ja8GWIw+xeJ+QoEOpQ8p7O4VbklTkU0jln7lHiBXaNT4VUDfSI1J/M\njXgBYnvcRXIgPBQ5n46QxnOZID92lqLy2DGSdgU+obG5GU5jLpz+/IiXnXRF3Pz3\nzHUFH2zWwQKBgCMVLVelLuOQBS7rb+koHWP+vSJRF3yrPd1GPWD7xM/SpAFzLHW/\nBbQdEoU2NJ0TYSYSRSg5Y+ZqjV2+qXSzRmG03kRCGJJHn8P2DzrlQNmjrJzQDurt\ny1/537fqBGFoK+7eI1qzgeziznSEBDKeO5dgTwEwWG+uUQ6cvnl3kek5AoGBAK+P\ncFNawCSm5KCGz9pUuHvo7kqi0h+6r7UG208lZyhAN7vXP+qJi14npag59rQEP76m\n6Xqp2L8IeEIv+vvOApmEyoIONHqymK3q4g2xtTtR3X3Jw8Eu64Ih1KmCeU17RURH\n11H5AccoXdUh71rtl7rnR8m2LmCjJxWKA45GCXFBAoGAWjPQ09XAprBt4zDxZbWY\nKHChv32qxRiz6BkMfPcS3FI/H7F34BoDCyORq9vbm5VHcr1H7WM3iKhmCx8BVl8N\nhCnNNIT0UW3kcm590fhuGPC2MTZdrPC0d5C2AcPk/kRAnRwTO0fWgKyUymMDmTP5\n+FdikdVIsWqBLWrzaVcoj04=\n-----END PRIVATE KEY-----\n",
  "client_email": "zenfinastro-service@zenfinastro.iam.gserviceaccount.com",
  "client_id": "102608393592165609157",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/zenfinastro-service%40zenfinastro.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
  ''';

  static const _spreadsheetId = '1Df5NEg2ooVSXeAKvyLdkbea1ZbE2ROg3qsuyLYpHdQs';

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
