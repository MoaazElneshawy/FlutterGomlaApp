import 'package:flutter/material.dart';
import 'package:gomla/base/app_localization.dart';
import 'package:gomla/data/Provider.dart';
import 'package:gomla/data/constants.dart';
import 'package:gomla/model/homeBaseModel.dart';
import 'package:gomla/presentation/home/homeManager.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppLocalization locale = AppLocalization.of(context);
    HomeManager manager = Provider.of(context).homeManager;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          locale.translate('main_title'),
          style: TextStyle(color: Colors.grey[800], fontFamily: Constants.FONT),
        ),
      ),
      body: FutureBuilder(
        future: manager.getHomeScreenData(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<HomeBaseModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var model = snapshot.data.data;
            if (snapshot.hasError || snapshot.data.status != 1) {
              return Text("${snapshot.data.message}");
            } else
              return _setData(model, locale);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _setData(Data model, AppLocalization localization) {
    Restaurant restaurant = model.restaurant;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("${restaurant.cover}"),
                    fit: BoxFit.cover)),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(model.restaurant.logo,
                        height: 150.0, width: 150.0),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${restaurant.name}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${restaurant.desc}",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${localization.translate("main_delivery_time")} : ${restaurant.deliveryTime} ${restaurant.currency}",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${localization.translate("main_delivery_cost")} : ${restaurant.deliveryFee} ${restaurant.currency}",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          menusList(restaurant.menu[0])
          // restaurant.menu.indexOf((element) {return menusList(element);})
        ],
      ),
    );
  }

  Widget menusList(Menu menu) {
    return Column(
      children: [
        Container(
          height: 50,
          color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('${menu.name}'), Icon(Icons.arrow_drop_down)],
            ),
          ),
        ),
        mealsList(menu.meals[0])
      ],
    );
  }

  Widget mealsList(Meals meal) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(meal.image, height: 100.0, width: 150.0),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${meal.name}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                    IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          print(meal.id.toString());
                        }),
                    Text('${meal.price} ${meal.currency}')
                  ],
                ),
                Text('${meal.desc}')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// child:
