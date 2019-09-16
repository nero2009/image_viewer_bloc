import 'package:flutter/material.dart';
import 'package:image_viewer_bloc_w0provider/src/Api/Image_Api.dart';
import 'package:image_viewer_bloc_w0provider/src/Bloc/Image_bloc.dart';

class ImageList extends StatelessWidget {
  final imageBloc = ImageBloc(ImageAPI());
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            _searchField(imageBloc),
            _displayImage(imageBloc),
          ],
        ));
  }

  Widget _searchField(ImageBloc _bloc) {
    return TextField(
      onChanged: _bloc.query.add,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search for anything... cats or doggos maybe'),
    );
  }

  Widget _displayImage(ImageBloc _bloc) {
    return Expanded(
      child: StreamBuilder(
        stream: _bloc.images,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return _buildImage(snapshot.data[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildImage(dynamic snapshot) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(
              snapshot.urls.small,
              fit: BoxFit.fitWidth,
              height: 200.0,
            ),
            padding: EdgeInsets.only(
              bottom: 8.0,
            ),
          ),
          Text(snapshot.description == null
              ? 'No description'
              : snapshot.description),
        ],
      ),
    );
  }
}
