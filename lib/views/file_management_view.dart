import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class FileManagementView extends StatefulWidget {
  FileManagementView({Key key}) : super(key: key);

  @override
  _FileManagementViewState createState() => _FileManagementViewState();
}

class _FileManagementViewState extends State<FileManagementView> {
  String _filePath = "";
  bool _checkResponse = false;
  var _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  _downloadSamplePDF();
                },
                icon: Icon(Icons.file_download),
                label: Text("Download File")),
            FlatButton.icon(
                onPressed: () {
                  _downloadSampleVideo();
                },
                icon: Icon(Icons.file_download),
                label: Text("Download Video")),
            _checkResponse == true
                ? CircularProgressIndicator(backgroundColor: Colors.red)
                : Text(_filePath),
            Visibility(
              visible: _filePath.length > 0,
              child: OutlineButton.icon(
                  onPressed: () {
                    _showSamplePDF();
                  },
                  icon: Icon(Icons.info),
                  label: Text("Show")),
            ),
            _filePath != ""
                ? FlatButton.icon(
                    onPressed: () {
                      _file.delete();
                      setState(() {
                        _filePath = "";
                      });
                    },
                    icon: Icon(Icons.delete),
                    label: Text("Delete File"))
                : Text("No file"),
          ],
        ),
      ),
    );
  }

  Future _downloadSamplePDF() async {
    setState(() {
      _checkResponse = true;
    });
    final _response =
        await http.get("http://africau.edu/images/default/sample.pdf");
    if (_response.statusCode == 200) {
      //await _buildDownloadWayOne(response: _response);
      // or..
      _buildDownloadWayTwo(
          response: _response, path: "pdfOfArif", typeOfFile: "pdf");
    } else {
      Logger().e("error occurred while send request to sample pdf");
    }
  }

  Future _downloadSampleVideo() async {
    setState(() {
      _checkResponse = true;
    });
    final _response = await http.get(
        "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4");
    if (_response.statusCode == 200) {
      _buildDownloadWayTwo(
          response: _response, path: "mp4OfArif", typeOfFile: "mp4");
    } else {
      Logger().e("error occurred while send request to sample pdf");
    }
  }

  void _showSamplePDF() {
    OpenFile.open(_filePath);
  }

  void _buildDownloadWayTwo(
      {http.Response response, String path, String typeOfFile}) async {
    await _getLocalFile(path: path, typeOfFile: typeOfFile).then((file) async {
      Logger().i("file successfully generated");
      /**var [_savedFileOther] =*/
      await file.writeAsBytes(response.bodyBytes).then((_savedFile) {
        Logger().i("file wrote successfully");
        setState(() {
          _file = _savedFile;
          _filePath = _savedFile.path;
          _checkResponse = false;
        });

        ///return [_savedFile];
      });

      /// [_savedFileOther] does not return null, if we do decleration "return [_savedFile];" in "then()" block.
      // otherwise return null
      /**print([_savedFileOther]);*/
    }).catchError((Object error) {
      Logger().e("error occurred while writing");
      print(error.toString());
    });
  }

  Future _buildDownloadWayOne({http.Response response}) async {
    var _file = await _getLocalFile(path: "pdfOfArif", typeOfFile: "pdf");
    var _savedFile = await _file.writeAsBytes(response.bodyBytes);
  }

  Future<File> _getLocalFile({String path, String typeOfFile}) async {
    var _path = await _getLocalDevicePath;
    // direct we can generate new file under in _path
    // if we wan to be file in custom new directory
    // we must be generate custom new directory
    var _newDirectory = await Directory("$_path/$path").create();
    // then we can generate new file in custom new directory
    return File("${_newDirectory.path}/myFile.$typeOfFile");
  }

  Future<String> get _getLocalDevicePath async {
    final _devicePath = await getApplicationDocumentsDirectory();
    return _devicePath.path;
  }
}
