import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(
              fontSize: 18,
              fontFamily: 'Sans-Serif',
              fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/rizky.jpg'),
            ),
            SizedBox(height: 20),
            Text('Muhammad Rizky Susanto', style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('123200145 - IF B', style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Selalu lakukanlah hal-hal baik dan indah.',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Centaur',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detail()),
                );
              },
              child: Text('Kesan Pesan'),
            ),
          ],
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kesan Pesan', style: TextStyle(
            fontSize: 18,
            fontFamily: 'Sans-Serif',
            fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 12, // menentukan tingkat kejelasan (elevation)
          shadowColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                SizedBox(height: 8),
                Text(
                  'Pertama-tama, saya ingin mengungkapkan kekaguman saya terhadap perkembangan teknologi mobile yang begitu pesat. Melalui mata kuliah ini, saya mempelajari tentang berbagai platform dan framework seperti Flutter, React Native, dan Kotlin yang memungkinkan kita untuk membuat aplikasi yang kaya fitur dan menarik dengan cepat.',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Centaur',
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 8),
                Text(
                  'Tentu saja, tidak hanya belajar teori semata, tetapi juga melakukan banyak latihan dan proyek praktis. Saya senang bahwa mata kuliah ini memberikan kesempatan bagi kita untuk menerapkan konsep dan teknik yang dipelajari melalui proyek-proyek nyata. Hal ini membantu saya memperkuat pemahaman saya dan mengasah keterampilan pemrograman mobile saya.',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Centaur',
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 8),
                Text('Sebagai pesan penutup, saya ingin mendorong teman-teman untuk terus mengasah keterampilan dan pengetahuan dalam pemrograman mobile. Dalam dunia yang terus berubah, penting bagi kita untuk tetap up-to-date dengan teknologi terbaru dan terus mengikuti perkembangan tren dalam industri ini. Jangan takut untuk mencoba hal baru dan terus berlatih untuk meningkatkan kemampuan kita.', style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Centaur',
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 8),
                Text('Terima kasih kepada dosen dan asisten yang telah membimbing kami dengan penuh kesabaran dan dedikasi. Saya berharap bahwa apa yang telah saya pelajari dalam mata kuliah ini akan menjadi dasar yang kokoh untuk perjalanan saya dalam dunia pemrograman mobile.', style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Centaur',
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 8),
                Text(
                  'Salam, [Rizky Susanto]',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Centaur',
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}