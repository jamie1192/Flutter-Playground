import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/blocs/player_bloc.dart';
import 'package:flutter_playground/models/player_model.dart';

class PlayerSearch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Player Search'),
        backgroundColor: Color.fromARGB(255, 24, 29, 37),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              PlayerSearchForm(),
              StreamBuilder(
                  stream: bloc.getSearchResult,
                  builder: (context, AsyncSnapshot<PlayerModel> snapshot) {
                    if(snapshot.hasData) {
                      if(snapshot.data.error != null) {
                        return buildError(snapshot.data.error);
                      }
                      else {
                        return buildList(snapshot);
                      }
                    }
                    else if(snapshot.hasError) {
                      return buildError(snapshot.error.toString());
                    }
                    return Center();
                  }
              ),
            ],
          )
        )
      )
    );
  }

}

class PlayerSearchForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PlayerSearchFormState();
  }

}

class PlayerSearchFormState extends State<PlayerSearchForm> {

  //don't put this inside build() below
  final _formPlayerName = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    String _searchText;

      return Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
        child: Form(
          key: _formPlayerName,
          child: ListTile(
            title: TextFormField(
              decoration: InputDecoration(
                labelText: 'Player username...',
                border: OutlineInputBorder()
              ),
              maxLines: 1,
              maxLength: 30,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (term) {
                if(_formPlayerName.currentState.validate()) {
                  Fimber.i('Done, Validating: $_formPlayerName');
                  bloc.findPlayer(_searchText);
                }
              },
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Please enter a player name.';
                }
                else { //no return means form is valid
                  _searchText = value;
                }
              },
            ),
            trailing: RaisedButton(
              color: Color.fromARGB(255, 26, 32, 40),
              onPressed: () {
                if(_formPlayerName.currentState.validate()) {
                  Fimber.i('Validating: $_formPlayerName');
                  bloc.findPlayer(_searchText);
                }
              },
              child: Text('Search',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
      );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
    Fimber.i('player_search disposed');
  }

}

Widget buildError(String errorMessage) {
  return Center(
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            errorMessage,
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 14.0
            ),
          ),
        ),
        Icon(
          Icons.error_outline,
          color: Colors.redAccent,
        ),
      ],
    ),
  );
}

Widget buildList(AsyncSnapshot<PlayerModel> snapshot) {

  return ListView.builder(
    shrinkWrap: true,
    itemCount: snapshot.data.memberships.length,
    padding: EdgeInsets.all(10.0),
    itemBuilder: (BuildContext context, int index) {
      String _icon;
      switch(snapshot.data.memberships[index].mType) {
        case 1:
          _icon = "assets/images/icon_xbl.png";
          break;

        case 2:
          _icon = "assets/images/icon_psn.png";
          break;

        case 4:
          _icon = "assets/images/icon_blizzard.png";
          break;

        default:
          _icon = "assets/images/icon_psn.png";
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
                  'mId: ${snapshot.data.memberships[index].mId}',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey
                  )
                ),
                leading: Image(
                  image: AssetImage(_icon),
                  height: 30.0,
                  width: 30.0,
                ),
              )
              //TODO add characters for player account
            ],
          ),
        ),
      );
    },
  );
}
