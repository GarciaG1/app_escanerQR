import 'package:flutter/material.dart';
import 'generate_qr_code.dart';
import 'scan_qr_code.dart';
import 'main6.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR SCANNER ADBC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({Key? key}):super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
 
}


class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Escaner QR'),backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ScanQRCode()));
              });
            }, child: Text('Escanear QR General')),
            SizedBox(height: 40,),
             ElevatedButton(onPressed: (){
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ScanQRCodep()));
              });
            }, child: Text('Escanear QR Invitado')),
            SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GenerateQRCode()));
              });
            }, child: Text('Generar QR'))
          ],

        ),
      ),
    );
  }
}