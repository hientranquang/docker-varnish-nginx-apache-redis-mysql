vcl 4.0;
backend server_nginx {
    .host = "nginx_webserver";
    .port = "80";
    .probe = {
        .url = "/";
        .timeout = 1s;
        .interval = 3s;
        .window = 3;
        .threshold = 2;
    }
}

backend server_apache2 {
    .host = "apache2";
    .port = "80";
    .probe = {
        .url = "/";
        .timeout = 1s;
        .interval = 3s;
        .window = 3;
        .threshold = 2;
    }
}


import directors;

sub vcl_init {

  new cluster_server = directors.round_robin();

  
  cluster_server.add_backend(server_nginx);
  cluster_server.add_backend(server_apache2);  
  
}


sub vcl_recv {
  
  set req.backend_hint = cluster_server.backend();
}
