import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/blocs/bloc_provider.dart';
import 'package:flutter_playground/blocs/player_bloc.dart';
import 'package:flutter_playground/models/character_model.dart';
import 'package:flutter_svg/svg.dart';

class PlayerSearch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Player Search'),
        backgroundColor: Color.fromARGB(255, 24, 29, 37),
      ),
      body: BlocProvider<PlayerBloc>(
        bloc: PlayerBloc(),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                PlayerSearchForm(),
                StreamListBuilder(),
              ],
            )
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

class StreamListBuilder extends StatefulWidget {
  final Widget child;

  StreamListBuilder({Key key, this.child}) : super(key: key);

  _StreamListBuilderState createState() => _StreamListBuilderState();
}

class _StreamListBuilderState extends State<StreamListBuilder> {
  @override
  Widget build(BuildContext context) {

    final PlayerBloc playerBloc = BlocProvider.of<PlayerBloc>(context);

    return StreamBuilder(
      stream: playerBloc.getSearchResult,
      builder: (context, AsyncSnapshot<List<ProfileCharacterModel>> snapshot) {
        if(snapshot.hasData) {
          for(ProfileCharacterModel profile in snapshot.data) {
            if(profile.error != null) {
              return buildError(profile.error);
            }
            else {
              return buildList(snapshot);
            }
          }

        }
        else if(snapshot.hasError) {
          return buildError(snapshot.error.toString());
        }
        return Center();
      }
  );
  }
}

class PlayerSearchFormState extends State<PlayerSearchForm> {

  //don't put this inside build() below
  final _formPlayerName = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final PlayerBloc playerBloc = BlocProvider.of<PlayerBloc>(context);
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
                  playerBloc.findPlayer(_searchText);
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
                  playerBloc.findPlayer(_searchText);
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

Widget buildList(AsyncSnapshot<List<ProfileCharacterModel>> snapshot) {

  return ListView.builder(
    shrinkWrap: true,
    itemCount: snapshot.data.length,
    padding: EdgeInsets.all(10.0),
    itemBuilder: (BuildContext context, int index) {
      String _icon;
      switch(snapshot.data[index].response.profile.data.userInfo.membershipType) {
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
                  snapshot.data[index].response.profile.data.userInfo.displayName,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Destiny-Font'
                  ),
                ),
                subtitle: Text(
                  'mId: ${snapshot.data[index].response.profile.data.userInfo.membershipId}',
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                    characterListBuilder(snapshot.data[index].response.characters),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

List<Widget> characterListBuilder(List<CharacterData> charList) {

    List<Column> columnList = [];

    for(CharacterData character in charList) {
      columnList.add(
        new Column(
          children: <Widget>[
            getClassIcon(character.classType),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                character.light.toString(),
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Destiny-Font'
                ),
              ),
            )
          ],
        )
      );
    }
    return charList.isEmpty ? buildError('No Characters Found') : columnList;
}

Widget getClassIcon(int classType) {
  switch(classType) {
    case 0:
      return SvgPicture.asset(
        'assets/images/icon_titan.svg',
        color: Color.fromARGB(255, 42, 46, 135),
        height: 30.0,
      );
    case 1:
      return SvgPicture.asset(
        'assets/images/icon_hunter.svg',
        color: Color.fromARGB(255, 233, 139, 26),
        height: 30.0,
      );
    case 2:
      return SvgPicture.asset(
        'assets/images/icon_warlock.svg',
        color: Color.fromARGB(255, 155, 70, 158),
        height: 30.0,
      );
    default:
      return SvgPicture.asset(
        'assets/images/icon_destiny.svg',
        color: Colors.black,
        height: 30.0,
      );
  }

}

String getClassName(int classType) {
  switch(classType) {
    case 0:
      return 'Titan';
    case 1:
      return 'Hunter';
    case 2:
      return 'Warlock';
    default:
      return 'Unknown';
  }

}
