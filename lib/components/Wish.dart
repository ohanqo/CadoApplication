import 'package:cadeaux_app/models/Cadeau.dart';
import 'package:cadeaux_app/pages/CadeauDetails.dart';
import 'package:cadeaux_app/repositories/GiftRepository.dart';
import 'package:flutter/material.dart';
import 'package:cadeaux_app/utils/EventBus.dart';
import 'package:cadeaux_app/events/GiftDeletedEvent.dart';

class Wish extends StatelessWidget {
  final Cadeau gift;

  Wish(this.gift);

  deleteGift() async {
    await GiftRepository.instance.deleteGift(gift.id);
    eventBus.fire(GiftDeletedEvent());
  }

  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: new Row(
        children: <Widget>[
          Container(
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CadeauDetails(this.gift)));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: gift.id,
                    child: gift.picture != ''
                        ? Image.network(
                            gift.picture,
                          )
                        : Image(
                            image: AssetImage('assets/cadoIlustration.png'),
                          ),
                  ),
                ),
              )),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    gift.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                  // SizedBox(height: 20),
                  Text(
                    "Prix: ${gift.price}€",
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                    size: 30.0,
                  ),
                  onPressed: () => showDialog(
                        context: context,
                        child: AlertDialog(
                          title: Text("Confirmation"),
                          content: Text(
                              "Êtes-vous sûr de vouloir supprimer le cadeau: ${gift.name} ?"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Supprimer"),
                              onPressed: () {
                                Navigator.of(context).pop();
                                deleteGift();
                              },
                            ),
                          ],
                        ),
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
