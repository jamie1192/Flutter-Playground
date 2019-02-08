import 'package:flutter/material.dart';
import 'package:flutter_playground/blocs/player_bloc.dart';
import 'package:flutter_playground/models/player_model.dart';

class PlayerSearch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bloc.fetchPlayer();
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Search'),
      ),
      body: StreamBuilder(
        stream: bloc.playerSearch,
        builder: (context, AsyncSnapshot<PlayerModel> snapshot) {
          if(snapshot.hasData) {
            return buildList(snapshot);
          }
          else if(snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<PlayerModel> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.memberships.length,
      padding: EdgeInsets.all(10.0),
      itemBuilder: (BuildContext context, int index) {
        String icon;
        switch(snapshot.data.memberships[index].mType) {
          case 1:
            icon = "assets/images/icon_xbl.png";
            break;

          case 2:
            icon = "assets/images/icon_psn.png";
            break;

          case 4:
            icon = "assets/images/icon_blizzard.png";
            break;

          default:
            icon = "assets/images/icon_psn.png";
        }

        return SizedBox(
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    snapshot.data.memberships[index].displayName,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  subtitle: Text(
                    snapshot.data.memberships[index].mId,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey
                    )
                  ),
                  leading: Image(
                    image: AssetImage(icon),
                    height: 30.0,
                    width: 30.0,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }


}