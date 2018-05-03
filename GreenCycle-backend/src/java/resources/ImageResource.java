/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources;

import java.io.File;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

/**
 *
 * @author nhimbeobeo
 */

@Path("images")
public class ImageResource {
    
    @Context
    private UriInfo context;

    public ImageResource() {}
    
    @GET
    @Path("{filename}")
    @Produces({"image/png", "image/jpg", "image/gif"})
    public Response getJson(@PathParam("filename") String fileName) {
       File imageFile = new File("/Users/hongngocdoan/Desktop/RECYCLER/images/" + fileName);
       
       Response.ResponseBuilder responseBuilder = Response.ok((Object) imageFile);
       responseBuilder.header("Content-Disposition", "attachment; filename=\"" + fileName +"\"");
       return responseBuilder.build();
    }
}