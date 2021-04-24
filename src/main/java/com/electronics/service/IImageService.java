package com.electronics.service;

import com.electronics.entity.ImageEntity;

import java.util.List;

public interface IImageService {

    List<ImageEntity> getImageProduct(long id);

    List<ImageEntity> findByProduct_Id(long id);

    ImageEntity urlImage(long id);

    ImageEntity addImage(ImageEntity image);

    boolean deleteImage(long id);

    boolean deleteList(List<ImageEntity> list);

    List<ImageEntity> finByImage();

    List<ImageEntity> finByProduct_Name_Image(String name);

    ImageEntity finById(long id);
}
