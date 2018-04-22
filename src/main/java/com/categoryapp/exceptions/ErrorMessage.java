/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.categoryapp.exceptions;

import javax.json.Json;
import javax.json.JsonObject;
import javax.ws.rs.core.Response;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="message")
public class ErrorMessage { 
    @XmlElement
    public Integer code;

    @XmlElement 
    public String description;

    @XmlElement 
    public String link;

    @XmlElement 
    public Response.Status status;
   public ErrorMessage(Integer code,String description, String link, Response.Status status) {
        this.code = code;
        this.description = description;
        this.link = link;
        this.status = status;
   }
   
   /**
    * WORKAROUND: Unable to return this object as a JSON.
    * This helper methods help to overcome the problem by generating a JSON object which will be returned to client.
    */
   
   public JsonObject toJSON() {
       
       return  Json.createObjectBuilder()
                   .add("code", code)
                   .add("description", description)
                   .add("link", link)
                   .add("status", status.getStatusCode()).build();
   }
}
