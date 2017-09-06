vcl 4.0;
backend server_nginx {
    .host = "10.0.2.15";
    .port = "8081";
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
  
  
}


sub vcl_recv {
  
  set req.backend_hint = cluster_server.backend();
}
