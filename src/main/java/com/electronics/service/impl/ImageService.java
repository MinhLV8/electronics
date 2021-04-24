package com.electronics.service.impl;

import com.electronics.entity.ImageEntity;
import com.electronics.repository.ImageRepository;
import com.electronics.service.IImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageService implements IImageService {
    @Autowired
    private ImageRepository imageRepo;

    @Override
    public List<ImageEntity> getImageProduct(long id) {
        List<ImageEntity> list;
        try {
            list = imageRepo.getImageProduct(id);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ImageEntity> findByProduct_Id(long id) {
        List<ImageEntity> list;
        try {
            list = imageRepo.findByProduct_Id(id);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public ImageEntity urlImage(long id) {
        return imageRepo.urlImage(id);
    }

    @Override
    public ImageEntity addImage(ImageEntity image) {
        ImageEntity newImage;
        try {
            newImage = imageRepo.save(image);
            return newImage;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public boolean deleteImage(long id) {
        boolean t = false;
        try {
            imageRepo.deleteById(id);
            t = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }

    @Override
    public boolean deleteList(List<ImageEntity> list) {
        boolean t = false;
        try {
            imageRepo.deleteAll(list);
            t = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }

    @Override
    public List<ImageEntity> finByImage() {
        List<ImageEntity> list;
        try {
            list = imageRepo.findByOrderByIdDesc();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ImageEntity> finByProduct_Name_Image(String name) {
        name = "%" + name + "%";
        return imageRepo.findByProduct_NameLike(name);
    }

    @Override
    public ImageEntity finById(long id) {
        return imageRepo.findById(id);
    }
}
