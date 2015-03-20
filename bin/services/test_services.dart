part of aristadart.server;

@PrintHeaders()
@app.Route ('/cookies')
cookie ()
{
    var cookie = app.request.headers['cookie'];
    
    app.response = app.response.change(headers: {'set-cookie':'ID=2; Path=/; HttpOnly'});
    
    return new shelf.Response.ok("chao", headers: app.response.headers);
}

class PrintHeaders
{
    const PrintHeaders();
}
void PrintHeadersPlugin(app.Manager manager) {
    
    
    manager.addRouteWrapper(PrintHeaders, (metadata, Map<String,String> pathSegments, injector, 
                                        app.Request request, app.RouteHandler route) async {
        
        var res = route(pathSegments, injector, request);
        
        print (app.response.headers);
        
        return res;
    
  }, includeGroups: true);
}

