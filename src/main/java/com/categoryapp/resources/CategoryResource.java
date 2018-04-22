package com.categoryapp.resources;

import com.categoryapp.domains.Category;
import com.categoryapp.domains.Database;
import com.categoryapp.resources.utils.ImageFileManager;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.POST;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;

@Path("categories")
public class CategoryResource {

    @Context
    private UriInfo context;

    public CategoryResource() {
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response get() {
        List<Category> categories = Database.getInstance().getAllCategories();
        GenericEntity<List<Category>> genericEntity = new GenericEntity<List<Category>>(categories){};
        return Response.status(200).entity(genericEntity).build();
    }
    
    @POST
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    @Produces(MediaType.APPLICATION_JSON)
    public Response postData(@FormDataParam("category_name") String categoryName,
                             @FormDataParam("file") InputStream inputStream,
                             @FormDataParam("file") FormDataContentDisposition fileDetail) throws IOException {
        if (categoryName == null || categoryName.trim().equals("")) {
            return Response.status(Response.Status.BAD_REQUEST).entity("").build();
        }
        
        Integer categoryId = Database.getInstance().getAllCategories().size();
        Category newCategory = new Category(categoryId, categoryName, null);
        
        if (inputStream != null && fileDetail != null) {
            ImageFileManager ifm = new ImageFileManager();
            String fileName = fileDetail.getFileName();
            String fileExtension = ifm.getFileExtension(fileName);
            
            String randomFileName = UUID.randomUUID().toString() + "." + fileExtension;
            ifm.writeFileToDisk(inputStream, randomFileName, true);
            
            String imageURI = context.getBaseUri().toString() + "images/" + randomFileName;
            newCategory.setImageUrl(imageURI);
        }
        // Insert new category to database
        Database.getInstance().getAllCategories().add(newCategory);
        
        return Response.status(200).entity(newCategory).build();
    }
}
