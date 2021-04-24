package com.electronics.entity;

import javax.persistence.*;

@Entity
@Table(name = "Product_Information")
public class ProductInformationEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String color;
    private String cpu;
    private String gpu;
    private String oS;
    private String memory;
    private String ram;
    private String timeOfLaunch;
    private String display;
    private String guarantee;
    private String pin;
    private String camera;
    private String frontCamera;
    private String connector;
    private String wC;
    private String design;
    private String size;
    private String accessories;

    @Column(columnDefinition = "LONGTEXT")
    private String description;

    @OneToOne
    @JoinColumn(name = "productID")
    private ProductEntity product;

    public ProductInformationEntity() {
    }

    public ProductInformationEntity(Long id, String color, String cpu, String gpu, String oS, String memory, String ram, String timeOfLaunch, String display, String guarantee, String pin, String camera, String frontCamera, String connector, String wC, String design, String size, String accessories, String description, ProductEntity product) {
        this.id = id;
        this.color = color;
        this.cpu = cpu;
        this.gpu = gpu;
        this.oS = oS;
        this.memory = memory;
        this.ram = ram;
        this.timeOfLaunch = timeOfLaunch;
        this.display = display;
        this.guarantee = guarantee;
        this.pin = pin;
        this.camera = camera;
        this.frontCamera = frontCamera;
        this.connector = connector;
        this.wC = wC;
        this.design = design;
        this.size = size;
        this.accessories = accessories;
        this.description = description;
        this.product = product;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getGpu() {
        return gpu;
    }

    public void setGpu(String gpu) {
        this.gpu = gpu;
    }

    public String getoS() {
        return oS;
    }

    public void setoS(String oS) {
        this.oS = oS;
    }

    public String getMemory() {
        return memory;
    }

    public void setMemory(String memory) {
        this.memory = memory;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getTimeOfLaunch() {
        return timeOfLaunch;
    }

    public void setTimeOfLaunch(String timeOfLaunch) {
        this.timeOfLaunch = timeOfLaunch;
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }

    public String getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(String guarantee) {
        this.guarantee = guarantee;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    public String getCamera() {
        return camera;
    }

    public void setCamera(String camera) {
        this.camera = camera;
    }

    public String getFrontCamera() {
        return frontCamera;
    }

    public void setFrontCamera(String frontCamera) {
        this.frontCamera = frontCamera;
    }

    public String getConnector() {
        return connector;
    }

    public void setConnector(String connector) {
        this.connector = connector;
    }

    public String getwC() {
        return wC;
    }

    public void setwC(String wC) {
        this.wC = wC;
    }

    public String getDesign() {
        return design;
    }

    public void setDesign(String design) {
        this.design = design;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getAccessories() {
        return accessories;
    }

    public void setAccessories(String accessories) {
        this.accessories = accessories;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }
}
