import 'package:flutter/material.dart';
import 'package:sports_shopping_app/data/data.dart';
import 'package:sports_shopping_app/widgets/brend_type.dart';

class FavoiteScreen extends StatefulWidget {
  const FavoiteScreen({ Key? key }) : super(key: key);

  @override
  State<FavoiteScreen> createState() => _FavoiteScreenState();
}

class _FavoiteScreenState extends State<FavoiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favorite", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
      ),
      body:Padding(
       padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16, bottom: 16),
      child: GridView.builder(
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
            crossAxisCount: 2,
          ),
          itemBuilder: (
            BuildContext context,
            index,
          ) {
            return GestureDetector(
      onTap: (){
        // Navigator.push(
        //   context,
        // MaterialPageRoute(builder: (context) => DetailScreen()
        // ),
        //);
      },
      child: Padding(
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
                    "FC Barcelona",
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
                            "\$${20}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.blueAccent),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
          },
        ),
      ),
  
           
   
    );
  }
}