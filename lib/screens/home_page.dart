import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_bloc/data/product_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop App'),
        leading: Stack(children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 12,
              child: Text(
                '0',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
            future: ApiRepository.loadedData(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: snap.data!.length,
                    itemBuilder: (cxt, i) {
                      return Card(
                        child: ListTile(
                          onTap: () {},
                          title: Container(
                            height: 300,
                            child: Column(children: [
                              Expanded(
                                  flex: 2,
                                  child: Image(
                                      image:
                                          NetworkImage(snap.data![i].picUrl))),
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                  child: Text(
                                snap.data![i].name,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${snap.data![i].price}\$',
                                      style: TextStyle(
                                          color: snap.data![i].off > 0
                                              ? Colors.red
                                              : Colors.black,
                                          decoration: snap.data![i].off > 0
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      '${(snap.data![i].price - (snap.data![i].price * snap.data![i].off)).toStringAsFixed(2)}\$')
                                ],
                              )),
                              const SizedBox(
                                height: 10,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.shopping_cart_checkout_outlined,
                                    size: 28,
                                  ))
                            ]),
                          ),
                        ),
                      );
                    });
              }
              return const Center(child: CupertinoActivityIndicator());
            }),
      ),
    );
  }
}
