/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources;

import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;
import models.Category;
import models.Database;

/**
 *
 * @author nhimbeobeo
 */

@Path("categories")
public class CategoryResource {
    
    @Context
    private UriInfo context;
    
    public CategoryResource() {}
    
    @GET
    @Produces(MediaType.APPLICATION_JSON) 
    public Response get() {
        List<Category> categories = Database.getInstance().getAllCategories();
        return Response.status(200).entity(categories).build();
    }
}