
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mx_test_app/view/mx_connection_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String userId = "";
  final String authToken = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            RaisedButton(child: Text("connect_widget"),onPressed: () => getMxWidgetUrl("connect_widget")),
            RaisedButton(child: Text("accounts_widget"),onPressed: () => getMxWidgetUrl("accounts_widget")),
            RaisedButton(child: Text("budgets_widget"),onPressed: () => getMxWidgetUrl("budgets_widget")),
            RaisedButton(child: Text("cash_flow_widget"),onPressed: () => getMxWidgetUrl("cash_flow_widget")),
            RaisedButton(child: Text("connections_widget"),onPressed: () => getMxWidgetUrl("connections_widget")),
            RaisedButton(child: Text("debts_widget"),onPressed: () => getMxWidgetUrl("debts_widget")),
            RaisedButton(child: Text("finstrong_widget"),onPressed: () => getMxWidgetUrl("finstrong_widget")),
            RaisedButton(child: Text("goals_widget"),onPressed: () => getMxWidgetUrl("goals_widget")),
            RaisedButton(child: Text("help_widget"),onPressed: () => getMxWidgetUrl("help_widget")),
            RaisedButton(child: Text("investments_widget"),onPressed: () => getMxWidgetUrl("investments_widget")),
            RaisedButton(child: Text("master_widget"),onPressed: () => getMxWidgetUrl("master_widget")),
            RaisedButton(child: Text("mini_budgets_widget"),onPressed: () => getMxWidgetUrl("mini_budgets_widget")),
            RaisedButton(child: Text("mini_net_worth_widget"),onPressed: () => getMxWidgetUrl("mini_net_worth_widget")),
            RaisedButton(child: Text("mini_pulse_widget"),onPressed: () => getMxWidgetUrl("mini_pulse_widget")),
            RaisedButton(child: Text("mini_spending_widget"),onPressed: () => getMxWidgetUrl("mini_spending_widget")),
            RaisedButton(child: Text("mobile_master_widget"),onPressed: () => getMxWidgetUrl("mobile_master_widget")),
            RaisedButton(child: Text("mobile_accounts_widget"),onPressed: () => getMxWidgetUrl("mobile_accounts_widget")),
            RaisedButton(child: Text("mobile_budgets_widget"),onPressed: () => getMxWidgetUrl("mobile_budgets_widget")),
            RaisedButton(child: Text("mobile_spending_widget"),onPressed: () => getMxWidgetUrl("mobile_spending_widget")),
            RaisedButton(child: Text("mobile_transactions_widget"),onPressed: () => getMxWidgetUrl("mobile_transactions_widget")),
            RaisedButton(child: Text("net_worth_widget"),onPressed: () => getMxWidgetUrl("net_worth_widget")),
            RaisedButton(child: Text("notifications_settings_widget"),onPressed: () => getMxWidgetUrl("notifications_settings_widget")),
            RaisedButton(child: Text("pulse_widget"),onPressed: () => getMxWidgetUrl("pulse_widget")),
            RaisedButton(child: Text("settings_widget"),onPressed: () => getMxWidgetUrl("settings_widget")),
            RaisedButton(child: Text("spending_widget"),onPressed: () => getMxWidgetUrl("spending_widget")),
            RaisedButton(child: Text("transactions_widget"),onPressed: () => getMxWidgetUrl("transactions_widget")),
            RaisedButton(child: Text("trends_widget"),onPressed: () => getMxWidgetUrl("trends_widget")),
          ],
        ),
      ),
    );
  }

  void getMxWidgetUrl(String widgetType) async {
    var client = http.Client();
    try {
      var uriResponse = await client.post(
          'https://int-api.mx.com/users/$userId/widget_urls',
          headers: {
            "Authorization": "Basic $authToken",
            "Accept": "application/vnd.mx.api.v1+json",
            "Content-Type": "application/json"
          },
          body: '{"widget_url": {"widget_type": "$widgetType", "mode": "verification"}}'
      );

      debugPrint("${uriResponse.statusCode} - ${uriResponse.body}");

      dynamic responseDecoded = jsonDecode(uriResponse.body);

      String url = responseDecoded["widget_url"]["url"];
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => MxConnectionPage(url)
      ));
    } finally {
      client.close();
    }

  }
}