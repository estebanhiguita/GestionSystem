part of aristadart.server;

@app.Group('/${Col.noticia}')
@Catch()
@Encode()
class NoticiaServices extends AristaService<User>
{
    NoticiaServices (MongoService mongoService) : super (Col.noticia, mongoService);
    
    
}



