import 'package:fatihac/features/homepage/data/datasources/local/voucher_local_datasource_impl.dart';
import 'package:fatihac/features/homepage/presentation/home_page.dart';
import 'package:flutter/material.dart';

import 'core/database/database_helper.dart';
import 'core/injection/injector.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  final databaseHelper = DatabaseHelper();
  final voucherLocalDataSource = VoucherLocalDatasourceImpl( databaseHelper);

  // Insert dummy data into the database
  await voucherLocalDataSource.insertDummyVouchers();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Payuung UI',
      home: HomePage(),
    );
  }
}


