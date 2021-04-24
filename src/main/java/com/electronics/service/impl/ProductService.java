package com.electronics.service.impl;

import com.electronics.entity.ProductEntity;
import com.electronics.entity.ProductInformationEntity;
import com.electronics.repository.BrandRepository;
import com.electronics.repository.CategoryRepository;
import com.electronics.repository.ProductInformationRepository;
import com.electronics.repository.ProductRepository;
import com.electronics.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductService implements IProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductInformationRepository productInformationRepository;


    @Override
    public List<ProductEntity> findAll() {
        List<ProductEntity> list;
        try {
            list = (List<ProductEntity>) productRepository.findAll();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> findAllByOrderByIdDesc() {
        try {
            List<ProductEntity> list = productRepository.findAllByOrderByIdDesc();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> getAllProduct() {
        List<ProductEntity> list;
        try {
            list = (List<ProductEntity>) productRepository.findAll();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> searchProductName(String name) {
        name = "%" + name + "%";
        return productRepository.searchNameLike(name);
    }

    @Override
    public List<ProductEntity> searchCategoryName(String name) {
        List<ProductEntity> list;
        try {
            list = productRepository.findAllByCategory_Name(name);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> searchBrandName(String name) {
        List<ProductEntity> list;
        try {
            list = productRepository.findAllByBrandName(name);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> recentProducts() {
        List<ProductEntity> list;
        try {
            list = productRepository.recentProducts();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> recentProducts1() {
        List<ProductEntity> list;
        try {
            list = productRepository.recentProducts1();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> sellingProducts() {
        List<ProductEntity> list;
        try {
            list = productRepository.sellingProducts();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> sellingProducts1() {
        List<ProductEntity> list;
        try {
            list = productRepository.sellingProducts1();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> productPromotion() {
        List<ProductEntity> list;
        try {
            list = productRepository.promotion_Product();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> search1To5() {
        List<ProductEntity> list;
        try {
            list = productRepository.searchTo5();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> search5To10() {
        List<ProductEntity> list;
        try {
            list = productRepository.search5To10();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> search10To15() {
        List<ProductEntity> list;
        try {
            list = productRepository.search10To15();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> search15To20() {
        List<ProductEntity> list;
        try {
            list = productRepository.search15To20();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> search20To25() {
        List<ProductEntity> list;
        try {
            list = productRepository.search20To25();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> searchTo25() {
        List<ProductEntity> list;
        try {
            list = productRepository.searchTo25();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> searchTo5() {
        List<ProductEntity> list;
        try {
            list = productRepository.searchTo5();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public ProductEntity getProductID(long id) {
        ProductEntity productEntity;
        try {
            productEntity = productRepository.findById(id);
            return productEntity;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public int getTotalItem() {
        return (int) productRepository.count();
    }

    @Override
    @Transactional
    public ProductEntity addProduct(ProductEntity productEntity) {
        ProductEntity newProduct;
        try {
            newProduct = productRepository.save(productEntity);
            return newProduct;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    @Transactional
    public ProductEntity updateProduct(ProductEntity productEntity) {
        ProductEntity newProduct;
        ProductInformationEntity productInformationEntity = productEntity.getProductInformation();
        try {
            ProductInformationEntity newPI = productInformationRepository.save(productInformationEntity);
            newProduct = productRepository.save(productEntity);
            return newProduct;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
        /*ServiceEntity serviceUpdate = null;
        ServiceContentEntity serviceContent = serviceEntity.getServiceContent();
        try {
            ServiceContentEntity newServiceContent = serviceContentRepo.save(serviceContent);
            serviceUpdate = serviceRepo.save(serviceEntity);
        }catch (Exception e){
            System.out.println(e);
        }
        return serviceUpdate;*/
    }

    @Override
    public boolean delete(Long id) {
        boolean t = false;
        try {
            productRepository.deleteById(id);
            t = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }

    @Override
    @Transactional
    public void delete(Long[] ids) {
        for (long id : ids) {
            productRepository.deleteById(id);
        }
    }

    @Override
    public List<Object[]> inventoryCat() {
        try {
            return productRepository.inventoryCat();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Object[]> inventoryBrand() {
        try {
            return productRepository.inventoryBrand();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<Object[]> inventoryProduct() {
        try {
            return productRepository.inventoryProduct();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }


    @Override
    public List<Object[]> statisticsProduct() {
        try {
            return productRepository.statisticsProduct();
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<ProductEntity> outOfStock() {
        List<ProductEntity> list;
        try {
            list = productRepository.outOfStock();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
