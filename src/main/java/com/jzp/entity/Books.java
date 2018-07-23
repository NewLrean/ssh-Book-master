package com.jzp.entity;

import javax.persistence.*;
import javax.persistence.Entity;

/**
 * Created by renba on 2017/6/14.
 */

@Entity
public class Books {
    private int id;
    private String title;
    private String author;
    private int publisherId;
    private String publishDate;
    private String isbn;
    private Integer wordsCount;
    private Integer unitPrice;
    private String contentDescription;
    private String aurhorDescription;
    private String editorComment;
    private String toc;
    private int categoryId;
    private Integer clicks;
    private String booksImages;
    private Integer quantity;
    private String wwwimage;
    private String souhuo;
    private String address;
    private String baoyou;

    @Id
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "Title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "Author")
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Basic
    @Column(name = "PublisherId")
    public int getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(int publisherId) {
        this.publisherId = publisherId;
    }

    @Basic
    @Column(name = "PublishDate")
    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    @Basic
    @Column(name = "ISBN")
    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    @Basic
    @Column(name = "WordsCount")
    public Integer getWordsCount() {
        return wordsCount;
    }

    public void setWordsCount(Integer wordsCount) {
        this.wordsCount = wordsCount;
    }

    @Basic
    @Column(name = "UnitPrice")
    public Integer getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Basic
    @Column(name = "ContentDescription")
    public String getContentDescription() {
        return contentDescription;
    }

    public void setContentDescription(String contentDescription) {
        this.contentDescription = contentDescription;
    }

    @Basic
    @Column(name = "AurhorDescription")
    public String getAurhorDescription() {
        return aurhorDescription;
    }

    public void setAurhorDescription(String aurhorDescription) {
        this.aurhorDescription = aurhorDescription;
    }

    @Basic
    @Column(name = "EditorComment")
    public String getEditorComment() {
        return editorComment;
    }

    public void setEditorComment(String editorComment) {
        this.editorComment = editorComment;
    }

    @Basic
    @Column(name = "TOC")
    public String getToc() {
        return toc;
    }

    public void setToc(String toc) {
        this.toc = toc;
    }

    @Basic
    @Column(name = "CategoryId")
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Basic
    @Column(name = "Clicks")
    public Integer getClicks() {
        return clicks;
    }

    public void setClicks(Integer clicks) {
        this.clicks = clicks;
    }

    @Basic
    @Column(name = "BooksImages")
    public String getBooksImages() {
        return booksImages;
    }

    public void setBooksImages(String booksImages) {
        this.booksImages = booksImages;
    }

    @Basic
    @Column(name = "quantity")
    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Basic
    @Column(name = "wwwimage")
    public String getWwwimage() {
        return wwwimage;
    }

    public void setWwwimage(String wwwimage) {
        this.wwwimage = wwwimage;
    }

    @Basic
    @Column(name = "souhuo")
    public String getSouhuo() {
        return souhuo;
    }

    public void setSouhuo(String souhuo) {
        this.souhuo = souhuo;
    }

    @Basic
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "baoyou")
    public String getBaoyou() {
        return baoyou;
    }

    public void setBaoyou(String baoyou) {
        this.baoyou = baoyou;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Books books = (Books) o;

        if (id != books.id) return false;
        if (publisherId != books.publisherId) return false;
        if (categoryId != books.categoryId) return false;
        if (title != null ? !title.equals(books.title) : books.title != null) return false;
        if (author != null ? !author.equals(books.author) : books.author != null) return false;
        if (publishDate != null ? !publishDate.equals(books.publishDate) : books.publishDate != null) return false;
        if (isbn != null ? !isbn.equals(books.isbn) : books.isbn != null) return false;
        if (wordsCount != null ? !wordsCount.equals(books.wordsCount) : books.wordsCount != null) return false;
        if (unitPrice != null ? !unitPrice.equals(books.unitPrice) : books.unitPrice != null) return false;
        if (contentDescription != null ? !contentDescription.equals(books.contentDescription) : books.contentDescription != null)
            return false;
        if (aurhorDescription != null ? !aurhorDescription.equals(books.aurhorDescription) : books.aurhorDescription != null)
            return false;
        if (editorComment != null ? !editorComment.equals(books.editorComment) : books.editorComment != null)
            return false;
        if (toc != null ? !toc.equals(books.toc) : books.toc != null) return false;
        if (clicks != null ? !clicks.equals(books.clicks) : books.clicks != null) return false;
        if (booksImages != null ? !booksImages.equals(books.booksImages) : books.booksImages != null) return false;
        if (quantity != null ? !quantity.equals(books.quantity) : books.quantity != null) return false;
        if (wwwimage != null ? !wwwimage.equals(books.wwwimage) : books.wwwimage != null) return false;
        if (souhuo != null ? !souhuo.equals(books.souhuo) : books.souhuo != null) return false;
        if (address != null ? !address.equals(books.address) : books.address != null) return false;
        if (baoyou != null ? !baoyou.equals(books.baoyou) : books.baoyou != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (author != null ? author.hashCode() : 0);
        result = 31 * result + publisherId;
        result = 31 * result + (publishDate != null ? publishDate.hashCode() : 0);
        result = 31 * result + (isbn != null ? isbn.hashCode() : 0);
        result = 31 * result + (wordsCount != null ? wordsCount.hashCode() : 0);
        result = 31 * result + (unitPrice != null ? unitPrice.hashCode() : 0);
        result = 31 * result + (contentDescription != null ? contentDescription.hashCode() : 0);
        result = 31 * result + (aurhorDescription != null ? aurhorDescription.hashCode() : 0);
        result = 31 * result + (editorComment != null ? editorComment.hashCode() : 0);
        result = 31 * result + (toc != null ? toc.hashCode() : 0);
        result = 31 * result + categoryId;
        result = 31 * result + (clicks != null ? clicks.hashCode() : 0);
        result = 31 * result + (booksImages != null ? booksImages.hashCode() : 0);
        result = 31 * result + (quantity != null ? quantity.hashCode() : 0);
        result = 31 * result + (wwwimage != null ? wwwimage.hashCode() : 0);
        result = 31 * result + (souhuo != null ? souhuo.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (baoyou != null ? baoyou.hashCode() : 0);
        return result;
    }
}
