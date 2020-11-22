import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final urlProfile =
      'https://mobirise.com/bootstrap-template/profile-template/assets/images/timothy-paul-smith-256424-1200x800.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Battle Of Math',
        ),
      ),
      body: Container(
        //JADI KITA GUNAKAN SEBUAH COLUMN KARENA ADA BANYAK  COMPONENT YANG AKAN TERSUSUN KEBAWAH
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ProfileInformation(
              urlProfile: urlProfile,
            ),
            MathNovice(),
            Menu(),
          ],
        ),
      ),
    );
  }
}

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    Key key,
    @required this.urlProfile,
  }) : super(key: key);

  final String urlProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      //const EdgeInsets.all(10.0),
      //ADA 2 BAGIAN YANG BERURUT SECARA VERTIKAL, MAKA MENGGUNAKAN ROW
      child: Column(
        //ATTRIBUTENYA DI-SET SPACE BETWEEN AGAR TIAP COMPONENT MEMILIKI SPACE
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //BAGIAN PERTAMA ADALAH PROFIL PIC
          Container(
            width: 100, //DENGAN UKURAN PXL ADALAH 100
            height: 100,
            //KEMUDIAN MENGGUNAKAN CLIPRREACT UNTUK MEMBUAT LINGKARAN
            child: ClipRRect(
              //SET BORDER RADIUSNYA SETENGAH DARI UKURANNYA AGAR MEMBENTUK LINGKARAN
              borderRadius: BorderRadius.circular(50),
              //AMBIL GAMBAR DARI INTERNET
              child: Image.network(
                urlProfile,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "Name",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Description",
          ),
        ],
      ),
    );
  }
}

class MathNovice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          40, //KARENA HANYA SEBARIS TEKS MAKA KITA SET TINGGI CONTAINERNYA 40
      decoration: BoxDecoration(
        //AGAR TERLIHAT SEKATNYA, MAKA KITA TAMBAHKAN BORDER DISEKELILINGNYA
        border: Border.fromBorderSide(
          BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      //KARENA DIA TERDIRI DARI DUA BAGIAN YAKNI 10 YANG BOLD DAN TEKS SELANJUTNYA
      //MAKA KITA GUNAKAN ROW
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/medali.png'),
          Image.asset('assets/star.png'),
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //DERETANNYA KE BAWAH MAKA GUNAKAN COLUMN()
      child: Column(
        //MASING2 CHILD DIBUAT SPACE DISEKITARNYA
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //DAN TIAP BUTTON KITA GUNAKAN RAISEDBUTTON DENGAN TEKSNYA MASING-MASING
          RaisedButton(
            onPressed: () {},
            child: Text('Ranked Match'),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('Custom Match'),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('Self Test'),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('LeaderBoard'),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
