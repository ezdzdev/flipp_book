function httpGet_(theUrl, params) {
  return new Promise(function(res, rej) {
    var xmlhttp = new XMLHttpRequest();

    try {
      xmlhttp.onreadystatechange = (function() {
        if (xmlhttp.readyState!=4)
          return;

        if (xmlhttp.status==200) {
          var response = xmlhttp.responseText;
          res(JSON.parse(response));
        } else {
          var msg = "Failed to query from " + theUrl;
          rej(msg);
        }
      }).bind(this);

      xmlhttp.ontimeout = (function() {
        rej(msg);
      }).bind(this);

      xmlhttp.open( "GET", theUrl, true );
      xmlhttp.send();
    } catch(err) {
      var msg = this.getTranslation_('api_connection_error');
      rej(msg);
    }
  })
}