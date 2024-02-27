import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class News_Screen extends StatefulWidget {
  const News_Screen({super.key});

  @override
  State<News_Screen> createState() => _News_ScreenState();
}

class _News_ScreenState extends State<News_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      backgroundColor: Color.fromARGB(255, 241, 245, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Iconsax.arrow_left, color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Iconsax.share, color: Colors.black)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                  "https://static01.nyt.com/images/2020/07/17/business/00virus-cities1/00virus-cities1-mediumSquareAt3X.jpg"),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text("Ukraine Conflit: Kyiv brace for a Russian assualt",
                  style: TextStyle(
                      height: 1.5, fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text("By Information Tecchnology",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                  "Bitcoin is a protocol which implements a highly available, public, permanent, and decentralized ledger. In order to add to the ledger, a user must prove they control an entry in the ledger. The protocol specifies that the entry indicates an amount of a token, bitcoin with a minuscule bBitcoin is a protocol which implements a highly available, public, permanent, and decentralized ledger. In order to add to the ledger, a user must prove they control an entry in the ledger. The protocol specifies that the entry indicates an amount of a token, bitcoin with a minuscule bBitcoin is a protocol which implements a highly available, public, permanent, and decentralized ledger. In order to add to the ledger, a user must prove they control an entry in the ledger. The protocol specifies that the entry indicates an amount of a token, bitcoin with a minuscule b",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
