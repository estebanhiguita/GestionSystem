part of aristadart.server;

@app.Group('/${Col.noticia}')
@Catch()
@Encode()
class NoticiaServices extends AristaService<Noticia>
{
    NoticiaServices (MongoService mongoDb) : super (Col.noticia, mongoDb);
    
    @app.DefaultRoute (methods: const [app.POST])
    Future<Noticia> New () async
    {
        var noticia = new Noticia()
            ..id = newId()
            ..titulo = "Titulo"
            ..texto = "Texto";
        
        return NewGeneric (noticia);
    }
    
    @app.Route ('/:id', methods: const [app.GET])
    Future<Noticia> Get (String id)
    {
        throw new UnimplementedError();
    }
    
    @app.Route ('/:id', methods: const [app.PUT])
    Future<Noticia> Update (String id, Noticia delta)
    {
        throw new UnimplementedError();
    }
    
    @app.Route ('/:id', methods: const [app.DELETE])
    Future<Ref> Delete (String id)
    {
        throw new UnimplementedError();
    }

    @app.Route ('/ultimas', methods: const [app.GET])
    Future<List<Noticia>> Ultimas ()
    {
        throw new UnimplementedError();
    }
}



