import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_avaliacao_n1/models/products.dart';
import 'package:projeto_avaliacao_n1/provider/products_list.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/logo.jpg",
        ),
        title: Text(
          "Ofertas Do Dia!",
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: builder,
        itemCount: listOfProducts.length,
      ),
    );
  }

  Widget builder(BuildContext _, int index) {
    Products products = listOfProducts.elementAt(index);
    return ListTile(
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //Imagem do produto
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Image.asset(
                  products.photo,
                  height: 110,
                  width: 110,
                ),
              ),
              //Dados do produto
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products.name.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        products.descripition.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "R\$ ${products.price.toString()}",
                        style: TextStyle(
                          color: Color(0xFF0F79E3),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            products.descripitionPrice.toString(),
                            style: TextStyle(
                              color: Color(0xFF1087FF),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          //Ícone de favorito
                          IconButton(
                            icon: Hero(
                              tag: products.isFavorite,
                              child: Icon(
                                (products.isFavorite)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red.shade400,
                                size: 20,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                products.isFavorite = !products.isFavorite;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
