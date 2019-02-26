/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

/**
 *
 * @author DELL
 */
public class Book {
    private int id;
    private String name;
    private String author;
    private String semester;
    private String accessLavel;
    private String image;
    private String fileLocation;
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getAccessLavel() {
        return accessLavel;
    }

    public void setAccessLavel(String accessLavel) {
        this.accessLavel = accessLavel;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getFileLocation() {
        return fileLocation;
    }

    public void setFileLocation(String fileLocation) {
        this.fileLocation = fileLocation;
    }

    @Override
    public String toString() {
        return "Book{" + "id=" + id + ", name=" + name + ", author=" + author + ", semester=" + semester + ", accessLavel=" + accessLavel + ", image=" + image + ", fileLocation=" + fileLocation + '}';
    }
    


    
    

    
    
}
