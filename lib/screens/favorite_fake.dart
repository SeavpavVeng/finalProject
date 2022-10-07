import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favorite", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){},),
      ),
      body:Padding(
       padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16, bottom: 16),
      child: GridView.count(


  mainAxisSpacing: 10,
            childAspectRatio: 0.75,
            crossAxisCount: 2,
  children: <Widget>[
    Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    color: const Color.fromARGB(255, 223, 230, 243),
                    child: Container(
                      height: 150,
                      width: 160,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("asset/images/category/T_shirts.png"),
                      )),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "FC Bayern Munich",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "\$${20.0}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.blueAccent),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    color: const Color.fromARGB(255, 223, 230, 243),
                    child: Container(
                      height: 150,
                      width: 160,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("asset/images/real_madrid_home.png"),
                      )),
                    ),
                  ),
                ),
                Spacer(),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Real Madrid",
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                           Text(
                            "\$${16.0}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.blueAccent),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
  ],
)
      ),
  
           
   
    );
  }
}